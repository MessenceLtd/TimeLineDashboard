using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebformsPOCDemo.AppShared;
using TimeLineDashboard.BusinessLogicLayer;
using TimeLineDashboard.Shared.Models;

namespace WebformsPOCDemo
{
    public partial class manage_CreditCard : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.Bind_Default_View();
            }
        }

        private void Bind_Default_View()
        {
            // ToDo -- Check permissions -- if the user is able to view the client / edit the client
            this.Validate_Permissions();

            Common_Tools.Initialize_DropDown_Bank_Accounts(this, this.dropdown_Bank_Account);

            this.Bind_Credit_Card_Expiration_ComboBoxes();

            if (!base.Is_Create_New_Record_Request())
            {
                this.Set_Page_FormControls_Values();

                if (!string.IsNullOrEmpty(this.Request.QueryString["mode"]))
                {
                    if (Request.QueryString["mode"] == "view")
                    {
                        this.Bind_ReadOnly_View();
                    }
                    else if (Request.QueryString["mode"] == "edit")
                    {
                        Bind_Edit_View();
                    }
                }
                else
                {
                    this.Bind_ReadOnly_View();
                }
            }
            else
            {
                // Request mode is Create new 
                this.Bind_Create_View();
            }
        }

        private void Validate_Permissions()
        {

        }

        private void Bind_Create_View()
        {
            base.Change_View_Mode_FormControls_Wrappers(false);

            this.button_Edit_CreditCard_Details.Visible = false;
            this.button_Update_CreditCard_Details.Visible = false;
            this.button_CancelEdit_CreditCard_Details.Visible = false;
            this.button_Create_CreditCard_Details.Visible = true;

            this.panel_Last_Updates_Info.Visible = false;
        }

        private void Bind_ReadOnly_View()
        {
            base.Change_View_Mode_FormControls_Wrappers(true);

            this.button_Edit_CreditCard_Details.Visible = true;
            this.button_Update_CreditCard_Details.Visible = false;
            this.button_CancelEdit_CreditCard_Details.Visible = false;
            this.button_Create_CreditCard_Details.Visible = false;
        }

        private void Bind_Edit_View()
        {
            base.Change_View_Mode_FormControls_Wrappers(false);

            this.button_Edit_CreditCard_Details.Visible = false;
            this.button_Update_CreditCard_Details.Visible = true;
            this.button_CancelEdit_CreditCard_Details.Visible = true;
            this.button_Create_CreditCard_Details.Visible = false;
        }

        private readonly string[] k_Expiration_Months_Array = { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" };
        private const int k_Expiration_From_Year = 1990;
        private const int k_Expiration_To_Year_Distance_Years_From_Today = 20;

        private void Bind_Credit_Card_Expiration_ComboBoxes()
        {
            this.dropdown_Expiration_Date_Month.DataSource = k_Expiration_Months_Array;
            this.dropdown_Expiration_Date_Month.DataBind();
            this.dropdown_Expiration_Date_Month.Items.Insert(0, "");

            List<int> years_Array_For_Expiration = new List<int>();

            for (int i= k_Expiration_From_Year; i< DateTime.Now.Year + k_Expiration_To_Year_Distance_Years_From_Today; i++ )
            {
                years_Array_For_Expiration.Add(i);
            }

            this.dropdown_Expiration_Date_Year.DataSource = years_Array_For_Expiration;
            this.dropdown_Expiration_Date_Year.DataBind();
            this.dropdown_Expiration_Date_Year.Items.Insert(0, "");
        }

        private void Set_Page_FormControls_Values()
        {
            int credit_Card_Id = int.Parse(this.Request.QueryString["id"]);
            int user_Id_Owner = base.Authenticated_User_ID;

            Credit_Cards creditCardDetails = Business_Logic_Layer_Facade.Instance.CreditCards_Get_Credit_Card_Details(
                credit_Card_Id, 
                user_Id_Owner, 
                base.Authenticated_User_ID , 
                base.Authenticated_Permission_Type );

            if (creditCardDetails != null)
            {
                Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                    creditCardDetails.Bank_Account_Id.ToString(),
                    this.dropdown_Bank_Account,
                    this.label_Bank_Account);

                this.textbox_Card_Name.Text = creditCardDetails.Card_Name;
                this.label_Card_Name.Text = creditCardDetails.Card_Name;

                this.textbox_Four_Ending_Digits.Text = creditCardDetails.Four_Ending_Digits;
                this.label_Four_Ending_Digits.Text = creditCardDetails.Four_Ending_Digits;
                
                if (creditCardDetails.Expiration_Date.HasValue)
                {
                    DateTime date_Expiration_For_Display = creditCardDetails.Expiration_Date.Value.AddMonths(-1);

                    this.dropdown_Expiration_Date_Month.SelectedValue = date_Expiration_For_Display.Month.ToString("00");
                    this.dropdown_Expiration_Date_Year.SelectedValue = date_Expiration_For_Display.Year.ToString();

                    this.label_Expiration_Date.Text = date_Expiration_For_Display.ToString("MM / yyyy ");
                }

                this.checkbox_Is_Active.Checked = creditCardDetails.Is_Active;
                this.label_Is_Active.Text = base.Get_Yes_Or_No_Text_Value(creditCardDetails.Is_Active);

                this.label_Record_Created_By_User.Text = creditCardDetails.Record_Created_By_User_Details.FullName_With_Email;
                this.label_Record_Creation_DateTime_UTC.Text = creditCardDetails.Record_Creation_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
                this.label_Record_Last_Updated_By_User.Text = creditCardDetails.Record_Last_Updated_By_User_Details.FullName_With_Email.ToString();
                this.label_Record_Last_Updated_DateTime_UTC.Text = creditCardDetails.Record_Last_Updated_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
            }
        }

        protected void button_Update_CreditCard_Details_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                bool l_BankAccount_Successfully_Updated = false;

                string exception_During_Process = "";
                string exception_During_Process_Extra_Data = "";

                int p_Credit_Card_Id = int.Parse(this.Request.QueryString["id"]);

                int p_Bank_Account_Id = int.Parse(this.dropdown_Bank_Account.SelectedValue);
                string p_Card_Name = this.textbox_Card_Name.Text;
                string p_Four_Ending_Digits = this.textbox_Four_Ending_Digits.Text;

                DateTime? p_Expiration_Date = new DateTime?();
                if (!string.IsNullOrEmpty(this.dropdown_Expiration_Date_Month.SelectedValue) &&
                    !string.IsNullOrEmpty(this.dropdown_Expiration_Date_Year.SelectedValue) )
                {
                    bool parsed_Successfully = false;
                    DateTime date_Parsed = new DateTime(  );

                    try
                    {
                        date_Parsed = new DateTime(
                            int.Parse(this.dropdown_Expiration_Date_Year.SelectedValue),
                            int.Parse(this.dropdown_Expiration_Date_Month.SelectedValue),
                            1);

                        date_Parsed = date_Parsed.AddMonths(1);

                        parsed_Successfully = true;
                    }
                    catch
                    {
                        parsed_Successfully = false;
                    }

                    if (parsed_Successfully)
                    {
                        p_Expiration_Date = date_Parsed;
                    }
                }

                bool p_Is_Active = this.checkbox_Is_Active.Checked;
                int p_Updating_User_Id = base.Authenticated_User_ID;

                try
                {
                    l_BankAccount_Successfully_Updated = Business_Logic_Layer_Facade.Instance.CreditCards_Update_Credit_Card_Details(
                        p_Credit_Card_Id,
                        p_Bank_Account_Id,
                        p_Card_Name, 
                        p_Four_Ending_Digits,
                        p_Expiration_Date,
                        p_Is_Active, 
                        p_Updating_User_Id,
                        base.Authenticated_Permission_Type );
                }
                catch (Exception exc)
                {
                    l_BankAccount_Successfully_Updated = false;
                    exception_During_Process = exc.Message;
                    if (exc.InnerException != null)
                    {
                        exception_During_Process_Extra_Data = exc.InnerException.Message;
                    }
                }

                if (l_BankAccount_Successfully_Updated)
                {
                    // The client details were successfully updated. 
                    // redirect the user to view read only mode
                    Response.Redirect("manage_CreditCard.aspx?id=" + Request.QueryString["id"] + "&mode=view");
                }
                else
                {
                    // show error message to the user for the failed process
                    this.lbl_Insert_Process_Error_Result.Text = exception_During_Process;
                    if (!string.IsNullOrEmpty(exception_During_Process_Extra_Data))
                    {
                        this.lbl_Insert_Process_Error_Result.Text += " (" + exception_During_Process_Extra_Data + ")";
                    }
                }
            }
        }

        protected void button_Create_CreditCard_Details_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string exception_During_Process = "";
                string exception_During_Process_Extra_Data = "";

                int p_User_Id_Owner = base.Authenticated_User_ID;
                int p_Bank_Account_Id = int.Parse(this.dropdown_Bank_Account.SelectedValue);
                string p_Card_Name = this.textbox_Card_Name.Text;
                string p_Four_Ending_Digits = this.textbox_Four_Ending_Digits.Text;

                DateTime? p_Expiration_Date = new DateTime?();
                if (!string.IsNullOrEmpty(this.dropdown_Expiration_Date_Month.SelectedValue) &&
                    !string.IsNullOrEmpty(this.dropdown_Expiration_Date_Year.SelectedValue))
                {
                    bool parsed_Successfully = false;
                    DateTime date_Parsed = new DateTime();

                    try
                    {
                        date_Parsed = new DateTime(
                            int.Parse(this.dropdown_Expiration_Date_Year.SelectedValue),
                            int.Parse(this.dropdown_Expiration_Date_Month.SelectedValue),
                            1);

                        date_Parsed = date_Parsed.AddMonths(1);

                        parsed_Successfully = true;
                    }
                    catch
                    {
                        parsed_Successfully = false;
                    }

                    if (parsed_Successfully)
                    {
                        p_Expiration_Date = date_Parsed;
                    }
                }

                bool p_Is_Active = this.checkbox_Is_Active.Checked;
                int p_Creating_User_Id = base.Authenticated_User_ID;

                TimeLineDashboard.Shared.Models.Credit_Cards new_CreditCard_Details = null;
                int l_New_Credit_Card_Id = 0;
                bool l_CreditCard_Successfully_Created = false;

                try
                {
                    new_CreditCard_Details = Business_Logic_Layer_Facade.Instance.CreditCards_Add_New_Credit_Card(
                            p_User_Id_Owner,
                            p_Bank_Account_Id,
                            p_Card_Name,
                            p_Four_Ending_Digits,
                            p_Expiration_Date,
                            p_Is_Active,
                            p_Creating_User_Id,
                            base.Authenticated_Permission_Type);

                    l_New_Credit_Card_Id = new_CreditCard_Details.Credit_Card_Id;
                    l_CreditCard_Successfully_Created = true;
                }
                catch (Exception exc)
                {
                    exception_During_Process = exc.Message;
                    if (exc.InnerException != null)
                    {
                        exception_During_Process_Extra_Data = exc.InnerException.Message;
                    }
                }

                if (l_CreditCard_Successfully_Created && l_New_Credit_Card_Id > 0)
                {
                    Response.Redirect("manage_CreditCard.aspx?id=" + l_New_Credit_Card_Id + "&mode=view");
                }
                else
                {
                    // show error message to the user for the failed process
                    this.lbl_Insert_Process_Error_Result.Text = exception_During_Process;
                    if (!string.IsNullOrEmpty(exception_During_Process_Extra_Data))
                    {
                        this.lbl_Insert_Process_Error_Result.Text += " (" + exception_During_Process_Extra_Data + ")";
                    }
                }
            }
        }

        protected void button_Edit_CreditCard_Details_Click(object sender, EventArgs e)
        {
            this.Bind_Edit_View();
        }

        protected void button_CancelEdit_CreditCard_Details_Click(object sender, EventArgs e)
        {
            this.Bind_ReadOnly_View();
        }
    }
}
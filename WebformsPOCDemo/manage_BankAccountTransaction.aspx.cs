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
    public partial class manage_BankAccountTransaction : BasePage
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

            Common_Tools.Initialize_DropDown_Countries(this.dropdown_Country);
            Common_Tools.Initialize_DropDown_Document_Types(this.dropdown_Type);

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

        private void Validate_Permissions()
        {

        }

        private void Bind_ReadOnly_View()
        {
            base.Change_View_Mode_FormControls_Wrappers(true);

            this.button_Edit_BankAccount_Transaction_Details.Visible = true;
            this.button_Update_BankAccount_Transaction_Details.Visible = false;
            this.button_CancelEdit_BankAccount_Transaction_Details.Visible = false;
        }

        private void Bind_Edit_View()
        {
            base.Change_View_Mode_FormControls_Wrappers(false);

            this.button_Edit_BankAccount_Transaction_Details.Visible = false;
            this.button_Update_BankAccount_Transaction_Details.Visible = true;
            this.button_CancelEdit_BankAccount_Transaction_Details.Visible = true;
        }

        private void Set_Page_FormControls_Values()
        {
            int Bank_Account_Id = int.Parse(this.Request.QueryString["id"]);
            int user_Id_BankAccount_Owner = base.Authenticated_User_ID;

            Bank_Account_Transactions transactionDetails = Business_Logic_Layer_Facade.Instance.BankAccount_Transactions_Get_Transaction_Details_By_Transaction_Id(
                Bank_Account_Id, user_Id_BankAccount_Owner, user_Id_BankAccount_Owner);

            if (transactionDetails != null)
            {

                Common_Tools.Set_Number_Text_Value_To_TextBox_Label_Text(
                    transactionDetails.Transaction_Account_Balance,
                    this.textbox_Transaction_Account_Balance,
                    this.label_Transaction_Account_Balance);

                Common_Tools.Set_DateTime_To_TextBox_And_Label(
                    transactionDetails.Transaction_Actual_DateTime,
                    this.textbox_Transaction_Actual_DateTime,
                    this.label_Transaction_Actual_DateTime );

                Common_Tools.Set_Number_Text_Value_To_TextBox_Label_Text(
                    transactionDetails.Positive_Amount_Entered,
                    this.textbox_Positive_Amount_Entered,
                    this.label_Positive_Amount_Entered);

                Common_Tools.Set_Number_Text_Value_To_TextBox_Label_Text(
                    transactionDetails.Negative_Amount_Paid,
                    this.textbox_Negative_Amount_Paid,
                    this.label_Negative_Amount_Paid);

                Common_Tools.Set_DateTime_To_TextBox_And_Label(
                    transactionDetails.Transaction_Value_DateTime,
                    this.textbox_Transaction_Value_DateTime,
                    this.label_Transaction_Value_DateTime);

                this.textbox_Reference_Number.Text = transactionDetails.Reference_Number;
                this.label_Reference_Number.Text = transactionDetails.Reference_Number;

                this.textbox_Transaction_Bank_Description.Text = transactionDetails.Transaction_Bank_Description;
                this.label_Transaction_Bank_Description.Text = transactionDetails.Transaction_Bank_Description;

                this.textbox_Transaction_Bank_Inner_Reference_Code.Text = transactionDetails.Transaction_Bank_Inner_Reference_Code;
                this.label_Transaction_Bank_Inner_Reference_Code.Text = transactionDetails.Transaction_Bank_Inner_Reference_Code;

                this.textbox_Transaction_User_Description.Text = transactionDetails.Transaction_User_Description;
                this.label_Transaction_User_Description.Text = transactionDetails.Transaction_User_Description;

                this.textbox_Transaction_User_Comments.Text = transactionDetails.Transaction_User_Comments;
                this.label_Transaction_User_Comments.Text = transactionDetails.Transaction_User_Comments;

                this.checkbox_Is_Visible_To_Anonymous_Users.Checked = transactionDetails.Is_Visible_To_Anonymous_Users;
                this.label_Is_Visible_To_Anonymous_Users.Text = transactionDetails.Is_Visible_To_Anonymous_Users ? "Yes" : "No";

                this.checkbox_Is_Visible_To_Followers_Users.Checked = transactionDetails.Is_Visible_To_Followers_Users;
                this.label_Is_Visible_To_Followers_Users.Text = transactionDetails.Is_Visible_To_Followers_Users ? "Yes" : "No";

                this.label_Record_Created_By_User.Text = transactionDetails.Record_Created_By_User_Details.FullName_With_Email;
                this.label_Record_Creation_DateTime_UTC.Text = transactionDetails.Record_Creation_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
                this.label_Record_Last_Updated_By_User.Text = transactionDetails.Record_Last_Updated_By_User_Details.FullName_With_Email.ToString();
                this.label_Record_Last_Updated_DateTime_UTC.Text = transactionDetails.Record_Last_Updated_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
            }
            else
            {
                throw new Exception("Could not find any details for the transction.");
            }
        }

        protected void button_Update_BankAccount_Transaction_Details_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                bool l_BankAccount_Transaction_Successfully_Updated = false;

                string exception_During_Process = "";
                string exception_During_Process_Extra_Data = "";

                int p_Bank_Account_Transaction_Id = int.Parse(this.Request.QueryString["id"]);

                decimal p_Transaction_Account_Balance = decimal.Parse(textbox_Transaction_Account_Balance.Text);
                
                DateTime p_Transaction_Actual_DateTime = new DateTime();
                if (!string.IsNullOrEmpty(this.textbox_Transaction_Actual_DateTime.Text))
                {
                    bool parsed_Successfully = false;
                    DateTime date_Parsed = new DateTime();
                    try
                    {

                        parsed_Successfully = DateTime.TryParseExact(this.textbox_Transaction_Actual_DateTime.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out date_Parsed);
                    }
                    catch
                    {
                        parsed_Successfully = false;
                    }

                    if (parsed_Successfully)
                    {
                        p_Transaction_Actual_DateTime = date_Parsed;
                    }
                    else
                    {
                        throw new Exception("Invalid transaction date!");
                    }
                }
                else
                {
                    throw new Exception("Invalid transaction date!");
                }

                decimal p_Positive_Amount_Entered = decimal.Parse(textbox_Positive_Amount_Entered.Text);
                decimal p_Negative_Amount_Paid = decimal.Parse(textbox_Negative_Amount_Paid.Text);

                DateTime? p_Transaction_Value_DateTime = new DateTime?();
                if (!string.IsNullOrEmpty(this.textbox_Transaction_Value_DateTime.Text))
                {
                    bool parsed_Successfully = false;
                    DateTime date_Parsed = new DateTime();
                    try
                    {

                        parsed_Successfully = DateTime.TryParseExact(this.textbox_Transaction_Value_DateTime.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out date_Parsed);
                    }
                    catch
                    {
                        parsed_Successfully = false;
                    }

                    if (parsed_Successfully)
                    {
                        p_Transaction_Value_DateTime = date_Parsed;
                    }
                }

                string p_Reference_Number = this.textbox_Reference_Number.Text;
                string p_Transaction_Bank_Description = this.textbox_Transaction_Bank_Description.Text;
                string p_Transaction_Bank_Inner_Reference_Code = this.textbox_Transaction_Bank_Inner_Reference_Code.Text;
                string p_Transaction_User_Description = this.textbox_Transaction_User_Description.Text;
                string p_Transaction_User_Comments = this.textbox_Transaction_User_Comments.Text;
                
                bool p_Is_Visible_To_Anonymous_Users = this.checkbox_Is_Visible_To_Anonymous_Users.Checked;
                bool p_Is_Visible_To_Followers_Users = this.checkbox_Is_Visible_To_Followers_Users.Checked;

                int p_Updating_User_Id = base.Authenticated_User_ID;

                try
                {
                    l_BankAccount_Transaction_Successfully_Updated = Business_Logic_Layer_Facade.Instance.BankAccount_Transactions_Update_Transaction_Details(
                        p_Bank_Account_Transaction_Id, 
                        p_Transaction_Account_Balance,
                        p_Transaction_Actual_DateTime,
                        p_Positive_Amount_Entered,
                        p_Negative_Amount_Paid,
                        p_Transaction_Value_DateTime,
                        p_Reference_Number,
                        p_Transaction_Bank_Description,
                        p_Transaction_Bank_Inner_Reference_Code,
                        p_Transaction_User_Description,
                        p_Transaction_User_Comments, 
                        p_Is_Visible_To_Anonymous_Users,
                        p_Is_Visible_To_Followers_Users,
                        p_Updating_User_Id
                        );
                }
                catch (Exception exc)
                {
                    l_BankAccount_Transaction_Successfully_Updated = false;
                    exception_During_Process = exc.Message;
                    if (exc.InnerException != null)
                    {
                        exception_During_Process_Extra_Data = exc.InnerException.Message;
                    }
                }

                if (l_BankAccount_Transaction_Successfully_Updated)
                {
                    // The client details were successfully updated. 
                    // redirect the user to view read only mode
                    Response.Redirect("manage_BankAccountTransaction.aspx?id=" + Request.QueryString["id"] + "&mode=view");
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

        protected void button_Edit_BankAccount_Transaction_Details_Click(object sender, EventArgs e)
        {
            this.Bind_Edit_View();
        }

        protected void button_CancelEdit_BankAccount_Transaction_Details_Click(object sender, EventArgs e)
        {
            this.Bind_ReadOnly_View();
        }

        protected void dropdown_Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Bind_States_ComboBox();
        }

        private void Bind_States_ComboBox()
        {
            // check if the current selected country_id from the drop down has states
            Hide_Or_Show_States_And_Reset_Selection();
            short Country_Id = 0;

            if (!string.IsNullOrEmpty(this.dropdown_Country.SelectedValue))
            {
                short.TryParse(this.dropdown_Country.SelectedValue, out Country_Id);

                if (Country_Id > 0)
                {
                    List<States> countryId_States = Business_Logic_Layer_Facade.Instance.States_GetStates_By_Country_Id(Country_Id);

                    if (countryId_States.Count > 0)
                    {
                        this.dropdown_State.DataSource = countryId_States;
                        this.dropdown_State.DataTextField = "State_Name";
                        this.dropdown_State.DataValueField = "State_Id";
                        this.dropdown_State.DataBind();

                        this.dropdown_State.Items.Insert(0, new ListItem("-- Select State -- ", ""));
                    }

                    if (countryId_States != null && countryId_States.Count > 0)
                    {
                        this.panel_States.Visible = true;
                    }
                    else
                    {
                        this.panel_States.Visible = false;
                    }
                }
            }
        }

        private void Hide_Or_Show_States_And_Reset_Selection()
        {
            this.dropdown_State.ClearSelection();
            this.dropdown_State.Items.Clear();

            if (!string.IsNullOrEmpty(this.dropdown_Country.SelectedValue))
            {
                int country_Id = int.Parse(this.dropdown_Country.SelectedValue);
                if (country_Id == 14 || country_Id == 41 || country_Id == 237)
                {
                    this.panel_States.Visible = true;

                }
                else
                {
                    this.panel_States.Visible = false;
                }
            }
            else
            {
                this.panel_States.Visible = false;
            }
        }

        protected void button_Search_Documents_Click(object sender, EventArgs e)
        {
            DateTime? p_Filter_By_From_Date = new DateTime?();
            DateTime l_Filter_By_From_Date_For_Parsing_Result = new DateTime();

            DateTime? p_Filter_By_To_Date = new DateTime?();
            DateTime l_Filter_By_To_Date_For_Parsing_Result = new DateTime();

            bool l_Parsed_Successfully = DateTime.TryParseExact(this.text_Filter_By_From_Date.Text,
                "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out l_Filter_By_From_Date_For_Parsing_Result);
            if (l_Parsed_Successfully)
            {
                p_Filter_By_From_Date = l_Filter_By_From_Date_For_Parsing_Result;
            }

            l_Parsed_Successfully = DateTime.TryParseExact(this.text_Filter_By_To_Date.Text,
                "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out l_Filter_By_To_Date_For_Parsing_Result);
            if (l_Parsed_Successfully)
            {
                p_Filter_By_To_Date = l_Filter_By_To_Date_For_Parsing_Result;
            }

            short? filter_By_Type = new short?();
            if (!string.IsNullOrEmpty(this.dropdown_Type.SelectedValue))
            {
                filter_By_Type = short.Parse(this.dropdown_Type.SelectedValue);
            }

            short? filter_By_Country = new short?();
            short? filter_By_State = new short?();
            if (!string.IsNullOrEmpty(this.dropdown_Country.SelectedValue))
            {
                filter_By_Country = short.Parse(this.dropdown_Country.SelectedValue);
                if (!string.IsNullOrEmpty(this.dropdown_State.SelectedValue))
                {
                    filter_By_State = short.Parse(this.dropdown_State.SelectedValue);
                }
            }

            string filter_By_City_Or_Address_Or_ZipCode = this.text_Filter_By_CityAddressZipCode.Text;
            string filter_By_CompanyName_Or_Person_Fullname = this.text_Filter_By_CompanyNamePeopleName.Text;

            var list_Of_Documents_Searched = Business_Logic_Layer_Facade.Instance.GeneralDocuments_Get_Search(
                base.Authenticated_User_ID,
                filter_By_Type,
                filter_By_Country,
                filter_By_State,
                filter_By_City_Or_Address_Or_ZipCode,
                filter_By_CompanyName_Or_Person_Fullname);

            if (list_Of_Documents_Searched != null && list_Of_Documents_Searched.Count > 0)
            {
                this.dataGrid_Documents_List.DataSource = list_Of_Documents_Searched;
                this.dataGrid_Documents_List.DataBind();
                this.dataGrid_Documents_List.Visible = true;

                this.panel_No_Results_Message.Visible = false;
            }
            else
            {
                this.dataGrid_Documents_List.Visible = false;
                this.panel_No_Results_Message.Visible = true;
            }
        }
    }
}
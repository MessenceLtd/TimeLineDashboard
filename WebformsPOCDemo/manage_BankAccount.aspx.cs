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
    public partial class manage_BankAccount : BasePage
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

            Common_Tools.Initialize_DropDown_Currencies(this.dropdown_Currency);

            Common_Tools.Initialize_DropDown_Countries(this.dropdown_Branch_Country);

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

        protected void dropdown_Branch_Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Bind_States_ComboBox();
        }

        private void Bind_States_ComboBox()
        {
            // check if the current selected country_id from the drop down has states
            Hide_Or_Show_States_And_Reset_Selection();
            short Country_Id = 0;

            if (!string.IsNullOrEmpty(this.dropdown_Branch_Country.SelectedValue))
            {
                short.TryParse(this.dropdown_Branch_Country.SelectedValue, out Country_Id);

                if (Country_Id > 0)
                {
                    List<States> countryId_States = Business_Logic_Layer_Facade.Instance.States_GetStates_By_Country_Id(Country_Id);

                    if (countryId_States.Count > 0)
                    {
                        this.dropdown_Branch_State.DataSource = countryId_States;
                        this.dropdown_Branch_State.DataTextField = "State_Name";
                        this.dropdown_Branch_State.DataValueField = "State_Id";
                        this.dropdown_Branch_State.DataBind();

                        this.dropdown_Branch_State.Items.Insert(0, new ListItem("-- Select -- ", ""));
                    }

                    if (countryId_States != null && countryId_States.Count > 0)
                    {
                        this.p_State_Wrapper_Panel.Visible = true;
                    }
                    else
                    {
                        this.p_State_Wrapper_Panel.Visible = false;
                    }
                }
            }
        }

        private void Hide_Or_Show_States_And_Reset_Selection()
        {
            this.dropdown_Branch_State.ClearSelection();
            this.dropdown_Branch_State.Items.Clear();

            if (!string.IsNullOrEmpty(this.dropdown_Branch_Country.SelectedValue))
            {
                int country_Id = int.Parse(this.dropdown_Branch_Country.SelectedValue);
                if (country_Id == 14 || country_Id == 41 || country_Id == 237)
                {
                    this.p_State_Wrapper_Panel.Visible = true;

                }
                else
                {
                    this.p_State_Wrapper_Panel.Visible = false;
                }
            }
            else
            {
                this.p_State_Wrapper_Panel.Visible = false;
            }
        }

        private void Bind_ReadOnly_View()
        {
            base.Change_View_Mode_FormControls_Wrappers(true);

            this.button_Edit_BankAccount_Details.Visible = true;
            this.button_Update_BankAccount_Details.Visible = false;
            this.button_CancelEdit_BankAccount_Details.Visible = false;
        }

        private void Bind_Edit_View()
        {
            base.Change_View_Mode_FormControls_Wrappers(false);

            this.button_Edit_BankAccount_Details.Visible = false;
            this.button_Update_BankAccount_Details.Visible = true;
            this.button_CancelEdit_BankAccount_Details.Visible = true;
        }

        private void Set_Page_FormControls_Values()
        {
            int Bank_Account_Id = int.Parse(this.Request.QueryString["id"]);
            int user_Id_BankAccount_Owner = base.Authenticated_User_ID;

            Bank_Accounts BankAccountDetails = Business_Logic_Layer_Facade.Instance.BankAccounts_Get_Bank_Account_Details(
                Bank_Account_Id, user_Id_BankAccount_Owner);

            if (BankAccountDetails != null)
            {
                this.textbox_Bank_Name.Text = BankAccountDetails.Bank_Name;
                this.label_Bank_Name.Text = BankAccountDetails.Bank_Name;

                this.textbox_Bank_Number.Text = BankAccountDetails.Bank_Number;
                this.label_Bank_Number.Text = BankAccountDetails.Bank_Number;

                this.textbox_Branch_Name.Text = BankAccountDetails.Branch_Name;
                this.label_Branch_Name.Text = BankAccountDetails.Branch_Name;

                this.textbox_Branch_Number.Text = BankAccountDetails.Branch_Number;
                this.label_Branch_Number.Text = BankAccountDetails.Branch_Number;

                this.textbox_Account_Number.Text = BankAccountDetails.Account_Number;
                this.label_Account_Number.Text = BankAccountDetails.Account_Number;

                this.textbox_Account_Name.Text = BankAccountDetails.Account_Name;
                this.label_Account_Name.Text = BankAccountDetails.Account_Name;

                this.textbox_IBAN.Text = BankAccountDetails.IBAN;
                this.label_IBAN.Text = BankAccountDetails.IBAN;

                this.textbox_IBAN.Text = BankAccountDetails.IBAN;
                this.label_Currency.Text = BankAccountDetails.IBAN;

                Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                    BankAccountDetails.Currency_Id.ToString(),
                    this.dropdown_Currency,
                    this.label_Currency);

                Common_Tools.Set_DateTime_To_TextBox_And_Label(
                    BankAccountDetails.Opened_Account_DateTime,
                    this.textbox_Opened_Account_DateTime,
                    this.label_Opened_Account_DateTime);

                Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                    BankAccountDetails.Branch_Country_Id.ToString(),
                    this.dropdown_Branch_Country,
                    this.label_Branch_Country);

                this.Bind_States_ComboBox();
                if (BankAccountDetails.Branch_State_Id.HasValue)
                {
                    Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                        BankAccountDetails.Branch_State_Id.ToString(),
                        this.dropdown_Branch_State,
                        this.label_Branch_State);
                }

                this.textbox_Branch_City.Text = BankAccountDetails.Branch_City;
                this.label_Branch_City.Text = BankAccountDetails.Branch_City;

                this.textbox_Branch_Address.Text = BankAccountDetails.Branch_Address;
                this.label_Branch_Address.Text = BankAccountDetails.Branch_Address;

                this.textbox_Branch_Zipcode.Text = BankAccountDetails.Branch_Zipcode;
                this.label_Branch_Zipcode.Text = BankAccountDetails.Branch_Zipcode;

                this.textbox_Branch_Zipcode.Text = BankAccountDetails.Branch_Zipcode;
                this.label_Branch_Zipcode.Text = BankAccountDetails.Branch_Zipcode;
                
                this.textbox_Branch_Phone.Text = BankAccountDetails.Branch_Phone;
                this.label_Branch_Phone.Text = BankAccountDetails.Branch_Phone;

                this.textbox_Branch_Main_Email_Address.Text = BankAccountDetails.Branch_Main_Email_Address;
                this.label_Branch_Main_Email_Address.Text = BankAccountDetails.Branch_Main_Email_Address;

                this.textbox_Branch_Main_Contact.Text = BankAccountDetails.Branch_Main_Contact;
                this.label_Branch_Main_Contact.Text = BankAccountDetails.Branch_Main_Contact;

                this.textbox_Main_Contact_Phone_Number.Text = BankAccountDetails.Main_Contact_Phone_Number;
                this.label_Main_Contact_Phone_Number.Text = BankAccountDetails.Main_Contact_Phone_Number;

                Common_Tools.Set_DateTime_To_TextBox_And_Label(
                    BankAccountDetails.Account_Active_From_Date,
                    this.textbox_Account_Active_From_Date,
                    this.label_Account_Active_From_Date);

                Common_Tools.Set_DateTime_To_TextBox_And_Label(
                    BankAccountDetails.Account_Active_To_Date,
                    this.textbox_Account_Active_To_Date,
                    this.label_Account_Active_To_Date);

                this.checkbox_Is_Visible_To_Anonymous_Users.Checked = BankAccountDetails.Is_Visible_To_Anonymous_Users;
                this.label_Is_Visible_To_Anonymous_Users.Text = BankAccountDetails.Is_Visible_To_Anonymous_Users ? "Yes" : "No";

                this.checkbox_Is_Available_For_Download_For_Anonymous_Users.Checked = BankAccountDetails.Is_Available_For_Download_For_Anonymous_Users;
                this.label_Is_Available_For_Download_For_Anonymous_Users.Text = BankAccountDetails.Is_Available_For_Download_For_Anonymous_Users ? "Yes" : "No";

                this.checkbox_Is_Visible_To_Followers_Users.Checked = BankAccountDetails.Is_Visible_To_Followers_Users;
                this.label_Is_Visible_To_Followers_Users.Text = BankAccountDetails.Is_Visible_To_Followers_Users ? "Yes" : "No";

                this.checkbox_Is_Available_For_Download_For_Followers_Users.Checked = BankAccountDetails.Is_Available_For_Download_For_Followers_Users;
                this.label_Is_Available_For_Download_For_Followers_Users.Text = BankAccountDetails.Is_Available_For_Download_For_Followers_Users ? "Yes" : "No";

                this.checkbox_Is_Active.Checked = BankAccountDetails.Is_Active;
                this.label_Is_Active.Text = BankAccountDetails.Is_Active ? "Yes" : "No";

                this.label_Record_Created_By_User.Text = BankAccountDetails.Record_Created_By_User_Details.FullName_With_Email;
                this.label_Record_Creation_DateTime_UTC.Text = BankAccountDetails.Record_Creation_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
                this.label_Record_Last_Updated_By_User.Text = BankAccountDetails.Record_Last_Updated_By_User_Details.FullName_With_Email.ToString();
                this.label_Record_Last_Updated_DateTime_UTC.Text = BankAccountDetails.Record_Last_Updated_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
            }
        }

        protected void button_Update_BankAccount_Details_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                bool l_BankAccount_Successfully_Updated = false;

                string exception_During_Process = "";
                string exception_During_Process_Extra_Data = "";

                int p_Bank_Account_Id = int.Parse(this.Request.QueryString["id"]);
                string p_Bank_Name = this.textbox_Bank_Name.Text;
                string p_Bank_Number = this.textbox_Bank_Number.Text;
                string p_Branch_Name = this.textbox_Branch_Name.Text;
                string p_Branch_Number = this.textbox_Branch_Number.Text;

                string p_Account_Number = this.textbox_Account_Number.Text;
                string p_Account_Name = this.textbox_Account_Name.Text;
                string p_IBAN = this.textbox_IBAN.Text;

                byte? p_Currency_Id = new byte?();
                if (!string.IsNullOrEmpty(this.dropdown_Currency.SelectedValue))
                {
                    p_Currency_Id = byte.Parse(this.dropdown_Currency.SelectedValue);
                }

                DateTime? p_Opened_Account_DateTime = new DateTime?();
                if (!string.IsNullOrEmpty(this.textbox_Opened_Account_DateTime.Text))
                {
                    bool parsed_Successfully = false;
                    DateTime date_Parsed = new DateTime();
                    try
                    {

                        parsed_Successfully = DateTime.TryParseExact(this.textbox_Opened_Account_DateTime.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out date_Parsed);
                    }
                    catch
                    {
                        parsed_Successfully = false;
                    }

                    if (parsed_Successfully)
                    {
                        p_Opened_Account_DateTime = date_Parsed;
                    }
                }

                short? p_Branch_Country_Id = new short?();
                short? p_Branch_State_Id = new short?();
                if (!string.IsNullOrEmpty(this.dropdown_Branch_Country.SelectedValue))
                {
                    p_Branch_Country_Id = short.Parse(this.dropdown_Branch_Country.SelectedValue);
                    if (!string.IsNullOrEmpty(this.dropdown_Branch_State.SelectedValue))
                    {
                        p_Branch_State_Id = short.Parse(this.dropdown_Branch_State.SelectedValue);
                    }
                }

                string p_Branch_City = this.textbox_Branch_City.Text;
                string p_Branch_Address_Description = this.textbox_Branch_Address.Text;
                string p_Branch_ZipCode = this.textbox_Branch_Address.Text;
                string p_Branch_Phone = this.textbox_Branch_Phone.Text;
                string p_Branch_Main_Email_Address = this.textbox_Branch_Main_Email_Address.Text;
                string p_Branch_Main_Contact = this.textbox_Branch_Main_Contact.Text;
                string p_Main_Contact_Phone_Number = this.textbox_Main_Contact_Phone_Number.Text;

                DateTime? p_Account_Active_From_Date = new DateTime?();
                if (!string.IsNullOrEmpty(this.textbox_Account_Active_From_Date.Text))
                {
                    bool parsed_Successfully = false;
                    DateTime date_Parsed = new DateTime();
                    try
                    {

                        parsed_Successfully = DateTime.TryParseExact(this.textbox_Account_Active_From_Date.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out date_Parsed);
                    }
                    catch
                    {
                        parsed_Successfully = false;
                    }

                    if (parsed_Successfully)
                    {
                        p_Account_Active_From_Date = date_Parsed;
                    }
                }

                DateTime? p_Account_Active_To_Date = new DateTime?();
                if (!string.IsNullOrEmpty(this.textbox_Account_Active_To_Date.Text))
                {
                    bool parsed_Successfully = false;
                    DateTime date_Parsed = new DateTime();
                    try
                    {

                        parsed_Successfully = DateTime.TryParseExact(this.textbox_Account_Active_To_Date.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out date_Parsed);
                    }
                    catch
                    {
                        parsed_Successfully = false;
                    }

                    if (parsed_Successfully)
                    {
                        p_Account_Active_To_Date = date_Parsed;
                    }
                }

                bool p_Is_Visible_To_Anonymous_Users = this.checkbox_Is_Visible_To_Anonymous_Users.Checked;
                bool p_Is_Available_For_Download_For_Anonymous_Users = this.checkbox_Is_Available_For_Download_For_Anonymous_Users.Checked;
                bool p_Is_Visible_To_Followers_Users = this.checkbox_Is_Visible_To_Followers_Users.Checked;
                bool p_Is_Available_For_Download_For_Followers_Users = this.checkbox_Is_Available_For_Download_For_Followers_Users.Checked;
                bool p_Is_Active = this.checkbox_Is_Active.Checked;

                int p_Updating_User_Id = base.Authenticated_User_ID;

                try
                {
                    l_BankAccount_Successfully_Updated = Business_Logic_Layer_Facade.Instance.BankAccounts_Update_Bank_Account_Details(
                        p_Bank_Account_Id, p_Bank_Name, p_Bank_Number, p_Branch_Name,
                        p_Branch_Number, p_Account_Number, p_Account_Name,
                        p_IBAN, p_Currency_Id, p_Opened_Account_DateTime,
                        p_Branch_Country_Id, p_Branch_State_Id, p_Branch_City,
                        p_Branch_Address_Description, p_Branch_ZipCode, p_Branch_Phone,
                        p_Branch_Main_Email_Address, p_Branch_Main_Contact, p_Main_Contact_Phone_Number,
                        p_Account_Active_From_Date, p_Account_Active_To_Date,
                        p_Is_Visible_To_Anonymous_Users, p_Is_Available_For_Download_For_Anonymous_Users,
                        p_Is_Visible_To_Followers_Users, p_Is_Available_For_Download_For_Followers_Users,
                        p_Is_Active, p_Updating_User_Id
                        );
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
                    Response.Redirect("manage_BankAccount.aspx?id=" + Request.QueryString["id"] + "&mode=view");
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

        protected void button_Edit_BankAccount_Details_Click(object sender, EventArgs e)
        {
            this.Bind_Edit_View();
        }

        protected void button_CancelEdit_BankAccount_Details_Click(object sender, EventArgs e)
        {
            this.Bind_ReadOnly_View();
        }
    }
}
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
    public partial class Add_BankAccount : BasePage
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
            Common_Tools.Initialize_DropDown_Currencies(this.dropdown_Currency);

            Common_Tools.Initialize_DropDown_Countries(this.dropdown_Branch_Country);
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

        protected void button_Create_Bank_Account_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                bool l_Bank_Account_Successfully_Created = false;
                int l_New_Bank_Account_Id = 0;

                string exception_During_Process = "";
                string exception_During_Process_Extra_Data = "";

                int p_User_Id = base.Authenticated_User_ID;
                string p_Bank_Name = this.textbox_Bank_Name.Text;
                string p_Bank_Number = this.textbox_Bank_Number.Text;
                string p_Branch_Name = this.textbox_Branch_Name.Text;
                string p_Branch_Number = this.textbox_Branch_Number.Text;

                string p_Account_Number = this.textbox_Account_Number.Text;
                string p_Account_Name = this.textbox_Account_Name.Text;
                string p_IBAN = this.textbox_IBAN.Text;

                byte? p_Currency_Id = new byte?();
                if ( !string.IsNullOrEmpty( this.dropdown_Currency.SelectedValue))
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

                Bank_Accounts new_Bank_Account_Details = null;

                try
                {
                    new_Bank_Account_Details = Business_Logic_Layer_Facade.Instance.BankAccounts_Insert_New_Bank_Account_Details(
                        p_Bank_Name, p_Bank_Number, p_Branch_Name, 
                        p_Branch_Number, p_Account_Number, p_Account_Name, 
                        p_IBAN, p_Currency_Id, p_Opened_Account_DateTime, 
                        p_Branch_Country_Id, p_Branch_State_Id, p_Branch_City, 
                        p_Branch_Address_Description, p_Branch_ZipCode, p_Branch_Phone, 
                        p_Branch_Main_Email_Address, p_Branch_Main_Contact, p_Main_Contact_Phone_Number,
                        p_Account_Active_From_Date, p_Account_Active_To_Date, 
                        p_Is_Visible_To_Anonymous_Users, p_Is_Available_For_Download_For_Anonymous_Users,
                        p_Is_Visible_To_Followers_Users, p_Is_Available_For_Download_For_Followers_Users, 
                        p_Is_Active, p_User_Id
                        );

                    l_New_Bank_Account_Id = new_Bank_Account_Details.Bank_Account_Id;
                    l_Bank_Account_Successfully_Created = true;
                }
                catch (Exception exc)
                {
                    exception_During_Process = exc.Message;
                    if (exc.InnerException != null)
                    {
                        exception_During_Process_Extra_Data = exc.InnerException.Message;
                    }
                }

                if (l_Bank_Account_Successfully_Created && l_New_Bank_Account_Id > 0)
                {
                    // The user details was successfully created.. 
                    // Show success message and redirect the user to view page or back to users page (depends on where the user came from)
                    Response.Redirect("list_BankAccounts.aspx");
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
    }
}
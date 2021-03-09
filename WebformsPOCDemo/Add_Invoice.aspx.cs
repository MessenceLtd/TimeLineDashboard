using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TimeLineDashboard.BusinessLogicLayer;
using TimeLineDashboard.Shared.Models;
using WebformsPOCDemo.AppShared;

namespace WebformsPOCDemo
{
    public partial class Add_Invoice : BasePage
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
            // Bind users combo box if the current authenticated user is employee/administrator.
            this.dropdown_User_Selection.DataSource = Business_Logic_Layer_Facade.Instance.Users_Get_Administration_List(base.Authenticated_User_ID);
            this.dropdown_User_Selection.DataTextField = "FullName_With_Email";
            this.dropdown_User_Selection.DataValueField = "User_Id";
            this.dropdown_User_Selection.DataBind();
            this.dropdown_User_Selection.Items.Insert(0, new ListItem("-- Select -- ", ""));

            Common_Tools.Initialize_DropDown_Countries(this.dropdown_Invoiced_Client_To_Country);

            // bind currencies 
            Common_Tools.Initialize_DropDown_Currencies(this.dropdown_Currency);

            // bind time pickers
            Common_Tools.Initialize_DropDown_Hours(this.dropdown_Invoice_Time_Hours);
            Common_Tools.Initialize_DropDown_Minutes(this.dropdown_Invoice_Time_Minutes);
            Common_Tools.Initialize_DropDown_Seconds(this.dropdown_Invoice_Time_Seconds);

            Common_Tools.Initialize_DropDown_Hours(this.dropdown_Invoice_Creation_Time_Hours);
            Common_Tools.Initialize_DropDown_Minutes(this.dropdown_Invoice_Creation_Time_Minutes);
            Common_Tools.Initialize_DropDown_Seconds(this.dropdown_Invoice_Creation_Time_Seconds);

            // bind expense types
            Common_Tools.Initialize_DropDown_Invoice_Types(this.dropdown_Invoice_Type);
        }

        protected void dropdown_User_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Bind availble suppliers to pick based on current selected user
            this.Bind_DropDown_Supplier_After_User_Id_Selection();
        }

        private void Bind_DropDown_Supplier_After_User_Id_Selection()
        {
            if (!string.IsNullOrEmpty(this.dropdown_User_Selection.SelectedValue))
            {
                int p_Selected_User_Id_To_Return_Suppliers = int.Parse(this.dropdown_User_Selection.SelectedValue);
                var list_Users_Clients = Business_Logic_Layer_Facade.Instance.Clients_Get_All_By_User_Id(p_Selected_User_Id_To_Return_Suppliers, base.Authenticated_User_ID);

                this.dropdown_Client.DataSource = list_Users_Clients;
                this.dropdown_Client.DataTextField = "Company_Name";
                this.dropdown_Client.DataValueField = "Client_Id";
                this.dropdown_Client.DataBind();
                this.dropdown_Client.Items.Insert(0, new ListItem("-- Select -- ", ""));
            }
        }

        protected void dropdown_Client_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Bind default values the page based on recent supplier invoices for the user and supplier country for vat value
            User_Supplier_Selected();
        }

        private void User_Supplier_Selected()
        {
            this.Try_To_Auto_Fill_Invoice();
        }

        protected void button_Create_Invoice_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                bool l_Invoice_Successfully_Created = false;
                int l_New_Invoice_Id = 0;

                string exception_During_Process = "";
                string exception_During_Process_Extra_Data = "";

                int p_User_Id = int.Parse(this.dropdown_User_Selection.SelectedValue);
                int p_Client_Id = int.Parse(this.dropdown_Client.SelectedValue);

                DateTime? p_Invoice_DateTime = Common_Tools.Get_DateTime_From_ComboBoxes(
                    this.textbox_Invoice_DateTime,
                    this.dropdown_Invoice_Time_Hours,
                    this.dropdown_Invoice_Time_Minutes,
                    this.dropdown_Invoice_Time_Seconds);

                byte p_Currency_Id = byte.Parse(this.dropdown_Currency.SelectedValue);
                decimal p_Total_Amount = decimal.Parse(this.textbox_Total_Amount.Text);
                decimal p_Vat_Percentage = decimal.Parse(this.textbox_Vat_Percentage.Text);
                decimal p_Total_Without_Vat = decimal.Parse(this.textbox_Total_Without_Vat.Text);
                decimal p_Total_Vat = decimal.Parse(this.textbox_Total_Vat.Text);

                DateTime? p_Creation_DateTime = Common_Tools.Get_DateTime_From_ComboBoxes(
                    this.textbox_Creation_DateTime,
                    this.dropdown_Invoice_Creation_Time_Hours,
                    this.dropdown_Invoice_Creation_Time_Minutes,
                    this.dropdown_Invoice_Creation_Time_Seconds);

                int? p_Invoiced_Client_On_User_Location_Id = new int?();

                string p_Invoiced_Client_To_CompanyName = this.textbox_Invoiced_To_CompanyName.Text;
                string p_Invoiced_Client_To_Tax_Reference = this.textbox_Invoiced_To_Tax_Reference.Text;
                string p_Invoiced_Client_To_PersonName = this.textbox_Invoiced_To_PersonName.Text;
                string p_Invoiced_Client_To_PhoneNumber = this.textbox_Invoiced_Client_To_PhoneNumber.Text;

                short? p_Invoiced_Client_To_Country_Id = new short?();
                if (!string.IsNullOrEmpty(this.dropdown_Invoiced_Client_To_Country.SelectedValue))
                {
                    p_Invoiced_Client_To_Country_Id = short.Parse(this.dropdown_Invoiced_Client_To_Country.SelectedValue);
                }
                short? p_Invoiced_Client_To_State_Id = new short?();
                if (!string.IsNullOrEmpty(this.dropdown_Invoiced_Client_To_State.SelectedValue))
                {
                    p_Invoiced_Client_To_State_Id = short.Parse(this.dropdown_Invoiced_Client_To_State.SelectedValue);
                }

                string p_Invoiced_Client_To_City = this.textbox_Invoiced_Client_To_City.Text;
                string p_Invoiced_Client_To_Address = this.textbox_Invoiced_Client_To_Address.Text;
                string p_Invoiced_Client_To_Zip = this.textbox_Invoiced_Client_To_Zip.Text;
                string p_Invoiced_Client_To_EmailAddress = this.textbox_Invoiced_Client_To_EmailAddress.Text;

                byte p_Invoice_Type_Id = byte.Parse(this.dropdown_Invoice_Type.SelectedValue);
                string p_Invoice_Number = this.textbox_Invoice_Number.Text;
                string p_Invoice_Reference_Number = this.textbox_Invoice_Reference_Number.Text;

                string p_Invoice_Content_Long_Description = this.textbox_Invoice_Content_Long_Description.Text;
                string p_User_Description = this.textbox_User_Description.Text;
                string p_User_Comments = this.textbox_User_Description.Text;

                string p_Original_File_Name = this.textbox_Original_File_Name.Text;
                string p_Azure_Block_Blob_Reference = "N/A";

                bool p_Is_Visible_To_Anonymous_Users = this.checkbox_Is_Visible_To_Anonymous_Users.Checked;
                bool p_Is_Available_For_Download_For_Anonymous_Users = this.checkbox_Is_Available_For_Download_For_Anonymous_Users.Checked;
                bool p_Is_Visible_To_Followers_Users = this.checkbox_Is_Visible_To_Followers_Users.Checked;
                bool p_Is_Available_For_Download_For_Followers_Users = this.checkbox_Is_Available_For_Download_For_Followers_Users.Checked;

                int p_Record_Created_By_User_Id = base.Authenticated_User_ID; 
                DateTime p_Record_Creation_DateTime_UTC = DateTime.UtcNow;
                int p_Record_Last_Updated_By_User_Id = base.Authenticated_User_ID;
                DateTime p_Record_Last_Updated_DateTime_UTC = DateTime.UtcNow;
                bool p_Is_Active = this.checkbox_Is_Active.Checked;

                TimeLineDashboard.Shared.Models.Invoices new_Invoice_Details = null;

                try
                {
                    new_Invoice_Details = Business_Logic_Layer_Facade.Instance.Invoices_Insert_New_Invoice_Details(
                        p_User_Id, p_Client_Id, p_Invoice_DateTime, p_Currency_Id, p_Total_Amount, p_Vat_Percentage,
                        p_Total_Without_Vat, p_Total_Vat, p_Creation_DateTime , p_Invoiced_Client_On_User_Location_Id, 
                        p_Invoiced_Client_To_CompanyName, p_Invoiced_Client_To_Tax_Reference,
                        p_Invoiced_Client_To_PersonName, p_Invoiced_Client_To_PhoneNumber, p_Invoiced_Client_To_Country_Id,
                        p_Invoiced_Client_To_State_Id, p_Invoiced_Client_To_City, 
                        p_Invoiced_Client_To_Address, p_Invoiced_Client_To_Zip,
                        p_Invoiced_Client_To_EmailAddress, p_Invoice_Type_Id, 
                        p_Invoice_Number, p_Invoice_Reference_Number,
                        p_Invoice_Content_Long_Description, p_User_Description,
                        p_User_Comments, p_Original_File_Name, p_Azure_Block_Blob_Reference,
                        p_Is_Visible_To_Anonymous_Users, p_Is_Available_For_Download_For_Anonymous_Users,
                        p_Is_Visible_To_Followers_Users, p_Is_Available_For_Download_For_Followers_Users,
                        p_Record_Created_By_User_Id, p_Record_Creation_DateTime_UTC,
                        p_Record_Last_Updated_By_User_Id, p_Record_Last_Updated_DateTime_UTC,
                        p_Is_Active
                        );

                    l_New_Invoice_Id = new_Invoice_Details.Invoice_Record_Id;
                    l_Invoice_Successfully_Created = true;
                }
                catch (Exception exc)
                {
                    exception_During_Process = exc.Message;
                    if (exc.InnerException != null)
                    {
                        exception_During_Process_Extra_Data = exc.InnerException.Message;
                    }
                }

                if (l_Invoice_Successfully_Created && l_New_Invoice_Id > 0)
                {
                    // The user details was successfully created.. 
                    // Show success message and redirect the user to view page or back to users page (depends on where the user came from)
                    Response.Redirect("list_Invoices.aspx");
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

        protected void textbox_Invoice_DateTime_TextChanged(object sender, EventArgs e)
        {
            this.Try_To_Auto_Fill_Invoice();
        }

        private void Try_To_Auto_Fill_Invoice()
        {
            if (!string.IsNullOrEmpty(this.dropdown_Client.SelectedValue) && !string.IsNullOrEmpty(this.textbox_Invoice_DateTime.Text))
            {
                // Auto complete should be initiated only when the Supplier & the datetime has been picked. 
                // It will help with fillup iether supplier default values incase its his first expense or fetch from the most recent expense that its date is larger then the current selected datetime
                // If the supplier has an expense but user selected a datetime that doesnt match a value in the table try to get any recent expense (of the supplier) and use its autocomplete values
                DateTime p_Invoice_Invoice_DateTime = DateTime.ParseExact(this.textbox_Invoice_DateTime.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None);

                // ask business logic to create a pre populate expense entity based on supplier selection
                int p_Authenticated_User_Id = base.Authenticated_User_ID;
                int p_Client_Id = int.Parse(this.dropdown_Client.SelectedValue);
                var base_Invoice_For_Auto_Complete = Business_Logic_Layer_Facade.Instance.Invoices_Get_Auto_Complete_Invoice_Based_On_Client_And_DateTime_Selection(p_Client_Id, p_Invoice_Invoice_DateTime, p_Authenticated_User_Id);

                // Fillup details if the user has not entered values in ~2 main textboxes (that should be auto completed with default values 
                if (string.IsNullOrEmpty(this.textbox_Invoiced_Client_To_City.Text) &&
                        string.IsNullOrEmpty(this.textbox_Invoiced_Client_To_Address.Text))
                {
                    this.textbox_Vat_Percentage.Text = base_Invoice_For_Auto_Complete.Vat_Percentage.ToString();
                    //this.textbox_Invoiced_Client_To_Address.Text = base_Invoice_For_Auto_Complete.Invoiced_Client_To_Address;
                    this.textbox_Invoiced_To_Tax_Reference.Text = base_Invoice_For_Auto_Complete.Invoiced_Client_To_Tax_Reference;
                    if (base_Invoice_For_Auto_Complete.Invoiced_Client_To_Country_Id.HasValue)
                    {
                        this.dropdown_Invoiced_Client_To_Country.SelectedValue = base_Invoice_For_Auto_Complete.Invoiced_Client_To_Country_Id.Value.ToString();
                        this.Bind_Invoiced_Client_States_ComboBox();

                        if (base_Invoice_For_Auto_Complete.Invoiced_Client_To_State_Id.HasValue)
                        {
                            this.dropdown_Invoiced_Client_To_State.SelectedValue = base_Invoice_For_Auto_Complete.Invoiced_Client_To_State_Id.Value.ToString();
                        }
                    }

                    this.textbox_Invoiced_Client_To_City.Text = base_Invoice_For_Auto_Complete.Invoiced_Client_To_City;
                    this.textbox_Invoiced_Client_To_Address.Text = base_Invoice_For_Auto_Complete.Invoiced_Client_To_Address;
                    this.textbox_Invoiced_Client_To_Zip.Text = base_Invoice_For_Auto_Complete.Invoiced_Client_To_Zip;
                    this.textbox_Invoiced_Client_To_EmailAddress.Text = base_Invoice_For_Auto_Complete.Invoiced_Client_To_EmailAddress;
                    this.textbox_Invoiced_Client_To_PhoneNumber.Text = base_Invoice_For_Auto_Complete.Invoiced_Client_To_PhoneNumber;
                    this.textbox_Invoiced_To_PersonName.Text = base_Invoice_For_Auto_Complete.Invoiced_Client_To_PersonName;

                    if (base_Invoice_For_Auto_Complete.Currency_Id > 0 )
                    { 
                        this.dropdown_Currency.SelectedValue = base_Invoice_For_Auto_Complete.Currency_Id.ToString();
                    }
                }
            }
        }

        private void Bind_Invoiced_Client_States_ComboBox()
        {
            // check if the current selected country_id from the drop down has states
            Hide_Or_Show_Invoiced_Client_States_And_Reset_Selection();
            short Country_Id = 0;

            if (!string.IsNullOrEmpty(this.dropdown_Invoiced_Client_To_Country.SelectedValue))
            {
                short.TryParse(this.dropdown_Invoiced_Client_To_Country.SelectedValue, out Country_Id);

                if (Country_Id > 0)
                {
                    List<States> countryId_States = Business_Logic_Layer_Facade.Instance.States_GetStates_By_Country_Id(Country_Id);

                    if (countryId_States.Count > 0)
                    {
                        this.dropdown_Invoiced_Client_To_State.DataSource = countryId_States;
                        this.dropdown_Invoiced_Client_To_State.DataTextField = "State_Name";
                        this.dropdown_Invoiced_Client_To_State.DataValueField = "State_Id";
                        this.dropdown_Invoiced_Client_To_State.DataBind();

                        this.dropdown_Invoiced_Client_To_State.Items.Insert(0, new ListItem("-- Select -- ", ""));
                    }

                    if (countryId_States != null && countryId_States.Count > 0)
                    {
                        this.p_Invoiced_Client_To_State_Wrapper_Panel.Visible = true;
                    }
                    else
                    {
                        this.p_Invoiced_Client_To_State_Wrapper_Panel.Visible = false;
                    }
                }
            }
        }

        private void Hide_Or_Show_Invoiced_Client_States_And_Reset_Selection()
        {
            this.dropdown_Invoiced_Client_To_State.ClearSelection();
            this.dropdown_Invoiced_Client_To_State.Items.Clear();

            if (!string.IsNullOrEmpty(this.dropdown_Invoiced_Client_To_Country.SelectedValue))
            {
                int country_Id = int.Parse(this.dropdown_Invoiced_Client_To_Country.SelectedValue);
                if (country_Id == 14 || country_Id == 41 || country_Id == 237)
                {
                    this.p_Invoiced_Client_To_State_Wrapper_Panel.Visible = true;
                }
                else
                {
                    this.p_Invoiced_Client_To_State_Wrapper_Panel.Visible = false;
                }
            }
            else
            {
                this.p_Invoiced_Client_To_State_Wrapper_Panel.Visible = false;
            }
        }

        protected void dropdown_Invoiced_Client_To_Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Bind_Invoiced_Client_States_ComboBox();
        }       
    }
}
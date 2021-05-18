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
    public partial class manage_Invoice : BasePage
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

            int p_Selected_User_Id_To_Return_Clients = base.Authenticated_User_ID;
            var list_Users_Clients = Business_Logic_Layer_Facade.Instance.Clients_Get_All_By_User_Id(p_Selected_User_Id_To_Return_Clients, base.Authenticated_User_ID);

            this.dropdown_Client.DataSource = list_Users_Clients;
            this.dropdown_Client.DataTextField = "Company_Name";
            this.dropdown_Client.DataValueField = "Client_Id";
            this.dropdown_Client.DataBind();
            this.dropdown_Client.Items.Insert(0, new ListItem("-- Select -- ", ""));

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

            this.button_Edit_Invoice_Details.Visible = true;
            this.button_Update_Invoice_Details.Visible = false;
            this.button_CancelEdit_Invoice_Details.Visible = false;
        }

        private void Bind_Edit_View()
        {
            base.Change_View_Mode_FormControls_Wrappers(false);

            this.button_Edit_Invoice_Details.Visible = false;
            this.button_Update_Invoice_Details.Visible = true;
            this.button_CancelEdit_Invoice_Details.Visible = true;
        }

        private void Set_Page_FormControls_Values()
        {

            int Invoice_Record_Id = int.Parse(this.Request.QueryString["id"]);
            int user_Id_Invoice_Owner = base.Authenticated_User_ID;

            Invoices InvoiceDetails = Business_Logic_Layer_Facade.Instance.Invoices_Get_By_Id(
                Invoice_Record_Id, 
                user_Id_Invoice_Owner, 
                base.Authenticated_User_ID,
                base.Authenticated_Permission_Type );

            if (InvoiceDetails != null)
            {
                this.textbox_Invoice_DateTime.Text = InvoiceDetails.Invoice_DateTime.ToString("dd/MM/yyyy");
                this.label_Invoice_DateTime.Text = InvoiceDetails.Invoice_DateTime.ToString("dd/MM/yyyy");

                Common_Tools.Set_DateTime_To_ComboBoxes_And_Label(
                    InvoiceDetails.Invoice_DateTime,
                    this.textbox_Invoice_DateTime,
                    this.label_Invoice_DateTime,
                    this.dropdown_Invoice_Time_Hours,
                    this.dropdown_Invoice_Time_Minutes,
                    this.dropdown_Invoice_Time_Seconds,
                    this.label_Invoice_Time
                    );

                Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                    InvoiceDetails.Client_Id.ToString(),
                    this.dropdown_Client,
                    this.label_Client);

                Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                    InvoiceDetails.Currency_Id.ToString(),
                    this.dropdown_Currency,
                    this.label_Currency);

                Common_Tools.Set_Number_Text_Value_To_TextBox_Label_Text(
                    InvoiceDetails.Total_Amount, this.textbox_Total_Amount, this.label_Total_Amount);

                Common_Tools.Set_Number_Text_Value_To_TextBox_Label_Text(
                    InvoiceDetails.Vat_Percentage, this.textbox_Vat_Percentage, this.label_Vat_Percentage);

                Common_Tools.Set_Number_Text_Value_To_TextBox_Label_Text(
                    InvoiceDetails.Total_Without_Vat, this.textbox_Total_Without_Vat, this.label_Total_Without_Vat);

                Common_Tools.Set_Number_Text_Value_To_TextBox_Label_Text(
                    InvoiceDetails.Total_Vat, this.textbox_Total_Vat, this.label_Total_Vat);

                Common_Tools.Set_DateTime_To_ComboBoxes_And_Label(
                    InvoiceDetails.Creation_DateTime,
                    this.textbox_Creation_DateTime,
                    this.label_Creation_DateTime,
                    this.dropdown_Invoice_Creation_Time_Hours,
                    this.dropdown_Invoice_Creation_Time_Minutes,
                    this.dropdown_Invoice_Creation_Time_Seconds,
                    this.label_Invoice_Creation_Time
                    );

                this.textbox_Invoiced_On_User_Location_Id.Text = InvoiceDetails.Invoiced_Client_On_User_Location_Id.ToString();
                this.label_Invoiced_On_User_Location_Id.Text = InvoiceDetails.Invoiced_Client_On_User_Location_Id.ToString();

                this.textbox_Invoiced_Client_To_CompanyName.Text = InvoiceDetails.Invoiced_Client_To_CompanyName.ToString();
                this.label_Invoiced_Client_To_CompanyName.Text = InvoiceDetails.Invoiced_Client_To_CompanyName.ToString();

                this.textbox_Invoiced_Client_To_Tax_Reference.Text = InvoiceDetails.Invoiced_Client_To_Tax_Reference.ToString();
                this.label_Invoiced_Client_To_Tax_Reference.Text = InvoiceDetails.Invoiced_Client_To_Tax_Reference.ToString();

                this.textbox_Invoiced_Client_To_PersonName.Text = InvoiceDetails.Invoiced_Client_To_PersonName.ToString();
                this.label_Invoiced_Client_To_PersonName.Text = InvoiceDetails.Invoiced_Client_To_PersonName.ToString();

                this.textbox_Invoiced_Client_To_PhoneNumber.Text = InvoiceDetails.Invoiced_Client_To_PhoneNumber.ToString();
                this.label_Invoiced_Client_To_PhoneNumber.Text = InvoiceDetails.Invoiced_Client_To_PhoneNumber.ToString();

                Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                    InvoiceDetails.Invoiced_Client_To_Country_Id.ToString(),
                    this.dropdown_Invoiced_Client_To_Country,
                    this.label_Invoiced_Client_To_Country);

                this.Bind_Invoiced_Client_States_ComboBox();

                Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                    InvoiceDetails.Invoiced_Client_To_State_Id.ToString(),
                    this.dropdown_Invoiced_Client_To_State,
                    this.label_Invoiced_Client_To_State);

                this.textbox_Invoiced_Client_To_City.Text = InvoiceDetails.Invoiced_Client_To_City;
                this.label_Invoiced_Client_To_City.Text = InvoiceDetails.Invoiced_Client_To_City;

                this.textbox_Invoiced_Client_To_Address.Text = InvoiceDetails.Invoiced_Client_To_Address;
                this.label_Invoiced_Client_To_Address.Text = InvoiceDetails.Invoiced_Client_To_Address;

                this.textbox_Invoiced_Client_To_Zip.Text = InvoiceDetails.Invoiced_Client_To_Zip;
                this.label_Invoiced_Client_To_Zip.Text = InvoiceDetails.Invoiced_Client_To_Zip;

                this.textbox_Invoiced_Client_To_Zip.Text = InvoiceDetails.Invoiced_Client_To_Zip;
                this.label_Invoiced_Client_To_Zip.Text = InvoiceDetails.Invoiced_Client_To_Zip;

                this.textbox_Invoiced_Client_To_EmailAddress.Text = InvoiceDetails.Invoiced_Client_To_EmailAddress;
                this.label_Invoiced_Client_To_EmailAddress.Text = InvoiceDetails.Invoiced_Client_To_EmailAddress;

                Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                    InvoiceDetails.Invoice_Type_Id.ToString(),
                    this.dropdown_Invoice_Type,
                    this.label_Invoice_Type);

                this.textbox_Invoice_Number.Text = InvoiceDetails.Invoice_Number;
                this.label_Invoice_Number.Text = InvoiceDetails.Invoice_Number;

                this.textbox_Invoice_Reference_Number.Text = InvoiceDetails.Invoice_Reference_Number;
                this.label_Invoice_Reference_Number.Text = InvoiceDetails.Invoice_Reference_Number;

                this.textbox_Invoice_Content_Long_Description.Text = InvoiceDetails.Invoice_Content_Long_Description;
                this.label_Invoice_Content_Long_Description.Text = InvoiceDetails.Invoice_Content_Long_Description;

                this.textbox_User_Description.Text = InvoiceDetails.User_Description;
                this.label_User_Description.Text = InvoiceDetails.User_Description;

                this.textbox_User_Comments.Text = InvoiceDetails.User_Comments;
                this.label_User_Comments.Text = InvoiceDetails.User_Comments;

                //textbox_Original_File_Name // TODO -- Show file management / update

                this.checkbox_Is_Visible_To_Anonymous_Users.Checked = InvoiceDetails.Is_Visible_To_Anonymous_Users;
                this.label_Is_Visible_To_Anonymous_Users.Text = InvoiceDetails.Is_Visible_To_Anonymous_Users ? "Yes" : "No";

                this.checkbox_Is_Available_For_Download_For_Anonymous_Users.Checked = InvoiceDetails.Is_Available_For_Download_For_Anonymous_Users;
                this.label_Is_Available_For_Download_For_Anonymous_Users.Text = InvoiceDetails.Is_Available_For_Download_For_Anonymous_Users ? "Yes" : "No";

                this.checkbox_Is_Visible_To_Followers_Users.Checked = InvoiceDetails.Is_Visible_To_Followers_Users;
                this.label_Is_Visible_To_Followers_Users.Text = InvoiceDetails.Is_Visible_To_Followers_Users ? "Yes" : "No";

                this.checkbox_Is_Available_For_Download_For_Followers_Users.Checked = InvoiceDetails.Is_Available_For_Download_For_Followers_Users;
                this.label_Is_Available_For_Download_For_Followers_Users.Text = InvoiceDetails.Is_Available_For_Download_For_Followers_Users ? "Yes" : "No";

                this.checkbox_Is_Active.Checked = InvoiceDetails.Is_Active;
                this.label_Is_Active.Text = InvoiceDetails.Is_Active ? "Yes" : "No";

                this.label_Record_Created_By_User.Text = InvoiceDetails.Record_Created_By_User_Details.FullName_With_Email;
                this.label_Record_Creation_DateTime_UTC.Text = InvoiceDetails.Record_Creation_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
                this.label_Record_Last_Updated_By_User.Text = InvoiceDetails.Record_Last_Updated_By_User_Details.FullName_With_Email.ToString();
                this.label_Record_Last_Updated_DateTime_UTC.Text = InvoiceDetails.Record_Last_Updated_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
            }
        }

        protected void textbox_Invoice_DateTime_TextChanged(object sender, EventArgs e)
        {
            this.Try_To_Auto_Fill_Invoice();
        }

        protected void button_Update_Invoice_Details_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                bool l_Invoice_Successfully_Updated = false;

                string exception_During_Process = "";
                string exception_During_Process_Extra_Data = "";

                int p_Invoice_Record_Id = int.Parse(this.Request.QueryString["id"]);
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

                string p_Invoiced_Client_To_CompanyName = this.textbox_Invoiced_Client_To_CompanyName.Text;
                string p_Invoiced_Client_To_Tax_Reference = this.textbox_Invoiced_Client_To_Tax_Reference.Text;
                string p_Invoiced_Client_To_PersonName = this.textbox_Invoiced_Client_To_PersonName.Text;
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

                bool p_Is_Visible_To_Anonymous_Users = this.checkbox_Is_Visible_To_Anonymous_Users.Checked;
                bool p_Is_Available_For_Download_For_Anonymous_Users = this.checkbox_Is_Available_For_Download_For_Anonymous_Users.Checked;
                bool p_Is_Visible_To_Followers_Users = this.checkbox_Is_Visible_To_Followers_Users.Checked;
                bool p_Is_Available_For_Download_For_Followers_Users = this.checkbox_Is_Available_For_Download_For_Followers_Users.Checked;

                bool p_Is_Active = this.checkbox_Is_Active.Checked;
                int p_Updating_User_Id = base.Authenticated_User_ID;

                try
                {
                    l_Invoice_Successfully_Updated = Business_Logic_Layer_Facade.Instance.Invoices_Update_Invoice_Details(
                        p_Invoice_Record_Id, p_Client_Id, p_Invoice_DateTime, p_Currency_Id, p_Total_Amount, p_Vat_Percentage,
                        p_Total_Without_Vat, p_Total_Vat, p_Creation_DateTime, p_Invoiced_Client_On_User_Location_Id,
                        p_Invoiced_Client_To_CompanyName, p_Invoiced_Client_To_Tax_Reference,
                        p_Invoiced_Client_To_PersonName, p_Invoiced_Client_To_PhoneNumber, p_Invoiced_Client_To_Country_Id,
                        p_Invoiced_Client_To_State_Id, p_Invoiced_Client_To_City,
                        p_Invoiced_Client_To_Address, p_Invoiced_Client_To_Zip,
                        p_Invoiced_Client_To_EmailAddress, p_Invoice_Type_Id,
                        p_Invoice_Number, p_Invoice_Reference_Number,
                        p_Invoice_Content_Long_Description, p_User_Description, p_User_Comments, 
                        p_Is_Visible_To_Anonymous_Users, p_Is_Available_For_Download_For_Anonymous_Users,
                        p_Is_Visible_To_Followers_Users, p_Is_Available_For_Download_For_Followers_Users,
                        p_Is_Active, p_Updating_User_Id
                        );
                }
                catch (Exception exc)
                {
                    l_Invoice_Successfully_Updated = false;
                    exception_During_Process = exc.Message;
                    if (exc.InnerException != null)
                    {
                        exception_During_Process_Extra_Data = exc.InnerException.Message;
                    }
                }

                if (l_Invoice_Successfully_Updated)
                {
                    // The client details were successfully updated. 
                    // redirect the user to view read only mode
                    Response.Redirect("manage_Invoice.aspx?id=" + Request.QueryString["id"] + "&mode=view");
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

        protected void textbox_Invoice_Invoice_DateTime_TextChanged(object sender, EventArgs e)
        {
            this.Try_To_Auto_Fill_Invoice();
        }

        protected void dropdown_Client_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Bind default values the page based on recent supplier invoices for the user and supplier country for vat value
            User_Client_Selected();
        }

        private void User_Client_Selected()
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
                    this.textbox_Invoiced_Client_To_Tax_Reference.Text = base_Invoice_For_Auto_Complete.Invoiced_Client_To_Tax_Reference;
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
                    this.textbox_Invoiced_Client_To_PersonName.Text = base_Invoice_For_Auto_Complete.Invoiced_Client_To_PersonName;

                    if (base_Invoice_For_Auto_Complete.Currency_Id > 0)
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

        protected void button_Edit_Invoice_Details_Click(object sender, EventArgs e)
        {
            this.Bind_Edit_View();
        }

        protected void button_CancelEdit_Invoice_Details_Click(object sender, EventArgs e)
        {
            this.Bind_ReadOnly_View();
        }
    }
}
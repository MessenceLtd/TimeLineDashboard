using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TimeLineDashboard.BusinessLogicLayer;
using TimeLineDashboard.Shared.Models;

namespace WebformsPOCDemo
{
    public partial class Add_Expense : System.Web.UI.Page
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
            // bind the combobox of the countries

            // Bind users combo box if the current authenticated user is employee/administrator.
            this.dropdown_User_Selection.DataSource = Business_Logic_Layer_Facade.Instance.Users_Get_Administration_List(1);
            this.dropdown_User_Selection.DataTextField = "FullName_With_Email";
            this.dropdown_User_Selection.DataValueField = "User_Id";
            this.dropdown_User_Selection.DataBind();
            this.dropdown_User_Selection.Items.Insert(0, new ListItem("-- Select -- ", ""));

            Common_Tools.Initialize_DropDown_Countries(this.dropdown_Invoice_Supplier_Country);

            // bind currencies 
            Common_Tools.Initialize_DropDown_Currencies(this.dropdown_Currency);
            
            // bind time pickers
            Common_Tools.Initialize_DropDown_Hours(this.dropdown_Invoice_Time_Hours);
            Common_Tools.Initialize_DropDown_Minutes(this.dropdown_Invoice_Time_Minutes);
            Common_Tools.Initialize_DropDown_Seconds(this.dropdown_Invoice_Time_Seconds);

            // bind expense types
            Common_Tools.Initialize_DropDown_Expense_Types(this.dropdown_Expense_Type);
        }

        protected void button_Create_Supplier_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                //bool l_Supplier_Successfully_Created = false;
                //int l_New_Supplier_Id = 0;

                //string exception_During_Process = "";
                //string exception_During_Process_Extra_Data = "";

                //int p_User_Id = 1;
                //string p_Company_Name = this.textbox_Company_Name.Text;
                //string p_Website_URL = this.textbox_Website_URL.Text;
                //short p_Country_Id = short.Parse(this.dropdown_Country.SelectedValue);
                //short? p_State_Id = new short?();
                //if (this.dropdown_State.Items.Count > 0)
                //{
                //    p_State_Id = short.Parse(this.dropdown_State.SelectedValue);
                //}

                //string p_City = this.textbox_City.Text;
                //string p_Address = this.textbox_Address.Text;
                //string p_ZipCode = this.textbox_Zipcode.Text;
                //string p_Telephone = this.textbox_Telephone.Text;
                //string p_Mobile_Phone = this.textbox_Mobile_Phone.Text;

                //short p_Supplier_Type_Id = short.Parse(this.dropdown_Supplier_Type.SelectedValue);
                //string p_Supplier_Tax_Reference_Number = this.textbox_Supplier_Tax_Reference_Number.Text;

                //string p_Main_Contact_FullName = this.textbox_Main_Contact_FullName.Text;
                //string p_Main_Contact_Email_Address = this.textbox_Main_Contact_Email_Address.Text;
                //string p_Main_Contact_Phone_Number = this.textbox_Main_Contact_Phone_Number.Text;

                //DateTime? p_Supplier_From_Date = new DateTime?();
                //DateTime l_Supplier_From_Date_For_Parsing_Result = new DateTime();
                //DateTime? p_Supplier_To_Date = new DateTime?();
                //DateTime l_Supplier_To_Date_For_Parsing_Result = new DateTime();
                //DateTime? p_First_Contract_Date = new DateTime?();
                //DateTime l_First_Contract_Date_For_Parsing_Result = new DateTime();

                //bool l_Parsed_Successfully = DateTime.TryParseExact(this.textbox_Supplier_From_Date.Text,
                //    "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out l_Supplier_From_Date_For_Parsing_Result);
                //if (l_Parsed_Successfully)
                //{
                //    p_Supplier_From_Date = l_Supplier_From_Date_For_Parsing_Result;
                //}

                //l_Parsed_Successfully = DateTime.TryParseExact(this.textbox_Supplier_To_Date.Text,
                //    "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out l_Supplier_To_Date_For_Parsing_Result);
                //if (l_Parsed_Successfully)
                //{
                //    p_Supplier_To_Date = l_Supplier_To_Date_For_Parsing_Result;
                //}

                //l_Parsed_Successfully = DateTime.TryParseExact(this.textbox_First_Contract_Date.Text,
                //    "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out l_First_Contract_Date_For_Parsing_Result);
                //if (l_Parsed_Successfully)
                //{
                //    p_First_Contract_Date = l_First_Contract_Date_For_Parsing_Result;
                //}

                //string p_First_Contract_Signed_With_Contact_Full_Name = this.textbox_First_Contract_Signed_With_Contact_Full_Name.Text;
                //string p_First_Contract_Signed_In_Location_Description = this.textbox_First_Contract_Signed_In_Location_Description.Text;

                //bool p_Is_Active = this.checkbox_Is_Active.Checked;
                //int p_Logged_In_Administrative_User_Id = 1;

                //TimeLineDashboard.Shared.Models.Suppliers new_Supplier_Details = null;

                //try
                //{
                //    new_Supplier_Details = Business_Logic_Layer_Facade.Instance.Suppliers_Insert_New_Supplier_Administrative_Registration_Process(
                //        p_User_Id, p_Company_Name, p_Website_URL, p_Country_Id,
                //        p_State_Id, p_City, p_Address, p_ZipCode,
                //        p_Telephone, p_Mobile_Phone, p_Supplier_Type_Id,
                //        p_Supplier_Tax_Reference_Number, p_Main_Contact_FullName,
                //        p_Main_Contact_Email_Address, p_Main_Contact_Phone_Number,
                //        p_Supplier_From_Date, p_Supplier_To_Date, p_First_Contract_Date,
                //        p_First_Contract_Signed_With_Contact_Full_Name, p_First_Contract_Signed_In_Location_Description,
                //        p_Is_Active, p_Logged_In_Administrative_User_Id
                //        );

                //    l_New_Supplier_Id = new_Supplier_Details.Supplier_Id;
                //    l_Supplier_Successfully_Created = true;
                //}
                //catch (Exception exc)
                //{
                //    exception_During_Process = exc.Message;
                //    if (exc.InnerException != null)
                //    {
                //        exception_During_Process_Extra_Data = exc.InnerException.Message;
                //    }
                //}

                //if (l_Supplier_Successfully_Created && l_New_Supplier_Id > 0)
                //{
                //    // The user details was successfully created.. 
                //    // Show success message and redirect the user to view page or back to users page (depends on where the user came from)
                //    Response.Redirect("list_Suppliers.aspx");
                //}
                //else
                //{
                //    // show error message to the user for the failed process
                //    this.lbl_Insert_Process_Error_Result.Text = exception_During_Process;
                //    if (!string.IsNullOrEmpty(exception_During_Process_Extra_Data))
                //    {
                //        this.lbl_Insert_Process_Error_Result.Text += " (" + exception_During_Process_Extra_Data + ")";
                //    }
                //}

            }
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
                var list_Users_Suppliers = Business_Logic_Layer_Facade.Instance.Suppliers_Get_All_By_User_Id(p_Selected_User_Id_To_Return_Suppliers, 1);

                this.dropdown_Supplier.DataSource = list_Users_Suppliers;
                this.dropdown_Supplier.DataTextField = "Company_Name";
                this.dropdown_Supplier.DataValueField = "Supplier_Id";
                this.dropdown_Supplier.DataBind();
                this.dropdown_Supplier.Items.Insert(0, new ListItem("-- Select -- ", ""));
            }
        }

        protected void dropdown_Supplier_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Bind default values the page based on recent supplier invoices for the user and supplier country for vat value
            User_Supplier_Selected();
        }

        private void User_Supplier_Selected()
        {
            this.Try_To_Auto_Fill_Expense();
        }

        protected void button_Create_Expense_Click(object sender, EventArgs e)
        {

        }

        protected void textbox_Expense_Invoice_DateTime_TextChanged(object sender, EventArgs e)
        {
            this.Try_To_Auto_Fill_Expense();
        }

        private void Try_To_Auto_Fill_Expense()
        {
            if (!string.IsNullOrEmpty(this.dropdown_Supplier.SelectedValue) && !string.IsNullOrEmpty(this.textbox_Expense_Invoice_DateTime.Text))
            {
                // Auto complete should be initiated only when the Supplier & the datetime has been picked. 
                // It will help with fillup iether supplier default values incase its his first expense or fetch from the most recent expense that its date is larger then the current selected datetime
                // If the supplier has an expense but user selected a datetime that doesnt match a value in the table try to get any recent expense (of the supplier) and use its autocomplete values
                DateTime p_Expense_Invoice_DateTime = DateTime.ParseExact(this.textbox_Expense_Invoice_DateTime.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None);

                // ask business logic to create a pre populate expense entity based on supplier selection
                int p_Authenticated_User_Id = 1; // ToDo;
                int p_Supplier_Id = int.Parse(this.dropdown_Supplier.SelectedValue);
                var base_Expense_For_Auto_Complete = Business_Logic_Layer_Facade.Instance.Expenses_Get_Auto_Complete_Expense_Based_On_Supplier_And_DateTime_Selection(p_Supplier_Id, p_Expense_Invoice_DateTime, p_Authenticated_User_Id);

                // Fillup details if the user has not entered values in ~2 main textboxes (that should be auto completed with default values 
                if (    string.IsNullOrEmpty(this.textbox_Invoice_Supplier_City.Text) &&
                        string.IsNullOrEmpty(this.textbox_Invoice_Supplier_Address_Description.Text ) )
                {
                    this.textbox_Vat_Percentage.Text = base_Expense_For_Auto_Complete.Vat_Percentage.ToString();
                    this.textbox_Invoice_Supplier_Address_Description.Text = base_Expense_For_Auto_Complete.Invoice_Supplier_Company_Details;
                    this.textbox_Invoice_Supplier_Tax_Reference.Text = base_Expense_For_Auto_Complete.Invoice_Supplier_Company_Details;
                    if(base_Expense_For_Auto_Complete.Invoice_Supplier_Country_Id.HasValue)
                    {
                        this.dropdown_Invoice_Supplier_Country.SelectedValue = base_Expense_For_Auto_Complete.Invoice_Supplier_Country_Id.Value.ToString();
                        this.Bind_States_ComboBox();

                        if (base_Expense_For_Auto_Complete.Invoice_Supplier_State_Id.HasValue)
                        {
                            this.dropdown_Invoice_Supplier_State.SelectedValue = base_Expense_For_Auto_Complete.Invoice_Supplier_State_Id.Value.ToString();
                        }                        
                    }

                    this.textbox_Invoice_Supplier_City.Text = base_Expense_For_Auto_Complete.Invoice_Supplier_City;
                    this.textbox_Invoice_Supplier_Address_Description.Text = base_Expense_For_Auto_Complete.Invoice_Supplier_Address_Description;
                    this.textbox_Invoice_Supplier_ZipCode.Text = base_Expense_For_Auto_Complete.Invoice_Supplier_ZipCode;
                    this.textbox_Invoice_Supplier_WebAddress.Text = base_Expense_For_Auto_Complete.Invoice_Supplier_WebAddress;
                    this.textbox_Invoice_Supplier_Phone_Number.Text = base_Expense_For_Auto_Complete.Invoice_Supplier_Phone_Number;
                    this.textbox_Invoice_Supplier_Contact_FullName.Text = base_Expense_For_Auto_Complete.Invoice_Supplier_Contact_FullName;

                    this.dropdown_Currency.SelectedValue = base_Expense_For_Auto_Complete.Currency_Id.ToString();
                }
            }
        }

        protected void dropdown_Invoice_Supplier_Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Bind_States_ComboBox();
        }

        private void Bind_States_ComboBox()
        {
            // check if the current selected country_id from the drop down has states
            Hide_Or_Show_States_And_Reset_Selection();
            short Country_Id = 0;

            if (!string.IsNullOrEmpty(this.dropdown_Invoice_Supplier_Country.SelectedValue))
            {
                short.TryParse(this.dropdown_Invoice_Supplier_Country.SelectedValue, out Country_Id);

                if (Country_Id > 0)
                {
                    List<States> countryId_States = Business_Logic_Layer_Facade.Instance.States_GetStates_By_Country_Id(Country_Id);

                    if (countryId_States.Count > 0)
                    {
                        this.dropdown_Invoice_Supplier_State.DataSource = countryId_States;
                        this.dropdown_Invoice_Supplier_State.DataTextField = "State_Name";
                        this.dropdown_Invoice_Supplier_State.DataValueField = "State_Id";
                        this.dropdown_Invoice_Supplier_State.DataBind();

                        this.dropdown_Invoice_Supplier_State.Items.Insert(0, new ListItem("-- Select -- ", ""));
                    }

                    if (countryId_States != null && countryId_States.Count > 0)
                    {
                        this.p_Invoice_Supplier_State_Wrapper_Panel.Visible = true;
                    }
                    else
                    {
                        this.p_Invoice_Supplier_State_Wrapper_Panel.Visible = false;
                    }
                }
            }
        }

        private void Hide_Or_Show_States_And_Reset_Selection()
        {
            this.dropdown_Invoice_Supplier_State.ClearSelection();
            this.dropdown_Invoice_Supplier_State.Items.Clear();

            if (!string.IsNullOrEmpty(this.dropdown_Invoice_Supplier_Country.SelectedValue))
            {
                int country_Id = int.Parse(this.dropdown_Invoice_Supplier_Country.SelectedValue);
                if (country_Id == 14 || country_Id == 41 || country_Id == 237)
                {
                    this.p_Invoice_Supplier_State_Wrapper_Panel.Visible = true;

                }
                else
                {
                    this.p_Invoice_Supplier_State_Wrapper_Panel.Visible = false;
                }
            }
            else
            {
                this.p_Invoice_Supplier_State_Wrapper_Panel.Visible = false;
            }
        }

        protected void button_Fill_Up_Form_Dummy_Data_For_Test_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.dropdown_User_Selection.SelectedValue))
            {
                //this.dropdown_User_Selection.SelectedValue = "1";
                //this.Bind_DropDown_Supplier_After_User_Id_Selection();
                this.textbox_Expense_Invoice_DateTime.Text = "23/07/2019";
                this.dropdown_Invoice_Time_Hours.SelectedValue = "15";
                this.dropdown_Invoice_Time_Minutes.SelectedValue = "44";
                this.dropdown_Invoice_Time_Minutes.SelectedValue = "26";
                this.dropdown_Supplier.SelectedValue = "1";
                this.dropdown_Currency.SelectedValue = "28";
                this.textbox_Total_Amount.Text = "1170";
                this.textbox_Vat_Percentage.Text = "17";
                this.textbox_Total_Without_Vat.Text = "1000";
                this.textbox_Total_Vat.Text = "170";

                //this.textbox_Invoiced_On_User_Location_Id.Text = ""
                this.textbox_Invoiced_To_CompanyName.Text = "User Company Dummy AutoFill";
                this.textbox_Invoiced_To_PersonName.Text = "User Company Dummy AutoFill";
                this.textbox_Invoiced_To_Address.Text = "User Address Dummy AutoFill";

                this.dropdown_Expense_Type.SelectedValue = "1";

                this.textbox_Invoice_Number.Text = "1234";
                this.textbox_Invoice_Reference_Number.Text = "Dummy AutoNum 4321";

                this.textbox_Invoice_Supplier_Company_Details.Text = "Dummy Supplier Company";
                this.textbox_Invoice_Supplier_Tax_Reference.Text = "Supplier Tax Reference";

                this.dropdown_Invoice_Supplier_Country.SelectedValue = "157";
                this.textbox_Invoice_Supplier_City.Text = "Dummy City";
                this.textbox_Invoice_Supplier_Address_Description.Text = "Dummy Address Description";
                this.textbox_Invoice_Supplier_ZipCode.Text = "DummyZip12";
                this.textbox_Invoice_Supplier_WebAddress.Text = "http://control-supplier.com/";
                this.textbox_Invoice_Supplier_Phone_Number.Text = "0123456789";
                this.textbox_Invoice_Supplier_Contact_FullName.Text = "Dummy AutoFill Name";

                this.textbox_Invoice_Content_Long_Description.Text = "Long description from dummy auto fill goes here!";
                this.textbox_User_Description.Text = "Users thoughts about this specific expense and maybe suppliers service";
                this.textbox_User_Comments.Text = "Users comments for himself or followers / other wierd privacy setting";
                this.textbox_Original_File_Name.Text = "Mega long expense file name with desc.pdf";

                this.checkbox_Is_Visible_To_Anonymous_Users.Checked = false;
                this.checkbox_Is_Available_For_Download_For_Anonymous_Users.Checked = false;
                this.checkbox_Is_Visible_To_Followers_Users.Checked = false;
                this.checkbox_Is_Available_For_Download_For_Followers_Users.Checked = false;
                this.checkbox_Is_Active.Checked = true;
            }
            else
            {
                this.lbl_Insert_Process_Error_Result.Text = "Please select a user for dummy data testing";
            }
        }


    }
}
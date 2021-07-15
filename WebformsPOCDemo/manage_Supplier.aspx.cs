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
    public partial class manage_Supplier : BasePage
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
            Common_Tools.Initialize_DropDown_Countries(this.dropdown_Country);

            Common_Tools.Initialize_DropDown_Currencies(this.dropdown_Currency);

            Common_Tools.Initialize_DropDown_Supplier_Types(this.dropdown_Supplier_Type);

            // ToDo -- Check permissions -- if the user is able to view the Supplier / edit the Supplier
            this.Validate_Permissions();

            this.Set_Page_FormControls_Values();

            if (!string.IsNullOrEmpty(Request.QueryString["mode"]))
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

            this.button_Edit_Supplier_Details.Visible = true;
            this.button_Update_Supplier_Details.Visible = false;
            this.button_CancelEdit_Supplier_Details.Visible = false;
        }

        private void Bind_Edit_View()
        {
            base.Change_View_Mode_FormControls_Wrappers(false);

            this.button_Edit_Supplier_Details.Visible = false;
            this.button_Update_Supplier_Details.Visible = true;
            this.button_CancelEdit_Supplier_Details.Visible = true;
        }

        private void Set_Page_FormControls_Values()
        {
            int Supplier_Id = int.Parse(this.Request.QueryString["id"]);
            int user_Id_Supplier_Owner = base.Authenticated_User_ID;

            Suppliers SupplierDetails = Business_Logic_Layer_Facade.Instance.Suppliers_Get_By_Supplier_Id(Supplier_Id, user_Id_Supplier_Owner);

            if (SupplierDetails != null)
            {
                this.textbox_Company_Name.Text = SupplierDetails.Company_Name;
                this.label_Company_Name.Text = SupplierDetails.Company_Name;

                this.textbox_Website_URL.Text = SupplierDetails.Website_URL;
                this.label_Website_URL.Text = SupplierDetails.Website_URL;

                this.dropdown_Country.SelectedValue = SupplierDetails.Country_Id.ToString();
                this.label_Country.Text = Business_Logic_Layer_Facade.Instance.Countries_Get_By_Country_Id(SupplierDetails.Country_Id).Country_English_Name;
                this.Bind_States_ComboBox();

                if (SupplierDetails.State_Id.HasValue && SupplierDetails.State_Id.Value > 0)
                {
                    dropdown_State.SelectedValue = SupplierDetails.State_Id.Value.ToString();
                    this.label_State.Text = Business_Logic_Layer_Facade.Instance.States_Get_By_State_Id(SupplierDetails.State_Id.Value).State_Name;
                }

                this.textbox_City.Text = SupplierDetails.City;
                this.label_City.Text = SupplierDetails.City;

                this.textbox_Address.Text = SupplierDetails.Address;
                this.label_Address.Text = SupplierDetails.Address;

                this.textbox_Zipcode.Text = SupplierDetails.ZipCode;
                this.label_Zipcode.Text = SupplierDetails.ZipCode;

                if (SupplierDetails.Default_Currency_Id.HasValue)
                {
                    this.dropdown_Currency.SelectedValue = SupplierDetails.Default_Currency_Id.Value.ToString();
                    this.label_Currency.Text = Business_Logic_Layer_Facade.Instance.Currencies_Get_By_Id(SupplierDetails.Default_Currency_Id.Value).Formatted_Currency_Display_For_Selection;
                }

                Common_Tools.Set_Number_Text_Value_To_TextBox_Label_Text(
                    SupplierDetails.Default_Vat_Percentage, 
                    this.textbox_Default_Vat_Percentage, 
                    this.label_Default_Vat_Percentage);

                this.textbox_Telephone.Text = SupplierDetails.Telephone;
                this.label_Telephone.Text = SupplierDetails.Telephone;

                this.textbox_Mobile_Phone.Text = SupplierDetails.Mobile_Phone;
                this.label_Mobile_Phone.Text = SupplierDetails.Mobile_Phone;

                if (SupplierDetails.Supplier_Type_Id > 0)
                {
                    this.dropdown_Supplier_Type.SelectedValue = SupplierDetails.Supplier_Type_Id.ToString();
                    this.label_Supplier_Type.Text = Business_Logic_Layer_Facade.Instance.SupplierTypes_Get_By_Id(SupplierDetails.Supplier_Type_Id).Type_Name;
                }

                this.textbox_Supplier_Tax_Reference_Number.Text = SupplierDetails.Supplier_Tax_Reference_Number;
                this.label_Supplier_Tax_Reference_Number.Text = SupplierDetails.Supplier_Tax_Reference_Number;

                this.textbox_Main_Contact_FullName.Text = SupplierDetails.Main_Contact_FullName;
                this.label_Main_Contact_FullName.Text = SupplierDetails.Main_Contact_FullName;

                this.textbox_Main_Contact_Email_Address.Text = SupplierDetails.Main_Contact_Email_Address;
                this.label_Main_Contact_Email_Address.Text = SupplierDetails.Main_Contact_Email_Address;

                this.textbox_Main_Contact_Phone_Number.Text = SupplierDetails.Main_Contact_Phone_Number;
                this.label_Main_Contact_Phone_Number.Text = SupplierDetails.Main_Contact_Phone_Number;

                if (SupplierDetails.Supplier_From_Date.HasValue)
                {
                    this.textbox_Supplier_From_Date.Text = SupplierDetails.Supplier_From_Date.Value.ToString("dd/MM/yyyy");
                    this.label_Supplier_From_Date.Text = SupplierDetails.Supplier_From_Date.Value.ToString("dd/MM/yyyy");
                }

                if (SupplierDetails.Supplier_To_Date.HasValue)
                {
                    this.textbox_Supplier_To_Date.Text = SupplierDetails.Supplier_To_Date.Value.ToString("dd/MM/yyyy");
                    this.label_Supplier_To_Date.Text = SupplierDetails.Supplier_To_Date.Value.ToString("dd/MM/yyyy");
                }

                if (SupplierDetails.First_Contract_Date.HasValue)
                {
                    this.textbox_First_Contract_Date.Text = SupplierDetails.First_Contract_Date.Value.ToString("dd/MM/yyyy");
                    this.label_First_Contract_Date.Text = SupplierDetails.First_Contract_Date.Value.ToString("dd/MM/yyyy");
                }

                this.textbox_First_Contract_Signed_With_Contact_Full_Name.Text = SupplierDetails.First_Contract_Signed_With_Contact_Full_Name;
                this.label_First_Contract_Signed_With_Contact_Full_Name.Text = SupplierDetails.First_Contract_Signed_With_Contact_Full_Name;

                this.textbox_First_Contract_Signed_In_Location_Description.Text = SupplierDetails.First_Contract_Signed_In_Location_Description;
                this.label_First_Contract_Signed_In_Location_Description.Text = SupplierDetails.First_Contract_Signed_In_Location_Description;

                this.checkbox_Is_Active.Checked = SupplierDetails.Is_Active;
                this.label_Is_Active.Text = base.Get_Yes_Or_No_Text_Value(SupplierDetails.Is_Active);

                this.label_Record_Created_By_User.Text = SupplierDetails.Record_Created_By_User_Details.FullName_With_Email;
                this.label_Record_Creation_DateTime_UTC.Text = SupplierDetails.Record_Creation_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
                this.label_Record_Last_Updated_By_User.Text = SupplierDetails.Record_Last_Updated_By_User_Details.FullName_With_Email.ToString();
                this.label_Record_Last_Updated_DateTime_UTC.Text = SupplierDetails.Record_Last_Updated_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
            }
        }

        protected void dropdown_Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Countries_Combo_Box_Changed();
        }

        private void Countries_Combo_Box_Changed()
        {
            this.Bind_States_ComboBox();

            // check if the country has a default currency 
            short p_Country_Id = short.Parse(this.dropdown_Country.SelectedValue);
            var country_Details = Business_Logic_Layer_Facade.Instance.Countries_Get_By_Country_Id(p_Country_Id);
            if (country_Details.Primary_Currency_Id.HasValue)
            {
                this.dropdown_Currency.SelectedValue = country_Details.Primary_Currency_Id.Value.ToString();
            }

            this.Bind_Vat_By_Selected_Country();
        }

        private void Bind_Vat_By_Selected_Country()
        {
            this.textbox_Default_Vat_Percentage.Text = "0";

            short p_Country_Id = short.Parse(this.dropdown_Country.SelectedValue);
            if (p_Country_Id > 0)
            {
                this.textbox_Default_Vat_Percentage.Text = Business_Logic_Layer_Facade.Instance
                    .Countries_Get_Latest_Vat_Value_By_Country_Id(p_Country_Id).ToString();
            }
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

                        this.dropdown_State.Items.Insert(0, new ListItem("-- Select -- ", ""));
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
            this.dropdown_State.ClearSelection();
            this.dropdown_State.Items.Clear();

            if (!string.IsNullOrEmpty(this.dropdown_Country.SelectedValue))
            {
                int country_Id = int.Parse(this.dropdown_Country.SelectedValue);
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

        protected void button_Update_Supplier_Details_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                bool l_Supplier_Successfully_Updated = false;

                string exception_During_Process = "";
                string exception_During_Process_Extra_Data = "";

                int p_Supplier_Id = int.Parse(this.Request.QueryString["id"]);
                string p_Company_Name = this.textbox_Company_Name.Text;
                string p_Website_URL = this.textbox_Website_URL.Text;
                short p_Country_Id = short.Parse(this.dropdown_Country.SelectedValue);
                short? p_State_Id = new short?();
                if (this.dropdown_State.Items.Count > 0)
                {
                    p_State_Id = short.Parse(this.dropdown_State.SelectedValue);
                }

                string p_City = this.textbox_City.Text;
                string p_Address = this.textbox_Address.Text;
                string p_ZipCode = this.textbox_Zipcode.Text;

                byte? p_Default_Currency = new byte?();
                if (!string.IsNullOrEmpty(this.dropdown_Currency.SelectedValue))
                {
                    p_Default_Currency = byte.Parse(this.dropdown_Currency.SelectedValue);
                }

                decimal? p_Default_Vat_Percentage = new decimal?();
                if (!string.IsNullOrEmpty(this.textbox_Default_Vat_Percentage.Text))
                {
                    decimal parsed_Vat_Percentage = 0;
                    if (decimal.TryParse(this.textbox_Default_Vat_Percentage.Text, out parsed_Vat_Percentage))
                    {
                        p_Default_Vat_Percentage = parsed_Vat_Percentage;
                    }
                }

                string p_Telephone = this.textbox_Telephone.Text;
                string p_Mobile_Phone = this.textbox_Mobile_Phone.Text;

                short p_Supplier_Type_Id = short.Parse(this.dropdown_Supplier_Type.SelectedValue);
                string p_Supplier_Tax_Reference_Number = this.textbox_Supplier_Tax_Reference_Number.Text;

                string p_Main_Contact_FullName = this.textbox_Main_Contact_FullName.Text;
                string p_Main_Contact_Email_Address = this.textbox_Main_Contact_Email_Address.Text;
                string p_Main_Contact_Phone_Number = this.textbox_Main_Contact_Phone_Number.Text;

                DateTime? p_Supplier_From_Date = new DateTime?();
                DateTime l_Supplier_From_Date_For_Parsing_Result = new DateTime();
                DateTime? p_Supplier_To_Date = new DateTime?();
                DateTime l_Supplier_To_Date_For_Parsing_Result = new DateTime();
                DateTime? p_First_Contract_Date = new DateTime?();
                DateTime l_First_Contract_Date_For_Parsing_Result = new DateTime();

                bool l_Parsed_Successfully = DateTime.TryParseExact(this.textbox_Supplier_From_Date.Text,
                    "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out l_Supplier_From_Date_For_Parsing_Result);
                if (l_Parsed_Successfully)
                {
                    p_Supplier_From_Date = l_Supplier_From_Date_For_Parsing_Result;
                }

                l_Parsed_Successfully = DateTime.TryParseExact(this.textbox_Supplier_To_Date.Text,
                    "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out l_Supplier_To_Date_For_Parsing_Result);
                if (l_Parsed_Successfully)
                {
                    p_Supplier_To_Date = l_Supplier_To_Date_For_Parsing_Result;
                }

                l_Parsed_Successfully = DateTime.TryParseExact(this.textbox_First_Contract_Date.Text,
                    "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out l_First_Contract_Date_For_Parsing_Result);
                if (l_Parsed_Successfully)
                {
                    p_First_Contract_Date = l_First_Contract_Date_For_Parsing_Result;
                }

                string p_First_Contract_Signed_With_Contact_Full_Name = this.textbox_First_Contract_Signed_With_Contact_Full_Name.Text;
                string p_First_Contract_Signed_In_Location_Description = this.textbox_First_Contract_Signed_In_Location_Description.Text;

                bool p_Is_Active = this.checkbox_Is_Active.Checked;
                int p_Logged_In_Administrative_User_Id = base.Authenticated_User_ID;

                try
                {
                    l_Supplier_Successfully_Updated = Business_Logic_Layer_Facade.Instance.Suppliers_Update_Supplier_Details(
                        p_Supplier_Id, p_Company_Name, p_Website_URL, p_Country_Id,
                        p_State_Id, p_City, p_Address, p_ZipCode, p_Default_Currency, p_Default_Vat_Percentage, 
                        p_Telephone, p_Mobile_Phone, p_Supplier_Type_Id,
                        p_Supplier_Tax_Reference_Number, p_Main_Contact_FullName,
                        p_Main_Contact_Email_Address, p_Main_Contact_Phone_Number,
                        p_Supplier_From_Date, p_Supplier_To_Date, p_First_Contract_Date,
                        p_First_Contract_Signed_With_Contact_Full_Name, p_First_Contract_Signed_In_Location_Description,
                        p_Is_Active, p_Logged_In_Administrative_User_Id
                        );

                }
                catch (Exception exc)
                {
                    exception_During_Process = exc.Message;
                    if (exc.InnerException != null)
                    {
                        exception_During_Process_Extra_Data = exc.InnerException.Message;
                    }
                }

                if (l_Supplier_Successfully_Updated )
                {
                    // The client details were successfully updated. 
                    // redirect the user to view read only mode
                    Response.Redirect("manage_Supplier.aspx?id=" + Request.QueryString["id"] + "&mode=view");
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

        protected void button_Edit_Supplier_Details_Click(object sender, EventArgs e)
        {
            this.Bind_Edit_View();
        }

        protected void button_CancelEdit_Supplier_Details_Click(object sender, EventArgs e)
        {
            this.Bind_ReadOnly_View();
        }
    }
}
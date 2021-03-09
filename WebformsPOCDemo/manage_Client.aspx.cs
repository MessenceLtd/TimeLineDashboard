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
    public partial class manage_Client : BasePage
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

            Common_Tools.Initialize_DropDown_Client_Types(this.dropdown_Client_Type);

            // ToDo -- Check permissions -- if the user is able to view the client / edit the client
            this.Validate_Permissions();

            this.Set_Page_FormControls_Values();

            if (!string.IsNullOrEmpty( Request.QueryString["mode"]))
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

            this.button_Edit_Client_Details.Visible = true;
            this.button_Update_Client_Details.Visible = false;
            this.button_CancelEdit_Client_Details.Visible = false;
        }

        private void Bind_Edit_View()
        {
            base.Change_View_Mode_FormControls_Wrappers(false);

            this.button_Edit_Client_Details.Visible = false;
            this.button_Update_Client_Details.Visible = true;
            this.button_CancelEdit_Client_Details.Visible = true;
        }

        private void Set_Page_FormControls_Values()
        {
            // get the clientDetails
            //int client_Id = Business_Logic_Layer_Facade.Instance.clients_get
            int client_Id = int.Parse(this.Request.QueryString["id"]);
            int user_Id_Client_Owner = base.Authenticated_User_ID;

            Clients clientDetails = Business_Logic_Layer_Facade.Instance.Clients_Get_By_Id(client_Id, user_Id_Client_Owner);

            if (clientDetails!= null)
            {
                this.textbox_Company_Name.Text = clientDetails.Company_Name;
                this.label_Company_Name.Text = clientDetails.Company_Name;

                this.textbox_Website_URL.Text = clientDetails.Website_URL;
                this.label_Website_URL.Text = clientDetails.Website_URL;

                Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                    clientDetails.Default_Currency_Id.ToString(),
                    this.dropdown_Currency,
                    this.label_Currency);

                this.dropdown_Country.SelectedValue = clientDetails.Country_Id.ToString();
                this.label_Country.Text = Business_Logic_Layer_Facade.Instance.Countries_Get_By_Country_Id(clientDetails.Country_Id).Country_English_Name;
                this.Bind_States_ComboBox();

                if (clientDetails.State_Id >0 )
                {
                    dropdown_State.SelectedValue = clientDetails.State_Id.ToString();
                    this.label_State.Text = Business_Logic_Layer_Facade.Instance.States_Get_By_State_Id(clientDetails.State_Id).State_Name;
                }

                this.textbox_City.Text = clientDetails.City;
                this.label_City.Text = clientDetails.City;

                this.textbox_Address.Text = clientDetails.Address;
                this.label_Address.Text = clientDetails.Address;
                
                this.textbox_Zipcode.Text = clientDetails.ZipCode;
                this.label_Zipcode.Text = clientDetails.ZipCode;

                this.textbox_Telephone.Text = clientDetails.Telephone;
                this.label_Telephone.Text = clientDetails.Telephone;

                this.textbox_Mobile_Phone.Text = clientDetails.Mobile_Phone;
                this.label_Mobile_Phone.Text = clientDetails.Mobile_Phone;

                if (clientDetails.Client_Type_Id > 0)
                { 
                    this.dropdown_Client_Type.SelectedValue = clientDetails.Client_Type_Id.ToString();
                    this.label_Client_Type.Text = Business_Logic_Layer_Facade.Instance.ClientTypes_Get_By_Id(clientDetails.Client_Type_Id).Type_Name;
                }

                this.textbox_Client_Tax_Reference_Number.Text = clientDetails.Client_Tax_Reference_Number;
                this.label_Client_Tax_Reference_Number.Text = clientDetails.Client_Tax_Reference_Number;

                this.textbox_Main_Contact_FullName.Text = clientDetails.Main_Contact_FullName;
                this.label_Main_Contact_FullName.Text = clientDetails.Main_Contact_FullName;

                this.textbox_Main_Contact_Email_Address.Text = clientDetails.Main_Contact_Email_Address;
                this.label_Main_Contact_Email_Address.Text = clientDetails.Main_Contact_Email_Address;

                this.textbox_Main_Contact_Phone_Number.Text = clientDetails.Main_Contact_Phone_Number;
                this.label_Main_Contact_Phone_Number.Text = clientDetails.Main_Contact_Phone_Number;

                if (clientDetails.Client_From_Date.HasValue)
                { 
                    this.textbox_Client_From_Date.Text = clientDetails.Client_From_Date.Value.ToString("dd/MM/yyyy");
                    this.label_Client_From_Date.Text = clientDetails.Client_From_Date.Value.ToString("dd/MM/yyyy");
                }

                if (clientDetails.Client_To_Date.HasValue)
                {
                    this.textbox_Client_To_Date.Text = clientDetails.Client_To_Date.Value.ToString("dd/MM/yyyy");
                    this.label_Client_To_Date.Text = clientDetails.Client_To_Date.Value.ToString("dd/MM/yyyy");
                }

                if (clientDetails.First_Contract_Date.HasValue)
                {
                    this.textbox_First_Contract_Date.Text = clientDetails.First_Contract_Date.Value.ToString("dd/MM/yyyy");
                    this.label_First_Contract_Date.Text = clientDetails.First_Contract_Date.Value.ToString("dd/MM/yyyy");
                }

                this.textbox_First_Contract_Signed_With_Contact_Full_Name.Text = clientDetails.First_Contract_Signed_With_Contact_Full_Name;
                this.label_First_Contract_Signed_With_Contact_Full_Name.Text = clientDetails.First_Contract_Signed_With_Contact_Full_Name;

                this.textbox_First_Contract_Signed_In_Location_Description.Text = clientDetails.First_Contract_Signed_In_Location_Description;
                this.label_First_Contract_Signed_In_Location_Description.Text = clientDetails.First_Contract_Signed_In_Location_Description;

                this.checkbox_Is_Active.Checked = clientDetails.Is_Active;
                this.label_Is_Active.Text = clientDetails.Is_Active ? "Yes" : "No";

                this.label_Record_Created_By_User.Text = clientDetails.Record_Created_By_User_Details.FullName_With_Email;
                this.label_Record_Creation_DateTime_UTC.Text = clientDetails.Record_Creation_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
                this.label_Record_Last_Updated_By_User.Text = clientDetails.Record_Last_Updated_By_User_Details.FullName_With_Email.ToString();
                this.label_Record_Last_Updated_DateTime_UTC.Text = clientDetails.Record_Last_Updated_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
            }
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

        protected void button_Update_Client_Details_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                bool l_Client_Successfully_Updated = false;

                string exception_During_Process = "";
                string exception_During_Process_Extra_Data = "";

                int p_Client_Id = int.Parse(this.Request.QueryString["id"]);
                string p_Company_Name = this.textbox_Company_Name.Text;
                string p_Website_URL = this.textbox_Website_URL.Text;

                byte? p_Default_Currency = new byte?();
                if (!string.IsNullOrEmpty(this.dropdown_Currency.SelectedValue))
                {
                    p_Default_Currency = byte.Parse(this.dropdown_Currency.SelectedValue);
                }

                short p_Country_Id = short.Parse(this.dropdown_Country.SelectedValue);
                short? p_State_Id = new short?();
                if (this.dropdown_State.Items.Count > 0)
                {
                    p_State_Id = short.Parse(this.dropdown_State.SelectedValue);
                }

                string p_City = this.textbox_City.Text;
                string p_Address = this.textbox_Address.Text;
                string p_ZipCode = this.textbox_Zipcode.Text;
                string p_Telephone = this.textbox_Telephone.Text;
                string p_Mobile_Phone = this.textbox_Mobile_Phone.Text;

                short p_Client_Type_Id = short.Parse(this.dropdown_Client_Type.SelectedValue);
                string p_Client_Tax_Reference_Number = this.textbox_Client_Tax_Reference_Number.Text;

                string p_Main_Contact_FullName = this.textbox_Main_Contact_FullName.Text;
                string p_Main_Contact_Email_Address = this.textbox_Main_Contact_Email_Address.Text;
                string p_Main_Contact_Phone_Number = this.textbox_Main_Contact_Phone_Number.Text;

                DateTime? p_Client_From_Date = new DateTime?();
                DateTime l_Client_From_Date_For_Parsing_Result = new DateTime();
                DateTime? p_Client_To_Date = new DateTime?();
                DateTime l_Client_To_Date_For_Parsing_Result = new DateTime();
                DateTime? p_First_Contract_Date = new DateTime?();
                DateTime l_First_Contract_Date_For_Parsing_Result = new DateTime();

                bool l_Parsed_Successfully = DateTime.TryParseExact(this.textbox_Client_From_Date.Text,
                    "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out l_Client_From_Date_For_Parsing_Result);
                if (l_Parsed_Successfully)
                {
                    p_Client_From_Date = l_Client_From_Date_For_Parsing_Result;
                }

                l_Parsed_Successfully = DateTime.TryParseExact(this.textbox_Client_To_Date.Text,
                    "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out l_Client_To_Date_For_Parsing_Result);
                if (l_Parsed_Successfully)
                {
                    p_Client_To_Date = l_Client_To_Date_For_Parsing_Result;
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
                int p_Authenticated_User_ID = base.Authenticated_User_ID;

                try
                {
                    l_Client_Successfully_Updated = Business_Logic_Layer_Facade.Instance.Clients_Update_Client_Details(
                        p_Client_Id, p_Company_Name, p_Website_URL, p_Default_Currency, p_Country_Id,
                        p_State_Id, p_City, p_Address, p_ZipCode,
                        p_Telephone, p_Mobile_Phone, p_Client_Type_Id,
                        p_Client_Tax_Reference_Number, p_Main_Contact_FullName,
                        p_Main_Contact_Email_Address, p_Main_Contact_Phone_Number,
                        p_Client_From_Date, p_Client_To_Date, p_First_Contract_Date,
                        p_First_Contract_Signed_With_Contact_Full_Name, p_First_Contract_Signed_In_Location_Description,
                        p_Is_Active, p_Authenticated_User_ID
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

                if (l_Client_Successfully_Updated)
                {
                    // The client details were successfully updated. 
                    // redirect the user to view read only mode
                    Response.Redirect("manage_Client.aspx?id=" + Request.QueryString["id"] + "&mode=view" );
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

        protected void button_Edit_Client_Details_Click(object sender, EventArgs e)
        {
            this.Bind_Edit_View();
        }

        protected void button_CancelEdit_Client_Details_Click(object sender, EventArgs e)
        {
            this.Bind_ReadOnly_View();
        }

    }
}
﻿using System;
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
    public partial class Add_Supplier : BasePage
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
        }

        protected void dropdown_Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Bind_States_ComboBox();

            // check if the country has a default currency 
            short p_Country_Id = short.Parse(this.dropdown_Country.SelectedValue);
            var country_Details = Business_Logic_Layer_Facade.Instance.Countries_Get_By_Country_Id(p_Country_Id);
            if (country_Details.Primary_Currency_Id.HasValue)
            {
                this.dropdown_Currency.SelectedValue = country_Details.Primary_Currency_Id.Value.ToString();
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

        protected void button_Create_Supplier_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                bool l_Supplier_Successfully_Created = false;
                int l_New_Supplier_Id = 0;

                string exception_During_Process = "";
                string exception_During_Process_Extra_Data = "";

                int p_User_Id = 1;
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
                if (!string.IsNullOrEmpty( this.dropdown_Currency.SelectedValue))
                {
                    p_Default_Currency = byte.Parse(this.dropdown_Currency.SelectedValue);
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
                int p_Logged_In_Administrative_User_Id = 1;

                TimeLineDashboard.Shared.Models.Suppliers new_Supplier_Details = null;

                try
                {
                    new_Supplier_Details = Business_Logic_Layer_Facade.Instance.Suppliers_Insert_New_Supplier_Administrative_Registration_Process(
                        p_User_Id, p_Company_Name, p_Website_URL, p_Country_Id,
                        p_State_Id, p_City, p_Address, p_ZipCode, p_Default_Currency, 
                        p_Telephone, p_Mobile_Phone, p_Supplier_Type_Id,
                        p_Supplier_Tax_Reference_Number, p_Main_Contact_FullName,
                        p_Main_Contact_Email_Address, p_Main_Contact_Phone_Number,
                        p_Supplier_From_Date, p_Supplier_To_Date, p_First_Contract_Date,
                        p_First_Contract_Signed_With_Contact_Full_Name, p_First_Contract_Signed_In_Location_Description,
                        p_Is_Active, p_Logged_In_Administrative_User_Id
                        );

                    l_New_Supplier_Id = new_Supplier_Details.Supplier_Id;
                    l_Supplier_Successfully_Created = true;
                }
                catch (Exception exc)
                {
                    exception_During_Process = exc.Message;
                    if (exc.InnerException != null)
                    {
                        exception_During_Process_Extra_Data = exc.InnerException.Message;
                    }
                }

                if (l_Supplier_Successfully_Created && l_New_Supplier_Id > 0)
                {
                    // The user details was successfully created.. 
                    // Show success message and redirect the user to view page or back to users page (depends on where the user came from)
                    Response.Redirect("list_Suppliers.aspx");
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

        protected void button_Fill_Up_Form_Dummy_Data_For_Test_Click(object sender, EventArgs e)
        {
            this.textbox_Company_Name.Text = "dummy company";
            this.textbox_Website_URL.Text = "http://stupidcompanywithnossl.com/";
            this.dropdown_Country.Text = "57";
            this.textbox_City.Text = "Dummy City";
            this.textbox_Address.Text = "dummy long address with elevetor number";
            this.textbox_Zipcode.Text = "1234567";
            this.dropdown_Currency.SelectedValue = "1";
            this.textbox_Telephone.Text = "0123456789";
            this.textbox_Mobile_Phone.Text = "9876543210";
            this.textbox_Zipcode.Text = "Dummy Zipcode";
            this.dropdown_Supplier_Type.SelectedValue = "1";
            this.textbox_Supplier_Tax_Reference_Number.Text = "LFKJD2134142";
            this.textbox_Main_Contact_FullName.Text = "Dummy Phone_Number2";
            this.textbox_Main_Contact_Email_Address.Text = "dummyuser@stupid-company.com";
            this.textbox_Main_Contact_Phone_Number.Text = "Dummy Phone_Number2";
            this.textbox_Supplier_From_Date.Text = "01/01/2007";
            this.textbox_Supplier_To_Date.Text = "01/01/2020";
            this.textbox_First_Contract_Date.Text = "";
            this.textbox_First_Contract_Signed_With_Contact_Full_Name.Text = "Dummy Person name";
            this.textbox_First_Contract_Signed_In_Location_Description.Text = "Dummy long place description";
            this.checkbox_Is_Active.Checked = true;
        }
    }
}
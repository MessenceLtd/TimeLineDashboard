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
    public partial class Add_Document : System.Web.UI.Page
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
            this.dropdown_User_Selection.DataSource = Business_Logic_Layer_Facade.Instance.Users_Get_Administration_List(1);
            this.dropdown_User_Selection.DataTextField = "FullName_With_Email";
            this.dropdown_User_Selection.DataValueField = "User_Id";
            this.dropdown_User_Selection.DataBind();
            this.dropdown_User_Selection.Items.Insert(0, new ListItem("-- Select -- ", ""));

            // bind document types
            Common_Tools.Initialize_DropDown_Document_Types(this.dropdown_Document_Type);

            // bind the combobox of the countries
            Common_Tools.Initialize_DropDown_Countries(this.dropdown_Recieved_In_Country);

            // bind time pickers
            Common_Tools.Initialize_DropDown_Hours(this.dropdown_Document_Creation_Time_Hours);
            Common_Tools.Initialize_DropDown_Minutes(this.dropdown_Document_Creation_Time_Minutes);
            Common_Tools.Initialize_DropDown_Seconds(this.dropdown_Document_Creation_Time_Seconds);

            Common_Tools.Initialize_DropDown_Hours(this.dropdown_Recieved_Document_Time_Hours);
            Common_Tools.Initialize_DropDown_Minutes(this.dropdown_Recieved_Document_Time_Minutes);
            Common_Tools.Initialize_DropDown_Seconds(this.dropdown_Recieved_Document_Time_Seconds);
        }

        protected void dropdown_Recieved_In_Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Bind_States_ComboBox();
        }
        private void Bind_States_ComboBox()
        {
            // check if the current selected country_id from the drop down has states
            Hide_Or_Show_States_And_Reset_Selection();
            short Country_Id = 0;

            if (!string.IsNullOrEmpty(this.dropdown_Recieved_In_Country.SelectedValue))
            {
                short.TryParse(this.dropdown_Recieved_In_Country.SelectedValue, out Country_Id);

                if (Country_Id > 0)
                {
                    List<States> countryId_States = Business_Logic_Layer_Facade.Instance.States_GetStates_By_Country_Id(Country_Id);

                    if (countryId_States.Count > 0)
                    {
                        this.dropdown_Recieved_In_State.DataSource = countryId_States;
                        this.dropdown_Recieved_In_State.DataTextField = "State_Name";
                        this.dropdown_Recieved_In_State.DataValueField = "State_Id";
                        this.dropdown_Recieved_In_State.DataBind();

                        this.dropdown_Recieved_In_State.Items.Insert(0, new ListItem("-- Select -- ", ""));
                    }

                    if (countryId_States != null && countryId_States.Count > 0)
                    {
                        this.p_Recieved_In_State_Wrapper_Panel.Visible = true;
                    }
                    else
                    {
                        this.p_Recieved_In_State_Wrapper_Panel.Visible = false;
                    }
                }
            }
        }

        private void Hide_Or_Show_States_And_Reset_Selection()
        {
            this.dropdown_Recieved_In_State.ClearSelection();
            this.dropdown_Recieved_In_State.Items.Clear();

            if (!string.IsNullOrEmpty(this.dropdown_Recieved_In_Country.SelectedValue))
            {
                int country_Id = int.Parse(this.dropdown_Recieved_In_Country.SelectedValue);
                if (country_Id == 14 || country_Id == 41 || country_Id == 237)
                {
                    this.p_Recieved_In_State_Wrapper_Panel.Visible = true;

                }
                else
                {
                    this.p_Recieved_In_State_Wrapper_Panel.Visible = false;
                }
            }
            else
            {
                this.p_Recieved_In_State_Wrapper_Panel.Visible = false;
            }
        }

        

        protected void button_Create_Document_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                throw new NotImplementedException();
            }
        }

        protected void button_Fill_Up_Form_Dummy_Data_For_Test_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.dropdown_User_Selection.SelectedValue))
            {
                //this.textbox_Company_Name.Text = "dummy company";
                //this.textbox_Website_URL.Text = "http://stupidcompanywithnossl.com/";
                //this.dropdown_Country.Text = "57";
                //this.textbox_City.Text = "Dummy City";
                //this.textbox_Address.Text = "dummy long address with elevetor number";
                //this.textbox_Zipcode.Text = "1234567";
                //this.textbox_Telephone.Text = "0123456789";
                //this.textbox_Mobile_Phone.Text = "9876543210";
                //this.textbox_Zipcode.Text = "Dummy Zipcode";
                //this.dropdown_Supplier_Type.SelectedValue = "1";
                //this.textbox_Supplier_Tax_Reference_Number.Text = "LFKJD2134142";
                //this.textbox_Main_Contact_FullName.Text = "Dummy Phone_Number2";
                //this.textbox_Main_Contact_Email_Address.Text = "dummyuser@stupid-company.com";
                //this.textbox_Main_Contact_Phone_Number.Text = "Dummy Phone_Number2";
                //this.textbox_Supplier_From_Date.Text = "01/01/2007";
                //this.textbox_Supplier_To_Date.Text = "01/01/2020";
                //this.textbox_First_Contract_Date.Text = "";
                //this.textbox_First_Contract_Signed_With_Contact_Full_Name.Text = "Dummy Person name";
                //this.textbox_First_Contract_Signed_In_Location_Description.Text = "Dummy long place description";
                this.checkbox_Is_Active.Checked = true;
            }
            else
            {
                this.lbl_Insert_Process_Error_Result.Text = "Please select a user for dummy data testing";
            }
        }

        protected void dropdown_User_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Bind availble suppliers to pick based on current selected user
        }

        protected void dropdown_Supplier_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Bind default values the page based on recent supplier invoices for the user and supplier country for vat value

        }

    }
}
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
    public partial class Add_User : BasePage
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
            Common_Tools.Initialize_DropDown_App_Permission_Types(this.dropdown_App_Permission_Type);

            Common_Tools.Initialize_DropDown_Countries(dropdown_Country);

            Common_Tools.Initialize_DropDown_Currencies(this.dropdown_Currency);
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

        protected void button_Create_User_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                bool l_User_Successfully_Created = false;
                int l_New_User_Id = 0;
                string exception_During_Process = "";
                string exception_During_Process_Extra_Data = "";


                string p_Username = this.textbox_Username.Text;
                string p_Password = this.textbox_Password.Text;
                byte p_App_Permission_Type_Id = byte.Parse(this.dropdown_App_Permission_Type.SelectedValue);

                string p_First_Name = this.textbox_First_Name.Text;
                string p_Middle_Name = this.textbox_Middle_Name.Text;
                string p_Last_Name = this.textbox_Last_Name.Text;
                string p_Email = this.textbox_Email_Address.Text;
                short p_Country_Id = short.Parse(this.dropdown_Country.SelectedValue);

                short? p_State_Id = new short?();
                if (this.dropdown_State.Items.Count > 0)
                {
                    p_State_Id = short.Parse(this.dropdown_State.SelectedValue);
                }

                string p_City = this.textbox_City.Text;
                string p_Address = this.textbox_Address.Text;
                string p_ZipCode = this.textbox_Zipcode.Text;

                byte? p_Default_Currency_Id = new byte?();
                if (!string.IsNullOrEmpty(this.dropdown_Currency.SelectedValue))
                {
                    p_Default_Currency_Id = byte.Parse(this.dropdown_Currency.SelectedValue);
                }

                string p_Mobile_Phone = this.textbox_Mobile_Phone.Text;
                string p_Additional_Phone_Number = this.textbox_Mobile_Phone.Text;

                DateTime p_BirthDate;
                bool BirthDate_Parsed_Successfully = DateTime.TryParseExact(this.textbox_Birth_Date.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out p_BirthDate);

                if (BirthDate_Parsed_Successfully)
                {
                    byte p_Gender = byte.Parse(this.dropdown_Gender.SelectedValue);
                    string p_Heard_About_Application_From = this.textbox_Heard_About_Application_From.Text;
                    string p_Our_Administrative_Side_Notes = this.textbox_Administrative_Side_Notes.Text;

                    int p_Logged_In_Authenticated_User_Id = base.Authenticated_User_ID; // ToDo -- Make sure the permission type of the authenticated user that is trying to create a user is appropriate.

                    TimeLineDashboard.Shared.Models.Users new_User_Details = null;

                    try
                    {
                        new_User_Details = Business_Logic_Layer_Facade.Instance.Users_Insert_New_User_Administrative_Registration_Process(
                            p_Username,
                            p_Password,
                            p_App_Permission_Type_Id,
                            p_First_Name,
                            p_Middle_Name,
                            p_Last_Name,
                            p_Email,
                            p_Country_Id,
                            p_State_Id,
                            p_City,
                            p_Address,
                            p_ZipCode,
                            p_Default_Currency_Id,
                            p_Mobile_Phone,
                            p_Additional_Phone_Number,
                            p_BirthDate,
                            p_Gender,
                            p_Heard_About_Application_From,
                            p_Our_Administrative_Side_Notes,
                            p_Logged_In_Authenticated_User_Id
                            );

                        l_New_User_Id = new_User_Details.User_Id;
                        l_User_Successfully_Created = true;
                    }
                    catch (Exception exc)
                    {
                        exception_During_Process = exc.Message;
                        if (exc.InnerException != null)
                        {
                            exception_During_Process_Extra_Data = exc.InnerException.Message;
                        }
                    }
                }
                else
                {
                    exception_During_Process = "Wrong date format for birth date. Registration process aborted";
                }


                if (l_User_Successfully_Created && l_New_User_Id > 0)
                {
                    // The user details was successfully created.. 
                    // Show success message and redirect the user to view page or back to users page (depends on where the user came from)
                    Response.Redirect("list_Users.aspx");
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

        protected void dropdown_Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Bind_States_ComboBox();
        }

        protected void button_Fill_Up_Form_Dummy_Data_For_Test_Click(object sender, EventArgs e)
        {
            this.textbox_Email_Address.Text = "dummy@dummy.com";
            this.textbox_Username.Text = "dummyUsername";
            this.textbox_Password.Text = "dummyPas$word123";
            this.textbox_Password_Repeat.Text = "dummyPas$word123";
            this.textbox_First_Name.Text = "dummy_FirstName";
            this.textbox_Middle_Name.Text = "dummy_MiddleName";
            this.textbox_Last_Name.Text = "dummy_LastName";
            this.dropdown_Country.SelectedValue = "144";

            this.textbox_City.Text = "Dummy City";
            this.textbox_Address.Text = "Dummy Address";
            this.textbox_Zipcode.Text = "Dummy Zipcode";

            this.textbox_Mobile_Phone.Text = "Dummy Mobile_Phone";
            this.textbox_Additional_Phone_Number.Text = "Dummy Phone_Number2";

            this.textbox_Birth_Date.Text = "01/12/1981";
            this.dropdown_Gender.SelectedValue = "1";
            this.textbox_Heard_About_Application_From.Text = "Dummy heard about app notes";
            this.textbox_Administrative_Side_Notes.Text = "Dummy demo notes from some administrative employee";

            // Todo:
            // Add support for Birthdate, Gender, Heard about application from and administrative notes

        }
    }
}
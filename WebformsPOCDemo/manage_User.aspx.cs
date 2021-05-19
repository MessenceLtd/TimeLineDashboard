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
    public partial class manage_User : BasePage
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

            Common_Tools.Initialize_DropDown_App_Permission_Types(this.dropdown_App_Permission_Type);

            Common_Tools.Initialize_DropDown_Currencies(this.dropdown_Currency);

            Common_Tools.Initialize_DropDown_Hours(this.dropdown_Registration_Time_Hours);
            Common_Tools.Initialize_DropDown_Minutes(this.dropdown_Registration_Time_Minutes);
            Common_Tools.Initialize_DropDown_Seconds(this.dropdown_Registration_Time_Seconds);

            // ToDo -- Check permissions -- if the user is able to view the client / edit the client
            this.Validate_Permissions();

            if (base.Authenticated_Permission_Type.App_Permission_Type_Id == App_Permission_Type.Permission_Type.Application_Administrator)
            {
                this.panel_Azure_Container_Ref.Visible = true;
            }

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

            if (base.User_Is_Administrator)
            {

            }
        }

        private void Validate_Permissions()
        {

        }

        private void Bind_ReadOnly_View()
        {
            base.Change_View_Mode_FormControls_Wrappers(true);

            this.button_Edit_User_Details.Visible = true;
            this.button_Update_User_Details.Visible = false;
            this.button_CancelEdit_User_Details.Visible = false;
        }

        private void Bind_Edit_View()
        {
            base.Change_View_Mode_FormControls_Wrappers(false);

            this.button_Edit_User_Details.Visible = false;
            this.button_Update_User_Details.Visible = true;
            this.button_CancelEdit_User_Details.Visible = true;
        }

        private void Set_Page_FormControls_Values()
        {
            // get the user Details
            int User_Id = int.Parse(this.Request.QueryString["id"]);
            int user_Id_User_Owner = base.Authenticated_User_ID;

            TimeLineDashboard.Shared.Models.Users userDetails = 
                Business_Logic_Layer_Facade.Instance.Users_Get_Details_By_User_Id(
                    User_Id, 
                    base.Authenticated_User_ID , 
                    base.Authenticated_Permission_Type );

            if (userDetails != null)
            {
                this.textbox_Username.Text = userDetails.Username;
                this.label_Username.Text = userDetails.Username;

                Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                    userDetails.App_Permission_Type_Id.ToString(),
                    this.dropdown_App_Permission_Type,
                    this.label_App_Permission_Type);

                this.textbox_First_Name.Text = userDetails.First_Name;
                this.label_First_Name.Text = userDetails.First_Name;

                this.textbox_Middle_Name.Text = userDetails.Middle_Name;
                this.label_Middle_Name.Text = userDetails.Middle_Name;

                this.textbox_Last_Name.Text = userDetails.Last_Name;
                this.label_Last_Name.Text = userDetails.Last_Name;

                this.textbox_Email.Text = userDetails.Email;
                this.label_Email.Text = userDetails.Email;

                this.dropdown_Country.SelectedValue = userDetails.Country_Id.ToString();
                this.label_Country.Text = Business_Logic_Layer_Facade.Instance.Countries_Get_By_Country_Id(userDetails.Country_Id).Country_English_Name;
                this.Bind_States_ComboBox();

                if (userDetails.State_Id > 0)
                {
                    dropdown_State.SelectedValue = userDetails.State_Id.ToString();
                    this.label_State.Text = Business_Logic_Layer_Facade.Instance.States_Get_By_State_Id(userDetails.State_Id).State_Name;
                }

                this.textbox_City.Text = userDetails.City;
                this.label_City.Text = userDetails.City;

                this.textbox_Address.Text = userDetails.Address;
                this.label_Address.Text = userDetails.Address;

                this.textbox_Zipcode.Text = userDetails.ZipCode;
                this.label_Zipcode.Text = userDetails.ZipCode;

                if (userDetails.Default_Currency_Id.HasValue)
                {
                    this.dropdown_Currency.SelectedValue = userDetails.Default_Currency_Id.Value.ToString();
                    this.label_Currency.Text = Business_Logic_Layer_Facade.Instance.Currencies_Get_By_Id(userDetails.Default_Currency_Id.Value).Formatted_Currency_Display_For_Selection;
                }

                this.textbox_Mobile_Phone.Text = userDetails.Mobile_Phone;
                this.label_Mobile_Phone.Text = userDetails.Mobile_Phone;

                this.textbox_Additional_Phone_Number.Text = userDetails.Additional_Phone_Number;
                this.label_Additional_Phone_Number.Text = userDetails.Additional_Phone_Number;

                Common_Tools.Set_DateTime_To_TextBox_And_Label(
                     userDetails.Birth_Date,
                     this.textbox_Birth_Date,
                     this.label_Birth_Date);

                Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                    userDetails.Gender.ToString(),
                    this.dropdown_Gender,
                    this.label_Gender);

                Common_Tools.Set_DateTime_To_ComboBoxes_And_Label(
                     userDetails.Registration_DateTime_UTC,
                     this.textbox_Registration_DateTime,
                     this.label_Registration_DateTime,
                     this.dropdown_Registration_Time_Hours,
                     this.dropdown_Registration_Time_Minutes,
                     this.dropdown_Registration_Time_Seconds,
                     this.label_Registration_Time );

                this.textbox_Azure_Container_Ref.Text = userDetails.Azure_Container_Ref;
                this.label_Azure_Container_Ref.Text = userDetails.Azure_Container_Ref;
                this.textbox_Heard_About_Application_From.Text = userDetails.Heard_About_Application_From;
                this.label_Heard_About_Application_From.Text = userDetails.Heard_About_Application_From;
                this.textbox_Our_Administrative_Side_Notes.Text = userDetails.Our_Administrative_Side_Notes;
                this.label_Our_Administrative_Side_Notes.Text = userDetails.Our_Administrative_Side_Notes;

                this.checkbox_Is_Active.Checked = userDetails.Is_Active;
                this.label_Is_Active.Text = userDetails.Is_Active ? "Yes" : "No";

                this.label_Record_Created_By_User.Text = userDetails.Record_Created_By_User_Details.FullName_With_Email;
                this.label_Record_Creation_DateTime_UTC.Text = userDetails.Record_Creation_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
                this.label_Record_Last_Updated_By_User.Text = userDetails.Record_Last_Updated_By_User_Details.FullName_With_Email.ToString();
                this.label_Record_Last_Updated_DateTime_UTC.Text = userDetails.Record_Last_Updated_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
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

        protected void button_Update_User_Details_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                bool l_User_Successfully_Updated = false;

                string exception_During_Process = "";
                string exception_During_Process_Extra_Data = "";

                int p_User_Id = int.Parse(this.Request.QueryString["id"]);

                string p_Username = this.textbox_Username.Text;
                string p_First_Name = this.textbox_First_Name.Text;
                string p_Middle_Name = this.textbox_Middle_Name.Text;
                string p_Last_Name = this.textbox_Last_Name.Text;

                string p_Email = this.textbox_Email.Text;

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
                string p_Additional_Phone_Number = this.textbox_Additional_Phone_Number.Text;

                DateTime? p_Birth_Date = new DateTime?();
                if (!string.IsNullOrEmpty(this.textbox_Birth_Date.Text))
                {
                    p_Birth_Date = Common_Tools.Try_Parse_DateTime_By_Current_Culture(this.textbox_Birth_Date.Text);
                }

                byte? p_Gender = new byte?();
                if (!string.IsNullOrWhiteSpace(this.dropdown_Gender.SelectedValue))
                {
                    p_Gender = byte.Parse(this.dropdown_Gender.SelectedValue);
                }

                DateTime? p_Registration_Date = new DateTime?();
                if (!string.IsNullOrEmpty(this.textbox_Registration_DateTime.Text))
                {
                    p_Registration_Date = Common_Tools.Get_DateTime_From_ComboBoxes(
                        this.textbox_Registration_DateTime,
                        this.dropdown_Registration_Time_Hours,
                        this.dropdown_Registration_Time_Minutes,
                        this.dropdown_Registration_Time_Seconds);
                }

                string p_Azure_Container_Ref = this.textbox_Azure_Container_Ref.Text;
                string p_Heard_About_Application_From = this.textbox_Heard_About_Application_From.Text;
                string p_Our_Administrative_Side_Notes = this.textbox_Our_Administrative_Side_Notes.Text;

                bool p_Is_Active = this.checkbox_Is_Active.Checked;
                int p_Authenticated_User_ID = base.Authenticated_User_ID;

                try
                {
                    l_User_Successfully_Updated = Business_Logic_Layer_Facade.Instance.Users_Update_User_Details(
                        p_User_Id, 
                        p_Username, 
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
                        p_Birth_Date, 
                        p_Gender, 
                        p_Registration_Date, 
                        p_Azure_Container_Ref, 
                        p_Heard_About_Application_From, 
                        p_Our_Administrative_Side_Notes, 
                        p_Is_Active, 
                        p_Authenticated_User_ID, 
                        this.Authenticated_Permission_Type );
                }
                catch (Exception exc)
                {
                    exception_During_Process = exc.Message;
                    if (exc.InnerException != null)
                    {
                        exception_During_Process_Extra_Data = exc.InnerException.Message;
                    }
                }

                if (l_User_Successfully_Updated)
                {
                    // The user details were successfully updated. 
                    // redirect the user to view read only mode
                    Response.Redirect("manage_User.aspx?id=" + Request.QueryString["id"] + "&mode=view");
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

        protected void button_Edit_User_Details_Click(object sender, EventArgs e)
        {
            this.Bind_Edit_View();
        }

        protected void button_CancelEdit_User_Details_Click(object sender, EventArgs e)
        {
            this.Bind_ReadOnly_View();
        }

    }
}
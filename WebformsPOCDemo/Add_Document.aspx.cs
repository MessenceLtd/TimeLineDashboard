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
    public partial class Add_Document : BasePage
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

            // bind document types
            Common_Tools.Initialize_DropDown_Document_Types(this.dropdown_General_Document_Type);

            // bind the combobox of the countries
            Common_Tools.Initialize_DropDown_Countries(this.dropdown_Sent_By_Entity_Country);
            Common_Tools.Initialize_DropDown_Countries(this.dropdown_Sent_To_Entity_Country);
            Common_Tools.Initialize_DropDown_Countries(this.dropdown_Recieved_In_Country);

            // bind time pickers
            Common_Tools.Initialize_DropDown_Hours(this.dropdown_Document_Creation_Time_Hours);
            Common_Tools.Initialize_DropDown_Minutes(this.dropdown_Document_Creation_Time_Minutes);
            Common_Tools.Initialize_DropDown_Seconds(this.dropdown_Document_Creation_Time_Seconds);

            Common_Tools.Initialize_DropDown_Hours(this.dropdown_Sent_By_Entity_Time_Hours);
            Common_Tools.Initialize_DropDown_Minutes(this.dropdown_Sent_By_Entity_Time_Minutes);
            Common_Tools.Initialize_DropDown_Seconds(this.dropdown_Sent_By_Entity_Time_Seconds);

            Common_Tools.Initialize_DropDown_Hours(this.dropdown_Recieved_Document_Time_Hours);
            Common_Tools.Initialize_DropDown_Minutes(this.dropdown_Recieved_Document_Time_Minutes);
            Common_Tools.Initialize_DropDown_Seconds(this.dropdown_Recieved_Document_Time_Seconds);

            Common_Tools.Initialize_DropDown_Hours(this.dropdown_Recieved_Time_Hours);
            Common_Tools.Initialize_DropDown_Minutes(this.dropdown_Recieved_Time_Minutes);
            Common_Tools.Initialize_DropDown_Seconds(this.dropdown_Recieved_Time_Seconds);
        }

        protected void button_Create_Document_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                bool l_Document_Successfully_Created = false;
                int l_New_Document_Id = 0;

                string exception_During_Process = "";
                string exception_During_Process_Extra_Data = "";

                int p_User_Id = int.Parse(this.dropdown_User_Selection.SelectedValue);
                short p_General_Document_Type_Id = short.Parse(this.dropdown_General_Document_Type.SelectedValue);

                DateTime? p_Document_Creation_DateTime = Common_Tools.Get_DateTime_From_ComboBoxes(
                    this.textbox_Document_Creation_Date,
                    this.dropdown_Document_Creation_Time_Hours,
                    this.dropdown_Document_Creation_Time_Minutes,
                    this.dropdown_Document_Creation_Time_Seconds);

                string p_Title = this.textbox_Title.Text;
                string p_Description = this.textbox_Description.Text;

                string p_Sent_By_Entity_Name = this.textbox_Sent_By_Entity_Name.Text;
                short? p_Sent_By_Entity_Country_Id = new short?();
                short? p_Sent_By_Entity_State_Id = new short?();
                if (!string.IsNullOrEmpty(this.dropdown_Sent_By_Entity_Country.SelectedValue))
                {
                    p_Sent_By_Entity_Country_Id = short.Parse(this.dropdown_Sent_By_Entity_Country.SelectedValue);
                    if (!string.IsNullOrEmpty(this.dropdown_Sent_By_Entity_State.SelectedValue))
                    {
                        p_Sent_By_Entity_State_Id = short.Parse(this.dropdown_Sent_By_Entity_State.SelectedValue);
                    }
                }

                string p_Sent_By_Entity_City = this.textbox_Sent_By_Entity_City.Text;
                string p_Sent_By_Entity_Address = this.textbox_Sent_By_Entity_Address.Text;
                string p_Sent_By_Entity_ZipCode = this.textbox_Sent_By_Entity_ZipCode.Text;
                DateTime? p_Sent_By_Entity_DateTime = Common_Tools.Get_DateTime_From_ComboBoxes(
                    this.textbox_Sent_By_Entity_DateTime,
                    this.dropdown_Sent_By_Entity_Time_Hours,
                    this.dropdown_Sent_By_Entity_Time_Minutes,
                    this.dropdown_Sent_By_Entity_Time_Seconds);

                string p_Sent_By_Entity_Email_Address = this.textbox_Sent_By_Entity_Email_Address.Text;

                string p_Sent_To_Entity_Name = this.textbox_Sent_To_Entity_Name.Text;
                short? p_Sent_To_Entity_Country_Id = new short?();
                short? p_Sent_To_Entity_State_Id = new short?();
                if (!string.IsNullOrEmpty(this.dropdown_Sent_To_Entity_Country.SelectedValue))
                {
                    p_Sent_To_Entity_Country_Id = short.Parse(this.dropdown_Sent_To_Entity_Country.SelectedValue);
                    if (!string.IsNullOrEmpty(this.dropdown_Sent_By_Entity_State.SelectedValue))
                    {
                        p_Sent_To_Entity_State_Id = short.Parse(this.dropdown_Sent_By_Entity_State.SelectedValue);
                    }
                }

                string p_Sent_To_Entity_City = this.textbox_Sent_To_Entity_City.Text;
                string p_Sent_To_Entity_Address = this.textbox_Sent_To_Entity_Address.Text;
                string p_Sent_To_Entity_ZipCode = this.textbox_Sent_To_Entity_ZipCode.Text;
                string p_Sent_To_Entity_Email_Address = this.textbox_Sent_To_Entity_Email_Address.Text;

                DateTime? p_Recieved_Document_DateTime = new DateTime?();
                p_Recieved_Document_DateTime = Common_Tools.Get_DateTime_From_ComboBoxes(
                    this.textbox_Recieved_Document_DateTime,
                    this.dropdown_Recieved_Document_Time_Hours,
                    this.dropdown_Recieved_Document_Time_Minutes,
                    this.dropdown_Recieved_Document_Time_Seconds);


                short? p_Recieved_In_Country_Id = new short?();
                short? p_Recieved_In_State_Id = new short?();
                if (!string.IsNullOrEmpty(this.dropdown_Recieved_In_Country.SelectedValue))
                {
                    p_Recieved_In_Country_Id = short.Parse(this.dropdown_Recieved_In_Country.SelectedValue);
                    if (!string.IsNullOrEmpty(this.dropdown_Recieved_In_State.SelectedValue))
                    {
                        p_Recieved_In_State_Id = short.Parse(this.dropdown_Recieved_In_State.SelectedValue);
                    }
                }

                string p_Recieved_In_City = this.textbox_Recieved_In_City.Text;
                string p_Recieved_In_Address = this.textbox_Recieved_In_Address.Text;
                string p_Recieved_In_ZipCode = this.textbox_Recieved_In_ZipCode.Text;
                string p_Recieved_In_Email_Address = this.textbox_Recieved_In_Email_Address.Text;

                string p_User_Comments = this.textbox_User_Comments.Text;
                int? p_Recieved_By_User_Id = new int?();
                if (!string.IsNullOrEmpty(this.dropdown_Recieved_By_User.SelectedValue))
                {
                    p_Recieved_By_User_Id = int.Parse(this.dropdown_Recieved_By_User.SelectedValue);
                }
                DateTime? p_Recieved_DateTime = new DateTime?();
                if (!string.IsNullOrEmpty(this.textbox_Recieved_DateTime.Text))
                {
                    p_Recieved_DateTime = Common_Tools.Get_DateTime_From_ComboBoxes(
                    this.textbox_Recieved_DateTime,
                    this.dropdown_Recieved_Time_Hours,
                    this.dropdown_Recieved_Time_Minutes,
                    this.dropdown_Recieved_Time_Seconds);
                }

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

                TimeLineDashboard.Shared.Models.General_Documents new_General_Document_Details = null;

                try
                {
                    new_General_Document_Details = Business_Logic_Layer_Facade.Instance.GeneralDocuments_Insert_New_General_Document_Details(
                        p_User_Id, p_General_Document_Type_Id, p_Title,
                        p_Description, p_Document_Creation_DateTime,

                        p_Sent_By_Entity_Name, p_Sent_By_Entity_Country_Id,
                        p_Sent_By_Entity_State_Id, p_Sent_By_Entity_City,
                        p_Sent_By_Entity_Address, p_Sent_By_Entity_ZipCode,
                        p_Sent_By_Entity_DateTime, p_Sent_By_Entity_Email_Address,

                        p_Sent_To_Entity_Name, p_Sent_To_Entity_Country_Id,
                        p_Sent_To_Entity_State_Id, p_Sent_To_Entity_City,
                        p_Sent_To_Entity_Address, p_Sent_To_Entity_ZipCode,
                        p_Sent_To_Entity_Email_Address,

                        p_Recieved_Document_DateTime,
                        p_Recieved_In_Country_Id, p_Recieved_In_State_Id,
                        p_Recieved_In_City, p_Recieved_In_Address,
                        p_Recieved_In_ZipCode, p_Recieved_In_Email_Address,

                        p_User_Comments, p_Recieved_By_User_Id, p_Recieved_DateTime,
                        p_Original_File_Name, p_Azure_Block_Blob_Reference,
                        p_Is_Visible_To_Anonymous_Users, p_Is_Available_For_Download_For_Anonymous_Users,
                        p_Is_Visible_To_Followers_Users, p_Is_Available_For_Download_For_Followers_Users,
                        p_Record_Created_By_User_Id, p_Record_Creation_DateTime_UTC,
                        p_Record_Last_Updated_By_User_Id, p_Record_Last_Updated_DateTime_UTC,
                        p_Is_Active
                        );

                    l_New_Document_Id = new_General_Document_Details.General_Document_Id;
                    l_Document_Successfully_Created = true;
                }
                catch (Exception exc)
                {
                    exception_During_Process = exc.Message;
                    if (exc.InnerException != null)
                    {
                        exception_During_Process_Extra_Data = exc.InnerException.Message;
                    }
                }

                if (l_Document_Successfully_Created && l_New_Document_Id > 0)
                {
                    // The user details was successfully created.. 
                    // Show success message and redirect the user to view page or back to users page (depends on where the user came from)
                    Response.Redirect("list_Documents.aspx");
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

        protected void dropdown_Sent_By_Entity_Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Bind_Sent_By_Entity_States_ComboBox();
        }

        private void Bind_Sent_By_Entity_States_ComboBox()
        {
            // check if the current selected country_id from the drop down has states
            Hide_Or_Show_Sent_By_Entity_States_And_Reset_Selection();
            short Country_Id = 0;

            if (!string.IsNullOrEmpty(this.dropdown_Sent_By_Entity_Country.SelectedValue))
            {
                short.TryParse(this.dropdown_Sent_By_Entity_Country.SelectedValue, out Country_Id);

                if (Country_Id > 0)
                {
                    List<States> countryId_States = Business_Logic_Layer_Facade.Instance.States_GetStates_By_Country_Id(Country_Id);

                    if (countryId_States.Count > 0)
                    {
                        this.dropdown_Sent_By_Entity_State.DataSource = countryId_States;
                        this.dropdown_Sent_By_Entity_State.DataTextField = "State_Name";
                        this.dropdown_Sent_By_Entity_State.DataValueField = "State_Id";
                        this.dropdown_Sent_By_Entity_State.DataBind();

                        this.dropdown_Sent_By_Entity_State.Items.Insert(0, new ListItem("-- Select -- ", ""));
                    }

                    if (countryId_States != null && countryId_States.Count > 0)
                    {
                        this.p_Sent_By_Entity_State_Wrapper_Panel.Visible = true;
                    }
                    else
                    {
                        this.p_Sent_By_Entity_State_Wrapper_Panel.Visible = false;
                    }
                }
            }
        }

        private void Hide_Or_Show_Sent_By_Entity_States_And_Reset_Selection()
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

        protected void dropdown_Sent_To_Entity_Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Bind_Sent_To_Entity_States_ComboBox();
        }

        private void Bind_Sent_To_Entity_States_ComboBox()
        {
            // check if the current selected country_id from the drop down has states
            Hide_Or_Show_Sent_To_Entity_States_And_Reset_Selection();
            short Country_Id = 0;

            if (!string.IsNullOrEmpty(this.dropdown_Sent_To_Entity_Country.SelectedValue))
            {
                short.TryParse(this.dropdown_Sent_To_Entity_Country.SelectedValue, out Country_Id);

                if (Country_Id > 0)
                {
                    List<States> countryId_States = Business_Logic_Layer_Facade.Instance.States_GetStates_By_Country_Id(Country_Id);

                    if (countryId_States.Count > 0)
                    {
                        this.dropdown_Sent_To_Entity_State.DataSource = countryId_States;
                        this.dropdown_Sent_To_Entity_State.DataTextField = "State_Name";
                        this.dropdown_Sent_To_Entity_State.DataValueField = "State_Id";
                        this.dropdown_Sent_To_Entity_State.DataBind();

                        this.dropdown_Sent_To_Entity_State.Items.Insert(0, new ListItem("-- Select -- ", ""));
                    }

                    if (countryId_States != null && countryId_States.Count > 0)
                    {
                        this.p_Sent_To_Entity_State_Wrapper_Panel.Visible = true;
                    }
                    else
                    {
                        this.p_Sent_To_Entity_State_Wrapper_Panel.Visible = false;
                    }
                }
            }
        }

        private void Hide_Or_Show_Sent_To_Entity_States_And_Reset_Selection()
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

        protected void dropdown_Recieved_In_Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Bind_Recieved_In_States_ComboBox();
        }

        private void Bind_Recieved_In_States_ComboBox()
        {
            // check if the current selected country_id from the drop down has states
            Hide_Or_Show_Recieved_In_States_And_Reset_Selection();
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

        private void Hide_Or_Show_Recieved_In_States_And_Reset_Selection()
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

        protected void dropdown_User_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Bind availble "recievers users" to pick based on current selected user
        }

    }
}
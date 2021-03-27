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
    public partial class manage_Document : BasePage
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

            this.button_Edit_Document_Details.Visible = true;
            this.button_Update_Document_Details.Visible = false;
            this.button_CancelEdit_Document_Details.Visible = false;
        }

        private void Bind_Edit_View()
        {
            base.Change_View_Mode_FormControls_Wrappers(false);
            
            this.button_Edit_Document_Details.Visible = false;
            this.button_Update_Document_Details.Visible = true;
            this.button_CancelEdit_Document_Details.Visible = true;
        }

        private void Set_Page_FormControls_Values()
        {
            int General_Document_Record_Id = int.Parse(this.Request.QueryString["id"]);
            int user_Id_Document_Owner = base.Authenticated_User_ID;

            General_Documents documentDetails = Business_Logic_Layer_Facade.Instance.GeneralDocuments_Get_By_Id(
                General_Document_Record_Id, user_Id_Document_Owner);

            if (documentDetails != null)
            {

                Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                    documentDetails.General_Document_Type.ToString(),
                    this.dropdown_General_Document_Type,
                    this.label_General_Document_Type);

                Common_Tools.Set_DateTime_To_ComboBoxes_And_Label(
                    documentDetails.Document_Creation_DateTime,
                    this.textbox_Document_Creation_Date,
                    this.label_Document_Creation_Date,
                    this.dropdown_Document_Creation_Time_Hours,
                    this.dropdown_Document_Creation_Time_Minutes,
                    this.dropdown_Document_Creation_Time_Seconds,
                    this.label_Document_Creation_Time
                    );

                this.textbox_Title.Text = documentDetails.Title;
                this.label_Title.Text = documentDetails.Title;

                this.textbox_Description.Text = documentDetails.Description;
                this.label_Description.Text = documentDetails.Description;

                this.textbox_Sent_By_Entity_Name.Text = documentDetails.Sent_By_Entity_Name;
                this.label_Sent_By_Entity_Name.Text = documentDetails.Sent_By_Entity_Name;

                Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                    documentDetails.Sent_By_Entity_Country_Id.ToString(),
                    this.dropdown_Sent_By_Entity_Country,
                    this.label_Sent_By_Entity_Country);
                this.Bind_Sent_By_Entity_States_ComboBox();
                if (documentDetails.Sent_By_Entity_State_Id.HasValue)
                { 
                    Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                        documentDetails.Sent_By_Entity_State_Id.ToString(),
                        this.dropdown_Sent_By_Entity_State,
                        this.label_Sent_By_Entity_State);
                }

                this.textbox_Sent_By_Entity_City.Text = documentDetails.Sent_By_Entity_City;
                this.label_Sent_By_Entity_City.Text = documentDetails.Sent_By_Entity_City;
                
                this.textbox_Sent_By_Entity_Address.Text = documentDetails.Sent_By_Entity_Address;
                this.label_Sent_By_Entity_Address.Text = documentDetails.Sent_By_Entity_Address;
                
                this.textbox_Sent_By_Entity_ZipCode.Text = documentDetails.Sent_By_Entity_ZipCode;
                this.label_Sent_By_Entity_ZipCode.Text = documentDetails.Sent_By_Entity_ZipCode;

                this.textbox_Sent_By_Entity_ZipCode.Text = documentDetails.Sent_By_Entity_ZipCode;
                this.label_Sent_By_Entity_ZipCode.Text = documentDetails.Sent_By_Entity_ZipCode;

                Common_Tools.Set_DateTime_To_ComboBoxes_And_Label(
                    documentDetails.Sent_By_Entity_DateTime,
                    this.textbox_Sent_By_Entity_DateTime,
                    this.label_Sent_By_Entity_DateTime,
                    this.dropdown_Sent_By_Entity_Time_Hours,
                    this.dropdown_Sent_By_Entity_Time_Minutes,
                    this.dropdown_Sent_By_Entity_Time_Seconds,
                    this.label_Sent_By_Entity_Time);

                this.textbox_Sent_By_Entity_Email_Address.Text = documentDetails.Sent_By_Entity_Email_Address;
                this.label_Sent_By_Entity_Email_Address.Text = documentDetails.Sent_By_Entity_Email_Address;


                this.textbox_Sent_To_Entity_Name.Text = documentDetails.Sent_To_Entity_Name;
                this.label_Sent_To_Entity_Name.Text = documentDetails.Sent_To_Entity_Name;

                this.textbox_Sent_To_Entity_Name.Text = documentDetails.Sent_To_Entity_Name;
                this.label_Sent_To_Entity_Name.Text = documentDetails.Sent_To_Entity_Name;

                Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                    documentDetails.Sent_To_Entity_Country_Id.ToString(),
                    this.dropdown_Sent_To_Entity_Country,
                    this.label_Sent_To_Entity_Country);
                this.Bind_Sent_To_Entity_States_ComboBox();
                if (documentDetails.Sent_To_Entity_State_Id.HasValue)
                {
                    Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                        documentDetails.Sent_To_Entity_State_Id.ToString(),
                        this.dropdown_Sent_To_Entity_State,
                        this.label_Sent_To_Entity_State);
                }

                this.textbox_Sent_To_Entity_City.Text = documentDetails.Sent_To_Entity_City;
                this.label_Sent_To_Entity_City.Text = documentDetails.Sent_To_Entity_City;

                this.textbox_Sent_To_Entity_Address.Text = documentDetails.Sent_To_Entity_Address;
                this.label_Sent_To_Entity_Address.Text = documentDetails.Sent_To_Entity_Address;

                this.textbox_Sent_To_Entity_ZipCode.Text = documentDetails.Sent_To_Entity_ZipCode;
                this.label_Sent_To_Entity_ZipCode.Text = documentDetails.Sent_To_Entity_ZipCode;

                this.textbox_Sent_To_Entity_Email_Address.Text = documentDetails.Sent_To_Entity_Email_Address;
                this.label_Sent_To_Entity_Email_Address.Text = documentDetails.Sent_To_Entity_Email_Address;

                Common_Tools.Set_DateTime_To_ComboBoxes_And_Label(
                    documentDetails.Sent_By_Entity_DateTime,
                    this.textbox_Recieved_Document_DateTime,
                    this.label_Recieved_Document_DateTime,
                    this.dropdown_Recieved_Document_Time_Hours,
                    this.dropdown_Recieved_Document_Time_Minutes,
                    this.dropdown_Recieved_Document_Time_Seconds,
                    this.label_Recieved_Document_Time);

                Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                    documentDetails.Recieved_In_Country_Id.ToString(),
                    this.dropdown_Recieved_In_Country,
                    this.label_Recieved_In_Country);

                this.Bind_Recieved_In_States_ComboBox();
                if (documentDetails.Recieved_In_State_Id.HasValue)
                {
                    Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                        documentDetails.Recieved_In_State_Id.ToString(),
                        this.dropdown_Recieved_In_State,
                        this.label_Recieved_In_State);
                }

                this.textbox_Recieved_In_City.Text = documentDetails.Recieved_In_City;
                this.label_Recieved_In_City.Text = documentDetails.Recieved_In_City;

                this.textbox_Recieved_In_Address.Text = documentDetails.Recieved_In_Address;
                this.label_Recieved_In_Address.Text = documentDetails.Recieved_In_Address;

                this.textbox_Recieved_In_ZipCode.Text = documentDetails.Recieved_In_ZipCode;
                this.label_Recieved_In_ZipCode.Text = documentDetails.Recieved_In_ZipCode;

                this.textbox_Recieved_In_Email_Address.Text = documentDetails.Recieved_In_Email_Address;
                this.label_Recieved_In_Email_Address.Text = documentDetails.Recieved_In_Email_Address;

                this.textbox_User_Comments.Text = documentDetails.User_Comments;
                this.label_User_Comments.Text = documentDetails.User_Comments;

                this.textbox_User_Comments.Text = documentDetails.User_Comments;
                this.label_User_Comments.Text = documentDetails.User_Comments;

                Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                    documentDetails.Recieved_By_User_Id.ToString(),
                    this.dropdown_Recieved_By_User,
                    this.label_Recieved_By_User);

                Common_Tools.Set_DateTime_To_ComboBoxes_And_Label(
                    documentDetails.Recieved_DateTime,
                    this.textbox_Recieved_DateTime,
                    this.label_Recieved_DateTime,
                    this.dropdown_Recieved_Time_Hours,
                    this.dropdown_Recieved_Time_Minutes,
                    this.dropdown_Recieved_Time_Seconds,
                    this.label_Recieved_Time );

                // ToDo: Show file changing option + view the actual file

                this.checkbox_Is_Visible_To_Anonymous_Users.Checked = documentDetails.Is_Visible_To_Anonymous_Users;
                this.label_Is_Visible_To_Anonymous_Users.Text = documentDetails.Is_Visible_To_Anonymous_Users ? "Yes" : "No";

                this.checkbox_Is_Available_For_Download_For_Anonymous_Users.Checked = documentDetails.Is_Available_For_Download_For_Anonymous_Users;
                this.label_Is_Available_For_Download_For_Anonymous_Users.Text = documentDetails.Is_Available_For_Download_For_Anonymous_Users ? "Yes" : "No";

                this.checkbox_Is_Visible_To_Followers_Users.Checked = documentDetails.Is_Visible_To_Followers_Users;
                this.label_Is_Visible_To_Followers_Users.Text = documentDetails.Is_Visible_To_Followers_Users ? "Yes" : "No";

                this.checkbox_Is_Available_For_Download_For_Followers_Users.Checked = documentDetails.Is_Available_For_Download_For_Followers_Users;
                this.label_Is_Available_For_Download_For_Followers_Users.Text = documentDetails.Is_Available_For_Download_For_Followers_Users ? "Yes" : "No";

                this.checkbox_Is_Active.Checked = documentDetails.Is_Active;
                this.label_Is_Active.Text = documentDetails.Is_Active ? "Yes" : "No";

                this.label_Record_Created_By_User.Text = documentDetails.Record_Created_By_User_Details.FullName_With_Email;
                this.label_Record_Creation_DateTime_UTC.Text = documentDetails.Record_Creation_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
                this.label_Record_Last_Updated_By_User.Text = documentDetails.Record_Last_Updated_By_User_Details.FullName_With_Email.ToString();
                this.label_Record_Last_Updated_DateTime_UTC.Text = documentDetails.Record_Last_Updated_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
            }
        }

        protected void button_Update_Document_Details_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                bool l_Document_Successfully_Updated = false;
                
                string exception_During_Process = "";
                string exception_During_Process_Extra_Data = "";

                int p_General_Document_Id = int.Parse(this.Request.QueryString["id"]);
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

                bool p_Is_Visible_To_Anonymous_Users = this.checkbox_Is_Visible_To_Anonymous_Users.Checked;
                bool p_Is_Available_For_Download_For_Anonymous_Users = this.checkbox_Is_Available_For_Download_For_Anonymous_Users.Checked;
                bool p_Is_Visible_To_Followers_Users = this.checkbox_Is_Visible_To_Followers_Users.Checked;
                bool p_Is_Available_For_Download_For_Followers_Users = this.checkbox_Is_Available_For_Download_For_Followers_Users.Checked;

                
                bool p_Is_Active = this.checkbox_Is_Active.Checked;
                int p_Updating_User_Id = base.Authenticated_User_ID;

                try
                {
                    l_Document_Successfully_Updated = Business_Logic_Layer_Facade.Instance.GeneralDocuments_Update_Document_Details(
                        p_General_Document_Id, p_General_Document_Type_Id, p_Title,
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
                        
                        p_Is_Visible_To_Anonymous_Users, p_Is_Available_For_Download_For_Anonymous_Users,
                        p_Is_Visible_To_Followers_Users, p_Is_Available_For_Download_For_Followers_Users,
                        
                        p_Is_Active, p_Updating_User_Id );

                }
                catch (Exception exc)
                {
                    l_Document_Successfully_Updated = false;
                    exception_During_Process = exc.Message;
                    if (exc.InnerException != null)
                    {
                        exception_During_Process_Extra_Data = exc.InnerException.Message;
                    }
                }

                if (l_Document_Successfully_Updated)
                {
                    // The client details were successfully updated. 
                    // redirect the user to view read only mode
                    Response.Redirect("manage_Document.aspx?id=" + Request.QueryString["id"] + "&mode=view");
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

        protected void button_Edit_Document_Details_Click(object sender, EventArgs e)
        {
            this.Bind_Edit_View();
        }

        protected void button_CancelEdit_Document_Details_Click(object sender, EventArgs e)
        {
            this.Bind_ReadOnly_View();
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

    }
}
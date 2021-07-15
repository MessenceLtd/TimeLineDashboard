using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TimeLineDashboard.BusinessLogicLayer;
using TimeLineDashboard.Shared.Models;
using TimeLineDashboard.Shared.Responses;
using WebformsPOCDemo.AppShared;

namespace WebformsPOCDemo
{
    public partial class manage_CreditCardStatementTransaction : BasePage
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

            Common_Tools.Initialize_DropDown_Countries(this.dropdown_Country);
            Common_Tools.Initialize_DropDown_Currencies(this.dropdown_Payment_Currency);
            Common_Tools.Initialize_DropDown_Document_Types(this.dropdown_Type);

            this.Set_Page_FormControls_Values();

            if (!string.IsNullOrEmpty(this.Request.QueryString["mode"]))
            {
                if (Request.QueryString["mode"] == "view")
                {
                    this.Bind_ReadOnly_View();
                }
                else if (Request.QueryString["mode"] == "edit")
                {
                    this.Bind_Edit_View();
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

            this.button_Edit_Credit_Card_Statement_Transaction_Details.Visible = true;
            this.button_Update_Credit_Card_Statement_Transaction_Details.Visible = false;
            this.button_CancelEdit_Credit_Card_Statement_Transaction_Details.Visible = false;

            this.Bind_Documents_Connections();
            this.Bind_Documents_Suggestions();
        }

        private void Bind_Edit_View()
        {
            base.Change_View_Mode_FormControls_Wrappers(false);

            this.button_Edit_Credit_Card_Statement_Transaction_Details.Visible = false;
            this.button_Update_Credit_Card_Statement_Transaction_Details.Visible = true;
            this.button_CancelEdit_Credit_Card_Statement_Transaction_Details.Visible = true;

            this.Bind_Documents_Connections();
            this.Bind_Documents_Suggestions();
        }

        private void Set_Page_FormControls_Values()
        {
            int ccStatement_Transaction_Id = int.Parse(this.Request.QueryString["id"]);
            int user_Id_BankAccount_Owner = base.Authenticated_User_ID;

            Credit_Cards_Statement_Transaction transactionDetails = Business_Logic_Layer_Facade.Instance
                .CreditCardStatementTransactions_Get_Credit_Card_Statement_Transaction_Details(
                    user_Id_BankAccount_Owner,
                    ccStatement_Transaction_Id, 
                    user_Id_BankAccount_Owner, 
                    base.Authenticated_Permission_Type);

            if (transactionDetails != null)
            {
                Common_Tools.Set_DateTime_To_TextBox_And_Label(
                    transactionDetails.Transaction_Date,
                    this.textbox_Transaction_Date,
                    this.label_Transaction_Date);

                this.textbox_Business_Name.Text = transactionDetails.Business_Name;
                this.label_Business_Name.Text = transactionDetails.Business_Name;

                Common_Tools.Set_Number_Text_Value_To_TextBox_Label_Text(
                    transactionDetails.Transaction_Amount,
                    this.textbox_Transaction_Amount,
                    this.label_Transaction_Amount);

                if (transactionDetails.Transaction_Amount_Currency_Id.HasValue)
                { 
                    Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                        transactionDetails.Transaction_Amount_Currency_Id.ToString(),
                        this.dropdown_Payment_Currency,
                        this.label_Payment_Currency);
                }

                Common_Tools.Set_Number_Text_Value_To_TextBox_Label_Text(
                    transactionDetails.Transaction_Actual_Payment_Amount,
                    this.textbox_Actual_Payment_Amount,
                    this.label_Actual_Payment_Amount);

                this.textbox_Description.Text = transactionDetails.Description;
                this.label_Description.Text = transactionDetails.Description;

                this.checkbox_Has_Been_Actually_Charged_In_Statement.Checked = transactionDetails.Has_Been_Actually_Charged_In_Statement;
                this.label_Has_Been_Actually_Charged_In_Statement.Text =
                    base.Get_Yes_Or_No_Text_Value(transactionDetails.Has_Been_Actually_Charged_In_Statement);

                Common_Tools.Set_Number_Text_Value_To_TextBox_Label_Text(
                    transactionDetails.Total_Charged_In_Statement,
                    this.textbox_Total_Charged_In_Statement,
                    this.label_Total_Charged_In_Statement);

                this.textbox_User_Description.Text = transactionDetails.User_Description;
                this.label_User_Description.Text = transactionDetails.User_Description;

                this.textbox_User_Comments.Text = transactionDetails.User_Comments;
                this.label_User_Comments.Text = transactionDetails.User_Comments;

                this.checkbox_Is_Visible_To_Anonymous_Users.Checked = transactionDetails.Is_Visible_To_Anonymous_Users;
                this.label_Is_Visible_To_Anonymous_Users.Text 
                    = base.Get_Yes_Or_No_Text_Value(transactionDetails.Is_Visible_To_Anonymous_Users);

                this.checkbox_Is_Available_For_Download_For_Anonymous_Users.Checked = transactionDetails.Is_Available_For_Download_For_Anonymous_Users;
                this.label_Is_Available_For_Download_For_Anonymous_Users.Text 
                    = base.Get_Yes_Or_No_Text_Value(transactionDetails.Is_Available_For_Download_For_Anonymous_Users);

                this.checkbox_Is_Visible_To_Followers_Users.Checked = transactionDetails.Is_Visible_To_Followers_Users;
                this.label_Is_Visible_To_Followers_Users.Text 
                    = base.Get_Yes_Or_No_Text_Value(transactionDetails.Is_Visible_To_Followers_Users);

                this.checkbox_Is_Available_For_Download_For_Followers_Users.Checked = transactionDetails.Is_Available_For_Download_For_Followers_Users;
                this.label_Is_Available_For_Download_For_Followers_Users.Text 
                    = base.Get_Yes_Or_No_Text_Value(transactionDetails.Is_Available_For_Download_For_Followers_Users);

                this.label_Record_Created_By_User.Text = transactionDetails.Record_Created_By_User_Details.FullName_With_Email;
                this.label_Record_Creation_DateTime_UTC.Text = transactionDetails.Record_Creation_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
                this.label_Record_Last_Updated_By_User.Text = transactionDetails.Record_Last_Updated_By_User_Details.FullName_With_Email.ToString();
                this.label_Record_Last_Updated_DateTime_UTC.Text = transactionDetails.Record_Last_Updated_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
            }
            else
            {
                throw new Exception("Could not find any details for the transction.");
            }
        }

        private void Bind_Documents_Connections()
        {
            int ccStatement_Transaction_Id = int.Parse(this.Request.QueryString["id"]);
            int user_Id_BankAccount_Owner = base.Authenticated_User_ID;

            var connected_Documents_List = Business_Logic_Layer_Facade.Instance
                .CreditCardStatementTransactionDocumentConnection_Get_Documents_Connections(
                    ccStatement_Transaction_Id,
                    base.Authenticated_User_ID );

            if (connected_Documents_List!= null && connected_Documents_List.Count>0)
            { 
                this.panel_Connected_Documentation_No_Result.Visible = false;
                this.panelConnected_Documentation_Title.Visible = true;

                this.grid_Connected_Documents.Visible = true;

                this.grid_Connected_Documents.DataSource = connected_Documents_List;
                this.grid_Connected_Documents.DataBind();
            }
            else
            {
                this.panelConnected_Documentation_Title.Visible = false;
                this.grid_Connected_Documents.Visible = false;
                this.panel_Connected_Documentation_No_Result.Visible = true;
            }
        }

        private void Bind_Documents_Suggestions()
        {
            int ccStatement_Transaction_Id = int.Parse(this.Request.QueryString["id"]);

            var l_Suggested_Documents = Business_Logic_Layer_Facade.Instance
                .CreditCardStatementTransactionDocumentConnection_Get_Document_Connection_Suggestions(
                    ccStatement_Transaction_Id,
                    base.Authenticated_User_ID);


            if (l_Suggested_Documents!= null && l_Suggested_Documents.Count > 0)
            {
                this.panel_Suggested_Documents_Title.Visible = true;

                this.grid_Suggested_Documents.Visible = true;
                this.grid_Suggested_Documents.DataSource = l_Suggested_Documents;
                this.grid_Suggested_Documents.DataBind();
            }
            else
            {
                this.panel_Suggested_Documents_Title.Visible = false;
                this.grid_Suggested_Documents.Visible = false;
            }
        }

        protected void button_Update_Credit_Card_Statement_Transaction_Details_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                bool l_Credit_Card_Statement_Transaction_Successfully_Updated = false;

                string exception_During_Process = "";
                string exception_During_Process_Extra_Data = "";

                int p_User_ID_Bank_Owner = base.Authenticated_User_ID;
                long p_Credit_Card_Statement_Transaction_Id = long.Parse(this.Request.QueryString["id"]);

                DateTime? p_Transaction_Date = null;
                if (!string.IsNullOrEmpty(this.textbox_Transaction_Date.Text))
                {
                    bool parsed_Successfully = false;
                    DateTime date_Parsed = new DateTime();
                    try
                    {
                        parsed_Successfully = DateTime.TryParseExact(this.textbox_Transaction_Date.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out date_Parsed);
                    }
                    catch
                    {
                        parsed_Successfully = false;
                    }

                    if (parsed_Successfully)
                    {
                        p_Transaction_Date = date_Parsed;
                    }
                }

                string p_Business_Name = this.textbox_Business_Name.Text;

                decimal? p_Transaction_Amount = null;
                if (  !string.IsNullOrEmpty( this.textbox_Transaction_Amount.Text) )
                {
                    p_Transaction_Amount = decimal.Parse(this.textbox_Transaction_Amount.Text);
                }

                byte? p_Transaction_Amount_Currency_Id = null;
                if (!string.IsNullOrEmpty(this.dropdown_Payment_Currency.SelectedValue))
                {
                    p_Transaction_Amount_Currency_Id = byte.Parse(this.dropdown_Payment_Currency.SelectedValue);
                }

                decimal? p_Transaction_Actual_Payment_Amount = null;
                if (!string.IsNullOrEmpty(this.textbox_Actual_Payment_Amount.Text))
                {
                    p_Transaction_Actual_Payment_Amount = decimal.Parse(this.textbox_Actual_Payment_Amount.Text);
                }

                string p_Description = this.textbox_Description.Text;

                bool p_Has_Been_Actually_Charged_In_Statement = this.checkbox_Has_Been_Actually_Charged_In_Statement.Checked;

                decimal? p_Total_Charged_In_Statement = null;
                if (    p_Has_Been_Actually_Charged_In_Statement && 
                        !string.IsNullOrEmpty(this.textbox_Total_Charged_In_Statement.Text) )
                {
                    p_Total_Charged_In_Statement = decimal.Parse(this.textbox_Total_Charged_In_Statement.Text);
                }

                string p_User_Description = this.textbox_User_Description.Text;
                string p_User_Comments = this.textbox_User_Comments.Text;

                bool p_Is_Visible_To_Anonymous_Users = this.checkbox_Is_Visible_To_Anonymous_Users.Checked;
                bool p_Is_Available_For_Download_For_Anonymous_Users = this.checkbox_Is_Available_For_Download_For_Anonymous_Users.Checked;
                bool p_Is_Visible_To_Followers_Users = this.checkbox_Is_Visible_To_Followers_Users.Checked;
                bool p_Is_Available_For_Download_For_Followers_Users = this.checkbox_Is_Available_For_Download_For_Followers_Users.Checked;

                int p_Updating_User_Id = base.Authenticated_User_ID;

                try
                {
                    l_Credit_Card_Statement_Transaction_Successfully_Updated = Business_Logic_Layer_Facade.Instance
                        .CreditCardStatementTransactions_Update_Credit_Card_Statement_Transaction_FullDetails(
                            p_User_ID_Bank_Owner,
                            p_Credit_Card_Statement_Transaction_Id,
                            p_Transaction_Date,
                            p_Business_Name,
                            p_Transaction_Amount,
                            p_Transaction_Amount_Currency_Id,
                            p_Transaction_Actual_Payment_Amount,
                            p_Description,
                            p_Has_Been_Actually_Charged_In_Statement,
                            p_Total_Charged_In_Statement,
                            p_User_Description,
                            p_User_Comments,
                            p_Is_Visible_To_Anonymous_Users,
                            p_Is_Available_For_Download_For_Anonymous_Users,
                            p_Is_Visible_To_Followers_Users,
                            p_Is_Available_For_Download_For_Followers_Users,
                            p_Updating_User_Id,
                            base.Authenticated_Permission_Type);
                }
                catch (Exception exc)
                {
                    l_Credit_Card_Statement_Transaction_Successfully_Updated = false;
                    exception_During_Process = exc.Message;
                    if (exc.InnerException != null)
                    {
                        exception_During_Process_Extra_Data = exc.InnerException.Message;
                    }
                }

                if (l_Credit_Card_Statement_Transaction_Successfully_Updated)
                {
                    // The client details were successfully updated. 
                    // redirect the user to view read only mode
                    this.Set_Page_FormControls_Values();
                    this.Bind_ReadOnly_View();
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

        protected void button_Edit_Credit_Card_Statement_Transaction_Details_Click(object sender, EventArgs e)
        {
            this.Bind_Edit_View();
        }

        protected void button_CancelEdit_Credit_Card_Statement_Transaction_Details_Click(object sender, EventArgs e)
        {
            this.Bind_ReadOnly_View();
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

                        this.dropdown_State.Items.Insert(0, new ListItem("-- Select State -- ", ""));
                    }

                    if (countryId_States != null && countryId_States.Count > 0)
                    {
                        this.panel_States.Visible = true;
                    }
                    else
                    {
                        this.panel_States.Visible = false;
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
                    this.panel_States.Visible = true;
                }
                else
                {
                    this.panel_States.Visible = false;
                }
            }
            else
            {
                this.panel_States.Visible = false;
            }
        }

        protected void button_Search_Documents_Click(object sender, EventArgs e)
        {
            int p_Credit_Card_Statement_Transaction_Id = int.Parse(this.Request.QueryString["id"]);
            DateTime? p_Filter_By_From_Date = new DateTime?();
            DateTime l_Filter_By_From_Date_For_Parsing_Result = new DateTime();

            DateTime? p_Filter_By_To_Date = new DateTime?();
            DateTime l_Filter_By_To_Date_For_Parsing_Result = new DateTime();

            bool l_Parsed_Successfully = DateTime.TryParseExact(this.text_Filter_By_From_Date.Text,
                "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out l_Filter_By_From_Date_For_Parsing_Result);
            if (l_Parsed_Successfully)
            {
                p_Filter_By_From_Date = l_Filter_By_From_Date_For_Parsing_Result;
            }

            l_Parsed_Successfully = DateTime.TryParseExact(this.text_Filter_By_To_Date.Text,
                "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out l_Filter_By_To_Date_For_Parsing_Result);
            if (l_Parsed_Successfully)
            {
                p_Filter_By_To_Date = l_Filter_By_To_Date_For_Parsing_Result;
            }

            byte? filter_By_Type = new byte?();
            if (!string.IsNullOrEmpty(this.dropdown_Type.SelectedValue))
            {
                filter_By_Type = byte.Parse(this.dropdown_Type.SelectedValue);
            }

            short? filter_By_Country = new short?();

            string filter_By_City_Or_Address_Or_ZipCode = this.text_Filter_By_CityAddressZipCode.Text;
            string filter_By_CompanyName_Or_Person_Fullname = this.text_Filter_By_CompanyNamePeopleName.Text;

            var list_Of_Documents_To_Connent_Searched = Business_Logic_Layer_Facade.Instance
                .CreditCardStatementTransactionDocumentConnection_Search_For_Documents_To_Connect(
                    p_Credit_Card_Statement_Transaction_Id,
                    p_Filter_By_From_Date,
                    p_Filter_By_To_Date,
                    filter_By_Type,
                    filter_By_Country,
                    filter_By_City_Or_Address_Or_ZipCode,
                    filter_By_CompanyName_Or_Person_Fullname,
                    base.Authenticated_User_ID);

            this.panel_Please_Search.Visible = false;
            if (list_Of_Documents_To_Connent_Searched != null && list_Of_Documents_To_Connent_Searched.Count > 0)
            {
                this.dataGrid_Documents_List.DataSource = list_Of_Documents_To_Connent_Searched;
                this.dataGrid_Documents_List.DataBind();
                this.dataGrid_Documents_List.Visible = true;

                this.panel_No_Results_Message.Visible = false;
            }
            else
            {
                this.dataGrid_Documents_List.Visible = false;
                this.panel_No_Results_Message.Visible = true;
            }
        }

        protected string Build_Document_Record_Type_Url(byte p_Document_Record_Type_Id, int p_Document_Id)
        {
            return this.Build_Document_Record_Type_Url(p_Document_Record_Type_Id, p_Document_Id, "");
        }

        protected string Build_Document_Record_Type_Url(byte p_Document_Record_Type_Id, int p_Document_Id, string p_Mode)
        {
            string url_To_Return = "";

            switch (p_Document_Record_Type_Id)
            {
                case 1:
                    url_To_Return = "manage_Expense.aspx?id=" + p_Document_Id;
                    break;
                case 2:
                    url_To_Return = "manage_Invoice.aspx?id=" + p_Document_Id;
                    break;
                case 3:
                    url_To_Return = "manage_Document.aspx?id=" + p_Document_Id;
                    break;
            }

            if (!string.IsNullOrEmpty(p_Mode))
            {
                url_To_Return += "&mode=" + p_Mode;
            }

            return url_To_Return;
        }

        protected void grid_Connected_Documents_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (e.Item.DataItem != null)
                {
                    byte l_Document_Type = ((Bank_Account_Transaction_Document_Connection)e.Item.DataItem).Connection_Type;
                    string l_Document_Title = ((Bank_Account_Transaction_Document_Connection)e.Item.DataItem).Title;
                    int l_Document_Record_Id = ((Bank_Account_Transaction_Document_Connection)e.Item.DataItem).Document_Record_Id;

                    ((Label)e.Item.FindControl("lbl_Document_Type")).Text = Get_Global_Resource_Key_Value("SiteCommon", "BankAccount_Transaction_Document_Connection_Type_" + l_Document_Type);

                    HyperLink l_link_Document_Title = (HyperLink)e.Item.FindControl("link_Document_Title");
                    l_link_Document_Title.Text = l_Document_Title;
                    if (l_Document_Type == 1)
                        l_link_Document_Title.NavigateUrl = "manage_Expense.aspx?id=" + l_Document_Record_Id + "&mode=view";
                    else if (l_Document_Type == 2)
                        l_link_Document_Title.NavigateUrl = "manage_Invoice.aspx?id=" + l_Document_Record_Id + "&mode=view";
                    else if (l_Document_Type == 3)
                        l_link_Document_Title.NavigateUrl = "manage_Document.aspx?id=" + l_Document_Record_Id + "&mode=view";

                    //HyperLink l_link_Document_Edit_Image_Button = (HyperLink)e.Item.FindControl("link_Document_Edit_Image_Button");
                    //if (l_Document_Type == 1)
                    //    l_link_Document_Edit_Image_Button.NavigateUrl = "manage_Expense.aspx?id=" + l_Document_Record_Id + "&mode=edit";
                    //else if (l_Document_Type == 2)
                    //    l_link_Document_Edit_Image_Button.NavigateUrl = "manage_Invoice.aspx?id=" + l_Document_Record_Id + "&mode=edit";
                    //else if (l_Document_Type == 3)
                    //    l_link_Document_Edit_Image_Button.NavigateUrl = "manage_Document.aspx?id=" + l_Document_Record_Id + "&mode=edit";

                    HyperLink l_link_Document_View_Image_Button = (HyperLink)e.Item.FindControl("link_Document_View_Image_Button");
                    if (l_Document_Type == 1)
                        l_link_Document_View_Image_Button.NavigateUrl = "manage_Expense.aspx?id=" + l_Document_Record_Id + "&mode=view";
                    else if (l_Document_Type == 2)
                        l_link_Document_View_Image_Button.NavigateUrl = "manage_Invoice.aspx?id=" + l_Document_Record_Id + "&mode=view";
                    else if (l_Document_Type == 3)
                        l_link_Document_View_Image_Button.NavigateUrl = "manage_Document.aspx?id=" + l_Document_Record_Id + "&mode=view";

                    HyperLink l_link_Document_Download_Image_Button = (HyperLink)e.Item.FindControl("link_Document_Download_Image_Button");
                    if (l_Document_Type == 1)
                        l_link_Document_Download_Image_Button.NavigateUrl = "downloader.aspx?id=" + l_Document_Record_Id + "&type=expense";
                    else if (l_Document_Type == 2)
                        l_link_Document_Download_Image_Button.NavigateUrl = "downloader.aspx?id=" + l_Document_Record_Id + "&type=invoice";
                    else if (l_Document_Type == 3)
                        l_link_Document_Download_Image_Button.NavigateUrl = "downloader.aspx?id=" + l_Document_Record_Id + "&type=document";
                }
            }
        }

        protected void grid_Suggested_Documents_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (e.Item.DataItem != null)
                {
                    byte l_Document_Type = ((Bank_Account_Transaction_Document_Connection_Suggestion)e.Item.DataItem).Connection_Type;
                    string l_Document_Title = ((Bank_Account_Transaction_Document_Connection_Suggestion)e.Item.DataItem).Title;
                    int l_Document_Record_Id = ((Bank_Account_Transaction_Document_Connection_Suggestion)e.Item.DataItem).Document_Record_Id;

                    ((Label)e.Item.FindControl("lbl_Document_Type")).Text = Get_Global_Resource_Key_Value("SiteCommon", "BankAccount_Transaction_Document_Connection_Type_" + l_Document_Type);

                    HyperLink l_link_Document_Title = (HyperLink)e.Item.FindControl("link_Document_Title");
                    l_link_Document_Title.Text = l_Document_Title;
                    if (l_Document_Type == 1)
                        l_link_Document_Title.NavigateUrl = "manage_Expense.aspx?id=" + l_Document_Record_Id + "&mode=view";
                    else if (l_Document_Type == 2)
                        l_link_Document_Title.NavigateUrl = "manage_Invoice.aspx?id=" + l_Document_Record_Id + "&mode=view";
                    else if (l_Document_Type == 3)
                        l_link_Document_Title.NavigateUrl = "manage_Document.aspx?id=" + l_Document_Record_Id + "&mode=view";

                    HyperLink l_link_Document_Add_Image_Button = (HyperLink)e.Item.FindControl("link_Document_Add_Image_Button");
                    l_link_Document_Add_Image_Button.NavigateUrl = "javascript:Add_Document_Connection(" + l_Document_Record_Id + ", " + l_Document_Type + ");";

                    HyperLink l_link_Document_Edit_Image_Button = (HyperLink)e.Item.FindControl("link_Document_Edit_Image_Button");
                    if (l_Document_Type == 1)
                        l_link_Document_Edit_Image_Button.NavigateUrl = "manage_Expense.aspx?id=" + l_Document_Record_Id + "&mode=edit";
                    else if (l_Document_Type == 2)
                        l_link_Document_Edit_Image_Button.NavigateUrl = "manage_Invoice.aspx?id=" + l_Document_Record_Id + "&mode=edit";
                    else if (l_Document_Type == 3)
                        l_link_Document_Edit_Image_Button.NavigateUrl = "manage_Document.aspx?id=" + l_Document_Record_Id + "&mode=edit";

                    HyperLink l_link_Document_View_Image_Button = (HyperLink)e.Item.FindControl("link_Document_View_Image_Button");
                    if (l_Document_Type == 1)
                        l_link_Document_View_Image_Button.NavigateUrl = "manage_Expense.aspx?id=" + l_Document_Record_Id + "&mode=view";
                    else if (l_Document_Type == 2)
                        l_link_Document_View_Image_Button.NavigateUrl = "manage_Invoice.aspx?id=" + l_Document_Record_Id + "&mode=view";
                    else if (l_Document_Type == 3)
                        l_link_Document_View_Image_Button.NavigateUrl = "manage_Document.aspx?id=" + l_Document_Record_Id + "&mode=view";

                    HyperLink l_link_Document_Download_Image_Button = (HyperLink)e.Item.FindControl("link_Document_Download_Image_Button");
                    if (l_Document_Type == 1)
                        l_link_Document_Download_Image_Button.NavigateUrl = "downloader.aspx?id=" + l_Document_Record_Id + "&type=expense";
                    else if (l_Document_Type == 2)
                        l_link_Document_Download_Image_Button.NavigateUrl = "downloader.aspx?id=" + l_Document_Record_Id + "&type=invoice";
                    else if (l_Document_Type == 3)
                        l_link_Document_Download_Image_Button.NavigateUrl = "downloader.aspx?id=" + l_Document_Record_Id + "&type=document";
                }
            }
        }

        protected void dataGrid_Documents_List_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (e.Item.DataItem != null)
                {
                    byte l_Document_Type = ((Bank_Account_Transaction_Document_Connection_Suggestion)e.Item.DataItem).Connection_Type;
                    string l_Document_Title = ((Bank_Account_Transaction_Document_Connection_Suggestion)e.Item.DataItem).Title;
                    int l_Document_Record_Id = ((Bank_Account_Transaction_Document_Connection_Suggestion)e.Item.DataItem).Document_Record_Id;

                    ((Label)e.Item.FindControl("lbl_Document_Type")).Text = Get_Global_Resource_Key_Value("SiteCommon", "BankAccount_Transaction_Document_Connection_Type_" + l_Document_Type);

                    HyperLink l_link_Document_Title = (HyperLink)e.Item.FindControl("link_Document_Title");
                    l_link_Document_Title.Text = l_Document_Title;
                    if (l_Document_Type == 1)
                        l_link_Document_Title.NavigateUrl = "manage_Expense.aspx?id=" + l_Document_Record_Id + "&mode=view";
                    else if (l_Document_Type == 2)
                        l_link_Document_Title.NavigateUrl = "manage_Invoice.aspx?id=" + l_Document_Record_Id + "&mode=view";
                    else if (l_Document_Type == 3)
                        l_link_Document_Title.NavigateUrl = "manage_Document.aspx?id=" + l_Document_Record_Id + "&mode=view";

                    HyperLink l_link_Document_Add_Image_Button = (HyperLink)e.Item.FindControl("link_Document_Add_Image_Button");
                    l_link_Document_Add_Image_Button.NavigateUrl = "javascript:Add_Document_Connection(" + l_Document_Record_Id + ", " + l_Document_Type + ");";

                    HyperLink l_link_Document_Edit_Image_Button = (HyperLink)e.Item.FindControl("link_Document_Edit_Image_Button");
                    if (l_Document_Type == 1)
                        l_link_Document_Edit_Image_Button.NavigateUrl = "manage_Expense.aspx?id=" + l_Document_Record_Id + "&mode=edit";
                    else if (l_Document_Type == 2)
                        l_link_Document_Edit_Image_Button.NavigateUrl = "manage_Invoice.aspx?id=" + l_Document_Record_Id + "&mode=edit";
                    else if (l_Document_Type == 3)
                        l_link_Document_Edit_Image_Button.NavigateUrl = "manage_Document.aspx?id=" + l_Document_Record_Id + "&mode=edit";

                    HyperLink l_link_Document_View_Image_Button = (HyperLink)e.Item.FindControl("link_Document_View_Image_Button");
                    if (l_Document_Type == 1)
                        l_link_Document_View_Image_Button.NavigateUrl = "manage_Expense.aspx?id=" + l_Document_Record_Id + "&mode=view";
                    else if (l_Document_Type == 2)
                        l_link_Document_View_Image_Button.NavigateUrl = "manage_Invoice.aspx?id=" + l_Document_Record_Id + "&mode=view";
                    else if (l_Document_Type == 3)
                        l_link_Document_View_Image_Button.NavigateUrl = "manage_Document.aspx?id=" + l_Document_Record_Id + "&mode=view";

                    HyperLink l_link_Document_Download_Image_Button = (HyperLink)e.Item.FindControl("link_Document_Download_Image_Button");
                    if (l_Document_Type == 1)
                        l_link_Document_Download_Image_Button.NavigateUrl = "downloader.aspx?id=" + l_Document_Record_Id + "&type=expense";
                    else if (l_Document_Type == 2)
                        l_link_Document_Download_Image_Button.NavigateUrl = "downloader.aspx?id=" + l_Document_Record_Id + "&type=invoice";
                    else if (l_Document_Type == 3)
                        l_link_Document_Download_Image_Button.NavigateUrl = "downloader.aspx?id=" + l_Document_Record_Id + "&type=document";
                }
            }
        }

        protected string Bind_True_False_Cell_Expression(object p_Boolean_Value)
        {
            string l_True_False_Value_Exp_To_Return = string.Empty;

            if (p_Boolean_Value != null && p_Boolean_Value != DBNull.Value)
            {
                l_True_False_Value_Exp_To_Return = base.Get_Yes_Or_No_Text_Value((bool)p_Boolean_Value);
            }

            return l_True_False_Value_Exp_To_Return;
        }

        protected void button_Add_Document_Connection_Click(object sender, EventArgs e)
        {
            int l_Document_Id = int.Parse(this.hidden_Add_Document_Connection_Document_Record_Id.Value);
            byte l_Document_Type_Id = byte.Parse(this.hidden_Add_Document_Connection_Type.Value);
            long ccStatementTransactionId = long.Parse(this.Request.QueryString["id"]);
            int l_User_Id_Bank_Owner = base.Authenticated_User_ID;

            Business_Logic_Layer_Facade.Instance
                .CreditCardStatementTransactionDocumentConnection_Insert_Credit_Card_Statement_Transaction_Document_Connection(
                    l_User_Id_Bank_Owner,
                    ccStatementTransactionId,
                    l_Document_Type_Id,
                    l_Document_Id,
                    l_User_Id_Bank_Owner,
                    base.Authenticated_Permission_Type);

            this.Bind_Documents_Connections();
            this.Bind_Documents_Suggestions();
        }

        protected void button_Remove_Document_Connection_Click(object sender, EventArgs e)
        {
            int l_Document_Connection_Id_To_Remove = int.Parse(this.hidden_Document_Connection_Id_To_Remove.Value);
            int l_User_Id_Bank_Owner = base.Authenticated_User_ID;

            Business_Logic_Layer_Facade.Instance
                .CreditCardStatementTransactionDocumentConnection_Delete_Credit_Card_Statement_Transaction_Document_Connection(
                    l_User_Id_Bank_Owner,
                    l_Document_Connection_Id_To_Remove,
                    l_User_Id_Bank_Owner,
                    base.Authenticated_Permission_Type);

            this.Bind_Documents_Connections();
            this.Bind_Documents_Suggestions();
        }

        protected void button_Popup_Save_Document_Connection_Details_Click(object sender, EventArgs e)
        {
            return;
            long l_Document_Connection_Id = long.Parse(hidden_Edit_Document_Connection_Id.Value);
            long l_Bank_Account_Transaction_Id = long.Parse(this.Request.QueryString["id"]);
            bool l_Is_Visible_To_Anonymous_Users = this.checkbox_DocumentConnection_Is_Visible_To_Anonymous_Users.Checked;
            bool l_Is_Available_For_Download_For_Anonymous_Users = this.checkbox_DocumentConnection_Is_Available_For_Download_For_Anonymous_Users.Checked;
            bool l_Is_Visible_To_Followers_Users = this.checkbox_DocumentConnection_Is_Visible_To_Followers_Users.Checked;
            bool l_Is_Available_For_Download_For_Followers_Users = this.checkbox_DocumentConnection_Is_Available_For_Download_For_Followers_Users.Checked;

            bool updated_Succesfully = Business_Logic_Layer_Facade.Instance
                .BankAccountTransactionsDocumentConnections_Update_Document_Connection(
                    l_Document_Connection_Id,
                    l_Bank_Account_Transaction_Id,
                    l_Is_Visible_To_Anonymous_Users,
                    l_Is_Available_For_Download_For_Anonymous_Users,
                    l_Is_Visible_To_Followers_Users,
                    l_Is_Available_For_Download_For_Followers_Users,
                    base.Authenticated_User_ID);

            if (updated_Succesfully)
            {
                this.Bind_Documents_Connections();
            }
            else
            {
                // display error message that the document could not be added.
            }
        }
        
    }
}
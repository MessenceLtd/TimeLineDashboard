using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebformsPOCDemo.AppShared;
using TimeLineDashboard.BusinessLogicLayer;
using TimeLineDashboard.Shared.Models;

namespace WebformsPOCDemo
{
    public partial class manage_BankAccountTransaction : BasePage
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
                    Bind_Edit_View();
                }
            }
            else
            {
                this.Bind_ReadOnly_View();
            }

            this.Bind_Connected_Documents();
            this.Bind_Suggested_Documents();

        }

        private void Validate_Permissions()
        {

        }

        private void Bind_Connected_Documents()
        {
            int l_Bank_Account_Transaction_Id = int.Parse(this.Request.QueryString["id"]);

            var l_Connected_Documents = Business_Logic_Layer_Facade.Instance
                .BankAccountTransactionsDocumentConnections_Get_Documents_Connections(
                    l_Bank_Account_Transaction_Id,
                    base.Authenticated_User_ID
                );

            if (l_Connected_Documents.Count > 0)
            {
                this.grid_Connected_Documents.DataSource = l_Connected_Documents;
                this.grid_Connected_Documents.DataBind();

                this.grid_Connected_Documents.Visible = true;
                this.pConnected_Documents_Title.Visible = true;
                this.pConnected_Documents_Empty_Results.Visible = false;
            }
            else
            {
                this.grid_Connected_Documents.Visible = false;
                this.pConnected_Documents_Title.Visible = false;
                this.pConnected_Documents_Empty_Results.Visible = true;
            }
        }

        private void Bind_Suggested_Documents()
        {
            int l_Bank_Account_Transaction_Id = int.Parse(this.Request.QueryString["id"]);

            var l_Suggested_Documents = Business_Logic_Layer_Facade.Instance
                .BankAccountTransactionsDocumentConnections_Get_Document_Connection_Suggestions(
                    l_Bank_Account_Transaction_Id,
                    base.Authenticated_User_ID
                );

            if (l_Suggested_Documents.Count > 0)
            {
                this.grid_Suggested_Documents.DataSource = l_Suggested_Documents;
                this.grid_Suggested_Documents.DataBind();

                this.grid_Suggested_Documents.Visible = true;
                this.pSuggested_Documents_Title.Visible = true;
                this.pSuggested_Documents_Empty_Message.Visible = false;
            }
            else
            {
                this.grid_Suggested_Documents.Visible = false;
                this.pSuggested_Documents_Title.Visible = false;
                this.pSuggested_Documents_Empty_Message.Visible = false;
            }
        }

        private void Bind_ReadOnly_View()
        {
            base.Change_View_Mode_FormControls_Wrappers(true);

            this.button_Edit_BankAccount_Transaction_Details.Visible = true;
            this.button_Update_BankAccount_Transaction_Details.Visible = false;
            this.button_CancelEdit_BankAccount_Transaction_Details.Visible = false;
        }

        private void Bind_Edit_View()
        {
            base.Change_View_Mode_FormControls_Wrappers(false);

            this.button_Edit_BankAccount_Transaction_Details.Visible = false;
            this.button_Update_BankAccount_Transaction_Details.Visible = true;
            this.button_CancelEdit_BankAccount_Transaction_Details.Visible = true;
        }

        private void Bind_Connected_CreditCardStatementInfo(Bank_Account_Transactions p_TransactionDetails)
        {
            if ( p_TransactionDetails.Credit_Card_Statement_Id > 0 )
            {
                // There is a credit card statement for the current bank account transaction info. 
                // Documentation tab should be disabled and special view of the CC Statement will be shown.

                int l_CCStatement_ID = p_TransactionDetails.Credit_Card_Statement_Id;
                this.hidden_Credit_Card_Statement_Id.Value = p_TransactionDetails.Credit_Card_Statement_Id.ToString();

                var ccStatement_Details = Business_Logic_Layer_Facade.Instance
                    .CreditCardStatements_Get_Credit_Card_Statement_Details_By_Credit_Card_Statement_Id(
                        l_CCStatement_ID                    ,
                        base.Authenticated_User_ID          ,
                        base.Authenticated_User_ID          ,
                        base.Authenticated_Permission_Type  );

                if (ccStatement_Details != null)
                {
                    this.panel_Statement_Unconnected.Visible = false;
                    this.panel_Statement_Info.Visible = true;
                    this.phTab_Documents.Visible = false;
                    this.phTab_CreditCardStatement.Visible = true;

                    this.link_Statement_ViewMore.NavigateUrl = "manage_CreditCardStatement.aspx?id=" + ccStatement_Details.Credit_Card_Statement_Id;
                    this.link_Statement_EditDetails.NavigateUrl = "manage_CreditCardStatement.aspx?id=" + ccStatement_Details.Credit_Card_Statement_Id + "&mode=edit";

                    this.label_BankAccount.Text = ccStatement_Details.Bank_Account_Name;
                    this.label_CreditCard.Text = ccStatement_Details.Card_Name;
                    this.label_CCStatement_DateTime.Text = ccStatement_Details.Statement_Date.ToString("dd/MM/yyyy");
                    if (ccStatement_Details.Currency_Id > 0 )
                    {
                        var currencyDetails = Business_Logic_Layer_Facade.Instance.Currencies_Get_By_Id(ccStatement_Details.Currency_Id);
                        this.label_Currency.Text = currencyDetails.Currency_Code + " - " + currencyDetails.Currency_Symbol;
                    }

                    Common_Tools.Set_Number_Text_Value_To_Label(
                        ccStatement_Details.Total_Amount,
                        this.label_Total_Amount);

                    bool l_Download_CCStatement_Visible = false; 

                    if (string.IsNullOrEmpty(ccStatement_Details.Original_File_Name))
                    {
                        this.link_Download_CCStatement.Target = "";
                        this.link_Download_CCStatement.NavigateUrl = "";
                        this.link_Download_CCStatement.Enabled = false;
                        this.link_Download_CCStatement.Text = "N/A";

                        this.panel_Image_Download_CCStatement.FindControl("link_Download_CCStatement").Visible = false;
                        l_Download_CCStatement_Visible = false;
                    }
                    else
                    {
                        this.link_Download_CCStatement.Target = "_blank";
                        this.link_Download_CCStatement.NavigateUrl = "downloader.aspx?id=" + ccStatement_Details.Credit_Card_Statement_Id + "&type=ccstatement";
                        this.link_Download_CCStatement.Enabled = true;
                        this.link_Download_CCStatement.Text = ccStatement_Details.Original_File_Name;

                        this.panel_Image_Download_CCStatement.FindControl("link_Download_CCStatement").Visible = true;
                        l_Download_CCStatement_Visible = true;
                    }

                    this.link_Download_CCStatement2.Target = this.link_Download_CCStatement.Target;
                    this.link_Download_CCStatement2.NavigateUrl = this.link_Download_CCStatement.NavigateUrl;
                    this.link_Download_CCStatement2.Enabled = this.link_Download_CCStatement.Enabled;
                    this.link_Download_CCStatement2.Visible = l_Download_CCStatement_Visible;

                    if (l_Download_CCStatement_Visible)
                    {
                        this.panel_Image_Download_CCStatement.CssClass += " download-link-with-image";
                    }

                    this.label_CCStatement_Is_Visible_To_Anonymous_Users.Text
                        = base.Get_Yes_Or_No_Text_Value(ccStatement_Details.Is_Visible_To_Anonymous_Users);
                    this.label_CCStatement_Is_Available_For_Download_For_Anonymous_Users.Text 
                        = base.Get_Yes_Or_No_Text_Value(ccStatement_Details.Is_Available_For_Download_For_Anonymous_Users);
                    this.label_CCStatement_Is_Visible_To_Followers_Users.Text 
                        = base.Get_Yes_Or_No_Text_Value(ccStatement_Details.Is_Visible_To_Followers_Users);
                    this.label_CCStatement_Is_Available_For_Download_For_Followers_Users.Text 
                        = base.Get_Yes_Or_No_Text_Value(ccStatement_Details.Is_Available_For_Download_For_Followers_Users);

                    this.label_CCStatement_Record_Created_By_User.Text = ccStatement_Details.Record_Created_By_User_Details.FullName_With_Email;
                    this.label_CCStatement_Record_Creation_DateTime_UTC.Text = ccStatement_Details.Record_Creation_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
                    this.label_CCStatement_Record_Last_Updated_By_User.Text = ccStatement_Details.Record_Last_Updated_By_User_Details.FullName_With_Email.ToString();
                    this.label_CCStatement_Record_Last_Updated_DateTime_UTC.Text = ccStatement_Details.Record_Last_Updated_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
                }
                else
                {
                    this.Bind_CreditCardStatement_Disconnected();
                }
            }
            else
            {
                this.Bind_CreditCardStatement_Disconnected();
            }
        }

        private void Bind_CreditCardStatement_Disconnected()
        {
            this.panel_Statement_Unconnected.Visible = true;
            this.panel_Statement_Info.Visible = false;
            this.phTab_Documents.Visible = true;
            this.phTab_CreditCardStatement.Visible = true;

            this.Bind_CreditCardStatement_Connection_Suggession();
        }

        private void Bind_CreditCardStatement_Connection_Suggession()
        {
            int l_Bank_Account_Transaction_Id = int.Parse(this.Request.QueryString["id"]);

            var l_Transaction_Statements_List = Business_Logic_Layer_Facade.Instance
                    .CreditCardStatements_Get_By_Date_Unconnected_Statements(
                        l_Bank_Account_Transaction_Id,
                        base.Authenticated_User_ID );

            if (l_Transaction_Statements_List != null && l_Transaction_Statements_List.Count > 0)
            {
                List<ListItem> statements_Formatted_For_Display = new List<ListItem>();

                this.dropdown_CreditCardStatements.ClearSelection();
                this.dropdown_CreditCardStatements.Items.Clear();

                for (int i=0; i< l_Transaction_Statements_List.Count; i++ )
                {
                    string l_Text =
                        Common_Tools.Get_Number_Formatted(l_Transaction_Statements_List[i].Total_Amount) 
                        + l_Transaction_Statements_List[i].Currency_Symbol
                        + " , " + l_Transaction_Statements_List[i].Statement_Date.ToString("yyyy-MMM-dd") + " | "
                        + l_Transaction_Statements_List[i].Card_Name;

                    this.dropdown_CreditCardStatements.Items.Add(
                        new ListItem(l_Text, l_Transaction_Statements_List[i].Credit_Card_Statement_Id.ToString()));
                }

                this.dropdown_CreditCardStatements.DataBind();
            }
        }

        private void Set_Page_FormControls_Values()
        {
            int Bank_Account_Id = int.Parse(this.Request.QueryString["id"]);
            int user_Id_BankAccount_Owner = base.Authenticated_User_ID;

            Bank_Account_Transactions transactionDetails = Business_Logic_Layer_Facade.Instance.BankAccount_Transactions_Get_Transaction_Details_By_Transaction_Id(
                Bank_Account_Id, user_Id_BankAccount_Owner, user_Id_BankAccount_Owner);

            if (transactionDetails != null)
            {
                Common_Tools.Set_Number_Text_Value_To_TextBox_Label_Text(
                    transactionDetails.Transaction_Account_Balance,
                    this.textbox_Transaction_Account_Balance,
                    this.label_Transaction_Account_Balance);

                Common_Tools.Set_DateTime_To_TextBox_And_Label(
                    transactionDetails.Transaction_Actual_DateTime,
                    this.textbox_Transaction_Actual_DateTime,
                    this.label_Transaction_Actual_DateTime );

                Common_Tools.Set_Number_Text_Value_To_TextBox_Label_Text(
                    transactionDetails.Positive_Amount_Entered,
                    this.textbox_Positive_Amount_Entered,
                    this.label_Positive_Amount_Entered);

                Common_Tools.Set_Number_Text_Value_To_TextBox_Label_Text(
                    transactionDetails.Negative_Amount_Paid,
                    this.textbox_Negative_Amount_Paid,
                    this.label_Negative_Amount_Paid);

                Common_Tools.Set_DateTime_To_TextBox_And_Label(
                    transactionDetails.Transaction_Value_DateTime,
                    this.textbox_Transaction_Value_DateTime,
                    this.label_Transaction_Value_DateTime);

                this.textbox_Reference_Number.Text = transactionDetails.Reference_Number;
                this.label_Reference_Number.Text = transactionDetails.Reference_Number;

                this.textbox_Transaction_Bank_Description.Text = transactionDetails.Transaction_Bank_Description;
                this.label_Transaction_Bank_Description.Text = transactionDetails.Transaction_Bank_Description;

                this.textbox_Transaction_Bank_Inner_Reference_Code.Text = transactionDetails.Transaction_Bank_Inner_Reference_Code;
                this.label_Transaction_Bank_Inner_Reference_Code.Text = transactionDetails.Transaction_Bank_Inner_Reference_Code;

                this.textbox_Transaction_User_Description.Text = transactionDetails.Transaction_User_Description;
                this.label_Transaction_User_Description.Text = transactionDetails.Transaction_User_Description;

                this.textbox_Transaction_User_Comments.Text = transactionDetails.Transaction_User_Comments;
                this.label_Transaction_User_Comments.Text = transactionDetails.Transaction_User_Comments;

                this.checkbox_Is_Visible_To_Anonymous_Users.Checked = transactionDetails.Is_Visible_To_Anonymous_Users;
                this.label_Is_Visible_To_Anonymous_Users.Text 
                    = base.Get_Yes_Or_No_Text_Value(transactionDetails.Is_Visible_To_Anonymous_Users);

                this.checkbox_Is_Visible_To_Followers_Users.Checked = transactionDetails.Is_Visible_To_Followers_Users;
                this.label_Is_Visible_To_Followers_Users.Text 
                    = base.Get_Yes_Or_No_Text_Value(transactionDetails.Is_Visible_To_Followers_Users);

                this.label_Record_Created_By_User.Text = transactionDetails.Record_Created_By_User_Details.FullName_With_Email;
                this.label_Record_Creation_DateTime_UTC.Text = transactionDetails.Record_Creation_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
                this.label_Record_Last_Updated_By_User.Text = transactionDetails.Record_Last_Updated_By_User_Details.FullName_With_Email.ToString();
                this.label_Record_Last_Updated_DateTime_UTC.Text = transactionDetails.Record_Last_Updated_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");

                this.Bind_Connected_CreditCardStatementInfo(transactionDetails);
            }
            else
            {
                throw new Exception("Could not find any details for the transction.");
            }
        }

        protected void button_Update_BankAccount_Transaction_Details_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                bool l_BankAccount_Transaction_Successfully_Updated = false;

                string exception_During_Process = "";
                string exception_During_Process_Extra_Data = "";

                long p_Bank_Account_Transaction_Id = long.Parse(this.Request.QueryString["id"]);

                decimal p_Transaction_Account_Balance = decimal.Parse(textbox_Transaction_Account_Balance.Text);
                
                DateTime p_Transaction_Actual_DateTime = new DateTime();
                if (!string.IsNullOrEmpty(this.textbox_Transaction_Actual_DateTime.Text))
                {
                    bool parsed_Successfully = false;
                    DateTime date_Parsed = new DateTime();
                    try
                    {

                        parsed_Successfully = DateTime.TryParseExact(this.textbox_Transaction_Actual_DateTime.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out date_Parsed);
                    }
                    catch
                    {
                        parsed_Successfully = false;
                    }

                    if (parsed_Successfully)
                    {
                        p_Transaction_Actual_DateTime = date_Parsed;
                    }
                    else
                    {
                        throw new Exception("Invalid transaction date!");
                    }
                }
                else
                {
                    throw new Exception("Invalid transaction date!");
                }

                decimal p_Positive_Amount_Entered = decimal.Parse(textbox_Positive_Amount_Entered.Text);
                decimal p_Negative_Amount_Paid = decimal.Parse(textbox_Negative_Amount_Paid.Text);

                DateTime? p_Transaction_Value_DateTime = new DateTime?();
                if (!string.IsNullOrEmpty(this.textbox_Transaction_Value_DateTime.Text))
                {
                    bool parsed_Successfully = false;
                    DateTime date_Parsed = new DateTime();
                    try
                    {

                        parsed_Successfully = DateTime.TryParseExact(this.textbox_Transaction_Value_DateTime.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out date_Parsed);
                    }
                    catch
                    {
                        parsed_Successfully = false;
                    }

                    if (parsed_Successfully)
                    {
                        p_Transaction_Value_DateTime = date_Parsed;
                    }
                }

                string p_Reference_Number = this.textbox_Reference_Number.Text;
                string p_Transaction_Bank_Description = this.textbox_Transaction_Bank_Description.Text;
                string p_Transaction_Bank_Inner_Reference_Code = this.textbox_Transaction_Bank_Inner_Reference_Code.Text;
                string p_Transaction_User_Description = this.textbox_Transaction_User_Description.Text;
                string p_Transaction_User_Comments = this.textbox_Transaction_User_Comments.Text;
                
                bool p_Is_Visible_To_Anonymous_Users = this.checkbox_Is_Visible_To_Anonymous_Users.Checked;
                bool p_Is_Visible_To_Followers_Users = this.checkbox_Is_Visible_To_Followers_Users.Checked;

                int p_Updating_User_Id = base.Authenticated_User_ID;

                try
                {
                    l_BankAccount_Transaction_Successfully_Updated = Business_Logic_Layer_Facade.Instance.BankAccount_Transactions_Update_Transaction_Details(
                        p_Bank_Account_Transaction_Id, 
                        p_Transaction_Account_Balance,
                        p_Transaction_Actual_DateTime,
                        p_Positive_Amount_Entered,
                        p_Negative_Amount_Paid,
                        p_Transaction_Value_DateTime,
                        p_Reference_Number,
                        p_Transaction_Bank_Description,
                        p_Transaction_Bank_Inner_Reference_Code,
                        p_Transaction_User_Description,
                        p_Transaction_User_Comments, 
                        p_Is_Visible_To_Anonymous_Users,
                        p_Is_Visible_To_Followers_Users,
                        p_Updating_User_Id
                        );
                }
                catch (Exception exc)
                {
                    l_BankAccount_Transaction_Successfully_Updated = false;
                    exception_During_Process = exc.Message;
                    if (exc.InnerException != null)
                    {
                        exception_During_Process_Extra_Data = exc.InnerException.Message;
                    }
                }

                if (l_BankAccount_Transaction_Successfully_Updated)
                {
                    // The client details were successfully updated. 
                    // redirect the user to view read only mode
                    Response.Redirect("manage_BankAccountTransaction.aspx?id=" + Request.QueryString["id"] + "&mode=view");
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

        protected void button_Edit_BankAccount_Transaction_Details_Click(object sender, EventArgs e)
        {
            this.Bind_Edit_View();
        }

        protected void button_CancelEdit_BankAccount_Transaction_Details_Click(object sender, EventArgs e)
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
            long p_Bank_Account_Transaction_Id = long.Parse(this.Request.QueryString["id"]);
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
                .BankAccountTransactionsDocumentConnections_Search_For_Documents_To_Connect(
                    p_Bank_Account_Transaction_Id,
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
                        l_link_Document_Download_Image_Button.NavigateUrl = "downloader.aspx?id=" + l_Document_Record_Id +"&type=document";
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

        protected void button_Add_Document_Connection_Click(object sender, EventArgs e)
        {
            long l_BankAccount_Transaction_Id = long.Parse(this.Request.QueryString["id"]);
            int l_Document_Record_Id = int.Parse(this.hidden_Add_Document_Connection_Document_Record_Id.Value);
            byte l_Connection_Type = byte.Parse(this.hidden_Add_Document_Connection_Type.Value);

            long new_Document_Connection_Id = Business_Logic_Layer_Facade.Instance
                .BankAccountTransactionsDocumentConnections_Insert_Document_Connection(
                    l_BankAccount_Transaction_Id,
                    l_Connection_Type,
                    l_Document_Record_Id,
                    false,
                    false,
                    false,
                    false,
                    base.Authenticated_User_ID);

            if (new_Document_Connection_Id > 0)
            {
                this.Bind_Suggested_Documents();
                this.Bind_Connected_Documents();
            }
            else
            {
                // display error message that the document could not be added.
            }

        }

        protected void button_Delete_Document_Connection_Click(object sender, EventArgs e)
        {
            int l_Document_Connection_Id = int.Parse(this.hidden_Delete_Document_Connection_Id.Value);
            long l_BankAccount_Transaction_Id = long.Parse(this.Request.QueryString["id"]);

            bool deleted_Succesfully = Business_Logic_Layer_Facade.Instance
                .BankAccountTransactionsDocumentConnections_Delete_Document_Connection(
                    l_Document_Connection_Id,
                    l_BankAccount_Transaction_Id,
                    base.Authenticated_User_ID);

            if ( deleted_Succesfully )
            {
                this.Bind_Suggested_Documents();
                this.Bind_Connected_Documents();
            }
            else
            {
                // display error message that the document could not be added.
            }
        }

        protected void button_Popup_Save_Document_Connection_Details_Click(object sender, EventArgs e)
        {
            long l_Document_Connection_Id = long.Parse(hidden_Edit_Document_Connection_Id.Value);
            long l_Bank_Account_Transaction_Id = long.Parse(this.Request.QueryString["id"]);
            bool l_Is_Visible_To_Anonymous_Users = this.checkbox_DocumentConnection_Is_Visible_To_Anonymous_Users.Checked;
            bool l_Is_Available_For_Download_For_Anonymous_Users = this.checkbox_DocumentConnection_Is_Available_For_Download_For_Anonymous_Users.Checked;
            bool l_Is_Visible_To_Followers_Users = this.checkbox_DocumentConnection_Is_Visible_To_Followers_Users.Checked;
            bool l_Is_Available_For_Download_For_Followers_Users = this.checkbox_DocumentConnection_Is_Available_For_Download_For_Followers_Users.Checked;

            bool updated_Succesfully = Business_Logic_Layer_Facade.Instance
                .BankAccountTransactionsDocumentConnections_Update_Document_Connection(
                    l_Document_Connection_Id                        ,
                    l_Bank_Account_Transaction_Id                   ,
                    l_Is_Visible_To_Anonymous_Users                 ,
                    l_Is_Available_For_Download_For_Anonymous_Users ,
                    l_Is_Visible_To_Followers_Users                 ,
                    l_Is_Available_For_Download_For_Followers_Users ,
                    base.Authenticated_User_ID);

            if (updated_Succesfully)
            {
                this.Bind_Connected_Documents();
            }
            else
            {
                // display error message that the document could not be added.
            }
        }

        protected void button_Save_Statement_Connection_Click(object sender, EventArgs e)
        {
            long l_Bank_Account_Transction_Id = long.Parse(this.Request.QueryString["id"]);
            int l_Credit_Card_Statement_Id = int.Parse(this.dropdown_CreditCardStatements.SelectedValue);

            bool l_Updated_Successfully = Business_Logic_Layer_Facade.Instance
                .BankAccount_Transactions_Update_Connect_With_Statement(
                    l_Bank_Account_Transction_Id, l_Credit_Card_Statement_Id, base.Authenticated_User_ID);

            if (l_Updated_Successfully)
            {
                Bank_Account_Transactions transactionDetails = Business_Logic_Layer_Facade.Instance
                    .BankAccount_Transactions_Get_Transaction_Details_By_Transaction_Id(
                        l_Bank_Account_Transction_Id, 
                        base.Authenticated_User_ID, 
                        base.Authenticated_User_ID);

                this.label_Record_Last_Updated_By_User.Text = transactionDetails.Record_Last_Updated_By_User_Details.FullName_With_Email.ToString();
                this.label_Record_Last_Updated_DateTime_UTC.Text = transactionDetails.Record_Last_Updated_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");

                this.Bind_Connected_CreditCardStatementInfo(transactionDetails);
            }

            this.liTab_CreditCardStatement.Attributes["class"] = "nav-item active";
            this.tab_Button_CreditCardStatement.CssClass = "nav-link active";
        }

        protected void button_Delete_Statement_Connection_Click(object sender, EventArgs e)
        {
            long l_Bank_Account_Transction_Id = long.Parse(this.Request.QueryString["id"]);
            int l_Credit_Card_Statement_Id = int.Parse(this.hidden_Credit_Card_Statement_Id.Value);

            bool l_Updated_Successfully = Business_Logic_Layer_Facade.Instance
                .BankAccount_Transactions_Update_Disconnect_Statement(
                    l_Bank_Account_Transction_Id, l_Credit_Card_Statement_Id, base.Authenticated_User_ID);

            if (l_Updated_Successfully)
            {
                Bank_Account_Transactions transactionDetails = Business_Logic_Layer_Facade.Instance
                    .BankAccount_Transactions_Get_Transaction_Details_By_Transaction_Id(
                        l_Bank_Account_Transction_Id,
                        base.Authenticated_User_ID,
                        base.Authenticated_User_ID);

                this.label_Record_Last_Updated_By_User.Text = transactionDetails.Record_Last_Updated_By_User_Details.FullName_With_Email.ToString();
                this.label_Record_Last_Updated_DateTime_UTC.Text = transactionDetails.Record_Last_Updated_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");

                this.Bind_Connected_CreditCardStatementInfo(transactionDetails);
            }

            this.liTab_CreditCardStatement.Attributes["class"] = "nav-item active";
            this.tab_Button_CreditCardStatement.CssClass = "nav-link active";
        }
    }
}
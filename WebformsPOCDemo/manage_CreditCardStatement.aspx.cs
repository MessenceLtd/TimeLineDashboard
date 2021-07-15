using System;
using System.Collections.Generic;
using System.Data;
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
    public partial class manage_CreditCardStatement : BasePage
    {
        protected bool l_Is_Create_Or_Edit_View = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.Bind_Default_View();
            }

            if (this.ViewState["Is_Create_Or_Edit_View"] != null)
            {
                l_Is_Create_Or_Edit_View = (bool)this.ViewState["Is_Create_Or_Edit_View"];
            }
        }

        private void Bind_Default_View()
        {
            Common_Tools.Initialize_DropDown_Currencies(this.dropdown_Currency);
            this.Bind_Bank_Accounts();

            // ToDo -- Check permissions -- if the user is able to view the client / edit the client
            this.Validate_Permissions();

            Common_Tools.Initialize_DropDown_Currencies(this.dropdown_Currency);

            this.Credit_Card_Transactions_Results();

            if (!base.Is_Create_New_Record_Request())
            {
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
            else
            {
                // Request mode is Create new 
                this.Bind_Create_View();
            }
        }

        private void Bind_Bank_Accounts()
        {
            var bank_Accounts_List = Business_Logic_Layer_Facade.Instance.BankAccounts_Get_Search(
                base.Authenticated_User_ID);

            if (bank_Accounts_List.Count > 0)
            {
                this.dropdown_BankAccounts.DataSource = bank_Accounts_List;
                this.dropdown_BankAccounts.DataTextField = "Account_Name";
                this.dropdown_BankAccounts.DataValueField = "Bank_Account_Id";
                this.dropdown_BankAccounts.DataBind();

                this.dropdown_BankAccounts.SelectedValue = bank_Accounts_List[0].Bank_Account_Id.ToString();
                if (bank_Accounts_List[0].Currency_Id > 0)
                {
                    this.dropdown_Currency.SelectedValue = bank_Accounts_List[0].Currency_Id.ToString();
                }

                this.Bind_Credit_Cards_List();
            }
            else
            {
                // ToDo -- Redirect user to bank account creation with error message.
                this.Response.Redirect("Add_BankAccount.aspx");
            }
        }

        private void Bind_Credit_Cards_List()
        {
            int bank_Account_Id = int.Parse(this.dropdown_BankAccounts.SelectedValue);

            var credit_Cards_List = Business_Logic_Layer_Facade.Instance.CreditCards_Get_Credit_Cards_By_Bank_Account_Id(
                base.Authenticated_User_ID,
                bank_Account_Id,
                base.Authenticated_User_ID,
                base.Authenticated_Permission_Type);

            if (credit_Cards_List.Count > 0)
            {
                this.dropdown_CreditCard.DataSource = credit_Cards_List;
                this.dropdown_CreditCard.DataTextField = "Card_Name";
                this.dropdown_CreditCard.DataValueField = "Credit_Card_Id";
                this.dropdown_CreditCard.DataBind();

                this.dropdown_CreditCard.SelectedValue = credit_Cards_List[0].Credit_Card_Id.ToString();
            }
            else
            {
                // ToDo -- Redirect user to bank account creation with error message.
                this.Response.Redirect("manage_CreditCard.aspx?new");
            }
        }

        private void Set_Page_FormControls_Values()
        {
            int ccStatement_Id = int.Parse(this.Request.QueryString["id"]);

            var ccStatement_Details =  Business_Logic_Layer_Facade.Instance.CreditCardStatements_Get_Credit_Card_Statement_Details_By_Credit_Card_Statement_Id(
                ccStatement_Id,
                base.Authenticated_User_ID,
                base.Authenticated_User_ID,
                base.Authenticated_Permission_Type);

            if (this.dropdown_BankAccounts.SelectedValue != ccStatement_Details.Bank_Account_Id.ToString())
            {
                this.Bind_Credit_Cards_List();
            }

            Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                    ccStatement_Details.Bank_Account_Id.ToString(),
                    this.dropdown_BankAccounts,
                    this.label_BankAccount);

            Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                ccStatement_Details.Credit_Card_Id.ToString(),
                this.dropdown_CreditCard,
                this.label_CreditCard);

            this.textbox_CCStatement_DateTime.Text = ccStatement_Details.Statement_Date.ToString("dd/MM/yyyy");
            this.label_CCStatement_DateTime.Text = ccStatement_Details.Statement_Date.ToString("dd/MM/yyyy");

            Common_Tools.Set_ComboBox_Selected_Value_And_Label_Text(
                ccStatement_Details.Currency_Id.ToString(),
                this.dropdown_Currency,
                this.label_Currency);

            Common_Tools.Set_Number_Text_Value_To_TextBox_Label_Text(
                ccStatement_Details.Total_Amount,
                this.textbox_Total_Amount,
                this.label_Total_Amount);

            bool l_Download_CCStatement_Visible = false;

            if (string.IsNullOrEmpty(ccStatement_Details.Original_File_Name))
            {
                this.link_Download_CCStatement.Target = "";
                this.link_Download_CCStatement.NavigateUrl = "";
                this.link_Download_CCStatement.Enabled = false;
                this.link_Download_CCStatement.Text = "N/A";

                // this.link_Download_CCStatement.Visible = false; O.o IS NOT WORKING ?!?!?!?!?!?
                this.panel_Image_Download_CCStatement.FindControl("link_Download_CCStatement").Visible = false;
                l_Download_CCStatement_Visible = false;
            }
            else
            {
                this.link_Download_CCStatement.Target = "_blank";
                this.link_Download_CCStatement.NavigateUrl = "downloader.aspx?id=" + ccStatement_Details.Credit_Card_Statement_Id + "&type=ccstatement";
                this.link_Download_CCStatement.Enabled = true;
                this.link_Download_CCStatement.Text = ccStatement_Details.Original_File_Name;

                // this.link_Download_CCStatement.Visible = true; O.o IS NOT WORKING ?!?!?!?!?!?
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

            this.checkbox_Is_Visible_To_Anonymous_Users.Checked = ccStatement_Details.Is_Visible_To_Anonymous_Users;
            this.label_Is_Visible_To_Anonymous_Users.Text 
                = base.Get_Yes_Or_No_Text_Value(ccStatement_Details.Is_Visible_To_Anonymous_Users);

            this.checkbox_Is_Available_For_Download_For_Anonymous_Users.Checked = ccStatement_Details.Is_Available_For_Download_For_Anonymous_Users;
            this.label_Is_Available_For_Download_For_Anonymous_Users.Text 
                = base.Get_Yes_Or_No_Text_Value(ccStatement_Details.Is_Available_For_Download_For_Anonymous_Users);

            this.checkbox_Is_Visible_To_Followers_Users.Checked = ccStatement_Details.Is_Visible_To_Followers_Users;
            this.label_Is_Visible_To_Followers_Users.Text 
                = base.Get_Yes_Or_No_Text_Value(ccStatement_Details.Is_Visible_To_Followers_Users);

            this.checkbox_Is_Available_For_Download_For_Followers_Users.Checked = ccStatement_Details.Is_Available_For_Download_For_Followers_Users;
            this.label_Is_Available_For_Download_For_Followers_Users.Text 
                = base.Get_Yes_Or_No_Text_Value(ccStatement_Details.Is_Available_For_Download_For_Followers_Users);

            this.label_Record_Created_By_User.Text = ccStatement_Details.Record_Created_By_User_Details.FullName_With_Email;
            this.label_Record_Creation_DateTime_UTC.Text = ccStatement_Details.Record_Creation_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
            this.label_Record_Last_Updated_By_User.Text = ccStatement_Details.Record_Last_Updated_By_User_Details.FullName_With_Email.ToString();
            this.label_Record_Last_Updated_DateTime_UTC.Text = ccStatement_Details.Record_Last_Updated_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");

            this.Bind_Connected_BankAccountTransactionInfo(ccStatement_Details);
        }

        private void Bind_Connected_BankAccountTransactionInfo(Credit_Cards_Statement p_Statement_Details)
        {
            if (p_Statement_Details.Bank_Account_Transaction_Id_Connection > 0)
            {
                // There is a bank account transaction for the current credit card statement info. 

                Bank_Account_Transactions transactionDetails = Business_Logic_Layer_Facade
                    .Instance.BankAccount_Transactions_Get_Transaction_Details_By_Transaction_Id(
                        p_Statement_Details.Bank_Account_Transaction_Id_Connection, 
                        base.Authenticated_User_ID,
                        base.Authenticated_User_ID);

                if (transactionDetails != null)
                {
                    this.panel_BankAccountTransaction_Unconnected.Visible = false;
                    this.panel_BankAccountTransaction_Info.Visible = true;

                    this.hidden_Bank_Account_Transaction_Id.Value = transactionDetails.Bank_Account_Transaction_Id.ToString();

                    this.link_BankAccountTransaction_ViewMore.NavigateUrl = "manage_BankAccountTransaction.aspx?id=" + transactionDetails.Bank_Account_Transaction_Id;
                    this.link_BankAccountTransaction_EditDetails.NavigateUrl = "manage_BankAccountTransaction.aspx?id=" + transactionDetails.Bank_Account_Transaction_Id + "&mode=edit";

                    Common_Tools.Set_Number_Text_Value_To_Label(
                        transactionDetails.Transaction_Account_Balance,
                        this.label_BankAccountTransaction_Transaction_Account_Balance);

                    Common_Tools.Set_DateTime_To_Label(
                        transactionDetails.Transaction_Actual_DateTime,
                        this.label_BankAccountTransaction_Transaction_Actual_DateTime);

                    Common_Tools.Set_Number_Text_Value_To_Label(
                        transactionDetails.Positive_Amount_Entered,
                        this.label_BankAccountTransaction_Positive_Amount_Entered);

                    Common_Tools.Set_Number_Text_Value_To_Label(
                        transactionDetails.Negative_Amount_Paid,
                        this.label_BankAccountTransaction_Negative_Amount_Paid);

                    Common_Tools.Set_DateTime_To_Label(
                        transactionDetails.Transaction_Value_DateTime,
                        this.label_BankAccountTransaction_Transaction_Value_DateTime);

                    this.label_BankAccountTransaction_Reference_Number.Text = transactionDetails.Reference_Number;
                    this.label_BankAccountTransaction_Transaction_Bank_Description.Text = transactionDetails.Transaction_Bank_Description;
                    this.label_BankAccountTransaction_Transaction_Bank_Inner_Reference_Code.Text = transactionDetails.Transaction_Bank_Inner_Reference_Code;
                    this.label_BankAccountTransaction_Transaction_User_Description.Text = transactionDetails.Transaction_User_Description;
                    this.label_BankAccountTransaction_Transaction_User_Comments.Text = transactionDetails.Transaction_User_Comments;

                    this.label_BankAccountTransaction_Is_Visible_To_Anonymous_Users.Text = base.Get_Yes_Or_No_Text_Value(transactionDetails.Is_Visible_To_Anonymous_Users);
                    this.label_BankAccountTransaction_Is_Visible_To_Followers_Users.Text = base.Get_Yes_Or_No_Text_Value(transactionDetails.Is_Visible_To_Followers_Users);

                    this.label_BankAccountTransaction_Record_Created_By_User.Text = transactionDetails.Record_Created_By_User_Details.FullName_With_Email;
                    this.label_BankAccountTransaction_Record_Creation_DateTime_UTC.Text = transactionDetails.Record_Creation_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
                    this.label_BankAccountTransaction_Record_Last_Updated_By_User.Text = transactionDetails.Record_Last_Updated_By_User_Details.FullName_With_Email.ToString();
                    this.label_BankAccountTransaction_Record_Last_Updated_DateTime_UTC.Text = transactionDetails.Record_Last_Updated_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");
                }
                else
                {
                    this.Bind_BankAccountTransaction_Disconnected();
                }
            }
            else
            {
                this.Bind_BankAccountTransaction_Disconnected();
            }
        }

        private void Bind_BankAccountTransaction_Disconnected()
        {
            this.panel_BankAccountTransaction_Unconnected.Visible = true;
            this.panel_BankAccountTransaction_Info.Visible = false;

            this.Bind_BankAccountTransactions_Connections_Suggession();
        }

        private void Bind_BankAccountTransactions_Connections_Suggession()
        {
            int l_Credit_Card_Statement_Id = int.Parse(this.Request.QueryString["id"]);

            var l_Bank_Account_Transactions_List = Business_Logic_Layer_Facade.Instance
                    .BankAccount_Transactions_Get_By_Date_Unconnected_Transactions_To_Credit_Card_Statements(
                        l_Credit_Card_Statement_Id,
                        base.Authenticated_User_ID);

            if (l_Bank_Account_Transactions_List != null && l_Bank_Account_Transactions_List.Count > 0)
            {
                this.dropdown_BankAccountTransaction.ClearSelection();
                this.dropdown_BankAccountTransaction.Items.Clear();

                for (int i = 0; i < l_Bank_Account_Transactions_List.Count; i++)
                {
                    string l_Text = string.Empty;

                    if (l_Bank_Account_Transactions_List[i].Negative_Amount_Paid > 0)
                    {
                        l_Text += "-" +
                            Common_Tools.Get_Number_Formatted(l_Bank_Account_Transactions_List[i].Negative_Amount_Paid);
                    }
                    else if (l_Bank_Account_Transactions_List[i].Positive_Amount_Entered > 0)
                    {
                        l_Text += "+" +
                            Common_Tools.Get_Number_Formatted(l_Bank_Account_Transactions_List[i].Positive_Amount_Entered);
                    }

                    l_Text += " , " + l_Bank_Account_Transactions_List[i].Transaction_Actual_DateTime.ToString("yyyy-MMM-dd")
                        + " | " + l_Bank_Account_Transactions_List[i].Transaction_Bank_Description;
                    
                    this.dropdown_BankAccountTransaction.Items.Add(
                        new ListItem(l_Text, l_Bank_Account_Transactions_List[i].Bank_Account_Transaction_Id.ToString()));
                }

                this.dropdown_BankAccountTransaction.DataBind();
            }
        }

        private void Credit_Card_Transactions_Results()
        {
            if (!base.Is_Create_New_Record_Request())
            {
                int statementId = int.Parse(this.Request.QueryString["id"]);

                var list_Bank_Account_Transactions_DB_Response_Paged = Business_Logic_Layer_Facade.Instance.
                    CreditCardStatementTransactions_Get_Credit_Cards_Transactions_For_UI(
                    statementId, 
                    base.Authenticated_User_ID,
                    base.Authenticated_User_ID,
                    base.Authenticated_Permission_Type);

                this.ViewState["Credit_Card_Transactions_Response"] = list_Bank_Account_Transactions_DB_Response_Paged;

                this.repeater.DataSource = list_Bank_Account_Transactions_DB_Response_Paged.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI;
                this.repeater.DataBind();
            }
            else
            {
                var list_Bank_Account_Transactions_DB_Response_Paged = new Credit_Card_Transactions_Response_For_UI();
                list_Bank_Account_Transactions_DB_Response_Paged.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI 
                    = new List<Credit_Card_Transactions_To_DB_Sync_From_UI>();

                this.ViewState["Credit_Card_Transactions_Response"] = list_Bank_Account_Transactions_DB_Response_Paged;

                this.repeater.DataSource = list_Bank_Account_Transactions_DB_Response_Paged.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI;
                this.repeater.DataBind();

                this.Create_New_Transaction_In_The_Begining();

                // Set the first row in edit mode 
                this.ClientScript.RegisterStartupScript(this.GetType(), "StartEditFirstRowOnCreateView", "StartEditFirstRowOnCreateView()", true);
            }
        }

        private void Bind_Create_View()
        {
            this.panel_Tabs.Visible = false;

            this.l_Is_Create_Or_Edit_View = true;
            this.ViewState["Is_Create_Or_Edit_View"] = true;

            base.Change_View_Mode_FormControls_Wrappers(false);

            this.p_Edit_Statement_File_Download.Visible = false;
            this.p_Edit_Statement_File.Visible = true;

            this.button_CancelEdit_CreditCardStatement_Details.Visible = false;
            this.button_Update_CreditCardStatement_Details.Visible = false;
            this.button_Edit_CreditCardStatement_Details.Visible = false;
            this.button_Create_CreditCardStatement_Details.Visible = true;

            this.button_CancelEdit_CreditCardStatement_Details_Top.Visible = false;
            this.button_Update_CreditCardStatement_Details_Top.Visible = false;
            this.button_Edit_CreditCardStatement_Details_Top.Visible = false;
            //this.button_Create_CreditCardStatement_Details.Visible = true;

            this.panel_Last_Updates_Info.Visible = false;

            this.panel_Add_New_CCStatement_Transaction_In_The_Begining.Visible = true;
            this.panel_Add_New_CCStatement_Transaction_In_The_End.Visible = true;

            this.panel_Top_Buttons.Visible = false;
        }

        private void Bind_ReadOnly_View()
        {
            this.panel_Tabs.Visible = true;

            this.l_Is_Create_Or_Edit_View = false;
            this.ViewState["Is_Create_Or_Edit_View"] = false;

            base.Change_View_Mode_FormControls_Wrappers(true);

            this.p_Edit_Statement_File_Download.Visible = true;
            this.p_Edit_Statement_File.Visible = false;

            this.button_Edit_CreditCardStatement_Details.Visible = true;
            this.button_Update_CreditCardStatement_Details.Visible = false;
            this.button_CancelEdit_CreditCardStatement_Details.Visible = false;
            this.button_Create_CreditCardStatement_Details.Visible = false;

            this.button_Edit_CreditCardStatement_Details_Top.Visible = true;
            this.button_Update_CreditCardStatement_Details_Top.Visible = false;
            this.button_CancelEdit_CreditCardStatement_Details_Top.Visible = false;

            this.panel_Last_Updates_Info.Visible = true;

            this.panel_Add_New_CCStatement_Transaction_In_The_Begining.Visible = false;
            this.panel_Add_New_CCStatement_Transaction_In_The_End.Visible = false;
        }

        private void Bind_Edit_View()
        {
            this.panel_Tabs.Visible = true;

            this.l_Is_Create_Or_Edit_View = true;
            this.ViewState["Is_Create_Or_Edit_View"] = true;

            this.p_Edit_Statement_File_Download.Visible = true;
            this.p_Edit_Statement_File.Visible = true;

            base.Change_View_Mode_FormControls_Wrappers(false);

            this.button_Edit_CreditCardStatement_Details.Visible = false;
            this.button_Update_CreditCardStatement_Details.Visible = true;
            this.button_CancelEdit_CreditCardStatement_Details.Visible = true;
            this.button_Create_CreditCardStatement_Details.Visible = false;

            this.button_Edit_CreditCardStatement_Details_Top.Visible = false;
            this.button_Update_CreditCardStatement_Details_Top.Visible = true;
            this.button_CancelEdit_CreditCardStatement_Details_Top.Visible = true;

            this.panel_Last_Updates_Info.Visible = true;

            this.panel_Add_New_CCStatement_Transaction_In_The_Begining.Visible = true;
            this.panel_Add_New_CCStatement_Transaction_In_The_End.Visible = true;
        }

        private void Validate_Permissions()
        {
            // ToDo .. 
        }

        protected void textbox_CCStatement_DateTime_TextChanged(object sender, EventArgs e)
        {
            // ToDo
        }

        protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Common_Tools.Initialize_DropDown_Currencies((DropDownList)e.Item.FindControl("dropdown_Transaction_Amount_Currency"));
                byte? currency_Id = ((Credit_Card_Transactions_To_DB_Sync_From_UI)e.Item.DataItem).Transaction_Amount_Currency_Id;

                if (currency_Id.HasValue)
                {
                    ((DropDownList)e.Item.FindControl("dropdown_Transaction_Amount_Currency")).SelectedValue
                        = currency_Id.Value.ToString();

                    ((DropDownList)e.Item.FindControl("dropdown_Transaction_Amount_Currency")).Attributes["LastEditedValue"] = currency_Id.Value.ToString();
                }

                Label label_Transaction_Amount = ((Label)e.Item.FindControl("label_Transaction_Amount"));
                if (((Credit_Card_Transactions_To_DB_Sync_From_UI)e.Item.DataItem).Transaction_Amount.HasValue)
                {
                    label_Transaction_Amount.Text
                        = ((Credit_Card_Transactions_To_DB_Sync_From_UI)e.Item.DataItem).Transaction_Amount.Value.ToString("#,#.##");

                    if (currency_Id.HasValue)
                    {
                        var currency_Details = Business_Logic_Layer_Facade.Instance.Currencies_Get_By_Id(currency_Id.Value);
                        label_Transaction_Amount.Text += currency_Details.Currency_Symbol;
                    }
                }

                label_Transaction_Amount.Attributes["LastEditedValue"] = label_Transaction_Amount.Text;


                bool pendingChanges = ((Credit_Card_Transactions_To_DB_Sync_From_UI)e.Item.DataItem).Has_Pending_Changes;
                bool IsNewRecord = ((Credit_Card_Transactions_To_DB_Sync_From_UI)e.Item.DataItem).Is_New_Record;
                bool IsDeleted = ((Credit_Card_Transactions_To_DB_Sync_From_UI)e.Item.DataItem).Is_Deleted;
                //bool HasError = (bool)((DataRowView)e.Item.DataItem)["Has_Error"];

                Panel panel_Bank_Account_Transaction_Id = (Panel)e.Item.FindControl("panel_Bank_Account_Transaction_Id");

                if (pendingChanges)
                {
                    //panel_Bank_Account_Transaction_Id.CssClass = "tr alert-warning";
                }

                if (IsNewRecord)
                {
                    panel_Bank_Account_Transaction_Id.CssClass = "tr NewRecord";
                }

                if (IsDeleted)
                {
                    panel_Bank_Account_Transaction_Id.CssClass = "Deleted";
                }

                //if (HasError)
                //{
                //    panel_Bank_Account_Transaction_Id.CssClass = "tr alert-danger";
                //}
            }
        }

        private void Sync_Repeater_ViewState()
        {
            var credit_Card_Transactions = ((Credit_Card_Transactions_Response_For_UI)this.ViewState["Credit_Card_Transactions_Response"]);

            for (int i = 0; i < this.repeater.Items.Count; i++)
            {
                var transaction_Date_Parsed = Common_Tools.Try_Parse_DateTime_By_Current_Culture(((TextBox)this.repeater.Items[i].FindControl("txt_Transaction_Date")).Text);
                if (transaction_Date_Parsed.HasValue)
                    credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI[i].Transaction_Date = transaction_Date_Parsed.Value;
                else
                    credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI[i].Transaction_Date = null;

                credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI[i].Business_Name
                    = ((TextBox)this.repeater.Items[i].FindControl("txt_Business_Name")).Text;

                string transaction_Amount = ((TextBox)this.repeater.Items[i].FindControl("txt_Transaction_Amount")).Text;
                decimal parsed_Transaction_Amount = 0;
                if (!string.IsNullOrEmpty(transaction_Amount) && decimal.TryParse(transaction_Amount, out parsed_Transaction_Amount))
                    credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI[i].Transaction_Amount = parsed_Transaction_Amount;
                else
                    credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI[i].Transaction_Amount = null;

                string transaction_Amount_Currency_Id = ((DropDownList)this.repeater.Items[i].FindControl("dropdown_Transaction_Amount_Currency")).SelectedValue;
                if (!string.IsNullOrEmpty(transaction_Amount_Currency_Id))
                {
                    credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI[i].Transaction_Amount_Currency_Id = byte.Parse(transaction_Amount_Currency_Id);
                    var currency_Details = Business_Logic_Layer_Facade.Instance.Currencies_Get_By_Id(byte.Parse(transaction_Amount_Currency_Id));
                    credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI[i].Transaction_Amount_Currency_Name = currency_Details.Currency_Code + " - " + currency_Details.Currency_Symbol;
                }
                else
                {
                    credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI[i].Transaction_Amount_Currency_Id = null;
                    credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI[i].Transaction_Amount_Currency_Name = string.Empty;
                }

                string transaction_Transaction_Actual_Payment_Amount = ((TextBox)this.repeater.Items[i].FindControl("txt_Transaction_Actual_Payment_Amount")).Text;
                decimal parsed_Transaction_Actual_Payment_Amount = 0;
                if (!string.IsNullOrEmpty(transaction_Transaction_Actual_Payment_Amount) 
                    && decimal.TryParse(transaction_Transaction_Actual_Payment_Amount, out parsed_Transaction_Actual_Payment_Amount))
                    credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI[i].Transaction_Actual_Payment_Amount = parsed_Transaction_Actual_Payment_Amount;
                else
                    credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI[i].Transaction_Actual_Payment_Amount = null;

                credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI[i].Description
                    = ((TextBox)this.repeater.Items[i].FindControl("txt_Description")).Text;

                if (bool.Parse(((HiddenField)this.repeater.Items[i].FindControl("hidden_PendingChanges")).Value))
                {
                    credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI[i].Has_Pending_Changes = true;
                }

                if (bool.Parse(((HiddenField)this.repeater.Items[i].FindControl("hidden_IsNewRecord")).Value))
                {
                    credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI[i].Is_New_Record = true;
                }

                if (bool.Parse(((HiddenField)this.repeater.Items[i].FindControl("hidden_IsDeleted")).Value))
                {
                    credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI[i].Is_Deleted = true;
                }
            }
        }

        protected void button_Add_New_Transaction_After_Transaction_Id_Click(object sender, EventArgs e)
        {
            int transaction_Id_To_Search_Index = int.Parse(this.hidden_New_Credit_Card_Transaction_After_Transaction_ID.Value);
            Create_New_Transaction(transaction_Id_To_Search_Index);
        }

        protected void button_Add_New_Credit_Card_Transactions_Click(object sender, EventArgs e)
        {
            if (((Button)sender).ID.EndsWith("In_The_Begining"))
            { 
                this.Create_New_Transaction_In_The_Begining();
            }
            else
            {
                if (((Button)sender).ID.EndsWith("In_The_End"))
                {
                    this.Create_New_Transaction_In_The_End();
                }
            }
        }

        private void Create_New_Transaction_In_The_Begining()
        {
            this.Create_New_Transaction(null);
        }

        private void Create_New_Transaction_In_The_End()
        {
            this.Create_New_Transaction(int.MaxValue);
        }

        private void Create_New_Transaction(int? create_After_Transaction_ID)
        {
            this.Sync_Repeater_ViewState();

            var credit_Card_Transactions = ((Credit_Card_Transactions_Response_For_UI)this.ViewState["Credit_Card_Transactions_Response"]);

            var new_Row = new Credit_Card_Transactions_To_DB_Sync_From_UI();

            new_Row.Credit_Card_Statement_Transaction_Id = (credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI.Count * -1);
            new_Row.Has_Pending_Changes = true;
            new_Row.Is_New_Record = true;
            new_Row.Is_Deleted = false;

            int indexOfTransaction = -1;
            if (create_After_Transaction_ID.HasValue)
            {
                int transaction_Id_To_Search_Index = create_After_Transaction_ID.Value;

                for (int i = 0; i < credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI.Count; i++)
                {
                    if (credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI[i].Credit_Card_Statement_Transaction_Id == transaction_Id_To_Search_Index)
                    {
                        indexOfTransaction = i;
                        break;
                    }
                }
            }

            if (create_After_Transaction_ID.HasValue)
            {
                if (create_After_Transaction_ID.Value < int.MaxValue)
                {
                    if (indexOfTransaction >= 0 && (indexOfTransaction + 1) <= credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI.Count)
                    {
                        credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI.Insert(indexOfTransaction + 1, new_Row);
                    }
                    else
                    {
                        credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI.Add(new_Row);
                    }
                }
                else
                {
                    credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI.Add(new_Row);
                }
            }
            else
            {
                credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI.Insert(0, new_Row);
                
            }

            this.ViewState["Credit_Card_Transactions_Response"] = credit_Card_Transactions;

            this.repeater.DataSource = credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI;
            this.repeater.DataBind();

        }

        protected void button_Edit_Credit_Card_Statement_Details_Click(object sender, EventArgs e)
        {
            this.Bind_Edit_View();
        }

        protected void button_CancelEdit_Credit_Card_Statement_Details_Click(object sender, EventArgs e)
        {
            this.Bind_ReadOnly_View();
        }

        protected void button_Update_Credit_Card_Statement_Details_Click(object sender, EventArgs e)
        {
            // Save all the statement information to the database 
            this.Sync_Repeater_ViewState();

            var credit_Card_Transactions = ((Credit_Card_Transactions_Response_For_UI)this.ViewState["Credit_Card_Transactions_Response"]);

            if (this.Page.IsValid)
            {
                bool l_CCStatement_Successfully_Updated = false;

                string exception_During_Process = "";
                string exception_During_Process_Extra_Data = "";

                int p_User_Id_Owner = base.Authenticated_User_ID;
                int p_Credit_Card_Statement_Id = int.Parse(this.Request.QueryString["id"]);

                int p_Bank_Account_Id = int.Parse(this.dropdown_BankAccounts.SelectedValue);
                int p_Credit_Card_Id = int.Parse(this.dropdown_CreditCard.SelectedValue);

                DateTime? p_Statement_Date = new DateTime?();
                if (!string.IsNullOrEmpty(this.textbox_CCStatement_DateTime.Text))
                {
                    bool parsed_Successfully = false;
                    DateTime date_Parsed = new DateTime();
                    try
                    {

                        parsed_Successfully = DateTime.TryParseExact(
                            this.textbox_CCStatement_DateTime.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out date_Parsed);
                    }
                    catch
                    {
                        parsed_Successfully = false;
                    }

                    if (parsed_Successfully)
                    {
                        p_Statement_Date = date_Parsed;
                    }
                }

                byte p_Currency_Id = byte.Parse(this.dropdown_Currency.SelectedValue);
                decimal p_Total_Amount = decimal.Parse(this.textbox_Total_Amount.Text);

                string p_Original_File_Name = "";
                byte[] p_File_Content_To_Save_In_Azure = new byte[0];
                if (this.fileUpload_CCStatement_File.HasFile)
                {
                    p_Original_File_Name = this.fileUpload_CCStatement_File.FileName;
                    p_File_Content_To_Save_In_Azure = this.fileUpload_CCStatement_File.FileBytes;
                }

                long? p_Bank_Account_Transaction_Id_Connection = new long?();

                bool p_Is_Visible_To_Anonymous_Users = this.checkbox_Is_Visible_To_Anonymous_Users.Checked;
                bool p_Is_Available_For_Download_For_Anonymous_Users = this.checkbox_Is_Available_For_Download_For_Anonymous_Users.Checked;
                bool p_Is_Visible_To_Followers_Users = this.checkbox_Is_Visible_To_Followers_Users.Checked;
                bool p_Is_Available_For_Download_For_Followers_Users = this.checkbox_Is_Available_For_Download_For_Followers_Users.Checked;

                List<Credit_Card_Transactions_To_DB_Sync_From_UI> statement_Transactions = credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI;

                int p_Creating_User_Id = base.Authenticated_User_ID;
                var p_Creating_User_Permission = base.Authenticated_Permission_Type;

                try
                {
                    l_CCStatement_Successfully_Updated = Business_Logic_Layer_Facade.Instance.CreditCardStatements_Update_Credit_Card_Statement_Details(
                        p_User_Id_Owner,
                        p_Credit_Card_Statement_Id,
                        p_Credit_Card_Id,
                        p_Statement_Date,
                        p_Total_Amount,
                        p_Currency_Id,
                        p_Original_File_Name,
                        p_File_Content_To_Save_In_Azure,
                        p_Bank_Account_Transaction_Id_Connection,
                        p_Is_Visible_To_Anonymous_Users,
                        p_Is_Available_For_Download_For_Anonymous_Users,
                        p_Is_Visible_To_Followers_Users,
                        p_Is_Available_For_Download_For_Followers_Users,
                        statement_Transactions,
                        p_Creating_User_Id,
                        p_Creating_User_Permission
                        );
                }
                catch (Exception exc)
                {
                    l_CCStatement_Successfully_Updated = false;

                    exception_During_Process = exc.Message;
                    if (exc.InnerException != null)
                    {
                        exception_During_Process_Extra_Data = exc.InnerException.Message;
                    }
                }

                if (l_CCStatement_Successfully_Updated)
                {
                    // The user details was successfully created.. 
                    // Show success message and redirect the user to view page or back to users page (depends on where the user came from)
                    this.Response.Redirect("manage_creditcardstatement.aspx?id=" + p_Credit_Card_Statement_Id);
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

        protected void button_Create_Credit_Card_Statement_Details_Click(object sender, EventArgs e)
        {
            // Save all the statement information to the database 
            this.Sync_Repeater_ViewState();

            var credit_Card_Transactions = ((Credit_Card_Transactions_Response_For_UI)this.ViewState["Credit_Card_Transactions_Response"]);
             
            if (this.Page.IsValid)
            {
                bool l_CCStatement_Successfully_Created = false;

                string exception_During_Process = "";
                string exception_During_Process_Extra_Data = "";

                int p_User_Id_Owner = base.Authenticated_User_ID;
                int p_Bank_Account_Id = int.Parse(this.dropdown_BankAccounts.SelectedValue);
                int p_Credit_Card_Id = int.Parse(this.dropdown_CreditCard.SelectedValue);

                DateTime? p_Statement_Date = new DateTime?();
                if (!string.IsNullOrEmpty(this.textbox_CCStatement_DateTime.Text))
                {
                    bool parsed_Successfully = false;
                    DateTime date_Parsed = new DateTime();
                    try
                    {

                        parsed_Successfully = DateTime.TryParseExact(
                            this.textbox_CCStatement_DateTime.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out date_Parsed);
                    }
                    catch
                    {
                        parsed_Successfully = false;
                    }

                    if (parsed_Successfully)
                    {
                        p_Statement_Date = date_Parsed;
                    }
                }

                byte p_Currency_Id = byte.Parse(this.dropdown_Currency.SelectedValue);
                decimal p_Total_Amount = decimal.Parse(this.textbox_Total_Amount.Text);

                string p_Original_File_Name = "";
                byte[] p_File_Content_To_Save_In_Azure = new byte[0];
                if (this.fileUpload_CCStatement_File.HasFile)
                {
                    p_Original_File_Name = this.fileUpload_CCStatement_File.FileName;
                    p_File_Content_To_Save_In_Azure = this.fileUpload_CCStatement_File.FileBytes;
                }

                long? p_Bank_Account_Transaction_Id_Connection = new long?();

                bool p_Is_Visible_To_Anonymous_Users = this.checkbox_Is_Visible_To_Anonymous_Users.Checked;
                bool p_Is_Available_For_Download_For_Anonymous_Users = this.checkbox_Is_Available_For_Download_For_Anonymous_Users.Checked;
                bool p_Is_Visible_To_Followers_Users = this.checkbox_Is_Visible_To_Followers_Users.Checked;
                bool p_Is_Available_For_Download_For_Followers_Users = this.checkbox_Is_Available_For_Download_For_Followers_Users.Checked;

                List<Credit_Card_Transactions_To_DB_Sync_From_UI> statement_Transactions = credit_Card_Transactions.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI;

                int p_Creating_User_Id = base.Authenticated_User_ID;
                var p_Creating_User_Permission = base.Authenticated_Permission_Type;

                Credit_Cards_Statement new_CCStatement_Details = null;
                int l_New_CCStatement_Id = 0;

                try
                {
                    new_CCStatement_Details = Business_Logic_Layer_Facade.Instance.CreditCardStatements_Insert_New_Credit_Card_Statement_Details(
                        p_User_Id_Owner,
                        p_Bank_Account_Id,
                        p_Credit_Card_Id,
                        p_Statement_Date,
                        p_Total_Amount,
                        p_Currency_Id,
                        p_Original_File_Name,
                        p_File_Content_To_Save_In_Azure,
                        p_Bank_Account_Transaction_Id_Connection,
                        p_Is_Visible_To_Anonymous_Users,
                        p_Is_Available_For_Download_For_Anonymous_Users,
                        p_Is_Visible_To_Followers_Users,
                        p_Is_Available_For_Download_For_Followers_Users,
                        statement_Transactions,
                        p_Creating_User_Id,
                        p_Creating_User_Permission
                        );

                    l_New_CCStatement_Id = new_CCStatement_Details.Credit_Card_Statement_Id;
                    if (l_New_CCStatement_Id > 0)
                        l_CCStatement_Successfully_Created = true;
                }
                catch (Exception exc)
                {
                    exception_During_Process = exc.Message;
                    if (exc.InnerException != null)
                    {
                        exception_During_Process_Extra_Data = exc.InnerException.Message;
                    }
                }

                if (l_CCStatement_Successfully_Created && l_New_CCStatement_Id > 0)
                {
                    // The user details was successfully created.. 
                    // Show success message and redirect the user to view page or back to users page (depends on where the user came from)
                    this.Response.Redirect("manage_creditcardstatement.aspx?id=" + l_New_CCStatement_Id);
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

        protected void button_Save_BankAccountTransaction_Connection_Click(object sender, EventArgs e)
        {
            long l_Bank_Account_Transction_Id = long.Parse(this.dropdown_BankAccountTransaction.SelectedValue);
            int l_Credit_Card_Statement_Id = int.Parse(this.Request.QueryString["id"]);

            bool l_Updated_Successfully = Business_Logic_Layer_Facade.Instance
                .BankAccount_Transactions_Update_Connect_With_Statement(
                    l_Bank_Account_Transction_Id, l_Credit_Card_Statement_Id, base.Authenticated_User_ID);

            if (l_Updated_Successfully)
            {
                var ccStatement_Details = Business_Logic_Layer_Facade.Instance
                    .CreditCardStatements_Get_Credit_Card_Statement_Details_By_Credit_Card_Statement_Id(
                        l_Credit_Card_Statement_Id,
                        base.Authenticated_User_ID,
                        base.Authenticated_User_ID,
                        base.Authenticated_Permission_Type);

                this.label_Record_Last_Updated_By_User.Text = ccStatement_Details.Record_Last_Updated_By_User_Details.FullName_With_Email.ToString();
                this.label_Record_Last_Updated_DateTime_UTC.Text = ccStatement_Details.Record_Last_Updated_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");

                this.Bind_Connected_BankAccountTransactionInfo(ccStatement_Details);
            }
        }

        protected void button_Delete_BankAccountTransaction_Connection_Click(object sender, EventArgs e)
        {
            long l_Bank_Account_Transction_Id = long.Parse(this.hidden_Bank_Account_Transaction_Id.Value);
            int l_Credit_Card_Statement_Id = int.Parse(this.Request.QueryString["id"]);

            bool l_Updated_Successfully = Business_Logic_Layer_Facade.Instance
                .BankAccount_Transactions_Update_Disconnect_Statement(
                    l_Bank_Account_Transction_Id, l_Credit_Card_Statement_Id, base.Authenticated_User_ID);

            if (l_Updated_Successfully)
            {
                var ccStatement_Details = Business_Logic_Layer_Facade.Instance
                    .CreditCardStatements_Get_Credit_Card_Statement_Details_By_Credit_Card_Statement_Id(
                        l_Credit_Card_Statement_Id,
                        base.Authenticated_User_ID,
                        base.Authenticated_User_ID,
                        base.Authenticated_Permission_Type);

                this.label_Record_Last_Updated_By_User.Text = ccStatement_Details.Record_Last_Updated_By_User_Details.FullName_With_Email.ToString();
                this.label_Record_Last_Updated_DateTime_UTC.Text = ccStatement_Details.Record_Last_Updated_DateTime_UTC.ToString("dd/MM/yyyy HH:mm:ss UTC");

                this.Bind_Connected_BankAccountTransactionInfo(ccStatement_Details);
            }
        }
    }
}
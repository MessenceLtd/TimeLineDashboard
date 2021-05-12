using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebformsPOCDemo.AppShared;
using TimeLineDashboard.BusinessLogicLayer;
using TimeLineDashboard.Shared.Models;
using TimeLineDashboard.Shared.Responses;

namespace WebformsPOCDemo
{
    public partial class manage_BankAccountTransactions : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty( this.Request.QueryString["ajax"]))
            {
                if (this.Request.QueryString["req"] == "check_session")
                {
                    if (this.Session["Back_Account_Transactions_Response"] != null)
                    {
                        Response.Write("true");
                    }
                    else
                    {
                        Response.Write("false");
                    }
                    Response.End();
                }
            }

            if (!this.IsPostBack)
            {
                this.Bind_Default_View();
            }
        }

        private void Bind_Default_View()
        {
            // ToDo -- Check permissions -- if the user is able to view the client / edit the client
            this.Validate_Permissions();

            this.Bind_Bank_Accounts_Transactions_Results();
        }

        private void Bind_Bank_Accounts_Transactions_Results()
        {
            int bankAccountId = int.Parse(this.Request.QueryString["id"]);

            int page_Number = 1;
            if (!string.IsNullOrEmpty(this.Request.QueryString["page"]))
            {
                page_Number = int.Parse(this.Request.QueryString["page"]);
            }

            var list_Bank_Account_Transactions_DB_Response_Paged = Business_Logic_Layer_Facade.Instance.
                BankAccount_Transactions_Get_Transactions_By_Bank_Account_Id_And_User_Id_As_DataTable(
                    page_Number,
                    k_Records_Per_Page,
                    bankAccountId,
                    base.Authenticated_User_ID,
                    base.Authenticated_User_ID);

            this.Session["Back_Account_Transactions_Response"] = list_Bank_Account_Transactions_DB_Response_Paged;
            this.repeater.DataSource = list_Bank_Account_Transactions_DB_Response_Paged.Bank_Account_Transactions_DataTable;
            this.repeater.DataBind();
            base.Build_Pagination_Pages(list_Bank_Account_Transactions_DB_Response_Paged.Total_Number_Of_Records, this.ph_Pagination);
        }

        private void Validate_Permissions()
        {

        }

        protected void button_Save_Bank_Account_Transactions_Click(object sender, EventArgs e)
        {
            this.Sync_Repeater_ViewState_To_DataTable_Session();

            var transcations_Current_Viewed_List_As_DataTable = ((Bank_Account_Transactions_Response_For_UI)this.Session["Back_Account_Transactions_Response"]).Bank_Account_Transactions_DataTable;

            // Try to grab the balance from the rows 
            List<Bank_Account_Transactions_To_DB_Sync_From_UI> transactions_To_Sync_To_Database = new List<Bank_Account_Transactions_To_DB_Sync_From_UI>();
            int errors_Counter = 0;
            List<int> transaction_Id_Error_Array = new List<int>();
            
            for (int i = 0; i < this.repeater.Items.Count; i++)
            {
                Bank_Account_Transactions_To_DB_Sync_From_UI transactionToAdd = new Bank_Account_Transactions_To_DB_Sync_From_UI();

                try
                {
                    transactionToAdd.Bank_Account_Transaction_Id = int.Parse(((HiddenField)this.repeater.Items[i].FindControl("hidden_Transaction_Record_ID")).Value);

                    string balance = ((TextBox)this.repeater.Items[i].FindControl("txt_Balance")).Text;
                    if (!string.IsNullOrEmpty(balance))
                        transactionToAdd.Transaction_Account_Balance = decimal.Parse(balance);

                    var transaction_Date_Parsed = Common_Tools.Try_Parse_DateTime_By_Current_Culture(((TextBox)this.repeater.Items[i].FindControl("txt_Actual_DateTime")).Text);

                    if (transaction_Date_Parsed.HasValue)
                        transactionToAdd.Transaction_Actual_DateTime = transaction_Date_Parsed.Value;
                    else
                    {
                        string exception = "Todo show exception transaction date is mandatory";
                        errors_Counter++;
                        continue; // skip this item and try to save the others
                    }

                    string income_Value = ((TextBox)this.repeater.Items[i].FindControl("txt_Income_Value")).Text;
                    if (!string.IsNullOrEmpty(income_Value))
                        transactionToAdd.Positive_Amount_Entered = decimal.Parse(income_Value);

                    string obligo_Value = ((TextBox)this.repeater.Items[i].FindControl("txt_Obligo_Value")).Text;
                    if (!string.IsNullOrEmpty(obligo_Value))
                        transactionToAdd.Negative_Amount_Paid = decimal.Parse(obligo_Value);

                    var value_Date_Parsed = Common_Tools.Try_Parse_DateTime_By_Current_Culture(((TextBox)this.repeater.Items[i].FindControl("txt_Value_Date")).Text);
                    if (value_Date_Parsed.HasValue)
                        transactionToAdd.Transaction_Value_DateTime = value_Date_Parsed;
                    else
                        transactionToAdd.Transaction_Value_DateTime = null;

                    transactionToAdd.Reference_Number = ((TextBox)this.repeater.Items[i].FindControl("txt_Reference")).Text;
                    transactionToAdd.Transaction_Bank_Description = ((TextBox)this.repeater.Items[i].FindControl("txt_Description")).Text;
                    transactionToAdd.Transaction_Bank_Inner_Reference_Code = ((TextBox)this.repeater.Items[i].FindControl("txt_Bank_Ref")).Text;

                    transactionToAdd.Is_Visible_To_Anonymous_Users = bool.Parse(((HiddenField)this.repeater.Items[i].FindControl("hidden_Is_Visible_To_Anonymous_Users")).Value);
                    transactionToAdd.Is_Visible_To_Followers_Users = bool.Parse(((HiddenField)this.repeater.Items[i].FindControl("hidden_Is_Visible_To_Followers_Users")).Value);

                    if (bool.Parse(((HiddenField)this.repeater.Items[i].FindControl("hidden_IsNewRecord")).Value))
                    {
                        transactionToAdd.Is_New_Record = true;
                    }

                    transactionToAdd.Has_Pending_Changes = bool.Parse(((HiddenField)this.repeater.Items[i].FindControl("hidden_PendingChanges")).Value);
                    transactionToAdd.Is_Deleted = bool.Parse(((HiddenField)this.repeater.Items[i].FindControl("hidden_IsDeleted")).Value);

                    if (transactionToAdd.Has_Pending_Changes)
                    { 
                        transactions_To_Sync_To_Database.Add(transactionToAdd);
                    }
                }
                catch
                {
                    transaction_Id_Error_Array.Add(transactionToAdd.Bank_Account_Transaction_Id);
                    errors_Counter++;
                }
            }

            if (errors_Counter == 0 && transactions_To_Sync_To_Database.Count > 0)
            {
                // No errors during the preparations for the DB sync and there are transactions to sync. 
                // We can Proceed with the save operation
                int bankAccountId = int.Parse(this.Request.QueryString["id"]);

                int succesfully_Processed_Records = 0;

                for (int i=0;i< transactions_To_Sync_To_Database.Count;i++ )
                {
                    int transaction_Id = transactions_To_Sync_To_Database[i].Bank_Account_Transaction_Id;

                    int affected_Saved_Rows = Business_Logic_Layer_Facade.Instance.BankAccount_Transactions_Save_Transactions_From_UI_To_Database(
                    bankAccountId,
                    transactions_To_Sync_To_Database[i],
                    base.Authenticated_User_ID
                    );

                    if (affected_Saved_Rows > 0)
                    {
                        // Row has been saved! Mark it as not a new row, And without pending changes. 
                        succesfully_Processed_Records++;
                        for (int r = 0; r < transcations_Current_Viewed_List_As_DataTable.Rows.Count; r++)
                        {
                            if ((int)transcations_Current_Viewed_List_As_DataTable.Rows[r]["Bank_Account_Transaction_Id"] == transaction_Id)
                            {
                                transcations_Current_Viewed_List_As_DataTable.Rows[r]["Pending_Changes"] = false;
                                transcations_Current_Viewed_List_As_DataTable.Rows[r]["Is_New_Record"] = false;
                                transcations_Current_Viewed_List_As_DataTable.Rows[r]["Is_Deleted"] = false;
                                transcations_Current_Viewed_List_As_DataTable.Rows[r]["Has_Error"] = false;
                                break;
                            }
                        }
                    }
                    else
                    {
                        // Error syncing the row to the database! 
                        for (int r = 0; r < transcations_Current_Viewed_List_As_DataTable.Rows.Count; r++)
                        {
                            if ((int)transcations_Current_Viewed_List_As_DataTable.Rows[r]["Bank_Account_Transaction_Id"] == transaction_Id)
                            {
                                transcations_Current_Viewed_List_As_DataTable.Rows[r]["Has_Error"] = true;
                                break;
                            }
                        }
                    }
                }

                //int succesfully_Processed_Records = Business_Logic_Layer_Facade.Instance.BankAccount_Transactions_Save_Transactions_From_UI_To_Database(
                //    bankAccountId,
                //    transactions_To_Sync_To_Database,
                //    base.Authenticated_User_ID
                //    );

                if (succesfully_Processed_Records == transactions_To_Sync_To_Database.Count)
                {
                    // Update operations was successfull! Refresh the grid results and fully refresh paged state.
                    this.Bind_Bank_Accounts_Transactions_Results();
                    this.hidden_Pending_Changes.Value = "false";
                    this.panel_Expired_Session_Warning.CssClass = "alert alert-warning hidden";
                } 
                else
                {
                    // One or more records were not successfully updated. 
                    // Todo: Show appropriate message to the user and mark the error records that were not saved successfully.
                    int unsuccessfullSavesCount = transactions_To_Sync_To_Database.Count - succesfully_Processed_Records;

                    ScriptManager.RegisterStartupScript(up_Transactions, up_Transactions.GetType(), "ConfirmSaveErrors", "alert('There were errors saving " + unsuccessfullSavesCount + " records.');", true);

                    this.repeater.DataSource = transcations_Current_Viewed_List_As_DataTable;
                    this.repeater.DataBind();
                }
            }
            else
            {
                // display another confirmation for the user that some rows has an error. 
                // TODO: Those rows should be marked with CSS class so the user will be edit and fix them
                //ScriptManager.RegisterStartupScript(up_Transactions, up_Transactions.GetType(), "ConfirmSaveErrors", "alert('Some errors ');", true);

                ScriptManager.RegisterStartupScript(up_Transactions, up_Transactions.GetType(), "SaveErrors", "alert('There are errors saving " + transaction_Id_Error_Array.Count +  "  records.');", true);

                this.Show_Errors_Refresh_Grid(transaction_Id_Error_Array); 
            }
        }

        private void Show_Errors_Refresh_Grid(List<int> transaction_Ids_Error_Array)
        {
            //this.Sync_Repeater_ViewState_To_DataTable_Session();

            var transcations_Current_Viewed_List_As_DataTable = ((Bank_Account_Transactions_Response_For_UI)this.Session["Back_Account_Transactions_Response"]).Bank_Account_Transactions_DataTable;

            for (int i = 0; i < transaction_Ids_Error_Array.Count; i++)
            {
                for (int r = 0; r < transcations_Current_Viewed_List_As_DataTable.Rows.Count; r++)
                {
                    if ((int)transcations_Current_Viewed_List_As_DataTable.Rows[r]["Bank_Account_Transaction_Id"] == transaction_Ids_Error_Array[i])
                    {
                        transcations_Current_Viewed_List_As_DataTable.Rows[r]["Has_Error"] = true;
                        break;
                    }
                }
            }

            this.repeater.DataSource = transcations_Current_Viewed_List_As_DataTable;
            this.repeater.DataBind();
        }

        protected void button_Add_New_Bank_Account_Transactions_Click(object sender, EventArgs e)
        {
            this.Create_New_Transaction();
        }

        protected void button_Add_New_Transaction_After_Transaction_Id_Click(object sender, EventArgs e)
        {
            int transaction_Id_To_Search_Index = int.Parse(this.hidden_New_Bank_Account_Transaction_After_Transaction_ID.Value);
            Create_New_Transaction(transaction_Id_To_Search_Index);
        }

        private void Create_New_Transaction()
        {
            this.Create_New_Transaction(null);
        }

        private void Create_New_Transaction(int? create_After_Transaction_ID)
        {
            if (this.Session["Back_Account_Transactions_Response"] != null)
            {
                this.Sync_Repeater_ViewState_To_DataTable_Session();

                var transcations_Current_Viewed_List_As_DataTable = ((Bank_Account_Transactions_Response_For_UI)this.Session["Back_Account_Transactions_Response"]).Bank_Account_Transactions_DataTable;
                var newRow = transcations_Current_Viewed_List_As_DataTable.NewRow();

                newRow["Bank_Account_Transaction_Id"] = (transcations_Current_Viewed_List_As_DataTable.Rows.Count * -1);
                newRow["Pending_Changes"] = true;
                newRow["Is_New_Record"] = true;
                newRow["Is_Deleted"] = false;
                newRow["Has_Error"] = false;

                int indexOfTransaction = -1;
                if (create_After_Transaction_ID.HasValue)
                {
                    int transaction_Id_To_Search_Index = create_After_Transaction_ID.Value;

                    for (int i = 0; i < transcations_Current_Viewed_List_As_DataTable.Rows.Count; i++)
                    {
                        if (transcations_Current_Viewed_List_As_DataTable.Rows[i]["Bank_Account_Transaction_Id"] is int &&
                            (int)transcations_Current_Viewed_List_As_DataTable.Rows[i]["Bank_Account_Transaction_Id"] == transaction_Id_To_Search_Index)
                        {
                            indexOfTransaction = i;
                            break;
                        }
                    }
                }

                if (indexOfTransaction >= 0 && (indexOfTransaction + 1) <= transcations_Current_Viewed_List_As_DataTable.Rows.Count)
                {
                    transcations_Current_Viewed_List_As_DataTable.Rows.InsertAt(newRow, indexOfTransaction + 1);
                } 
                else
                {
                    transcations_Current_Viewed_List_As_DataTable.Rows.InsertAt(newRow, 0);
                }

                this.repeater.DataSource = transcations_Current_Viewed_List_As_DataTable;
                this.repeater.DataBind();
            }
        }

        protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if ( e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem )
            {
                bool pendingChanges = (bool)((DataRowView)e.Item.DataItem)["Pending_Changes"];
                bool IsNewRecord = (bool)((DataRowView)e.Item.DataItem)["Is_New_Record"];
                bool IsDeleted = (bool)((DataRowView)e.Item.DataItem)["Is_Deleted"];
                bool HasError = (bool)((DataRowView)e.Item.DataItem)["Has_Error"];

                Panel panel_Bank_Account_Transaction_Id = (Panel)e.Item.FindControl("panel_Bank_Account_Transaction_Id");

                if (pendingChanges)
                {
                    panel_Bank_Account_Transaction_Id.CssClass = "tr alert-warning";
                }

                if (IsNewRecord)
                {
                    panel_Bank_Account_Transaction_Id.CssClass = "tr NewRecord";
                }

                if (IsDeleted)
                {
                    panel_Bank_Account_Transaction_Id.CssClass = "Deleted";
                }

                if (HasError)
                {
                    panel_Bank_Account_Transaction_Id.CssClass = "tr alert-danger";
                }
            }
        }

        private void Sync_Repeater_ViewState_To_DataTable_Session()
        {
            var dataTable = ((Bank_Account_Transactions_Response_For_UI)this.Session["Back_Account_Transactions_Response"]).Bank_Account_Transactions_DataTable;
            for (int i = 0; i < this.repeater.Items.Count; i++)
            {
                string balance = ((TextBox)this.repeater.Items[i].FindControl("txt_Balance")).Text;
                decimal parsed_Balance = 0;
                if (!string.IsNullOrEmpty(balance) && decimal.TryParse(balance, out parsed_Balance))
                    dataTable.Rows[i]["Transaction_Account_Balance"] = balance;
                else
                    dataTable.Rows[i]["Transaction_Account_Balance"] = DBNull.Value;

                var transaction_Date_Parsed = Common_Tools.Try_Parse_DateTime_By_Current_Culture(((TextBox)this.repeater.Items[i].FindControl("txt_Actual_DateTime")).Text);
                if (transaction_Date_Parsed.HasValue)
                    dataTable.Rows[i]["Transaction_Actual_DateTime"] = transaction_Date_Parsed;
                else
                    dataTable.Rows[i]["Transaction_Actual_DateTime"] = DBNull.Value;

                string income_Value = ((TextBox)this.repeater.Items[i].FindControl("txt_Income_Value")).Text;
                decimal parsed_Income_Value = 0;
                if (!string.IsNullOrEmpty(income_Value) && decimal.TryParse(income_Value, out parsed_Income_Value))
                    dataTable.Rows[i]["Positive_Amount_Entered"] = income_Value;
                else
                    dataTable.Rows[i]["Positive_Amount_Entered"] = DBNull.Value;

                string obligo_Value = ((TextBox)this.repeater.Items[i].FindControl("txt_Obligo_Value")).Text;
                decimal parsed_Obligo_Value = 0;
                if (!string.IsNullOrEmpty(obligo_Value) && decimal.TryParse(obligo_Value, out parsed_Obligo_Value))
                    dataTable.Rows[i]["Negative_Amount_Paid"] = obligo_Value;
                else
                    dataTable.Rows[i]["Negative_Amount_Paid"] = DBNull.Value;

                var value_Date_Parsed = Common_Tools.Try_Parse_DateTime_By_Current_Culture(((TextBox)this.repeater.Items[i].FindControl("txt_Value_Date")).Text);
                if (value_Date_Parsed.HasValue)
                    dataTable.Rows[i]["Transaction_Value_DateTime"] = value_Date_Parsed;
                else
                    dataTable.Rows[i]["Transaction_Value_DateTime"] = DBNull.Value;

                dataTable.Rows[i]["Reference_Number"] = ((TextBox)this.repeater.Items[i].FindControl("txt_Reference")).Text;
                dataTable.Rows[i]["Transaction_Bank_Description"] = ((TextBox)this.repeater.Items[i].FindControl("txt_Description")).Text;
                dataTable.Rows[i]["Transaction_Bank_Inner_Reference_Code"] = ((TextBox)this.repeater.Items[i].FindControl("txt_Bank_Ref")).Text;

                if (bool.Parse(((HiddenField)this.repeater.Items[i].FindControl("hidden_PendingChanges")).Value))
                {
                    dataTable.Rows[i]["Pending_Changes"] = true;
                }

                if (bool.Parse(((HiddenField)this.repeater.Items[i].FindControl("hidden_IsNewRecord")).Value))
                {
                    dataTable.Rows[i]["Is_New_Record"] = true;
                }

                if (bool.Parse(((HiddenField)this.repeater.Items[i].FindControl("hidden_IsDeleted")).Value))
                {
                    dataTable.Rows[i]["Is_Deleted"] = true;
                }
            }
        }
    }
}
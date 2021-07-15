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

            this.repeater.DataSource = list_Bank_Account_Transactions_DB_Response_Paged.Bank_Account_Transactions_DataTable;
            this.repeater.DataBind();
            base.Build_Pagination_Pages(list_Bank_Account_Transactions_DB_Response_Paged.Total_Number_Of_Records, this.ph_Pagination);
        }

        private void Validate_Permissions()
        {

        }

        protected void button_Add_New_Bank_Account_Transactions_Click(object sender, EventArgs e)
        {
            //this.Create_New_Transaction();
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

        protected void button_Popup_Save_Transaction_Details_Click(object sender, EventArgs e)
        {
            string l_After_Transaction_Id = this.hidden_Save_Transaction_Info_After_Transaction_Id.Value;
            string l_Transaction_Id = this.hidden_Save_Transaction_Info_Transaction_Id.Value;
            string l_Balance = this.textbox_Edit_Transaction_Account_Balance.Text;
            string l_Transaction_Date = this.textbox_Edit_Transaction_Actual_DateTime.Text;
            string l_Income_Value = this.textbox_Edit_Positive_Amount_Entered.Text;
            string l_Obligo_Value = this.textbox_Edit_Negative_Amount_Paid.Text;
            string l_Value_Date = this.textbox_Edit_Transaction_Value_DateTime.Text;
            string l_Reference = this.textbox_Edit_Reference_Number.Text;
            string l_Description = this.textbox_Transaction_Bank_Description.Text;
            string l_Bank_Ref = this.textbox_Transaction_Bank_Inner_Reference_Code.Text;

            int p_BackAccountId = int.Parse(this.Request.QueryString["id"]);

            long? p_After_Transaction_Id = null;
            if (!string.IsNullOrEmpty(l_After_Transaction_Id))
            {
                p_After_Transaction_Id = long.Parse(l_After_Transaction_Id);
            }

            long? p_Transaction_Id = null; 
            if (!string.IsNullOrEmpty(l_Transaction_Id))
            {
                p_Transaction_Id = long.Parse(l_Transaction_Id);
            }

            decimal p_Balance = decimal.Parse(l_Balance);
            DateTime? p_Transaction_Date = Common_Tools.Try_Parse_DateTime_By_Current_Culture(l_Transaction_Date);
            decimal p_Income_Value = 0;
            if (!string.IsNullOrEmpty(l_Income_Value))
            {
                p_Income_Value = decimal.Parse(l_Income_Value);
            }
            decimal p_Obligo_Value = 0;
            if (!string.IsNullOrEmpty(l_Obligo_Value))
            {
                p_Obligo_Value = decimal.Parse(l_Obligo_Value);
            }
            DateTime? p_Value_Date = Common_Tools.Try_Parse_DateTime_By_Current_Culture(l_Value_Date);
            string p_Reference = l_Reference;
            string p_Description = l_Description;
            string p_Bank_Ref = l_Bank_Ref;

            if (!p_Transaction_Date.HasValue)
            {
                // Todo throw exception to the clientside.
                return;
            }

            if (!p_Transaction_Id.HasValue || p_Transaction_Id.Value <= 0)
            {
                Business_Logic_Layer_Facade.Instance.
                    BankAccount_Transactions_Insert_New_Transaction_Details(
                        p_BackAccountId,
                        p_After_Transaction_Id,
                        p_Balance,
                        p_Transaction_Date.Value,
                        p_Income_Value,
                        p_Obligo_Value,
                        p_Value_Date,
                        p_Reference,
                        p_Description,
                        p_Bank_Ref,
                        false,
                        false,
                        base.Authenticated_User_ID);
            }
            else
            {
                var l_Updated_Successfully = Business_Logic_Layer_Facade.Instance.
                    BankAccount_Transactions_Update_Transaction_Details(
                        p_Transaction_Id.Value,
                        p_Balance,
                        p_Transaction_Date.Value,
                        p_Income_Value,
                        p_Obligo_Value,
                        p_Value_Date,
                        p_Reference,
                        p_Description,
                        p_Bank_Ref,
                        false,
                        false,
                        base.Authenticated_User_ID);
            }

            this.Bind_Bank_Accounts_Transactions_Results();
        }

        protected void button_Delete_Bank_Account_Transaction_Click(object sender, EventArgs e)
        {
            int l_BackAccountId = int.Parse(this.Request.QueryString["id"]);
            long l_BankAccount_Transaction_Id_To_Delete = long.Parse(this.hidden_Delete_Transaction_Id.Value);
            
            Business_Logic_Layer_Facade.Instance.BankAccount_Transactions_Delete_Transaction(
                l_BackAccountId,
                l_BankAccount_Transaction_Id_To_Delete,
                base.Authenticated_User_ID);

            this.Bind_Bank_Accounts_Transactions_Results();
        }
    }
}
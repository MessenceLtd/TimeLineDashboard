using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TimeLineDashboard.BusinessLogicLayer;
using WebformsPOCDemo.AppShared;

namespace WebformsPOCDemo
{
    public partial class list_CreditCardsStatements : BasePage
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
            var bank_Accounts_List = Business_Logic_Layer_Facade.Instance.BankAccounts_Get_Search(
                base.Authenticated_User_ID);

            if (bank_Accounts_List.Count > 0)
            {
                this.dropdown_Bank_Accounts.DataSource = bank_Accounts_List;
                this.dropdown_Bank_Accounts.DataTextField = "Account_Name";
                this.dropdown_Bank_Accounts.DataValueField = "Bank_Account_Id";
                this.dropdown_Bank_Accounts.DataBind();

                this.dropdown_Bank_Accounts.Items.Insert(0, new ListItem("-- Select --", ""));
            }
            else
            {
                // ToDo -- Redirect user to bank account creation with error message.
                this.Response.Redirect("Add_BankAccount.aspx");
                return;
            }

            this.Bind_Credit_Cards_Statements_Grid();
        }

        protected void button_Search_Credit_Cards_Statements_Click(object sender, EventArgs e)
        {
            this.Bind_Credit_Cards_Statements_Grid();
        }

        private void Bind_Credit_Cards_Statements_Grid()
        {
            int? p_Bank_Account_Id = null;
            if (!string.IsNullOrEmpty(this.dropdown_Bank_Accounts.SelectedValue))
            {
                p_Bank_Account_Id = int.Parse(this.dropdown_Bank_Accounts.SelectedValue);
            }

            var list_Of_Credit_Cards_Statements_Searched = Business_Logic_Layer_Facade.Instance
                .CreditCardStatements_Get_Search(
                    base.Authenticated_User_ID,
                    p_Bank_Account_Id, 
                    base.Authenticated_User_ID,
                    base.Authenticated_Permission_Type);

            if (list_Of_Credit_Cards_Statements_Searched != null && list_Of_Credit_Cards_Statements_Searched.Count > 0)
            {
                this.dataGrid_CreditCardsStatements_List.DataSource = list_Of_Credit_Cards_Statements_Searched;
                this.dataGrid_CreditCardsStatements_List.DataBind();
                this.dataGrid_CreditCardsStatements_List.Visible = true;

                this.panel_No_Results_Message.Visible = false;
            }
            else
            {
                this.dataGrid_CreditCardsStatements_List.Visible = false;
                this.panel_No_Results_Message.Visible = true;
            }
        }

        protected void button_Add_New_Credit_Card_Statement_Click(object sender, EventArgs e)
        {
            this.Response.Redirect("manage_CreditCardStatement.aspx?new");
        }
    }
}
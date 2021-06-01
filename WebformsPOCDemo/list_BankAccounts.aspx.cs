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
    public partial class list_BankAccounts : BasePage
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
            this.Bind_Bank_Accounts_Grid();
        }

        protected void button_Search_Bank_Accounts_Click(object sender, EventArgs e)
        {
            this.Bind_Bank_Accounts_Grid();
        }

        private void Bind_Bank_Accounts_Grid()
        {
            var list_Of_Bank_Accounts_Searched = Business_Logic_Layer_Facade.Instance.BankAccounts_Get_Search(
                base.Authenticated_User_ID);

            if (list_Of_Bank_Accounts_Searched != null && list_Of_Bank_Accounts_Searched.Count > 0)
            {
                this.dataGrid_BankAccounts_List.DataSource = list_Of_Bank_Accounts_Searched;
                this.dataGrid_BankAccounts_List.DataBind();
                this.dataGrid_BankAccounts_List.Visible = true;

                this.panel_No_Results_Message.Visible = false;
            }
            else
            {
                this.dataGrid_BankAccounts_List.Visible = false;
                this.panel_No_Results_Message.Visible = true;
            }
        }

        protected void button_Add_New_Bank_Account_Click(object sender, EventArgs e)
        {
            this.Response.Redirect("Add_BankAccount.aspx");
        }
    }
}
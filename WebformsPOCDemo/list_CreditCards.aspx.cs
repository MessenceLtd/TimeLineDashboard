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
    public partial class list_CreditCards : BasePage
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
            this.Bind_Credit_Cards_Grid();
        }

        protected void button_Search_Credit_Cards_Click(object sender, EventArgs e)
        {
            this.Bind_Credit_Cards_Grid();
        }

        private void Bind_Credit_Cards_Grid()
        {
            var list_Of_Credit_Cards_Searched = Business_Logic_Layer_Facade.Instance.CreditCards_Get_Credit_Cards(
                base.Authenticated_User_ID,
                base.Authenticated_User_ID, 
                base.Authenticated_Permission_Type);

            if (list_Of_Credit_Cards_Searched != null && list_Of_Credit_Cards_Searched.Count > 0)
            {
                this.dataGrid_CreditCards_List.DataSource = list_Of_Credit_Cards_Searched;
                this.dataGrid_CreditCards_List.DataBind();
                this.dataGrid_CreditCards_List.Visible = true;

                this.panel_No_Results_Message.Visible = false;
            }
            else
            {
                this.dataGrid_CreditCards_List.Visible = false;
                this.panel_No_Results_Message.Visible = true;
            }
        }

        protected void button_Add_New_Credit_Card_Click(object sender, EventArgs e)
        {
            this.Response.Redirect("manage_CreditCard.aspx?new");
        }
    }
}
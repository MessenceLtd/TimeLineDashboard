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
    public partial class Expenses : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.Bind_Default_View();
            }
            else
            {
                this.panel_Please_Search.Visible = false;
            }
        }

        private void Bind_Default_View()
        {
            //Business_Logic_Layer_Facade.Instance.

        }

        protected void button_Search_Expenses_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.textbox_Search_Criteria.Text))
            {
                var list_Of_Expenses_Searched = Business_Logic_Layer_Facade.Instance.Expenses_Get_Search(this.textbox_Search_Criteria.Text);

                if (list_Of_Expenses_Searched != null && list_Of_Expenses_Searched.Count > 0)
                {
                    this.dataGrid_Expenses_List.DataSource = list_Of_Expenses_Searched;
                    this.dataGrid_Expenses_List.DataBind();

                    this.dataGrid_Expenses_List.Visible = true;
                    this.panel_No_Results_Message.Visible = false;
                }
                else
                {
                    this.dataGrid_Expenses_List.Visible = false;
                    this.panel_No_Results_Message.Visible = true;
                }
            }
        }
    }
}
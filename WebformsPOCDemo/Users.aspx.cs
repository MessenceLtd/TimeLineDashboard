using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TimeLineDashboard.BusinessLogicLayer;
using TimeLineDashboard.Shared.Models;

namespace WebformsPOCDemo
{
    public partial class Users : System.Web.UI.Page
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
            //Business_Logic_Layer_Facade.Instance.


            
        }

        protected void button_Search_Users_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(this.textbox_Search_Criteria.Text))
            {
                this.dataGrid_Users_List.DataSource = Business_Logic_Layer_Facade.Instance.Get_Users_Search(this.textbox_Search_Criteria.Text);
                this.dataGrid_Users_List.DataBind();
            }
            
        }
    }
}
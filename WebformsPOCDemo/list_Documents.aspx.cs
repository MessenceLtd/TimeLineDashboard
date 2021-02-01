﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TimeLineDashboard.BusinessLogicLayer;
using WebformsPOCDemo.AppShared;

namespace WebformsPOCDemo
{
    public partial class Documents : BasePage
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

        protected void button_Search_Documents_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.textbox_Search_Criteria.Text))
            {
                var list_Of_Documents_Searched = Business_Logic_Layer_Facade.Instance.Documents_Get_Search(this.textbox_Search_Criteria.Text, 1);

                if (list_Of_Documents_Searched != null && list_Of_Documents_Searched.Count > 0)
                {
                    this.dataGrid_Documents_List.DataSource = list_Of_Documents_Searched;
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
        }
    }
}
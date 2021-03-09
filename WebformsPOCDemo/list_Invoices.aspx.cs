using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TimeLineDashboard.BusinessLogicLayer;
using TimeLineDashboard.Shared.Models;
using WebformsPOCDemo.AppShared;

namespace WebformsPOCDemo
{
    public partial class list_Invoices : BasePage
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
            Common_Tools.Initialize_DropDown_Countries(this.dropdown_Country);

            Common_Tools.Initialize_DropDown_Invoice_Types(this.dropdown_Type);
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

        protected void button_Search_Invoices_Click(object sender, EventArgs e)
        {
            short? filter_By_Type = new short?();
            if (!string.IsNullOrEmpty(this.dropdown_Type.SelectedValue))
            {
                filter_By_Type = short.Parse(this.dropdown_Type.SelectedValue);
            }

            short? filter_By_Country = new short?();
            short? filter_By_State = new short?();
            if (!string.IsNullOrEmpty(this.dropdown_Country.SelectedValue))
            {
                filter_By_Country = short.Parse(this.dropdown_Country.SelectedValue);
                if (!string.IsNullOrEmpty(this.dropdown_State.SelectedValue))
                {
                    filter_By_State = short.Parse(this.dropdown_State.SelectedValue);
                }
            }

            string filter_By_City_Or_Address_Or_ZipCode = this.text_Filter_By_CityAddressZipCode.Text;
            string filter_By_CompanyName_Or_Person_Fullname = this.text_Filter_By_CompanyNamePeopleName.Text;

            var list_Of_Invoices_Searched = Business_Logic_Layer_Facade.Instance.Invoices_Get_Search(
                base.Authenticated_User_ID,
                filter_By_Type,
                filter_By_Country,
                filter_By_State,
                filter_By_City_Or_Address_Or_ZipCode,
                filter_By_CompanyName_Or_Person_Fullname );

            if (list_Of_Invoices_Searched != null && list_Of_Invoices_Searched.Count > 0)
            {
                this.dataGrid_Invoices_List.DataSource = list_Of_Invoices_Searched;
                this.dataGrid_Invoices_List.DataBind();

                this.dataGrid_Invoices_List.Visible = true;
                this.panel_No_Results_Message.Visible = false;
            }
            else
            {
                this.dataGrid_Invoices_List.Visible = false;
                this.panel_No_Results_Message.Visible = true;
            }
            
        }
    }
}
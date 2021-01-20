using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TimeLineDashboard.BusinessLogicLayer;

namespace WebformsPOCDemo
{
    public partial class Add_User : System.Web.UI.Page
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
            // bind the combobox of the countries
            this.dropdown_Country.DataSource = Business_Logic_Layer_Facade.Instance.Countries_GetAll();
            this.dropdown_Country.DataTextField = "Country_English_Name";
            this.dropdown_Country.DataValueField = "Country_Id";
            this.dropdown_Country.DataBind();

            this.dropdown_Country.Items.Insert(0, new ListItem("-- Select -- " , ""));

            //TimeLineDashboard.BusinessLogicLayer

            // bind the combobox of the states

            // Bind the genders 

            // Bind the user types
        }

        protected void button_Create_User_Click(object sender, EventArgs e)
        {

        }

        protected void dropdown_Country_SelectedIndexChanged(object sender, EventArgs e)
        {            
            if ( !string.IsNullOrEmpty ( this.dropdown_Country.SelectedValue))
            { 
                int country_Id = int.Parse(this.dropdown_Country.SelectedValue);
                if (country_Id == 14 || country_Id == 41 || country_Id == 237)
                {
                    this.p_State_Wrapper_Panel.Visible = true;
                }
                else
                {
                    this.p_State_Wrapper_Panel.Visible = false;
                }
            }
            else
            {
                this.p_State_Wrapper_Panel.Visible = false;
            }
        }
    }
}
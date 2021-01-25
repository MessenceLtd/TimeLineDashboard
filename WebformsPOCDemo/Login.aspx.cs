using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebformsPOCDemo.AppShared;

namespace WebformsPOCDemo
{
    public partial class Login : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void button_Login_Click(object sender, EventArgs e)
        {
            
            if (this.textbox_UserName.Text == "admin" && this.textbox_Password.Text == "123" )
            {
                // Compiled temporary basic credentials.. 
                // Store logged in user as administrator
                FormsAuthentication.SetAuthCookie("1:Administrator", false);
                this.Response.Redirect("default.aspx");
            }

        }
    }
}
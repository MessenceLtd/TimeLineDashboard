using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebformsPOCDemo
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void button_Login_Click(object sender, EventArgs e)
        {
            // Simulate logic logic 
            if (this.textbox_UserName.Text == "admin" && this.textbox_Password.Text == "123" )
            { 
                FormsAuthentication.SetAuthCookie("admin", this.checkbox_RememberMe.Checked);
                this.Response.Redirect("default.aspx");
            }

        }
    }
}
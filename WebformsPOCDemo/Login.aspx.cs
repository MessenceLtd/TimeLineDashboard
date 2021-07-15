using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using TimeLineDashboard.BusinessLogicLayer;
using TimeLineDashboard.Shared.Models;
using WebformsPOCDemo.AppShared;

namespace WebformsPOCDemo
{
    public partial class Login : BasePage
    {
        public bool is_RTL = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.is_RTL = Thread.CurrentThread.CurrentUICulture.TextInfo.IsRightToLeft;
        }

        protected void button_Login_Click(object sender, EventArgs e)
        {
            // validate if the credentials suits the first system usage (Should authenticate only if the users table is empty)
            // Search the database for the username and try to see if he entered a valid password with his random salt
            // If the password matches, Authenticate him with his application permission
            string l_Entered_Username = this.textbox_UserName.Text;
            string l_Entered_Password = this.textbox_Password.Text;

            this.textbox_UserName.Text = string.Empty;
            this.textbox_Password.Text = string.Empty;

            var user_DB_Details = Business_Logic_Layer_Facade.Instance.Users_Get_User_Details_By_Username_For_Authentication(l_Entered_Username);
            if (user_DB_Details!= null && user_DB_Details.User_Id > 0)
            {
                if (Business_Logic_Layer_Facade.Instance.Users_Is_Entered_Password_And_RandomSalt_Matches_DB_User_Details_Encrypted_Password(
                   l_Entered_Password, user_DB_Details.Encrypted_Password ,user_DB_Details.Encryption_Random_Salt 
                    ))
                {
                    string permission_Type_Code = user_DB_Details.App_Permission_Type_Id.ToString();
                    FormsAuthentication.SetAuthCookie(user_DB_Details.User_Id + ":" + permission_Type_Code, false);
                    this.Response.Cookies.Set(new HttpCookie("Logged_In_User_Full_Name", user_DB_Details.FullName_With_Email));

                    if ( string.IsNullOrEmpty( this.Request.QueryString["ReturnUrl"]))
                    {
                        this.Response.Redirect("default.aspx");
                    }
                    else
                    {
                        this.Response.Redirect(this.Request.QueryString["ReturnUrl"]);
                    }
                }
                else
                {
                    // The user has entered wrong password.
                }
            }
            else
            {
                // no username was found in the database for the entered username
                if (    l_Entered_Username == ConfigurationManager.AppSettings["First_App_Usage_Administrator_Username"] &&
                        l_Entered_Password == ConfigurationManager.AppSettings["First_App_Usage_Administrator_Password"])
                {
                    // The user has entered a valid first app usage credentials. Authenticate only if there are no users in the DB. 
                    // If there are any existing users, Display error message so that a user credential should be used and not first time adminstrator. (or send an email alert)
                    bool are_There_Any_Users_In_The_DB = Business_Logic_Layer_Facade.Instance.Users_Are_There_Any_Users_In_Database();
                    if (are_There_Any_Users_In_The_DB == false)
                    {
                        FormsAuthentication.SetAuthCookie(k_Administrator_FirstUsage_Permission_Type_Name_Default_User_ID + ":" + App_Permission_Type.Permission_Type.Application_Administrator.ToString(), false);
                        this.Response.Redirect("default.aspx");
                    }
                    else
                    {
                        // There is a user in the database. Access as first app usage admin is denied
                    }
                }
            }

        }
    }
}
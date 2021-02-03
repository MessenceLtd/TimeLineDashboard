using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using TimeLineDashboard.BusinessLogicLayer;
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
                    var permission_Type_Details = Business_Logic_Layer_Facade.Instance.App_Permission_Types_Get_By_Type_Id(user_DB_Details.App_Permission_Type_Id);
                    if (permission_Type_Details!= null && permission_Type_Details.App_Permission_Type_Id>0)
                    {
                        string permission_Type_Code = permission_Type_Details.App_Permission_Type_Code;
                        FormsAuthentication.SetAuthCookie(user_DB_Details.User_Id + ":" + permission_Type_Code, false);
                        this.Response.Cookies.Set(new HttpCookie("Logged_In_User_Full_Name", user_DB_Details.FullName_With_Email));
                        this.Response.Redirect("default.aspx");
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
                        FormsAuthentication.SetAuthCookie(k_Administrator_FirstUsage_Permission_Type_Name_Default_User_ID + ":" + k_Administrator_Permission_Type_Name, false);
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
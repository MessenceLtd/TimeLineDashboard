using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace WebformsPOCDemo.AppShared
{
    public class BasePage : Page
    {
        const string k_Administrator_Permission_Type_Name = "Administrator";

        private int _User_ID = -1;
        private string _s_User_Full_Name = string.Empty;

        public int User_ID
        {
            get
            {
                if (this._User_ID <= 0)
                {
                    //the cookie identity is stored in the format: {User_Id}:{Permission Type Name}
                    string user_Id_From_Formatted_Auth_Cookie = this.User.Identity.Name.Split(':')[0];
                    int.TryParse(user_Id_From_Formatted_Auth_Cookie, out this._User_ID);
                }

                return this._User_ID;
            }
        }

        public string Authenticated_User_Full_Name
        {
            get
            {
                if (this.User_ID <= 0)
                {
                    //return k_Administrator_Permission_Type_Name;
                    // throw exception -- unindenifed user
                }

                // Get the employee fullname from cookie after login
                if (string.IsNullOrEmpty(this._s_User_Full_Name))
                { 
                    this._s_User_Full_Name = this.Request.Cookies["Logged_In_User_Full_Name"].Value;
                }

                return this._s_User_Full_Name;
            }
        }

        public bool UserIsEmployee
        {
            get
            {
                // Get the permission from the authentication cookie that should be in format: {User_Id}:{Permission Type Name}
                return (this._User_ID > 0);
            }
        }

    }

    
}
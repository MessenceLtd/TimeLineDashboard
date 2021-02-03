﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace WebformsPOCDemo.AppShared
{
    public class BasePage : Page
    {
        protected const string k_Administrator_Permission_Type_Name = "Application_Administrator";
        protected const string k_DashboardTimeLine_Company_Employee_Permission_Type_Name = "DashboardTimeLine_Company_Employee";
        /// <summary>
        /// Administrator first usage permission type is for the first usage of the system untill a real administrator or employeeId is created with the appropriate permission group.
        /// Its userId will be 0 and the system will only authenticate if the users table is empty. 
        /// The username & password of the first usage is on the private app settings
        /// </summary>
        protected const string k_Administrator_FirstUsage_Permission_Type_Name = "DashboardTimeLine_Company_Employee";
        protected const int k_Administrator_FirstUsage_Permission_Type_Name_Default_User_ID = 0;

        private int _User_ID = -1;
        private string _s_User_Full_Name = string.Empty;

        public int Authenticated_User_ID
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
                if (this.Authenticated_User_ID <= 0)
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

        public bool User_Is_Employee
        {
            get
            {
                bool is_Admin = false;

                string[] user_Id_From_Formatted_Auth_Cookie_Values = this.User.Identity.Name.Split(':');
                if (user_Id_From_Formatted_Auth_Cookie_Values.Length > 1)
                {
                    if (user_Id_From_Formatted_Auth_Cookie_Values[1] == k_DashboardTimeLine_Company_Employee_Permission_Type_Name)
                    {
                        is_Admin = true;
                    }
                }

                return is_Admin;
            }
        }

        public bool User_Is_Administrator
        {
            get
            {
                bool is_Admin = false;

                string[] user_Id_From_Formatted_Auth_Cookie_Values = this.User.Identity.Name.Split(':');
                if (user_Id_From_Formatted_Auth_Cookie_Values.Length > 1)
                {
                    if (user_Id_From_Formatted_Auth_Cookie_Values[1] == k_Administrator_Permission_Type_Name)
                    {
                        is_Admin = true;
                    }
                }

                return is_Admin;
            }
        }

    }

    
}
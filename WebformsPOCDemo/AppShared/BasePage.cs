using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TimeLineDashboard.BusinessLogicLayer;
using TimeLineDashboard.Shared.Models;

namespace WebformsPOCDemo.AppShared
{
    public class BasePage : Page
    {
        public const int k_Records_Per_Page = 25;

        //protected const string k_Administrator_Permission_Type_Name = "Application_Administrator";
        //protected const string k_DashboardTimeLine_Company_Employee_Permission_Type_Name = "DashboardTimeLine_Company_Employee";
        /// <summary>
        /// Administrator first usage permission type is for the first usage of the system untill a real administrator or employeeId is created with the appropriate permission group.
        /// Its userId will be 0 and the system will only authenticate if the users table is empty. 
        /// The username & password of the first usage is on the private app settings
        /// </summary>
        //protected const string k_Administrator_FirstUsage_Permission_Type_Name = "DashboardTimeLine_Company_Employee";
        protected const int k_Administrator_FirstUsage_Permission_Type_Name_Default_User_ID = 0;

        private int _User_ID = -1;
        private string _s_User_Full_Name = string.Empty;

        protected override void InitializeCulture()
        {
            // check if language cookie is present and set it as current culture 
            Common_Tools.Change_Current_Thread_Culture_By_Language_Cookie();

            base.InitializeCulture();
        }


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

        public string Authenticated_Permission_Type_Code
        {
            get
            {
                string permission_Code_From_Authentication_Cookie = this.User.Identity.Name.Split(':')[1];
                return permission_Code_From_Authentication_Cookie;
            }
        }

        public App_Permission_Type Authenticated_Permission_Type
        {
            get
            {
                string l_Authenticated_Permission_Type_Code = this.Authenticated_Permission_Type_Code;

                App_Permission_Type app_Permission_To_Return 
                    = Business_Logic_Layer_Facade.Instance.
                        App_Permission_Types_Get_By_Permission_Type_Code(l_Authenticated_Permission_Type_Code);

                if (app_Permission_To_Return == null)
                {
                    throw new NullReferenceException("Permission '" + l_Authenticated_Permission_Type_Code + "' could not be initialized.");
                }

                return app_Permission_To_Return;
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

        public bool User_Is_Employee
        {
            get
            {
                bool is_Employee = false;

                string[] user_Id_From_Formatted_Auth_Cookie_Values = this.User.Identity.Name.Split(':');
                if (user_Id_From_Formatted_Auth_Cookie_Values.Length > 1)
                {
                    if (user_Id_From_Formatted_Auth_Cookie_Values[1] == App_Permission_Type.Permission_Type.DashboardTimeLine_Company_Employee.ToString())
                    {
                        is_Employee = true;
                    }
                }

                return is_Employee;
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
                    if (user_Id_From_Formatted_Auth_Cookie_Values[1] == App_Permission_Type.Permission_Type.Application_Administrator.ToString())
                    {
                        is_Admin = true;
                    }
                }

                return is_Admin;
            }
        }

        protected void Change_View_Mode_FormControls_Wrappers(bool is_View_ReadOnly)
        {
            // Search the current page for the controls that starts with : formControl_Wrapper_Edit  or formControl_Wrapper_ReadOnly
            // And change thier visiblity based on the current selected view mode parameter.
            for (int i=0; i< this.Controls.Count;i++)
            {
                if (!string.IsNullOrEmpty(this.Controls[i].ID))
                {
                    if (this.Controls[i].ID.StartsWith("formControl_Wrapper_Edit"))
                    {
                        this.Controls[i].Visible = !is_View_ReadOnly;
                    }

                    if (this.Controls[i].ID.StartsWith("formControl_Wrapper_ReadOnly"))
                    {
                        this.Controls[i].Visible = is_View_ReadOnly;
                    }
                }

                if (this.Controls[i].Controls.Count > 0)
                {
                    Change_View_Mode_FormControls_Wrappers(this.Controls[i], is_View_ReadOnly);
                }
            }
        }

        protected void Change_View_Mode_FormControls_Wrappers(Control control, bool is_View_ReadOnly)
        {
            // Search the current page for the controls that starts with : formControl_Wrapper_Edit  or formControl_Wrapper_ReadOnly
            // And change thier visiblity based on the current selected view mode parameter.
            for (int i = 0; i < control.Controls.Count; i++)
            {
                if (!string.IsNullOrEmpty(control.Controls[i].ID))
                {
                    if (control.Controls[i].ID.StartsWith("formControl_Wrapper_Edit"))
                    {
                        control.Controls[i].Visible = !is_View_ReadOnly;
                    }

                    if (control.Controls[i].ID.StartsWith("formControl_Wrapper_ReadOnly"))
                    {
                        control.Controls[i].Visible = is_View_ReadOnly;
                    }
                }

                if (control.Controls.Count > 0)
                {
                    Change_View_Mode_FormControls_Wrappers(control.Controls[i], is_View_ReadOnly);
                }
            }
        }


        protected void Build_Pagination_Pages(int Total_Records_Returned_From_DB, PlaceHolder ph_Pagination)
        {
            int Total_Pages = Total_Records_Returned_From_DB / k_Records_Per_Page;
            if (Total_Records_Returned_From_DB % k_Records_Per_Page > 0)
            {
                Total_Pages++;
            }

            if (Total_Pages > 1)
            {
                string requestedPage = this.Request.Path;

                ph_Pagination.Visible = true;

                int id = int.Parse(this.Request.QueryString["id"]);

                int Current_Page_Number = 1;
                if (!string.IsNullOrEmpty(this.Request.QueryString["page"]))
                {
                    Current_Page_Number = int.Parse(this.Request.QueryString["page"]);
                }
                

                if (Current_Page_Number == 1)
                {
                    ((HtmlGenericControl)ph_Pagination.FindControl("pagination_li_Previous")).Attributes["class"] = "page-item disabled";
                    ((HtmlGenericControl)ph_Pagination.FindControl("pagination_li_Previous")).InnerHtml = "<span class=\"page-link\">Previous</span>";
                }
                else
                {
                    ((HtmlGenericControl)ph_Pagination.FindControl("pagination_li_Previous")).Attributes["class"] = "page-item";
                    ((HtmlGenericControl)ph_Pagination.FindControl("pagination_li_Previous")).InnerHtml = "<a class=\"page-link\" href=\""+ requestedPage + "?id=" + id + "&page=" + (Current_Page_Number - 1) + "\">Previous</a>";
                }

                Control ph_Pagination_Links = ph_Pagination.FindControl("ph_Pagination_Links");

                for (int i = 1; i <= Total_Pages; i++)
                {
                    HtmlGenericControl liLink = new HtmlGenericControl("li");
                    liLink.Attributes["class"] = "page-item";

                    if (i == Current_Page_Number)
                    {
                        liLink.InnerHtml = "<span class=\"page-link\">" + i + "<!--<span class=\"sr-only\">(current)</span>--></span>";
                        liLink.Attributes["class"] += " active";
                    }
                    else
                    {

                        liLink.InnerHtml = "<a class=\"page-link\" href=\""+ requestedPage + "?id=" + id + "&page=" + i + "\">" + i + "</a>";
                    }

                    ph_Pagination_Links.Controls.Add(liLink);
                }

                if (Current_Page_Number == Total_Pages)
                {
                    ((HtmlGenericControl)ph_Pagination.FindControl("pagination_li_Next")).Attributes["class"] = "page-item disabled";
                    ((HtmlGenericControl)ph_Pagination.FindControl("pagination_li_Next")).InnerHtml = "<span class=\"page-link\">Next</span>";
                }
                else
                {
                    ((HtmlGenericControl)ph_Pagination.FindControl("pagination_li_Next")).Attributes["class"] = "page-item";
                    ((HtmlGenericControl)ph_Pagination.FindControl("pagination_li_Next")).InnerHtml = "<a class=\"page-link\" href=\"" + requestedPage + "?id=" + id + "&page=" + (Current_Page_Number + 1) + "\">Next</a>";
                }
            }
            else
            {
                ph_Pagination.Visible = false;
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebformsPOCDemo
{
    public partial class wuc_Top_Menu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.SetCurrentVisitedLink();
                
            }
        }

        private void Build_Top_Menu()
        {

        }

        private void SetCurrentVisitedLink()
        {
            // Get the current requested web page from url.
            string requestedUrl = this.Request.Url.LocalPath;

            if (requestedUrl.StartsWith(@"/") && requestedUrl.Length > 1)
            {
                requestedUrl = requestedUrl.Substring(requestedUrl.IndexOf(@"/") + 1);
            }

            requestedUrl = requestedUrl.ToLower();
            string requestedUrlWithoutExtension = requestedUrl.Replace(".aspx", "");

            if (!string.IsNullOrEmpty(requestedUrl))
            {
                bool v_Found_Menu_Item_To_Set_As_Active_Css_Class = false;

                for (int i = 0; i < this.panel_HeaderLinks.Controls.Count; i++)
                {
                    if (this.panel_HeaderLinks.Controls[i] is PlaceHolder)
                    {
                        continue;
                    }

                    if (this.panel_HeaderLinks.Controls[i] is HyperLink)
                    {
                        if (((HyperLink)this.panel_HeaderLinks.Controls[i]).CssClass.IndexOf("dropdown-toggle") > -1)
                        {
                            if ((((HyperLink)this.panel_HeaderLinks.Controls[i]).NavigateUrl) == ("#" + requestedUrlWithoutExtension))
                            {
                                ((HyperLink)this.panel_HeaderLinks.Controls[i]).CssClass += " active";
                                v_Found_Menu_Item_To_Set_As_Active_Css_Class = true;
                                break;
                            }
                        }
                        else
                        {
                            if ((((HyperLink)this.panel_HeaderLinks.Controls[i]).NavigateUrl) == requestedUrl)
                            {
                                ((HyperLink)this.panel_HeaderLinks.Controls[i]).CssClass += " active";
                                v_Found_Menu_Item_To_Set_As_Active_Css_Class = true;
                                break;
                            }
                        }
                    }
                }

                if (!v_Found_Menu_Item_To_Set_As_Active_Css_Class)
                {
                    // It is possible that the current requested page is an inner submenu .. so hard code make sure its focused 
                    if (requestedUrl == "add_user.aspx") this.hyperlink_Users.CssClass += " active";
                    if (requestedUrl == "add_client.aspx") this.hyperlink_Clients.CssClass += " active";
                    if (requestedUrl == "add_supplier.aspx") this.hyperlink_Suppliers.CssClass += " active";
                    if (requestedUrl == "add_expense.aspx") this.hyperlink_Expenses.CssClass += " active";
                    if (requestedUrl == "add_invoice.aspx") this.hyperlink_Invoices.CssClass += " active";
                    if (requestedUrl == "add_document.aspx") this.hyperlink_Documents.CssClass += " active";
                    if (requestedUrl == "add_bankaccount.aspx") this.hyperlink_BankAccounts.CssClass += " active";

                    if (requestedUrl == "manage_user.aspx") this.hyperlink_Users.CssClass += " active";
                    if (requestedUrl == "manage_client.aspx") this.hyperlink_Clients.CssClass += " active";
                    if (requestedUrl == "manage_supplier.aspx") this.hyperlink_Suppliers.CssClass += " active";
                    if (requestedUrl == "manage_expense.aspx") this.hyperlink_Expenses.CssClass += " active";
                    if (requestedUrl == "manage_invoice.aspx") this.hyperlink_Invoices.CssClass += " active";
                    if (requestedUrl == "manage_document.aspx") this.hyperlink_Documents.CssClass += " active";
                    if (requestedUrl == "manage_bankaccount.aspx") this.hyperlink_BankAccounts.CssClass += " active";
                }
            }
            else
            {
                this.hyperlink_MainPage.CssClass += " active";
            }
        }

        protected void linkbutton_LogOff_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            this.Response.Redirect("login.aspx");
        }

        protected void button_Language_Swap_Event_Click(object sender, EventArgs e)
        {
            string current_Requested_Page_Url = this.Request.Url.PathAndQuery.ToString();

            string new_Lanauge_Code = this.hidden_New_Language_To_Swap.Value;

            Common_Tools.Set_Language_Cookie(new_Lanauge_Code);

            Response.Redirect(current_Requested_Page_Url);
        }
    }
}
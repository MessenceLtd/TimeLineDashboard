using System;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace WebformsPOCDemo
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.SetCurrentVisitedLink();
            }
        }

        private void SetCurrentVisitedLink()
        {
            // Get the current requested web page from url.
            string requestedUrl = this.Request.Url.LocalPath;

            if (requestedUrl.StartsWith(@"/") && requestedUrl.Length>1)
            {
                requestedUrl = requestedUrl.Substring(requestedUrl.IndexOf(@"/") + 1  );
            }

            requestedUrl = requestedUrl.ToLower();

            if (!string.IsNullOrEmpty(requestedUrl))
            {
                for (int i = 0; i < this.panel_HeaderLinks.Controls.Count; i++)
                {
                    if (this.panel_HeaderLinks.Controls[i] is HyperLink)
                    {
                        if (((HyperLink)this.panel_HeaderLinks.Controls[i]).NavigateUrl == requestedUrl)
                        {
                            ((HyperLink)this.panel_HeaderLinks.Controls[i]).CssClass = "active";
                        }
                    }
                }
            }
            else
            {
                this.hyperlink_MainPage.CssClass = "active";
            }
        }

        protected void linkbutton_LogOff_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            this.Response.Redirect("login.aspx");
        }
    }
}
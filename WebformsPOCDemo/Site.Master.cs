using System;
using System.Threading;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace WebformsPOCDemo
{
    public partial class Site : System.Web.UI.MasterPage
    {
        public bool is_RTL = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            is_RTL = Thread.CurrentThread.CurrentUICulture.TextInfo.IsRightToLeft;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebformsPOCDemo
{
    public partial class wuc_Breadcrumbs_Navigation : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Build_Site_Map();
        }

        private void Build_Site_Map()
        {
            string requestedUrl = this.Request.Url.LocalPath;

            if (requestedUrl.StartsWith(@"/") && requestedUrl.Length > 1)
            {
                requestedUrl = requestedUrl.Substring(requestedUrl.IndexOf(@"/") + 1);
            }

            requestedUrl = requestedUrl.ToLower();
            string requestedUrl_Only_Page_Name = requestedUrl;
            if (requestedUrl_Only_Page_Name.IndexOf("?") > -1 )
            {
                requestedUrl_Only_Page_Name = requestedUrl_Only_Page_Name.Substring(0, requestedUrl_Only_Page_Name.IndexOf("?"));
            }
            if (requestedUrl_Only_Page_Name.IndexOf(".") > -1)
            {
                requestedUrl_Only_Page_Name = requestedUrl_Only_Page_Name.Substring(0, requestedUrl_Only_Page_Name.IndexOf("."));
            }

            this.phBreadCrumbs.Controls.Clear();

            if (requestedUrl_Only_Page_Name != "" && 
                requestedUrl_Only_Page_Name != "default" && 
                requestedUrl_Only_Page_Name != "home" )
            {
                this.Add_Root_Node();
                this.Add_Navigation_Seperator_Node();

                switch (requestedUrl_Only_Page_Name)
                {
                    case "add_bankaccount":
                        this.Add_Navigation_Link_Node("list_bankaccounts", "list_bankaccounts.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "add_client":
                        this.Add_Navigation_Link_Node("list_clients", "list_clients.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "add_document":
                        this.Add_Navigation_Link_Node("list_documents", "list_documents.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "add_expense":
                        this.Add_Navigation_Link_Node("list_expenses", "list_expenses.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "add_invoice":
                        this.Add_Navigation_Link_Node("list_invoices", "list_invoices.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "add_supplier":
                        this.Add_Navigation_Link_Node("list_suppliers", "list_suppliers.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "add_user":
                        this.Add_Navigation_Link_Node("list_users", "list_users.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;
                    
                    case "list_bankaccounts":
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "list_clients":
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "list_creditcards":
                        this.Add_Navigation_Link_Node("list_bankaccounts", "list_bankaccounts.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "list_creditcardsstatements":
                        this.Add_Navigation_Link_Node("list_bankaccounts", "list_bankaccounts.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "list_documents":
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "list_expenses":
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "list_invoices":
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "list_suppliers":
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "list_users":
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "manage_bankaccount":
                        this.Add_Navigation_Link_Node("list_bankaccounts", "list_bankaccounts.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "manage_bankaccounttransaction":
                        this.Add_Navigation_Link_Node("list_bankaccounts", "list_bankaccounts.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "manage_bankaccounttransactions":
                        this.Add_Navigation_Link_Node("list_bankaccounts", "list_bankaccounts.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "manage_client":
                        this.Add_Navigation_Link_Node("list_clients", "list_clients.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "manage_creditcard":
                        this.Add_Navigation_Link_Node("list_bankaccounts", "list_bankaccounts.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Link_Node("list_creditcards", "list_creditcards.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "manage_creditcardstatement":
                        this.Add_Navigation_Link_Node("list_bankaccounts", "list_bankaccounts.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Link_Node("list_creditcardsstatements", "list_creditcardsstatements.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "manage_creditcardstatementtransaction":
                        this.Add_Navigation_Link_Node("list_bankaccounts", "list_bankaccounts.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Link_Node("list_creditcardsstatements", "list_creditcardsstatements.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "manage_document":
                        this.Add_Navigation_Link_Node("list_documents", "list_documents.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "manage_expense":
                        this.Add_Navigation_Link_Node("list_expenses", "list_expenses.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "manage_invoice":
                        this.Add_Navigation_Link_Node("list_invoices", "list_invoices.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "manage_supplier":
                        this.Add_Navigation_Link_Node("list_suppliers", "list_suppliers.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;

                    case "manage_user":
                        this.Add_Navigation_Link_Node("list_users", "list_users.aspx");
                        this.Add_Navigation_Seperator_Node();
                        this.Add_Navigation_Text_Node(requestedUrl_Only_Page_Name);
                        break;
                }
            }
            else
            {
                this.panel_BreadCrumbs.Visible = false;
            }
        }

        private void Add_Root_Node()
        {
            LiteralControl ltrlHome_Node = new LiteralControl();
            ltrlHome_Node.Text = "<a href=\"default.aspx\">" + Resources.SiteCommon.Link_To_home + "</a>";
            this.phBreadCrumbs.Controls.Add(ltrlHome_Node);
        }

        private void Add_Navigation_Link_Node(string requestedUrl_Only_Page_Name, string url)
        {
            LiteralControl ltrl_Node = new LiteralControl();
            ltrl_Node.Text = "<a href=\""+ url + "\">" + GetGlobalResourceObject("SiteCommon", "Link_To_" + requestedUrl_Only_Page_Name) + "</a>";
            this.phBreadCrumbs.Controls.Add(ltrl_Node);
        }

        private void Add_Navigation_Text_Node(string requestedUrl_Only_Page_Name)
        {
            LiteralControl ltrl_Node = new LiteralControl();
            ltrl_Node.Text = "<span>" + GetGlobalResourceObject("SiteCommon", "Link_To_" + requestedUrl_Only_Page_Name) + "</span>";
            this.phBreadCrumbs.Controls.Add(ltrl_Node);
        }

        private void Add_Navigation_Seperator_Node()
        {
            LiteralControl ltrl_Node = new LiteralControl();
            ltrl_Node.Text = "<span class=\"seperator\">" + GetGlobalResourceObject("SiteCommon", "Link_To_seperator") + "</span>";
            this.phBreadCrumbs.Controls.Add(ltrl_Node);
        }
    }
}
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wuc_Top_Menu.ascx.cs" Inherits="WebformsPOCDemo.wuc_Top_Menu" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <%--<a class="navbar-brand" href="#">Navbar</a>--%>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mb-2 mb-lg-0">
                <asp:PlaceHolder ID="panel_HeaderLinks" runat="server">

                    <li class="nav-item">
                        <asp:HyperLink runat="server" ID="hyperlink_MainPage" CssClass="nav-link" ClientIDMode="Static" NavigateUrl="default.aspx" meta:resourcekey="hyperlink_MainPageResource1">Home</asp:HyperLink>
                    </li>
                    <li class="nav-item dropdown">
                        <asp:HyperLink runat="server" ID="hyperlink_Users" CssClass="nav-link dropdown-toggle" data-toggle="dropdown" ClientIDMode="Static" NavigateUrl="#list_users" meta:resourcekey="hyperlink_UsersResource1">Users</asp:HyperLink>
                        <asp:PlaceHolder runat="server" ID="placeHolder_Users_Links">
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="list_users.aspx"><%= Resources.SiteCommon.Users_List %></a></li>
                                <li><a class="dropdown-item" href="add_user.aspx"><%= Resources.SiteCommon.Add_New_User %></a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </asp:PlaceHolder>
                    </li>
                    <li class="nav-item dropdown">
                        <asp:HyperLink runat="server" ID="hyperlink_Clients" CssClass="nav-link dropdown-toggle" 
                            data-toggle="dropdown" ClientIDMode="Static" NavigateUrl="#list_clients" meta:resourcekey="hyperlink_ClientsResource1">Clients</asp:HyperLink>
                        <asp:PlaceHolder runat="server" ID="placeHolder_Clients_Links">
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="list_clients.aspx"><%= Resources.SiteCommon.Clients_List %></a></li>
                                <li><a class="dropdown-item" href="add_client.aspx"><%= Resources.SiteCommon.Add_New_Client %></a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </asp:PlaceHolder>
                    </li>
                    <li class="nav-item dropdown">
                        <asp:HyperLink runat="server" ID="hyperlink_Suppliers" CssClass="nav-link dropdown-toggle" 
                            data-toggle="dropdown" ClientIDMode="Static" NavigateUrl="#list_suppliers" meta:resourcekey="hyperlink_SuppliersResource1">Suppliers</asp:HyperLink>
                        <asp:PlaceHolder runat="server" ID="placeHolder_Suppliers_Links">
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="list_suppliers.aspx"><%= Resources.SiteCommon.Suppliers_List %></a></li>
                                <li><a class="dropdown-item" href="add_supplier.aspx"><%= Resources.SiteCommon.Add_New_Supplier %></a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </asp:PlaceHolder>
                    </li>
                    <li class="nav-item dropdown">
                        <asp:HyperLink runat="server" ID="hyperlink_Expenses" CssClass="nav-link dropdown-toggle" 
                            data-toggle="dropdown" ClientIDMode="Static" NavigateUrl="#list_expenses" meta:resourcekey="hyperlink_ExpensesResource1">Expenses</asp:HyperLink>
                        <asp:PlaceHolder runat="server" ID="placeHolder_Expenses_Links">
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="list_expenses.aspx"><%= Resources.SiteCommon.Expenses_List %></a></li>
                                <li><a class="dropdown-item" href="add_expense.aspx"><%= Resources.SiteCommon.Add_New_Expense %></a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </asp:PlaceHolder>
                    </li>
                    <li class="nav-item dropdown">
                        <asp:HyperLink runat="server" ID="hyperlink_Invoices" CssClass="nav-link dropdown-toggle" data-toggle="dropdown" ClientIDMode="Static" NavigateUrl="#list_invoices" meta:resourcekey="hyperlink_InvoicesResource1">Invoices</asp:HyperLink>
                        <asp:PlaceHolder runat="server" ID="placeHolder_Invoices_Links">
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="list_invoices.aspx"><%= Resources.SiteCommon.Invoices_List %></a></li>
                                <li><a class="dropdown-item" href="add_invoice.aspx"><%= Resources.SiteCommon.Add_New_Invoice %></a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </asp:PlaceHolder>
                    </li>
                    <li class="nav-item dropdown">
                        <asp:HyperLink runat="server" ID="hyperlink_Documents" CssClass="nav-link dropdown-toggle" data-toggle="dropdown" ClientIDMode="Static" NavigateUrl="#list_documents" meta:resourcekey="hyperlink_DocumentsResource1">Documents</asp:HyperLink>
                        <asp:PlaceHolder runat="server" ID="placeHolder_Documents_Links">
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="list_documents.aspx"><%= Resources.SiteCommon.Documents_List %></a></li>
                                <li><a class="dropdown-item" href="add_document.aspx"><%= Resources.SiteCommon.Add_New_Document %></a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </asp:PlaceHolder>
                    </li>
                    <li class="nav-item dropdown">
                        <asp:HyperLink runat="server" ID="hyperlink_BankAccounts" CssClass="nav-link dropdown-toggle" data-toggle="dropdown" ClientIDMode="Static" NavigateUrl="#list_bankaccounts" meta:resourcekey="hyperlink_BankAccountsResource1">Bank Accounts</asp:HyperLink>
                        <asp:PlaceHolder runat="server" ID="placeHolder_BankAccounts_Links">
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="list_bankaccounts.aspx"><%= Resources.SiteCommon.Bank_Accounts_List %></a></li>
                                <li><a class="dropdown-item" href="add_bankaccount.aspx"><%= Resources.SiteCommon.Add_New_Bank_Account %></a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </asp:PlaceHolder>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink runat="server" ID="hyperlink_Reports" CssClass="nav-link disabled" NavigateUrl="#" meta:resourcekey="hyperlink_ReportsResource1">Reports</asp:HyperLink>
                    </li>
                    <%--<li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Dropdown</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#">Disabled</a>
                        </li>--%>
                        
                </asp:PlaceHolder>
            </ul>

            <ul class="navbar-nav Language_Wrapper">
                <li class="nav-item dropdown">
                    <asp:HyperLink runat="server" ID="hyperlink_Change_Language" CssClass="nav-link dropdown-toggle" 
                        data-toggle="dropdown" ClientIDMode="Static" NavigateUrl="#ChangeLang"><%= Resources.SiteCommon.Language %></asp:HyperLink>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="javascript:Swap_Sys_Language('en')"><img src="/Images/Languages/en.svg" height="26" width="26" border="0" /> <%= Resources.SiteCommon.English %></a></li>
                        <li><a class="dropdown-item" href="javascript:Swap_Sys_Language('he')"><img src="/Images/Languages/he.svg" height="26" width="26" border="0" /> <%= Resources.SiteCommon.Hebrew %></a></li>
                    </ul>
                </li>
            </ul>

            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" id="darkMode" onkeypress="return toggleDarkModeFromKeyBoard(event)">
                <label class="form-check-label" for="darkMode"><%= Resources.SiteCommon.Dark_Mode %></label>
            </div>
            <ul class="navbar-nav px-3">
                <li class="nav-item text-nowrap">
                    <asp:LinkButton runat="server" ID="linkbutton_LogOff" CssClass="nav-link" OnClick="linkbutton_LogOff_Click" CausesValidation="False" Text="Log Off" ClientIDMode="Static" meta:resourcekey="linkbutton_LogOffResource1"></asp:LinkButton>
                </li>
            </ul>
        </div>
    </div>
    <div class="hidden">
        <asp:button runat="server" ClientIDMode="Static" ID="button_Language_Swap_Event" Text="swap language" OnClick="button_Language_Swap_Event_Click" />
        <asp:HiddenField runat="server" ClientIDMode="Static" ID="hidden_New_Language_To_Swap" />
        <asp:HiddenField runat="server" ClientIDMode="Static" ID="hidden_Current_Language" />
    </div>
</nav>


<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wuc_Top_Menu.ascx.cs" Inherits="WebformsPOCDemo.wuc_Top_Menu" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <%--<a class="navbar-brand" href="#">Navbar</a>--%>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto mb-2 mb-lg-0">
                <asp:PlaceHolder ID="panel_HeaderLinks" runat="server">

                    <li class="nav-item">
                        <asp:HyperLink runat="server" ID="hyperlink_MainPage" CssClass="nav-link" ClientIDMode="Static" NavigateUrl="default.aspx">Home</asp:HyperLink>
                    </li>
                    <li class="nav-item dropdown">
                        <asp:HyperLink runat="server" ID="hyperlink_Users" CssClass="nav-link dropdown-toggle" data-toggle="dropdown" ClientIDMode="Static" NavigateUrl="#list_users">Users</asp:HyperLink>
                        <asp:PlaceHolder runat="server" ID="placeHolder_Users_Links">
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="list_users.aspx">Users list</a></li>
                                <li><a class="dropdown-item" href="add_user.aspx">Add new user</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </asp:PlaceHolder>
                    </li>
                    <li class="nav-item dropdown">
                        <asp:HyperLink runat="server" ID="hyperlink_Clients" CssClass="nav-link dropdown-toggle" 
                            data-toggle="dropdown" ClientIDMode="Static" NavigateUrl="#list_clients">Clients</asp:HyperLink>
                        <asp:PlaceHolder runat="server" ID="placeHolder_Clients_Links">
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="list_clients.aspx">Clients list</a></li>
                                <li><a class="dropdown-item" href="add_client.aspx">Add new client</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </asp:PlaceHolder>
                    </li>
                    <li class="nav-item dropdown">
                        <asp:HyperLink runat="server" ID="hyperlink_Suppliers" CssClass="nav-link dropdown-toggle" 
                            data-toggle="dropdown" ClientIDMode="Static" NavigateUrl="#list_suppliers">Suppliers</asp:HyperLink>
                        <asp:PlaceHolder runat="server" ID="placeHolder_Suppliers_Links">
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="list_suppliers.aspx">Suppliers list</a></li>
                                <li><a class="dropdown-item" href="add_supplier.aspx">Add new supplier</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </asp:PlaceHolder>
                    </li>
                    <li class="nav-item dropdown">
                        <asp:HyperLink runat="server" ID="hyperlink_Expenses" CssClass="nav-link dropdown-toggle" 
                            data-toggle="dropdown" ClientIDMode="Static" NavigateUrl="#list_expenses">Expenses</asp:HyperLink>
                        <asp:PlaceHolder runat="server" ID="placeHolder_Expenses_Links">
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="list_expenses.aspx">Expenses list</a></li>
                                <li><a class="dropdown-item" href="add_expense.aspx">Add new expense</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </asp:PlaceHolder>
                    </li>
                    <li class="nav-item dropdown">
                        <asp:HyperLink runat="server" ID="hyperlink_Invoices" CssClass="nav-link dropdown-toggle" data-toggle="dropdown" ClientIDMode="Static" NavigateUrl="#list_invoices">Invoices</asp:HyperLink>
                        <asp:PlaceHolder runat="server" ID="placeHolder_Invoices_Links">
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="list_invoices.aspx">Invoices list</a></li>
                                <li><a class="dropdown-item" href="add_invoice.aspx">Add new invoice</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </asp:PlaceHolder>
                    </li>
                    <li class="nav-item dropdown">
                        <asp:HyperLink runat="server" ID="hyperlink_Documents" CssClass="nav-link dropdown-toggle" data-toggle="dropdown" ClientIDMode="Static" NavigateUrl="#list_documents">Documents</asp:HyperLink>
                        <asp:PlaceHolder runat="server" ID="placeHolder_Documents_Links">
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="list_documents.aspx">Documents list</a></li>
                                <li><a class="dropdown-item" href="add_document.aspx">Add new document</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </asp:PlaceHolder>
                    </li>
                    <li class="nav-item dropdown">
                        <asp:HyperLink runat="server" ID="hyperlink_BankAccounts" CssClass="nav-link dropdown-toggle" data-toggle="dropdown" ClientIDMode="Static" NavigateUrl="#list_bankaccounts">Bank Accounts</asp:HyperLink>
                        <asp:PlaceHolder runat="server" ID="placeHolder_BankAccounts_Links">
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="list_bankaccounts.aspx">Bank Accounts list</a></li>
                                <li><a class="dropdown-item" href="add_bankaccount.aspx">Add new bank account</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </asp:PlaceHolder>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink runat="server" ID="hyperlink_Reports" CssClass="nav-link disabled" NavigateUrl="#">Reports</asp:HyperLink>
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

            <div class="form-check form-switch">

                <input class="form-check-input" type="checkbox" id="darkMode" onkeypress="return toggleDarkModeFromKeyBoard(event)">
                <label class="form-check-label" for="darkMode">Dark Mode</label>
            </div>
            <ul class="navbar-nav px-3">
                <li class="nav-item text-nowrap">
                    <asp:LinkButton runat="server" ID="linkbutton_LogOff" CssClass="nav-link" OnClick="linkbutton_LogOff_Click" CausesValidation="false" Text="Log Off" ClientIDMode="Static"></asp:LinkButton>
                </li>
            </ul>

        </div>
    </div>
</nav>

<script type="text/javascript">
    
    var darkModeOn = false;

    function createStorage(name, value) {
        localStorage.setItem(name, value);
    }

    function readStorage(name) {
        return localStorage.getItem(name);
    }

    function toggleDarkModeFromKeyBoard(e)
    {
        if (e.keyCode == 13) // return key
        {
            toggleDarkMode();
        }

        if (e.keyCode == 32) // space key
        {
            e.preventDefault();
        }

        return false;
    }

    function toggleDarkMode(e)
    {
        if (document.body.classList.contains("dark-mode")) {
            document.body.classList.remove("dark-mode");
            darkModeOn = false;
            createStorage("my_preferredMode", "light-mode");
            document.getElementById('darkMode').checked = false;
        } else {
            document.body.classList.add("dark-mode");
            darkModeOn = true;
            createStorage("my_preferredMode", "dark-mode");
            document.getElementById('darkMode').checked = true;
        }
    }

    document.addEventListener("DOMContentLoaded", function (event) {

        document.getElementById("darkMode").addEventListener('change', toggleDarkMode);

    });

    

    document.addEventListener("DOMContentLoaded", function () {
        if (readStorage("my_preferredMode")) {
            if (readStorage("my_preferredMode") == "dark-mode") {
                darkModeOn = true;
            } else {
                darkModeOn = false;
            }
        } else {
            if (window.matchMedia && window.matchMedia("(prefers-color-scheme: dark)").matches) {
                darkModeOn = true;
            } else {
                if (document.body.classList.contains("dark-mode")) {
                    darkModeOn = true;
                } else {
                    darkModeOn = false;
                }
            }
        }

        if (darkModeOn) {
            if (!document.body.classList.contains("dark-mode")) {
                document.body.classList.add("dark-mode");
            }
            document.getElementById("darkMode").checked = true;
        } else {
            if (document.body.classList.contains("dark-mode")) {
                document.body.classList.remove("dark-mode");
            }
        }
    });
</script>

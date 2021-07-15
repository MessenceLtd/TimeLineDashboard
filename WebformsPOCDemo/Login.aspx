<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebformsPOCDemo.Login" Culture="auto" UICulture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%= Resources.SiteCommon.Application_Title %></title>


    <% if (is_RTL) { %>
        <link href="/CSS/bootstrap/bootstrap.rtl.css" rel="stylesheet" />
        <link href="/CSS/bootstrap/bootstrap-reboot.rtl.css" rel="stylesheet" />
    <%} else { %>
        <link href="/CSS/bootstrap/bootstrap.css" rel="stylesheet" />
        <link href="/CSS/bootstrap/bootstrap-reboot.css" rel="stylesheet" />
    <%} %>

    <link href="/CSS/bootstrap/dark-mode.css" rel="stylesheet" />
    <link href="/CSS/Main.css" rel="stylesheet" />
    <link href="/CSS/Login.css" rel="stylesheet" />

    <% if (is_RTL) { %>
        <link href="/CSS/Main.rtl.css" rel="stylesheet" />
    <%}%>

    <script src="/JS/darkmode.js" type="text/javascript"></script>

</head>
<body class="text-center">
    <main class="form-signin">
        <form id="form1" runat="server">

            <h1 class="h3 mb-3 fw-normal"><%= Resources.SiteCommon.Login_Page_Please_Sign_In %></h1>

            <div class="form-floating">
                <asp:TextBox runat="server" ID="textbox_UserName" CssClass="form-control" placeholder="<%$ Resources:SiteCommon, Login_Page_Username %>"></asp:TextBox>
                <label for="textbox_UserName"><%= Resources.SiteCommon.Username %></label>
            </div>
            <div class="form-floating">
                <asp:TextBox runat="server" ID="textbox_Password" CssClass="form-control" TextMode="Password" placeholder="<%$ Resources:SiteCommon, Login_Page_Password %>"></asp:TextBox>
                <label for="textbox_UserName"><%= Resources.SiteCommon.Password %></label>
            </div>

            <div class="RememberMe mb-3">       
                <input type="checkbox" class="form-check-input" id="ui_RememberMe" />
                <label class="form-check-label" for="ui_RememberMe"><%= Resources.SiteCommon.Login_Page_Remember_Me %></label>
                <asp:CheckBox runat="server" ID="checkbox_RememberMe" style="display:none" />
            </div>

            <asp:Button runat="server" ID="button_Login" CssClass="w-50 btn btn-lg btn-primary" OnClick="button_Login_Click" 
                Text="<%$ Resources:SiteCommon, Login_Page_Button_Login %>" />
        </form>
    </main>
</body>
</html>

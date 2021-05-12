<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebformsPOCDemo.Login" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="CSS/bootstrap/bootstrap.css" rel="stylesheet" />

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>

    <link href="CSS/Login.css" rel="stylesheet" />
    <script src="/JS/darkmode.js" type="text/javascript"></script>
    <link href="CSS/bootstrap/dark-mode.css" rel="stylesheet" />

</head>
<body class="text-center">
    <main class="form-signin">
        <form id="form1" runat="server">

            <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

            <div class="form-floating">
                <asp:TextBox runat="server" ID="textbox_UserName" CssClass="form-control" placeholder="Username"></asp:TextBox>
                <label for="textbox_UserName"><%= Resources.SiteCommon.Username %></label>
            </div>
            <div class="form-floating">
                <asp:TextBox runat="server" ID="textbox_Password" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                <label for="textbox_UserName"><%= Resources.SiteCommon.Password %></label>
            </div>

            <div class="RememberMe mb-3">       
                <input type="checkbox" class="form-check-input" id="ui_RememberMe" />
                <label class="form-check-label" for="ui_RememberMe">Remember Me</label>
                <asp:CheckBox runat="server" ID="checkbox_RememberMe" style="display:none" />
            </div>

            <asp:Button runat="server" ID="button_Login" CssClass="w-50 btn btn-lg btn-primary" OnClick="button_Login_Click" Text="Login" meta:resourcekey="button_LoginResource1" />
        </form>
    </main>
</body>
</html>

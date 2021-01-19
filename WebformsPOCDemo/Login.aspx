<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebformsPOCDemo.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div>

                <label for="textbox_UserName">Username</label>
                <asp:TextBox runat="server" ID="textbox_UserName"></asp:TextBox>
                <br />
                <label for="textbox_UserName">Password</label>
                <asp:TextBox runat="server" ID="textbox_Password"></asp:TextBox>
                <br />
                <asp:CheckBox runat="server" ID="checkbox_RememberMe" Text="Remember Me!" />
                <br />
                <asp:Button runat="server" ID="button_Login" OnClick="button_Login_Click" Text="Login" />

            </div>
        </div>
    </form>
</body>
</html>

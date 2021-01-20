<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="WebformsPOCDemo.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links">       
        <asp:HyperLink runat="server" Text="Add New User" NavigateUrl="Add_User.aspx"></asp:HyperLink>
    </asp:Panel>


    Users list will go here with all the details and stuff
    <br /><br />
    <hr />
    <br /><br />
    <asp:Label runat="server" ID="lbl_Users_List_Search_Label">Enter Search Criteria:</asp:Label> 
    <asp:TextBox runat="server" ID="textbox_Search_Criteria"></asp:TextBox>
    &nbsp;
    <asp:Button runat="server" ID="button_Search_Users" OnClick="button_Search_Users_Click" Text="Search" />

    <asp:DataGrid runat="server" ID="dataGrid_Users_List">
        
        <Columns>
            <asp:BoundColumn DataField="User_Id" HeaderText="ID"></asp:BoundColumn>
            <asp:BoundColumn DataField="Email" HeaderText="Email"></asp:BoundColumn>
            <asp:BoundColumn DataField="Username" HeaderText="Username"></asp:BoundColumn>
        </Columns>

    </asp:DataGrid>

</asp:Content>

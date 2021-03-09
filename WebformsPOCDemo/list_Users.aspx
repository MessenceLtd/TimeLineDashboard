<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list_Users.aspx.cs" Inherits="WebformsPOCDemo.Users" %>
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
    <label for="<%=textbox_Search_Criteria.ClientID %>">Enter Search Criteria:</label> 
    <asp:TextBox runat="server" ID="textbox_Search_Criteria" ClientIDMode="Static" Width="200px"></asp:TextBox>
    &nbsp;&nbsp;
    <asp:Button runat="server" ID="button_Search_Users" OnClick="button_Search_Users_Click" Text="Search" CssClass="btn btn-primary" />

    <asp:UpdatePanel runat="server" ID="updatePanel_Search_Result">

        <ContentTemplate>

            <asp:DataGrid runat="server" ID="dataGrid_Users_List" AutoGenerateColumns="false" CssClass="table table-striped table-hover" Visible="false">
                <Columns>
                    <asp:BoundColumn DataField="User_Id" HeaderText="ID"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Email" HeaderText="Email"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Username" HeaderText="Username"></asp:BoundColumn>
                </Columns>
            </asp:DataGrid>

            <hr />
            <asp:Panel runat="server" ID="panel_Please_Search" class="alert alert-primary">
                <label for="<%=textbox_Search_Criteria.ClientID %>">Please use the search criteria to search for users.</label>
            </asp:Panel>

            <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="false" class="alert alert-warning">
                No results were found!
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="button_Search_Users" />
        </Triggers>

    </asp:UpdatePanel>

    


</asp:Content>

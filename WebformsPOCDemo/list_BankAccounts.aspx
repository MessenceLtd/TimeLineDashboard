<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list_BankAccounts.aspx.cs" Inherits="WebformsPOCDemo.list_BankAccounts" culture="auto" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links">
        <asp:HyperLink runat="server" Text="<%$ Resources:SiteCommon, Add_New_Bank_Account %>" NavigateUrl="Add_BankAccount.aspx"></asp:HyperLink>
    </asp:Panel>

    <hr />
    <br />

    <asp:Button runat="server" ID="button_Search_Bank_Accounts" OnClick="button_Search_Bank_Accounts_Click" Text="<%$ Resources:SiteCommon, Refresh %>" CssClass="btn btn-primary" />

    <asp:UpdatePanel runat="server" ID="updatePanel_Search_Result">

        <ContentTemplate>
            <hr />
            <asp:DataGrid runat="server" ID="dataGrid_BankAccounts_List" AutoGenerateColumns="False" CssClass="CustomTable" Visible="False">
                <Columns>
                    <asp:HyperLinkColumn DataTextField="Bank_Account_Id" HeaderText="ID"
                        DataNavigateUrlField="Bank_Account_Id" DataNavigateUrlFormatString="manage_BankAccount.aspx?id={0}" Visible="False"></asp:HyperLinkColumn>
                    <asp:HyperLinkColumn DataTextField="Account_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Name %>" DataNavigateUrlField="Bank_Account_Id"
                        DataNavigateUrlFormatString="manage_BankAccount.aspx?id={0}"></asp:HyperLinkColumn>

                    <asp:BoundColumn DataField="Branch_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Branch_Name %>"></asp:BoundColumn>

                    <asp:BoundColumn DataField="Branch_Country_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Branch_Country_Name %>"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Branch_City" HeaderText="<%$ Resources:SiteCommon, GridTable_Branch_City %>"></asp:BoundColumn>

                    <asp:TemplateColumn HeaderText="<%$ Resources:SiteCommon, GridTable_Latest_Transaction_Date %>">
                        <ItemTemplate>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Bank_Account_Id" , "manage_BankAccountTransactions.aspx?id={0}") %>'><%# DataBinder.Eval(Container, "DataItem.Latest_Transaction_Actual_DateTime", "{0:dd/MM/yyyy}") %></a>
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <asp:TemplateColumn HeaderText="<%$ Resources:SiteCommon, GridTable_Latest_Transaction_Date %>">
                        <ItemTemplate>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Bank_Account_Id" , "manage_BankAccountTransactions.aspx?id={0}") %>'><%# DataBinder.Eval(Container, "DataItem.Currency_Symbol") %><%# DataBinder.Eval(Container, "DataItem.Latest_Transaction_Account_Balance", "{0:#,#.##}") %></a>
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <asp:TemplateColumn>
                        <ItemTemplate>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Bank_Account_Id" , "manage_BankAccountTransactions.aspx?id={0}") %>'>
                                <img src="/Images/viewdetails2.png" width="32" height="32" alt="<%# Resources.SiteCommon.View_Transactions %>" title="<%# Resources.SiteCommon.View_Transactions %>" /></a>
                            &nbsp;&nbsp;&nbsp;
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Bank_Account_Id" , "manage_BankAccount.aspx?id={0}&mode=edit") %>'>
                                <img src="/Images/edit.png" width="32" height="32" alt="<%# Resources.SiteCommon.Edit %>" title="<%# Resources.SiteCommon.Edit %>" /></a>
                            &nbsp;&nbsp;&nbsp;
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Bank_Account_Id" , "manage_BankAccount.aspx?id={0}&mode=view") %>'>
                                <img src="/Images/viewdetails.png" width="32" height="32" alt="<%# Resources.SiteCommon.View_More %>" title="<%# Resources.SiteCommon.View_More %>" /></a>
                        </ItemTemplate>
                        <HeaderStyle Width="200px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>

            <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="False" class="alert alert-warning">
                <%= Resources.SiteCommon.There_Are_No_Bank_Accounts %>
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="button_Search_Bank_Accounts" />
        </Triggers>

    </asp:UpdatePanel>
    <hr />
    <asp:Button runat="server" ID="button_Add_New_Bank_Account" OnClick="button_Add_New_Bank_Account_Click" Text="<%$ Resources:SiteCommon, Add_New_Bank_Account %>" CssClass="btn btn-primary" />


</asp:Content>

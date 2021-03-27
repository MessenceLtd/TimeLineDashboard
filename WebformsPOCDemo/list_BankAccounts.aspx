<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list_BankAccounts.aspx.cs" Inherits="WebformsPOCDemo.list_BankAccounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links">
        <asp:HyperLink runat="server" Text="Add New Bank Account" NavigateUrl="Add_BankAccount.aspx"></asp:HyperLink>
    </asp:Panel>

    <hr />
    <br />

    <asp:Button runat="server" ID="button_Search_Bank_Accounts" OnClick="button_Search_Bank_Accounts_Click" Text="Refresh" CssClass="btn btn-primary" />

    <asp:UpdatePanel runat="server" ID="updatePanel_Search_Result">

        <ContentTemplate>
            <hr />
            <asp:DataGrid runat="server" ID="dataGrid_BankAccounts_List" AutoGenerateColumns="false" CssClass="CustomTable" Visible="false">
                <Columns>
                    <asp:HyperLinkColumn DataTextField="Bank_Account_Id" HeaderText="ID"
                        DataNavigateUrlField="Bank_Account_Id" DataNavigateUrlFormatString="manage_BankAccount.aspx?id={0}" Visible="false"></asp:HyperLinkColumn>
                    <asp:HyperLinkColumn DataTextField="Account_Name" HeaderText="Account Name" DataNavigateUrlField="Bank_Account_Id"
                        DataNavigateUrlFormatString="manage_BankAccount.aspx?id={0}"></asp:HyperLinkColumn>

                    <asp:BoundColumn DataField="Branch_Name" HeaderText="Branch Name"></asp:BoundColumn>

                    <asp:BoundColumn DataField="Branch_Country_Name" HeaderText="Country"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Branch_City" HeaderText="City"></asp:BoundColumn>


                    <asp:TemplateColumn HeaderText="Latest Transaction Date">
                        <ItemTemplate>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Bank_Account_Id" , "manage_BankAccountTransactions.aspx?id={0}") %>'><%# DataBinder.Eval(Container, "DataItem.Latest_Transaction_Actual_DateTime", "{0:dd/MM/yyyy}") %></a>
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <asp:TemplateColumn HeaderText="Latest Transaction Balance">
                        <ItemTemplate>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Bank_Account_Id" , "manage_BankAccountTransactions.aspx?id={0}") %>'><%# DataBinder.Eval(Container, "DataItem.Currency_Symbol") %><%# DataBinder.Eval(Container, "DataItem.Latest_Transaction_Account_Balance", "{0:#,#.##}") %></a>
                        </ItemTemplate>
                    </asp:TemplateColumn>


                    <asp:TemplateColumn HeaderStyle-Width="200px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Bank_Account_Id" , "manage_BankAccountTransactions.aspx?id={0}") %>'>
                                <img src="/Images/viewdetails2.png" width="32" height="32" alt="View Transactions" title="View Transactions" /></a>
                            &nbsp;&nbsp;&nbsp;
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Bank_Account_Id" , "manage_BankAccount.aspx?id={0}&mode=edit") %>'>
                                <img src="/Images/edit.png" width="32" height="32" alt="Edit" title="Edit" /></a>
                            &nbsp;&nbsp;&nbsp;
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Bank_Account_Id" , "manage_BankAccount.aspx?id={0}&mode=view") %>'>
                                <img src="/Images/viewdetails.png" width="32" height="32" alt="Edit" title="View more" /></a>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>

            <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="false" class="alert alert-warning">
                There are no bank accounts! :(
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="button_Search_Bank_Accounts" />
        </Triggers>

    </asp:UpdatePanel>
    <hr />
    <asp:Button runat="server" ID="button_Add_New_Bank_Account" OnClick="button_Add_New_Bank_Account_Click" Text="Add More" CssClass="btn btn-primary" />


</asp:Content>

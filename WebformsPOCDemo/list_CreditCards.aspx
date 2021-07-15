<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list_CreditCards.aspx.cs" Inherits="WebformsPOCDemo.list_CreditCards" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links">
        <asp:HyperLink runat="server" NavigateUrl="manage_CreditCard.aspx?new" Text="<%$ Resources:SiteCommon, Add_New_Credit_Card %>">
        </asp:HyperLink>
    </asp:Panel>

    <hr />
    <br />

    <asp:Button runat="server" ID="button_Search_Credit_Cards" OnClick="button_Search_Credit_Cards_Click" 
        CssClass="btn btn-primary" Text="<%$ Resources:SiteCommon, Search_Credit_Cards %>" />

    <asp:UpdatePanel runat="server" ID="updatePanel_Search_Result">
        <ContentTemplate>
            <hr />
            <asp:DataGrid runat="server" ID="dataGrid_CreditCards_List" AutoGenerateColumns="False" CssClass="CustomTable" Visible="false">
                <Columns>
                    <asp:HyperLinkColumn DataTextField="Credit_Card_Id" HeaderText="ID"
                        DataNavigateUrlField="Bank_Account_Id" DataNavigateUrlFormatString="manage_BankAccount.aspx?id={0}" Visible="false"></asp:HyperLinkColumn>
                    
                    <asp:HyperLinkColumn DataTextField="Bank_Account_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Name %>" DataNavigateUrlField="Credit_Card_Id"
                        DataNavigateUrlFormatString="manage_CreditCard.aspx?id={0}"></asp:HyperLinkColumn>

                    <asp:HyperLinkColumn DataTextField="Card_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Name %>" DataNavigateUrlField="Credit_Card_Id"
                        DataNavigateUrlFormatString="manage_CreditCard.aspx?id={0}"></asp:HyperLinkColumn>

                    <asp:BoundColumn DataField="Four_Ending_Digits" HeaderText="<%$ Resources:SiteCommon, GridTable_Four_Ending_Digits %>"></asp:BoundColumn>

                    <asp:BoundColumn DataField="Expiration_Date" HeaderText="<%$ Resources:SiteCommon, GridTable_Expiration_Date %>" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>

                    <asp:TemplateColumn>
                        <ItemTemplate>
                            
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Credit_Card_Id" , "manage_CreditCard.aspx?id={0}&mode=edit") %>'>
                                <img src="/Images/edit.png" width="32" height="32" alt="<%# Resources.SiteCommon.Edit %>" title="<%# Resources.SiteCommon.Edit %>" /></a>
                            &nbsp;&nbsp;&nbsp;
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Credit_Card_Id" , "manage_BankAccount.aspx?id={0}&mode=view") %>'>
                                <img src="/Images/viewdetails.png" width="32" height="32" alt="<%# Resources.SiteCommon.View_More %>" title="<%# Resources.SiteCommon.View_More %>" /></a>

                        </ItemTemplate>
                        <HeaderStyle Width="200px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>

            <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="False" class="alert alert-warning">
                <%= Resources.SiteCommon.There_Are_No_Credit_Cards %>
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="button_Add_New_Credit_Card" />
        </Triggers>

    </asp:UpdatePanel>
    <hr />
    <asp:Button runat="server" ID="button_Add_New_Credit_Card" OnClick="button_Add_New_Credit_Card_Click" 
        Text="<%$ Resources:SiteCommon, Add_New_Credit_Card %>" CssClass="btn btn-primary" />


</asp:Content>

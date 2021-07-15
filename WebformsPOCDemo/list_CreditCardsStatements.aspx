<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list_CreditCardsStatements.aspx.cs" Inherits="WebformsPOCDemo.list_CreditCardsStatements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links">
        <asp:HyperLink runat="server" NavigateUrl="manage_CreditCardStatement.aspx?new" 
            Text="<%$ Resources:SiteCommon, Add_New_Credit_Card_Statement %>">
        </asp:HyperLink>
    </asp:Panel>

    <hr />
    <br />

    <%= Resources.SiteCommon.Filter_By_Bank_Account %>&nbsp;&nbsp;<asp:DropDownList runat="server" ID="dropdown_Bank_Accounts" CssClass="Regular_ComboBox form-control"></asp:DropDownList>
    &nbsp;&nbsp;
    <asp:Button runat="server" ID="button_Search_Credit_Cards_Statements" OnClick="button_Search_Credit_Cards_Statements_Click" 
        CssClass="btn btn-primary" Text="<%$ Resources:SiteCommon, Search_Credit_Cards_Statements %>" />

    <asp:UpdatePanel runat="server" ID="updatePanel_Search_Result">
        <ContentTemplate>
            <hr />
            <asp:DataGrid runat="server" ID="dataGrid_CreditCardsStatements_List" AutoGenerateColumns="False" CssClass="CustomTable" Visible="false">
                <Columns>

                    <asp:HyperLinkColumn DataTextField="Bank_Account_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Name %>" DataNavigateUrlField="Credit_Card_Statement_Id"
                        DataNavigateUrlFormatString="manage_CreditCardStatement.aspx?id={0}"></asp:HyperLinkColumn>

                    <asp:HyperLinkColumn DataTextField="Card_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Name %>" DataNavigateUrlField="Credit_Card_Statement_Id"
                        DataNavigateUrlFormatString="manage_CreditCardStatement.aspx?id={0}"></asp:HyperLinkColumn>

                    <asp:HyperLinkColumn DataTextField="Statement_Date" DataTextFormatString="{0:dd/MM/yyyy}" HeaderText="<%$ Resources:SiteCommon, GridTable_Statement_Date %>" 
                        DataNavigateUrlField="Credit_Card_Statement_Id" DataNavigateUrlFormatString="manage_CreditCardStatement.aspx?id={0}"></asp:HyperLinkColumn>

                    <asp:TemplateColumn HeaderText="<%$ Resources:SiteCommon, GridTable_Total_Amount %>">
                        <ItemTemplate>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Credit_Card_Statement_Id" , "manage_CreditCardStatement.aspx?id={0}") %>'><%# DataBinder.Eval(Container, "DataItem.Currency_Symbol") %><%# DataBinder.Eval(Container, "DataItem.Total_Amount", "{0:#,#.##}") %></a>
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <asp:TemplateColumn HeaderText="<%$ Resources:SiteCommon, GridTable_Total_Number_Of_Purchases %>">
                        <ItemTemplate>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Credit_Card_Statement_Id" , "manage_CreditCardStatement.aspx?id={0}") %>'><%# DataBinder.Eval(Container, "DataItem.Total_Purchases") %></a>
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <asp:TemplateColumn>
                        <ItemTemplate>
                            
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Credit_Card_Statement_Id" , "manage_CreditCardStatement.aspx?id={0}&mode=edit") %>'>
                                <img src="/Images/edit.png" width="32" height="32" alt="<%# Resources.SiteCommon.Edit %>" title="<%# Resources.SiteCommon.Edit %>" /></a>
                            &nbsp;&nbsp;&nbsp;
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Credit_Card_Statement_Id" , "manage_CreditCardStatement.aspx?id={0}&mode=view") %>'>
                                <img src="/Images/viewdetails.png" width="32" height="32" alt="<%# Resources.SiteCommon.View_More %>" title="<%# Resources.SiteCommon.View_More %>" /></a>

                        </ItemTemplate>
                        <HeaderStyle Width="200px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>

            <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="False" class="alert alert-warning">
                <%= Resources.SiteCommon.There_Are_No_Credit_Card_Statements %>
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="button_Search_Credit_Cards_Statements" />
        </Triggers>
    </asp:UpdatePanel>
    <hr />
    <asp:Button runat="server" ID="button_Add_New_Credit_Card_Statement" OnClick="button_Add_New_Credit_Card_Statement_Click" 
        Text="<%$ Resources:SiteCommon, Add_New_Credit_Card_Statement %>" CssClass="btn btn-primary" />

</asp:Content>

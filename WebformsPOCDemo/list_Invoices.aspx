<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list_Invoices.aspx.cs" Inherits="WebformsPOCDemo.Invoices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links">       
        <asp:HyperLink runat="server" Text="Add New Invoice" NavigateUrl="Add_Invoice.aspx"></asp:HyperLink>
    </asp:Panel>

    Invoices list will go here with all the details and stuff
    <br /><br />
    <hr />
    <br /><br />

    <label for="<%=textbox_Search_Criteria.ClientID %>">Enter Search Criteria:</label> 
    <asp:TextBox runat="server" ID="textbox_Search_Criteria" ClientIDMode="Static" Width="200px"></asp:TextBox>
    &nbsp;&nbsp;
    <asp:Button runat="server" ID="button_Search_Invoices" OnClick="button_Search_Invoices_Click" Text="Search" CssClass="btn btn-primary" />

    <asp:UpdatePanel runat="server" ID="updatePanel_Invoices_List">

        <ContentTemplate>

            <asp:DataGrid runat="server" ID="dataGrid_Invoices_List" AutoGenerateColumns="false" CssClass="table table-striped table-hover" Visible="false">
        
                <Columns>
                    <asp:BoundColumn DataField="Expense_Record_Id" HeaderText="ID"></asp:BoundColumn>
                    <asp:BoundColumn DataField="User_Id" HeaderText="User_Id"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Supplier_Id" HeaderText="Supplier_Id"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Supplier_Id" HeaderText="Supplier_Id"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Total_Amount" HeaderText="Total_Amount"></asp:BoundColumn>
                </Columns>

            </asp:DataGrid>
            <hr />
            <asp:Panel runat="server" ID="panel_Please_Search" class="alert alert-primary">
                <label for="<%=textbox_Search_Criteria.ClientID %>">Please use the search criteria to search for Invoices.</label>
            </asp:Panel>

            <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="false" class="alert alert-warning">
                No results were found!
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="button_Search_Invoices" />
        </Triggers>

    </asp:UpdatePanel>


</asp:Content>

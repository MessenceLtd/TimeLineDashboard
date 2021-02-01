<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list_Expenses.aspx.cs" Inherits="WebformsPOCDemo.Expenses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links">       
        <asp:HyperLink runat="server" Text="Add New Expense" NavigateUrl="Add_Expense.aspx"></asp:HyperLink>
    </asp:Panel>

    Expenses list will go here with all the details and stuff
    <br /><br />
    <hr />
    <br /><br />

    <label for="<%=textbox_Search_Criteria.ClientID %>">Enter Search Criteria:</label> 
    <asp:TextBox runat="server" ID="textbox_Search_Criteria" ClientIDMode="Static" Width="200px"></asp:TextBox>
    &nbsp;&nbsp;
    <asp:Button runat="server" ID="button_Search_Expenses" OnClick="button_Search_Expenses_Click" Text="Search" CssClass="btn btn-primary" />

    <asp:UpdatePanel runat="server" ID="updatePanel_Expenses_List">

        <ContentTemplate>

            <asp:DataGrid runat="server" ID="dataGrid_Expenses_List" AutoGenerateColumns="false" CssClass="table table-striped table-hover" Visible="false">
        
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
                <label for="<%=textbox_Search_Criteria.ClientID %>">Please use the search criteria to search for expenses.</label>
            </asp:Panel>

            <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="false" class="alert alert-warning">
                No results were found!
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="button_Search_Expenses" />
        </Triggers>

    </asp:UpdatePanel>

</asp:Content>

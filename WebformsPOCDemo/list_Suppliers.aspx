﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list_Suppliers.aspx.cs" Inherits="WebformsPOCDemo.list_Suppliers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links">       
        <asp:HyperLink runat="server" Text="Add New Supplier" NavigateUrl="Add_Supplier.aspx"></asp:HyperLink>
    </asp:Panel>

    Suppliers list will go here with all the details
    <br /><br />
    <hr />
    <br /><br />
    <label for="<%= textbox_Search_Criteria.ClientID %>">Enter Search Criteria:</label> 
    <asp:TextBox runat="server" ID="textbox_Search_Criteria" ClientIDMode="Static" Width="200px"></asp:TextBox>
    &nbsp;&nbsp;
    <asp:Button runat="server" ID="button_Search_Suppliers" OnClick="button_Search_Suppliers_Click" Text="Search" CssClass="btn btn-primary" />

    <asp:UpdatePanel runat="server" ID="updatePanel_Users_List">

        <ContentTemplate>

            <asp:DataGrid runat="server" ID="dataGrid_Suppliers_List" AutoGenerateColumns="false" CssClass="table table-striped table-hover" Visible="false">
                <Columns>
                    <asp:BoundColumn DataField="Supplier_Id" HeaderText="ID"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Company_Name" HeaderText="Company Name"></asp:BoundColumn>
                </Columns>
            </asp:DataGrid>

            <hr />
            <asp:Panel runat="server" ID="panel_Please_Search" class="alert alert-primary">
                <label for="<%=textbox_Search_Criteria.ClientID %>">Please use the search criteria to search for suppliers.</label>
            </asp:Panel>

            <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="false" class="alert alert-warning">
                No results were found!
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="button_Search_Suppliers" />
        </Triggers>

    </asp:UpdatePanel>

</asp:Content>

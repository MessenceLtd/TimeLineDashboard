<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list_Documents.aspx.cs" Inherits="WebformsPOCDemo.Documents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links">       
        <asp:HyperLink runat="server" Text="Add New Document" NavigateUrl="Add_Document.aspx"></asp:HyperLink>
    </asp:Panel>

    Documents list will go here with all the details..
    <br /><br />
    <hr />
    <br /><br />
    <label for="<%= textbox_Search_Criteria.ClientID %>">Enter Search Criteria:</label> 
    <asp:TextBox runat="server" ID="textbox_Search_Criteria" Width="200px"></asp:TextBox>
    &nbsp;&nbsp;
    <asp:Button runat="server" ID="button_Search_Documents" OnClick="button_Search_Documents_Click" Text="Search" CssClass="btn btn-primary" />

    <asp:UpdatePanel runat="server" ID="updatePanel_Users_List">

        <ContentTemplate>

            <asp:DataGrid runat="server" ID="dataGrid_Documents_List" AutoGenerateColumns="false" CssClass="table table-striped table-hover" Visible="false">
                <Columns>
                    <asp:BoundColumn DataField="Document_Id" HeaderText="ID"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Document_Name" HeaderText="Document Name"></asp:BoundColumn>
                </Columns>
            </asp:DataGrid>

            <hr />
            <asp:Panel runat="server" ID="panel_Please_Search" class="alert alert-primary">
                <label for="<%=textbox_Search_Criteria.ClientID %>">Please use the search criteria to search for documents.</label>
            </asp:Panel>

            <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="false" class="alert alert-warning">
                No results were found!
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="button_Search_Documents" />
        </Triggers>

    </asp:UpdatePanel>

</asp:Content>

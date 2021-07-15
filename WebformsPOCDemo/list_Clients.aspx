<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list_Clients.aspx.cs" Inherits="WebformsPOCDemo.list_Clients" Culture="auto" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links">
        <asp:HyperLink runat="server" Text="<%$ Resources:SiteCommon, Add_New_Client %>" NavigateUrl="Add_Client.aspx"></asp:HyperLink>
    </asp:Panel>

    <br />
    <hr />
    <br />
    <div class="Search-Settings">
        <asp:UpdatePanel runat="server" ID="updatePanel_States" class="row g-2" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="col-md">
                    <div class="form-floating">
                        <asp:DropDownList runat="server" ID="dropdown_Type" ClientIDMode="Static" aria-label="<%$ Resources:SiteCommon, Clients_Select_Client_Type %>"
                            CssClass="form-select">
                        </asp:DropDownList>
                        <label for="">
                            <asp:Literal runat="server" ID="label_Filter_By_Type" Text="<%$ Resources:SiteCommon, Clients_Filter_By_Type %>"></asp:Literal></label>
                    </div>
                </div>

                <div class="col-md">
                    <div class="form-floating">
                        <asp:DropDownList runat="server" ID="dropdown_Country" ClientIDMode="Static" aria-label="<%$ Resources:SiteCommon, Select_Country %>"
                            CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Country_SelectedIndexChanged">
                        </asp:DropDownList>
                        <label for="">
                            <asp:Literal runat="server" ID="label_Filter_By_Country" Text="<%$ Resources:SiteCommon, Filter_By_Country %>"></asp:Literal></label>
                    </div>
                </div>

                <asp:Panel runat="server" ID="panel_States" CssClass="col-md" Visible="False">
                    <div class="form-floating">
                        <asp:DropDownList runat="server" ID="dropdown_State" ClientIDMode="Static" aria-label="<%$ Resources:SiteCommon, Select_State %>" CssClass="form-select"></asp:DropDownList>
                        <label for="<%= dropdown_State.ClientID %>">
                            <asp:Literal runat="server" ID="label_Filter_By_State" Text="<%$ Resources:SiteCommon, Filter_By_State %>"></asp:Literal></label>
                    </div>
                </asp:Panel>

                <div class="form-floating">
                    <asp:TextBox runat="server" ID="text_Filter_By_CityAddressZipCode" CssClass="form-control"
                        placeholder="<%$ Resources:SiteCommon, Filter_By_CityAddressZipCode %>" autocomplete="nope"></asp:TextBox>
                    <label for="floatingInput"><%= Resources.SiteCommon.Filter_By_CityAddressZipCode %></label>
                </div>
                <div class="form-floating">
                    <asp:TextBox runat="server" ID="text_Filter_By_CompanyNamePeopleName" autocomplete="nope"
                        CssClass="form-control" placeholder="<%$ Resources:SiteCommon, Filter_By_CompanyNamePeopleName %>"></asp:TextBox>
                    <label><%= Resources.SiteCommon.Filter_By_CompanyNamePeopleName %></label>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="dropdown_Country" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
    <br />

    <asp:Button runat="server" ID="button_Search_Clients" OnClick="button_Search_Clients_Click" Text="<%$ Resources:SiteCommon, Search_Clients %>" CssClass="btn btn-primary" />

    <asp:UpdatePanel runat="server" ID="updatePanel_Search_Result" UpdateMode="Conditional">

        <ContentTemplate>

            <hr />

            <asp:DataGrid runat="server" ID="dataGrid_Clients_List" AutoGenerateColumns="False" CssClass="CustomTable" Visible="False">
                <Columns>
                    <asp:HyperLinkColumn DataTextField="Client_Id" HeaderText="ID" DataNavigateUrlField="Client_Id" Visible="false" DataNavigateUrlFormatString="manage_Client.aspx?id={0}"></asp:HyperLinkColumn>
                    <asp:HyperLinkColumn DataTextField="Company_Name" HeaderText="<%$ Resources:SiteCommon, Company_Name %>" DataNavigateUrlField="Client_Id" DataNavigateUrlFormatString="manage_Client.aspx?id={0}"></asp:HyperLinkColumn>
                    <asp:BoundColumn DataField="Country_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Country_Name %>"></asp:BoundColumn>
                    <asp:BoundColumn DataField="City" HeaderText="<%$ Resources:SiteCommon, City %>"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Main_Contact_FullName" HeaderText="<%$ Resources:SiteCommon, Contact_Person %>"></asp:BoundColumn>
                    <asp:TemplateColumn>
                        <ItemTemplate>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Client_Id" , "manage_Client.aspx?id={0}&mode=edit") %>'>
                                <img
                                    src="/Images/edit.png" width="32" height="32" alt="<%# Resources.SiteCommon.Edit %>" title="<%# Resources.SiteCommon.Edit %>" /></a>
                            &nbsp;&nbsp;&nbsp;
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Client_Id" , "manage_Client.aspx?id={0}&mode=view") %>'>
                                <img
                                    src="/Images/viewdetails.png" width="32" height="32" alt="<%# Resources.SiteCommon.View_More %>" title="<%# Resources.SiteCommon.View_More %>" /></a>
                        </ItemTemplate>
                        <HeaderStyle Width="100px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>

            <asp:Panel runat="server" ID="panel_Please_Search" class="alert alert-primary">
                <label><% = Resources.SiteCommon.Clients_Please_Use_The_Search_Criteria %></label>
            </asp:Panel>

            <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="False" class="alert alert-warning">
                <% = Resources.SiteCommon.Clients_No_Results_Were_Found %>
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="button_Search_Clients" />
        </Triggers>

    </asp:UpdatePanel>


</asp:Content>

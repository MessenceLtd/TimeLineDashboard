<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list_Suppliers.aspx.cs" Inherits="WebformsPOCDemo.list_Suppliers" culture="auto" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links" >
        <asp:HyperLink runat="server" Text="<%$ Resources:SiteCommon, Add_New_Supplier %>" NavigateUrl="Add_Supplier.aspx"></asp:HyperLink>
    </asp:Panel>

    <br />
    <hr />
    <br /><br />
    <div class="Search-Settings">
        <asp:UpdatePanel runat="server" ID="updatePanel_States" class="row g-2" UpdateMode="Conditional">
            <ContentTemplate>

                <div class="col-md">
                    <div class="form-floating">
                        <asp:DropDownList runat="server" ID="dropdown_Type" ClientIDMode="Static" aria-label="<%$ Resources:SiteCommon, Select_Supplier_Type %>" 
                            CssClass="form-select"></asp:DropDownList>
                        <label for=""><asp:Literal runat="server" ID="label_Filter_By_Type" Text="<%$ Resources:SiteCommon, Suppliers_Filter_By_Type %>"></asp:Literal></label>
                    </div>
                </div>

                <div class="col-md">
                    <div class="form-floating">
                        <asp:DropDownList runat="server" ID="dropdown_Country" ClientIDMode="Static" aria-label="<%$ Resources:SiteCommon, Select_Country %>" 
                            CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Country_SelectedIndexChanged"></asp:DropDownList>
                        <label for=""><asp:Literal runat="server" ID="label_Filter_By_Country" Text="<%$ Resources:SiteCommon, Filter_By_Country %>"></asp:Literal></label>
                    </div>
                </div>

                <asp:Panel runat="server" id="panel_States" CssClass="col-md" Visible="False">
                    <div class="form-floating">
                        <asp:DropDownList runat="server" ID="dropdown_State" ClientIDMode="Static" aria-label="<%$ Resources:SiteCommon, Select_State %>" CssClass="form-select"></asp:DropDownList>
                        <label for="<%= dropdown_State.ClientID %>"><asp:Literal runat="server" ID="label_Filter_By_State" Text="<%$ Resources:SiteCommon, Filter_By_State %>"></asp:Literal></label>
                    </div>
                </asp:Panel>

                <div class="form-floating">
                    <asp:TextBox runat="server" ID="text_Filter_By_CityAddressZipCode" CssClass="form-control" 
                        placeholder="<%$ Resources:SiteCommon, Filter_By_CityAddressZipCode %>" autocomplete="nope"></asp:TextBox>
                    <label><%= Resources.SiteCommon.Filter_By_CityAddressZipCode %></label>
                </div>
                <div class="form-floating">
                    <asp:TextBox runat="server" ID="text_Filter_By_CompanyNamePeopleName" CssClass="form-control" 
                        placeholder="<%$ Resources:SiteCommon, Filter_By_CompanyNamePeopleName %>" autocomplete="nope"></asp:TextBox>
                    <label><%= Resources.SiteCommon.Filter_By_CompanyNamePeopleName %></label>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="dropdown_Country" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
    <br />
    <asp:Button runat="server" ID="button_Search_Suppliers" OnClick="button_Search_Suppliers_Click" 
        Text="<%$ Resources:SiteCommon, Search_Suppliers %>" CssClass="btn btn-primary" />

    <asp:UpdatePanel runat="server" ID="updatePanel_Search_Result">

        <ContentTemplate>

            <hr />

            <asp:DataGrid runat="server" ID="dataGrid_Suppliers_List" AutoGenerateColumns="False" CssClass="CustomTable" Visible="False">
                <Columns>
                    <asp:HyperLinkColumn DataTextField="Supplier_Id" HeaderText="ID" DataNavigateUrlField="Supplier_Id" 
                        DataNavigateUrlFormatString="manage_Supplier.aspx?id={0}" Visible="false">
                    </asp:HyperLinkColumn>
                    <asp:HyperLinkColumn DataTextField="Company_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Company_Name %>" DataNavigateUrlField="Supplier_Id" DataNavigateUrlFormatString="manage_Supplier.aspx?id={0}"></asp:HyperLinkColumn>
                    <asp:BoundColumn DataField="Country_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Country_Name %>"></asp:BoundColumn>
                    <asp:BoundColumn DataField="City" HeaderText="<%$ Resources:SiteCommon, City %>"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Main_Contact_FullName" HeaderText="<%$ Resources:SiteCommon, GridTable_Contact_Person %>"></asp:BoundColumn>
                    <asp:TemplateColumn>
                        <ItemTemplate>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Supplier_Id" , "manage_Supplier.aspx?id={0}&mode=edit") %>'><img 
                                src="/Images/edit.png" width="32" height="32" alt="<%# Resources.SiteCommon.Edit %>" title="<%# Resources.SiteCommon.Edit %>" /></a>
                            &nbsp;&nbsp;&nbsp;
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Supplier_Id" , "manage_Supplier.aspx?id={0}&mode=view") %>'><img 
                                src="/Images/viewdetails.png" width="32" height="32" alt="<%# Resources.SiteCommon.View_More %>" title="<%# Resources.SiteCommon.View_More %>" /></a>
                        </ItemTemplate>
                        <HeaderStyle Width="100px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>

            <asp:Panel runat="server" ID="panel_Please_Search" class="alert alert-primary">
                <%= Resources.SiteCommon.Suppliers_Please_Use_The_Search_Criteria %>
            </asp:Panel>

            <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="False" class="alert alert-warning">
                <%= Resources.SiteCommon.Suppliers_No_Results_Were_Found %>
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="button_Search_Suppliers" />
        </Triggers>

    </asp:UpdatePanel>

</asp:Content>

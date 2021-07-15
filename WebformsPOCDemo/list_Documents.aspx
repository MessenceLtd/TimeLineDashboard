<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list_Documents.aspx.cs" Inherits="WebformsPOCDemo.Documents" culture="auto" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links">       
        <asp:HyperLink runat="server" NavigateUrl="Add_Document.aspx" Text="<%$ Resources:SiteCommon, Add_New_Document %>"></asp:HyperLink>
    </asp:Panel>

    <hr />
    <br /><br />
    
    <div class="Search-Settings">
        <asp:UpdatePanel runat="server" ID="updatePanel_States" class="row g-2" UpdateMode="Conditional">
            <ContentTemplate>

                <div class="col-md">
                    <div class="form-floating">
                        <asp:DropDownList runat="server" ID="dropdown_Type" ClientIDMode="Static" aria-label="<%$ Resources:SiteCommon, Select_Document_Type %>" 
                            CssClass="form-select"></asp:DropDownList>
                        <label for=""><asp:Literal runat="server" ID="label_Filter_By_Type" Text="<%$ Resources:SiteCommon, Documents_Filter_By_Type %>"></asp:Literal></label>
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
                        autocomplete="nope" placeholder="<%$ Resources:SiteCommon, Filter_By_CityAddressZipCode %>"></asp:TextBox>
                    <label><%= Resources.SiteCommon.Filter_By_CityAddressZipCode %></label>
                </div>
                <div class="form-floating">
                    <asp:TextBox runat="server" ID="text_Filter_By_CompanyNamePeopleName" CssClass="form-control" 
                        autocomplete="nope" placeholder="<%$ Resources:SiteCommon, Filter_By_CompanyNamePeopleName %>"></asp:TextBox>
                    <label><%= Resources.SiteCommon.Filter_By_CompanyNamePeopleName %></label>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="dropdown_Country" />
            </Triggers>
        </asp:UpdatePanel>
    </div>

    <br />

    <asp:Button runat="server" ID="button_Search_Documents" OnClick="button_Search_Documents_Click" 
        Text="<%$ Resources:SiteCommon, Search_Documents %>" CssClass="btn btn-primary" />

    <asp:UpdatePanel runat="server" ID="updatePanel_Search_Result">

        <ContentTemplate>

            <hr />

            <asp:DataGrid runat="server" ID="dataGrid_Documents_List" AutoGenerateColumns="False" CssClass="CustomTable ListTable" Visible="False">
                <Columns>
                    <asp:HyperLinkColumn DataTextField="General_Document_Id" HeaderText="ID" Visible="false"
                        DataNavigateUrlField="General_Document_Id" DataNavigateUrlFormatString="manage_Document.aspx?id={0}">
                    </asp:HyperLinkColumn>
                    <asp:HyperLinkColumn DataTextField="Title" HeaderText="<%$ Resources:SiteCommon, GridTable_Document_Title %>" DataNavigateUrlField="General_Document_Id" 
                        DataNavigateUrlFormatString="manage_Document.aspx?id={0}"></asp:HyperLinkColumn>
                    <asp:HyperLinkColumn DataTextField="Sent_By_Entity_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Document_Sent_By %>" DataNavigateUrlField="General_Document_Id" 
                        DataNavigateUrlFormatString="manage_Document.aspx?id={0}"></asp:HyperLinkColumn>
                    
                    <asp:BoundColumn DataField="Description" HeaderText="<%$ Resources:SiteCommon, GridTable_Document_Description %>"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Sent_By_Entity_Country_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Document_From_Country %>"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Sent_By_Entity_City" HeaderText="<%$ Resources:SiteCommon, GridTable_Document_From_City %>"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Sent_By_Entity_Email_Address" HeaderText="<%$ Resources:SiteCommon, GridTable_Document_From_Email %>"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Document_Creation_DateTime" HeaderText="<%$ Resources:SiteCommon, GridTable_Document_Creation_DateTime %>" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>
                    
                    <asp:TemplateColumn>
                        <ItemTemplate>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.General_Document_Id" , "manage_Document.aspx?id={0}&mode=edit") %>'><img 
                                src="/Images/edit.png" width="32" height="32" alt="<%# Resources.SiteCommon.Edit %>" title="<%# Resources.SiteCommon.Edit %>" /></a>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.General_Document_Id" , "manage_Document.aspx?id={0}&mode=view") %>'><img 
                                src="/Images/viewdetails.png" width="32" height="32" alt="<%# Resources.SiteCommon.View_More %>" title="<%# Resources.SiteCommon.View_More %>" /></a>
                            <a runat="server" Visible='<%# Eval("Azure_Block_Blob_Reference") != null && !String.IsNullOrEmpty(Eval("Azure_Block_Blob_Reference").ToString()) %>' 
                                href='<%# DataBinder.Eval(Container, "DataItem.General_Document_Id" , "downloader.aspx?id={0}&type=general_document") %>' target="_blank"><img 
                                src="/Images/download.png" width="32" height="32" alt="<%# Resources.SiteCommon.Download %>" title="<%# Resources.SiteCommon.Download %>" /></a>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>

            <asp:Panel runat="server" ID="panel_Please_Search" class="alert alert-primary">
                <label><%= Resources.SiteCommon.Documents_Please_Use_The_Search_Criteria %></label>
            </asp:Panel>

            <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="False" class="alert alert-warning">
                <%= Resources.SiteCommon.Documents_No_Results_Were_Found %>
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="button_Search_Documents" />
        </Triggers>

    </asp:UpdatePanel>

</asp:Content>

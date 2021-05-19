<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list_Documents.aspx.cs" Inherits="WebformsPOCDemo.Documents" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links" meta:resourcekey="panel_HeaderLinksResource1">       
        <asp:HyperLink runat="server" Text="Add New Document" NavigateUrl="Add_Document.aspx" meta:resourcekey="HyperLinkResource1"></asp:HyperLink>
    </asp:Panel>

    Documents list will go here with all the details..
    <br /><br />
    <hr />
    <br /><br />
    
    <asp:UpdatePanel runat="server" ID="updatePanel_States" class="row g-2" UpdateMode="Conditional">
        <ContentTemplate>

            <div class="col-md">
                <div class="form-floating">
                    <asp:DropDownList runat="server" ID="dropdown_Type" ClientIDMode="Static" aria-label="Select expense type" 
                        CssClass="form-select" meta:resourcekey="dropdown_TypeResource1"></asp:DropDownList>
                    <label for=""><asp:Literal runat="server" ID="label_Filter_By_Type" meta:resourcekey="label_Filter_By_TypeResource1" Text="Filter by Type"></asp:Literal></label>
                </div>
            </div>

            <div class="col-md">
                <div class="form-floating">
                    <asp:DropDownList runat="server" ID="dropdown_Country" ClientIDMode="Static" aria-label="Select country" 
                        CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Country_SelectedIndexChanged" meta:resourcekey="dropdown_CountryResource1"></asp:DropDownList>
                    <label for=""><asp:Literal runat="server" ID="label_Filter_By_Country" meta:resourcekey="label_Filter_By_CountryResource1" Text="Filter by Country"></asp:Literal></label>
                </div>
            </div>

            <asp:Panel runat="server" id="panel_States" CssClass="col-md" Visible="False" meta:resourcekey="panel_StatesResource1">
                <div class="form-floating">
                    <asp:DropDownList runat="server" ID="dropdown_State" ClientIDMode="Static" aria-label="Select state" CssClass="form-select" meta:resourcekey="dropdown_StateResource1"></asp:DropDownList>
                    <label for="<%= dropdown_State.ClientID %>"><asp:Literal runat="server" ID="label_Filter_By_State" meta:resourcekey="label_Filter_By_StateResource1" Text="Filter by Type"></asp:Literal></label>
                </div>
            </asp:Panel>

            <div class="form-floating">
                <asp:TextBox runat="server" ID="text_Filter_By_CityAddressZipCode" CssClass="form-control" 
                    autocomplete="nope" placeholder="Filter by City / Address / Zipcode" meta:resourcekey="text_Filter_By_CityAddressZipCodeResource1"></asp:TextBox>
                <label for="floatingInput">Filter by City / Address / Zipcode</label>
            </div>
            <div class="form-floating">
                <asp:TextBox runat="server" ID="text_Filter_By_CompanyNamePeopleName" CssClass="form-control" 
                    autocomplete="nope" placeholder="Filter by Company name / People name" meta:resourcekey="text_Filter_By_CompanyNamePeopleNameResource1"></asp:TextBox>
                <label for="floatingPassword">Filter by Company name / People name</label>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="dropdown_Country" />
        </Triggers>
    </asp:UpdatePanel>

    <br />

    <asp:Button runat="server" ID="button_Search_Documents" OnClick="button_Search_Documents_Click" Text="Search" CssClass="btn btn-primary" meta:resourcekey="button_Search_DocumentsResource1" />

    <asp:UpdatePanel runat="server" ID="updatePanel_Search_Result">

        <ContentTemplate>

            <hr />

            <asp:DataGrid runat="server" ID="dataGrid_Documents_List" AutoGenerateColumns="False" CssClass="CustomTable ListTable" Visible="False" meta:resourcekey="dataGrid_Documents_ListResource1">
                <Columns>
                    <asp:HyperLinkColumn DataTextField="General_Document_Id" HeaderText="ID" 
                        DataNavigateUrlField="General_Document_Id" DataNavigateUrlFormatString="manage_Document.aspx?id={0}" meta:resourcekey="HyperLinkColumnResource1">
                    </asp:HyperLinkColumn>
                    <asp:HyperLinkColumn DataTextField="Title" HeaderText="Title" DataNavigateUrlField="General_Document_Id" 
                        DataNavigateUrlFormatString="manage_Document.aspx?id={0}" meta:resourcekey="HyperLinkColumnResource2"></asp:HyperLinkColumn>
                    <asp:HyperLinkColumn DataTextField="Sent_By_Entity_Name" HeaderText="Sent By" DataNavigateUrlField="General_Document_Id" 
                        DataNavigateUrlFormatString="manage_Document.aspx?id={0}" meta:resourcekey="HyperLinkColumnResource3"></asp:HyperLinkColumn>
                    
                    <asp:BoundColumn DataField="Description" HeaderText="Description"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Sent_By_Entity_Country_Name" HeaderText="From Country"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Sent_By_Entity_City" HeaderText="From City"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Sent_By_Entity_Email_Address" HeaderText="From Email"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Document_Creation_DateTime" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>
                    
                    <asp:TemplateColumn>
                        <ItemTemplate>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.General_Document_Id" , "manage_Document.aspx?id={0}&mode=edit") %>'><img 
                                src="/Images/edit.png" width="32" height="32" alt="Edit" title="Edit" /></a>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.General_Document_Id" , "manage_Document.aspx?id={0}&mode=view") %>'><img 
                                src="/Images/viewdetails.png" width="32" height="32" alt="Edit" title="View more" /></a>
                            <a runat="server" Visible='<%# Eval("Azure_Block_Blob_Reference") != null && !String.IsNullOrEmpty(Eval("Azure_Block_Blob_Reference").ToString()) %>' 
                                href='<%# DataBinder.Eval(Container, "DataItem.General_Document_Id" , "downloader.aspx?id={0}&type=general_document") %>' target="_blank"><img 
                                src="/Images/download.png" width="32" height="32" alt="Download" title="Download" /></a>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>

            <asp:Panel runat="server" ID="panel_Please_Search" class="alert alert-primary" meta:resourcekey="panel_Please_SearchResource1">
                <label>Please use the search criteria to search for documents.</label>
            </asp:Panel>

            <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="False" class="alert alert-warning" meta:resourcekey="panel_No_Results_MessageResource1">
                No results were found!
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="button_Search_Documents" />
        </Triggers>

    </asp:UpdatePanel>

</asp:Content>

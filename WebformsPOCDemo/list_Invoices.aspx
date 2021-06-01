<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list_Invoices.aspx.cs" Inherits="WebformsPOCDemo.list_Invoices" culture="auto" meta:resourcekey="Page" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links" meta:resourcekey="panel_HeaderLinks">       
        <asp:HyperLink runat="server" Text="Add New Invoice" NavigateUrl="Add_Invoice.aspx" meta:resourcekey="HyperLink"></asp:HyperLink>
    </asp:Panel>

    Invoices list will go here with all the details and stuff
    <br /><br />
    <hr />
    <br /><br />

    <asp:UpdatePanel runat="server" ID="updatePanel_States" class="row g-2" UpdateMode="Conditional">
        <ContentTemplate>

            <div class="col-md">
                <div class="form-floating">
                    <asp:DropDownList runat="server" ID="dropdown_Type" ClientIDMode="Static" aria-label="Select expense type" 
                        CssClass="form-select" meta:resourcekey="dropdown_Type"></asp:DropDownList>
                    <label for=""><asp:Literal runat="server" ID="label_Filter_By_Type" meta:resourcekey="label_Filter_By_Type" Text="Filter by Type"></asp:Literal></label>
                </div>
            </div>

            <div class="col-md">
                <div class="form-floating">
                    <asp:DropDownList runat="server" ID="dropdown_Country" ClientIDMode="Static" aria-label="Select country" 
                        CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Country_SelectedIndexChanged" meta:resourcekey="dropdown_Country"></asp:DropDownList>
                    <label for=""><asp:Literal runat="server" ID="label_Filter_By_Country" meta:resourcekey="label_Filter_By_Country" Text="Filter by Country"></asp:Literal></label>
                </div>
            </div>

            <asp:Panel runat="server" id="panel_States" CssClass="col-md" Visible="False" meta:resourcekey="panel_States">
                <div class="form-floating">
                    <asp:DropDownList runat="server" ID="dropdown_State" ClientIDMode="Static" aria-label="Select state" CssClass="form-select" meta:resourcekey="dropdown_State"></asp:DropDownList>
                    <label for="<%= dropdown_State.ClientID %>"><asp:Literal runat="server" ID="label_Filter_By_State" meta:resourcekey="label_Filter_By_State" Text="Filter by Type"></asp:Literal></label>
                </div>
            </asp:Panel>

            <div class="form-floating">
                <asp:TextBox runat="server" ID="text_Filter_By_CityAddressZipCode" CssClass="form-control"
                    autocomplete="nope" placeholder="Filter by City / Address / Zipcode" meta:resourcekey="text_Filter_By_CityAddressZipCode"></asp:TextBox>
                <label for="floatingInput">Filter by City / Address / Zipcode</label>
            </div>
            <div class="form-floating">
                <asp:TextBox runat="server" ID="text_Filter_By_CompanyNamePeopleName" CssClass="form-control" 
                    autocomplete="nope" placeholder="Filter by Company name / People name" meta:resourcekey="text_Filter_By_CompanyNamePeopleName"></asp:TextBox>
                <label for="floatingPassword">Filter by Company name / People name</label>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="dropdown_Country" />
        </Triggers>
    </asp:UpdatePanel>

    <br />

    <asp:Button runat="server" ID="button_Search_Invoices" OnClick="button_Search_Invoices_Click" Text="Search" CssClass="btn btn-primary" meta:resourcekey="button_Search_Invoices" />

    <asp:UpdatePanel runat="server" ID="updatePanel_Search_Result">

        <ContentTemplate>

            <hr />

            <asp:DataGrid runat="server" ID="dataGrid_Invoices_List" AutoGenerateColumns="False" CssClass="CustomTable ListTable" Visible="False" meta:resourcekey="dataGrid_Invoices_List">
                <Columns>
                    <asp:HyperLinkColumn DataTextField="Invoice_Record_Id" HeaderText="ID" DataNavigateUrlField="Invoice_Record_Id" DataNavigateUrlFormatString="manage_Invoice.aspx?id={0}" meta:resourcekey="HyperLinkColumn">
                    </asp:HyperLinkColumn>
                    <asp:HyperLinkColumn DataTextField="Invoiced_Client_To_CompanyName" HeaderText="Company Name" DataNavigateUrlField="Invoice_Record_Id" 
                        DataNavigateUrlFormatString="manage_Invoice.aspx?id={0}" meta:resourcekey="HyperLinkColumnResource2"></asp:HyperLinkColumn>
                    <asp:BoundColumn DataField="Invoiced_Client_To_Country_Name" HeaderText="Country Name"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Invoiced_Client_To_City" HeaderText="City"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Invoiced_Client_To_PersonName" HeaderText="Contact Person"></asp:BoundColumn>
                    <asp:TemplateColumn HeaderText="Total Amount">
                        <ItemTemplate>
                            <span><%# DataBinder.Eval(Container, "DataItem.Currency_Symbol") %><%# DataBinder.Eval(Container, "DataItem.Total_Amount", "{0:0,#.00}") %></span>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Total Vat">
                        <ItemTemplate>
                            <span><%# DataBinder.Eval(Container, "DataItem.Currency_Symbol") %><%# DataBinder.Eval(Container, "DataItem.Total_Vat", "{0:0,#.00}") %></span>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn>
                        <ItemTemplate>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Invoice_Record_Id" , "manage_Invoice.aspx?id={0}&mode=edit") %>'><img 
                                src="/Images/edit.png" width="32" height="32" alt="Edit" title="Edit" /></a>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Invoice_Record_Id" , "manage_Invoice.aspx?id={0}&mode=view") %>'><img 
                                src="/Images/viewdetails.png" width="32" height="32" alt="Edit" title="View more" /></a>
                            <a  runat="server" Visible='<%# Eval("Azure_Block_Blob_Reference") != null && !String.IsNullOrEmpty(Eval("Azure_Block_Blob_Reference").ToString()) %>' 
                                href='<%# DataBinder.Eval(Container, "DataItem.Invoice_Record_Id" , "downloader.aspx?id={0}&type=invoice") %>' target="_blank"><img 
                                src="/Images/download.png" width="32" height="32" alt="Download" title="Download" /></a>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>

            <asp:Panel runat="server" ID="panel_Please_Search" class="alert alert-primary" meta:resourcekey="panel_Please_Search">
                <label>Please use the search criteria to search for Invoices.</label>
            </asp:Panel>

            <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="False" class="alert alert-warning" meta:resourcekey="panel_No_Results_Message">
                No results were found!
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="button_Search_Invoices" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>

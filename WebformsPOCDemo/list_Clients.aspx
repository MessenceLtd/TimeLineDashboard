<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list_Clients.aspx.cs" Inherits="WebformsPOCDemo.list_Clients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links">
        <asp:HyperLink runat="server" Text="Add New Client" NavigateUrl="Add_Client.aspx"></asp:HyperLink>
    </asp:Panel>

    Clients list will go here with all the details
    <br />
    <br />
    <hr />
    <br />
    <br />

    <asp:UpdatePanel runat="server" ID="updatePanel_States" class="row g-2" UpdateMode="Conditional">
        <ContentTemplate>

            <div class="col-md">
                <div class="form-floating">
                    <asp:DropDownList runat="server" ID="dropdown_Type" ClientIDMode="Static" aria-label="Select client type" 
                        CssClass="form-select"></asp:DropDownList>
                    <label for="<%= dropdown_Type.ClientID %>"><asp:Literal runat="server" ID="label_Filter_By_Type">Filter by Type</asp:Literal></label>
                </div>
            </div>

            <div class="col-md">
                <div class="form-floating">
                    <asp:DropDownList runat="server" ID="dropdown_Country" ClientIDMode="Static" aria-label="Select country" 
                        CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="dropdown_Country_SelectedIndexChanged"></asp:DropDownList>
                    <label for="<%= dropdown_Country.ClientID %>"><asp:Literal runat="server" ID="label_Filter_By_Country">Filter by Country</asp:Literal></label>
                </div>
            </div>

            <asp:Panel runat="server" id="panel_States" CssClass="col-md" Visible="false">
                <div class="form-floating">
                    <asp:DropDownList runat="server" ID="dropdown_State" ClientIDMode="Static" aria-label="Select state" CssClass="form-select"></asp:DropDownList>
                    <label for="<%= dropdown_State.ClientID %>"><asp:Literal runat="server" ID="label_Filter_By_State">Filter by Type</asp:Literal></label>
                </div>
            </asp:Panel>

            <div class="form-floating">
                <asp:TextBox runat="server" ID="text_Filter_By_CityAddressZipCode" CssClass="form-control" placeholder="Filter by City / Address / Zipcode"></asp:TextBox>
                <label for="floatingInput">Filter by City / Address / Zipcode</label>
            </div>
            <div class="form-floating">
                <asp:TextBox runat="server" ID="text_Filter_By_CompanyNamePeopleName" CssClass="form-control" placeholder="Filter by Company name / People name"></asp:TextBox>
                <label for="floatingPassword">Filter by Company name / People name</label>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="dropdown_Country" />
        </Triggers>
    </asp:UpdatePanel>
    <br />

    <asp:Button runat="server" ID="button_Search_Clients" OnClick="button_Search_Clients_Click" Text="Search" CssClass="btn btn-primary" />

    <asp:UpdatePanel runat="server" ID="updatePanel_Search_Result" UpdateMode="Conditional">

        <ContentTemplate>

            <hr />

            <asp:DataGrid runat="server" ID="dataGrid_Clients_List" AutoGenerateColumns="false" CssClass="CustomTable" Visible="false">
                <Columns>
                    <asp:HyperLinkColumn DataTextField="Client_Id" HeaderText="ID" DataNavigateUrlField="Client_Id" DataNavigateUrlFormatString="manage_Client.aspx?id={0}">
                    </asp:HyperLinkColumn>
                    <asp:HyperLinkColumn DataTextField="Company_Name" HeaderText="Company Name" DataNavigateUrlField="Client_Id" DataNavigateUrlFormatString="manage_Client.aspx?id={0}"></asp:HyperLinkColumn>
                    <asp:BoundColumn DataField="Country_Name" HeaderText="Country Name"></asp:BoundColumn>
                    <asp:BoundColumn DataField="City" HeaderText="City"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Main_Contact_FullName" HeaderText="Contact Person"></asp:BoundColumn>
                    <asp:TemplateColumn HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Client_Id" , "manage_Client.aspx?id={0}&mode=edit") %>'><img 
                                src="/Images/edit.png" width="32" height="32" alt="Edit" title="Edit" /></a>
                            &nbsp;&nbsp;&nbsp;
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Client_Id" , "manage_Client.aspx?id={0}&mode=view") %>'><img 
                                src="/Images/viewdetails.png" width="32" height="32" alt="Edit" title="View more" /></a>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>
            
            <asp:Panel runat="server" ID="panel_Please_Search" class="alert alert-primary">
                <label>Please use the search criteria to search for clients.</label>
            </asp:Panel>

            <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="false" class="alert alert-warning">
                No results were found!
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="button_Search_Clients" />
        </Triggers>

    </asp:UpdatePanel>


</asp:Content>

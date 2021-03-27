<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list_Expenses.aspx.cs" Inherits="WebformsPOCDemo.list_Expenses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links">       
        <asp:HyperLink runat="server" Text="Add New Expense" NavigateUrl="Add_Expense.aspx"></asp:HyperLink>
    </asp:Panel>
    <hr />
    <br />
    
    <asp:UpdatePanel runat="server" ID="updatePanel_States" class="row g-2" UpdateMode="Conditional">
        <ContentTemplate>

            <div class="col-md">
                <div class="form-floating">
                    <asp:DropDownList runat="server" ID="dropdown_Type" ClientIDMode="Static" aria-label="Select expense type" 
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
    <asp:Button runat="server" ID="button_Search_Expenses" OnClick="button_Search_Expenses_Click" Text="Search" CssClass="btn btn-primary" />

    <asp:UpdatePanel runat="server" ID="updatePanel_Search_Result">

        <ContentTemplate>

            <hr />

            <asp:DataGrid runat="server" ID="dataGrid_Expenses_List" AutoGenerateColumns="false" CssClass="CustomTable" Visible="false">
                <Columns>
                    <asp:HyperLinkColumn DataTextField="Expense_Record_Id" HeaderText="ID" DataNavigateUrlField="Expense_Record_Id" DataNavigateUrlFormatString="manage_Expense.aspx?id={0}">
                    </asp:HyperLinkColumn>
                    <asp:HyperLinkColumn DataTextField="Invoice_Supplier_Company_Details" HeaderText="Company Name" DataNavigateUrlField="Expense_Record_Id" 
                        DataNavigateUrlFormatString="manage_Expense.aspx?id={0}"></asp:HyperLinkColumn>
                    <asp:BoundColumn DataField="Invoice_Supplier_Country_Name" HeaderText="Country Name"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Invoice_Supplier_City" HeaderText="City"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Invoice_Supplier_Contact_FullName" HeaderText="Contact Person"></asp:BoundColumn>
                    <asp:TemplateColumn HeaderText="Total Amount" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <span><%# DataBinder.Eval(Container, "DataItem.Currency_Symbol") %><%# DataBinder.Eval(Container, "DataItem.Total_Amount", "{0:0,#.00}") %></span>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Total Vat" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <span><%# DataBinder.Eval(Container, "DataItem.Currency_Symbol") %><%# DataBinder.Eval(Container, "DataItem.Total_Vat", "{0:0,#.00}") %></span>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Expense_Record_Id" , "manage_Expense.aspx?id={0}&mode=edit") %>'><img 
                                src="/Images/edit.png" width="32" height="32" alt="Edit" title="Edit" /></a>
                            &nbsp;&nbsp;&nbsp;
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Expense_Record_Id" , "manage_Expense.aspx?id={0}&mode=view") %>'><img 
                                src="/Images/viewdetails.png" width="32" height="32" alt="Edit" title="View more" /></a>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>
            
            <asp:Panel runat="server" ID="panel_Please_Search" class="alert alert-primary">
                Please use the search criteria to search for expenses.
            </asp:Panel>

            <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="false" class="alert alert-warning">
                No results were found!
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="button_Search_Expenses" />
        </Triggers>

    </asp:UpdatePanel>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list_Users.aspx.cs" Inherits="WebformsPOCDemo.Users" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links" meta:resourcekey="panel_HeaderLinksResource1">       
        <asp:HyperLink runat="server" Text="Add New User" NavigateUrl="Add_User.aspx" meta:resourcekey="HyperLinkResource1"></asp:HyperLink>
    </asp:Panel>


    Users list will go here with all the details and stuff
    <br /><br />
    <hr />
    <br /><br />
    <label for="<%=textbox_Search_Criteria.ClientID %>">Enter Search Criteria:</label> 
    <asp:TextBox runat="server" ID="textbox_Search_Criteria" ClientIDMode="Static" Width="200px" meta:resourcekey="textbox_Search_CriteriaResource1"></asp:TextBox>
    &nbsp;&nbsp;
    <asp:Button runat="server" ID="button_Search_Users" OnClick="button_Search_Users_Click" Text="Search" CssClass="btn btn-primary" meta:resourcekey="button_Search_UsersResource1" />

    <asp:UpdatePanel runat="server" ID="updatePanel_Search_Result">

        <ContentTemplate>

            <asp:DataGrid runat="server" ID="dataGrid_Users_List" AutoGenerateColumns="False" CssClass="CustomTable" Visible="False" meta:resourcekey="dataGrid_Users_ListResource1">
                <Columns>
                    <asp:BoundColumn DataField="User_Id" HeaderText="ID" Visible="False"></asp:BoundColumn>
                    <asp:HyperLinkColumn DataTextField="FullName" HeaderText="Full name" DataNavigateUrlField="User_Id" DataNavigateUrlFormatString="manage_User.aspx?id={0}" meta:resourcekey="HyperLinkColumnResource1"></asp:HyperLinkColumn>
                    <asp:HyperLinkColumn DataTextField="Email" HeaderText="Email" DataNavigateUrlField="User_Id" DataNavigateUrlFormatString="manage_User.aspx?id={0}" meta:resourcekey="HyperLinkColumnResource2"></asp:HyperLinkColumn>
                    <asp:BoundColumn DataField="Username" HeaderText="Username"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Country_English_Name" HeaderText="Country"></asp:BoundColumn>
                    <asp:BoundColumn DataField="City" HeaderText="City"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Gender_Name" HeaderText="Gender"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Registration_DateTime_UTC" HeaderText="Reg. Date" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>
                    <asp:TemplateColumn>
                        <ItemTemplate>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.User_Id" , "manage_User.aspx?id={0}&mode=edit") %>'><img 
                                src="/Images/edit.png" width="32" height="32" alt="Edit" title="Edit" /></a>
                            &nbsp;&nbsp;&nbsp;
                            <a href='<%# DataBinder.Eval(Container, "DataItem.User_Id" , "manage_User.aspx?id={0}&mode=view") %>'><img 
                                src="/Images/viewdetails.png" width="32" height="32" alt="Edit" title="View more" /></a>
                        </ItemTemplate>
                        <HeaderStyle Width="100px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>

            <hr />
            <asp:Panel runat="server" ID="panel_Please_Search" class="alert alert-primary" meta:resourcekey="panel_Please_SearchResource1">
                <label for="<%=textbox_Search_Criteria.ClientID %>">Please use the search criteria to search for users.</label>
            </asp:Panel>

            <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="False" class="alert alert-warning" meta:resourcekey="panel_No_Results_MessageResource1">
                No results were found!
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="button_Search_Users" />
        </Triggers>

    </asp:UpdatePanel>

    


</asp:Content>

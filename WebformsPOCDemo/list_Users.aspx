<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="list_Users.aspx.cs" Inherits="WebformsPOCDemo.Users" culture="auto" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links">
        <asp:HyperLink runat="server" Text="<%$ Resources:SiteCommon, Add_New_User %>" NavigateUrl="Add_User.aspx"></asp:HyperLink>
    </asp:Panel>

    <br />
    <hr />
    <br /><br />
    <label for="<%=textbox_Search_Criteria.ClientID %>"><%= Resources.SiteCommon.Users_Enter_Search_Criteria %></label> 
    <asp:TextBox runat="server" ID="textbox_Search_Criteria" ClientIDMode="Static" Width="200px"></asp:TextBox>
    &nbsp;&nbsp;
    <asp:Button runat="server" ID="button_Search_Users" OnClick="button_Search_Users_Click" 
        Text="<%$ Resources:SiteCommon, Search_Users %>" CssClass="btn btn-primary" />

    <asp:UpdatePanel runat="server" ID="updatePanel_Search_Result">

        <ContentTemplate>

            <asp:DataGrid runat="server" ID="dataGrid_Users_List" AutoGenerateColumns="False" CssClass="CustomTable" Visible="False">
                <Columns>
                    <asp:BoundColumn DataField="User_Id" HeaderText="ID" Visible="False"></asp:BoundColumn>
                    <asp:HyperLinkColumn DataTextField="FullName" HeaderText="<%$ Resources:SiteCommon, GridTable_Fullname %>" DataNavigateUrlField="User_Id" 
                        DataNavigateUrlFormatString="manage_User.aspx?id={0}"></asp:HyperLinkColumn>
                    <asp:HyperLinkColumn DataTextField="Email" HeaderText="<%$ Resources:SiteCommon, GridTable_Fullname %>" DataNavigateUrlField="User_Id" 
                        DataNavigateUrlFormatString="manage_User.aspx?id={0}"></asp:HyperLinkColumn>
                    <asp:BoundColumn DataField="Username" HeaderText="<%$ Resources:SiteCommon, GridTable_Username %>"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Country_English_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Country_Name %>"></asp:BoundColumn>
                    <asp:BoundColumn DataField="City" HeaderText="<%$ Resources:SiteCommon, City %>"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Gender_Name" HeaderText="<%$ Resources:SiteCommon, Gender %>"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Registration_DateTime_UTC" HeaderText="<%$ Resources:SiteCommon, GridTable_Registration_Date %>" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>
                    <asp:TemplateColumn>
                        <ItemTemplate>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.User_Id" , "manage_User.aspx?id={0}&mode=edit") %>'><img 
                                src="/Images/edit.png" width="32" height="32" alt="<%# Resources.SiteCommon.Edit %>" title="<%# Resources.SiteCommon.Edit %>" /></a>
                            &nbsp;&nbsp;&nbsp;
                            <a href='<%# DataBinder.Eval(Container, "DataItem.User_Id" , "manage_User.aspx?id={0}&mode=view") %>'><img 
                                src="/Images/viewdetails.png" width="32" height="32" alt="<%# Resources.SiteCommon.View_More %>" title="<%# Resources.SiteCommon.View_More %>" /></a>
                        </ItemTemplate>
                        <HeaderStyle Width="100px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>

            <hr />
            <asp:Panel runat="server" ID="panel_Please_Search" class="alert alert-primary">
                <label for="<%=textbox_Search_Criteria.ClientID %>">
                    <%= Resources.SiteCommon.Users_Please_Use_The_Search_Criteria %>
                </label>
            </asp:Panel>

            <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="False" class="alert alert-warning">
                <%= Resources.SiteCommon.Users_No_Results_Were_Found %>
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="button_Search_Users" />
        </Triggers>

    </asp:UpdatePanel>

    


</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_CreditCardStatementTransaction.aspx.cs" Inherits="WebformsPOCDemo.manage_CreditCardStatementTransaction" Culture="auto" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5"><% = Resources.SiteCommon.Manage_Credit_Card_Statement_Transaction_Title %></h2>
        <p class="lead"><% = Resources.SiteCommon.Manage_Credit_Card_Statement_Transaction_SubTitle %></p>
    </div>

    <hr />

    <!-- Nav tabs -->
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
            <asp:HyperLink runat="server" ID="tab_Button_General_Info" ClientIDMode="Static" CssClass="nav-link" data-toggle="tab" 
                NavigateUrl="#General_Info" role="tab" aria-controls="general_info" aria-selected="true" Text="<%$ Resources:SiteCommon, Credit_Card_Statement_Transaction_General_Info %>"></asp:HyperLink>
        </li>
        <li class="nav-item">
            <asp:HyperLink runat="server" ID="tab_Button_Documents" ClientIDMode="Static" CssClass="nav-link" data-toggle="tab" 
                NavigateUrl="#Documents" role="tab" aria-controls="Documents" aria-selected="true" Text="<%$ Resources:SiteCommon, Credit_Card_Statement_Transaction_Documents %>"></asp:HyperLink>
        </li>
    </ul>

    <div class="tab-content">
        <asp:Panel runat="server" ID="General_Info" ClientIDMode="Static" CssClass="tab-pane" role="tabpanel" aria-labelledby="general_info-tab">
            <asp:UpdatePanel runat="server" ID="up_Statement_Transaction_Details">
                <ContentTemplate>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= textbox_Transaction_Date.ClientID %>"><%= Resources.SiteCommon.Transaction_Date %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_Transaction_Date" runat="server" CssClass="Form_Control">
                            <asp:TextBox runat="server" ID="textbox_Transaction_Date" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Transaction_Date" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Transaction_Date"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= textbox_Business_Name.ClientID %>"><%= Resources.SiteCommon.Business_Name %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_Business_Name" runat="server" CssClass="Form_Control">
                            <asp:TextBox runat="server" ID="textbox_Business_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Business_Name" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Business_Name"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= textbox_Transaction_Amount.ClientID %>"><%= Resources.SiteCommon.Payment_Amount %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_Transaction_Amount" runat="server" CssClass="Form_Control">
                            <asp:TextBox runat="server" ID="textbox_Transaction_Amount" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Transaction_Amount" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Transaction_Amount"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= dropdown_Payment_Currency.ClientID %>"><%= Resources.SiteCommon.Payment_Currency %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_Payment_Currency" runat="server" CssClass="Form_Control">
                            <asp:DropDownList runat="server" ID="dropdown_Payment_Currency" ClientIDMode="Static" CssClass="form-control Regular_ComboBox" autocomplete="nope"></asp:DropDownList>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Payment_Currency" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Payment_Currency"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= textbox_Actual_Payment_Amount.ClientID %>"><%= Resources.SiteCommon.Actual_Payment_Amount %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_Actual_Payment_Amount" runat="server" CssClass="Form_Control">
                            <asp:TextBox runat="server" ID="textbox_Actual_Payment_Amount" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Actual_Payment_Amount" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Actual_Payment_Amount"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= textbox_Description.ClientID %>"><%= Resources.SiteCommon.Description %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_Description" runat="server" CssClass="Form_Control">
                            <asp:TextBox runat="server" ID="textbox_Description" ClientIDMode="Static"
                                CssClass="form-control InitializeDatePicker" autocomplete="nope"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Description" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Description"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group CheckBox">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= checkbox_Has_Been_Actually_Charged_In_Statement.ClientID %>"><%= Resources.SiteCommon.Has_Been_Actually_Charged_In_Statement %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_Has_Been_Actually_Charged_In_Statement" runat="server" CssClass="Form_Control">
                            <asp:CheckBox runat="server" ID="checkbox_Has_Been_Actually_Charged_In_Statement" />
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Has_Been_Actually_Charged_In_Statement" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Has_Been_Actually_Charged_In_Statement"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= textbox_Total_Charged_In_Statement.ClientID %>"><%= Resources.SiteCommon.Total_Charged_In_Statement %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_Total_Charged_In_Statement" runat="server" CssClass="Form_Control">
                            <asp:TextBox runat="server" ID="textbox_Total_Charged_In_Statement" ClientIDMode="Static"
                                CssClass="form-control" autocomplete="nope"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Total_Charged_In_Statement" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Total_Charged_In_Statement"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= textbox_User_Description.ClientID %>"><%= Resources.SiteCommon.User_Description %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_User_Description" runat="server" CssClass="Form_Control">
                            <asp:TextBox runat="server" ID="textbox_User_Description" ClientIDMode="Static"
                                CssClass="form-control" autocomplete="nope"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_User_Description" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_User_Description"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= textbox_User_Comments.ClientID %>"><%= Resources.SiteCommon.User_Comments %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_User_Comments" runat="server" CssClass="Form_Control">
                            <asp:TextBox runat="server" ID="textbox_User_Comments" ClientIDMode="Static"
                                CssClass="form-control" autocomplete="nope"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_User_Comments" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_User_Comments"></asp:Label>
                        </asp:Panel>
                    </div>

                    <hr />

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= checkbox_Is_Visible_To_Anonymous_Users.ClientID %>"><%= Resources.SiteCommon.Is_Visible_To_Public %>?</label>
                        </div>
                        <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Visible_To_Anonymous_Users" CssClass="Form_Control">
                            <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Anonymous_Users" ClientIDMode="Static" />
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Visible_To_Anonymous_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Is_Visible_To_Anonymous_Users"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= checkbox_Is_Available_For_Download_For_Anonymous_Users.ClientID %>"><%= Resources.SiteCommon.Is_Downloadable_To_Public %>?</label>
                        </div>
                        <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Available_For_Download_For_Anonymous_Users" CssClass="Form_Control">
                            <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Anonymous_Users" ClientIDMode="Static" />
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Available_For_Download_For_Anonymous_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Is_Available_For_Download_For_Anonymous_Users"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= checkbox_Is_Visible_To_Followers_Users.ClientID %>"><%= Resources.SiteCommon.Is_Visible_To_Followers %>?</label>
                        </div>
                        <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Visible_To_Followers_Users" CssClass="Form_Control">
                            <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Followers_Users" ClientIDMode="Static" />
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Visible_To_Followers_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Is_Visible_To_Followers_Users"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= checkbox_Is_Available_For_Download_For_Followers_Users.ClientID %>"><%= Resources.SiteCommon.Can_Followers_Download_File %>?</label>
                        </div>
                        <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Available_For_Download_For_Followers_Users" CssClass="Form_Control">
                            <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Followers_Users" ClientIDMode="Static" />
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Available_For_Download_For_Followers_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Is_Available_For_Download_For_Followers_Users"></asp:Label>
                        </asp:Panel>
                    </div>

                    <hr />

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label>Created by:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Record_Created_By_User" runat="server" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Record_Created_By_User"></asp:Label>
                        </asp:Panel>
                    </div>
                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label>Created at:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Record_Creation_DateTime_UTC" runat="server" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Record_Creation_DateTime_UTC"></asp:Label>
                        </asp:Panel>
                    </div>
                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label>Last Modified by:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_By_User" runat="server" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Record_Last_Updated_By_User"></asp:Label>
                        </asp:Panel>
                    </div>
                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label>Last Modified Date:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_DateTime_UTC" runat="server" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Record_Last_Updated_DateTime_UTC"></asp:Label>
                        </asp:Panel>
                    </div>

                    <hr />
                    <div>

                        <asp:Button runat="server" ID="button_Edit_Credit_Card_Statement_Transaction_Details"
                            Text="<%$ Resources:SiteCommon, Credit_Card_Statement_Transaction_Edit_Details %>" OnClick="button_Edit_Credit_Card_Statement_Transaction_Details_Click" CssClass="btn btn-primary" />

                        <asp:Button runat="server" ID="button_Update_Credit_Card_Statement_Transaction_Details"
                            Text="<%$ Resources:SiteCommon, Credit_Card_Statement_Transaction_Save Changes %>" OnClick="button_Update_Credit_Card_Statement_Transaction_Details_Click" CssClass="btn btn-success" />

                        <asp:Button runat="server" ID="button_CancelEdit_Credit_Card_Statement_Transaction_Details"
                            Text="<%$ Resources:SiteCommon, Credit_Card_Statement_Transaction_Cancel_Editing %>" OnClick="button_CancelEdit_Credit_Card_Statement_Transaction_Details_Click" CssClass="btn btn-danger" />

                    </div>

                    <div>
                        <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result"></asp:Label>
                    </div>

                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="button_Edit_Credit_Card_Statement_Transaction_Details" />
                    <asp:AsyncPostBackTrigger ControlID="button_Update_Credit_Card_Statement_Transaction_Details" />
                    <asp:AsyncPostBackTrigger ControlID="button_CancelEdit_Credit_Card_Statement_Transaction_Details" />
                </Triggers>
            </asp:UpdatePanel>
        </asp:Panel>
        <asp:Panel runat="server" ID="Documents" ClientIDMode="Static" CssClass="tab-pane" role="tabpanel" aria-labelledby="documents-tab">
            <asp:UpdatePanel runat="server" ID="up_Transaction_Connected_Documents" UpdateMode="Conditional">
                <ContentTemplate>
                    <br />
                    <asp:Panel runat="server" ID="panelConnected_Documentation_Title">
                        <div class="page-title my-3 text-center">
                            <h2 class="display-5"><%= Resources.SiteCommon.Credit_Card_Statement_Transaction_Documents_Connected_Documents_Title %></h2>
                            <p class="lead"><%= Resources.SiteCommon.Credit_Card_Statement_Transaction_Documents_Connected_Documents_SubTitle %></p>
                        </div>
                        <hr />
                    </asp:Panel>
                    <asp:DataGrid runat="server" ID="grid_Connected_Documents" AutoGenerateColumns="False" CssClass="CustomTable" 
                        Visible="False" OnItemDataBound="grid_Connected_Documents_ItemDataBound">
                        <Columns>
                            <asp:TemplateColumn HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Connected_Documents_Type %>">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbl_Document_Type"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Connected_Documents_Title %>">
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" ID="link_Document_Title" NavigateUrl="#" Target="_blank"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn DataField="Document_Date" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Connected_Documents_Document_Date %>" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Description" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Connected_Documents_Description %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Country_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Connected_Documents_Country %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="City" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Connected_Documents_City %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Email_Address" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Connected_Documents_Email %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Creation_DateTime" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Connected_Documents_Creation_Date %>" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>
                            <asp:TemplateColumn>
                                <ItemTemplate>
                                    <input type="hidden" class='<%# Eval("Document_Connection_Id", "Is_Visible_To_Anonymous_Users_{0}") %>' value='<%# Eval("Is_Visible_To_Anonymous_Users")%>' />
                                    <input type="hidden" class='<%# Eval("Document_Connection_Id", "Is_Available_For_Download_For_Anonymous_Users_{0}") %>' value='<%# Eval("Is_Available_For_Download_For_Anonymous_Users")%>' />
                                    <input type="hidden" class='<%# Eval("Document_Connection_Id", "Is_Visible_To_Followers_Users_{0}") %>' value='<%# Eval("Is_Visible_To_Followers_Users")%>' />
                                    <input type="hidden" class='<%# Eval("Document_Connection_Id", "Is_Available_For_Download_For_Followers_Users_{0}") %>' value='<%# Eval("Is_Available_For_Download_For_Followers_Users")%>' />
                                    <a class="Button_Edit" href='<%# Eval("Document_Connection_Id", "javascript:Edit_Document_Connection({0})") %>'><img 
                                        src="/Images/edit.png" width="32" height="32" alt="<%# Resources.SiteCommon.Edit %>" title="<%# Resources.SiteCommon.Edit %>" /></a>
                                    &nbsp;&nbsp;
                                    <asp:HyperLink runat="server" ID="link_Document_View_Image_Button" NavigateUrl="#" Target="_blank"><img 
                                        src="/Images/viewdetails.png" width="32" height="32" alt="<%# Resources.SiteCommon.View_More %>" title="<%# Resources.SiteCommon.View_More %>" /></asp:HyperLink>
                                    &nbsp;&nbsp;
                                    <asp:HyperLink runat="server" ID="link_Document_Download_Image_Button" NavigateUrl="#" Target="_blank"><img 
                                        src="/Images/download.png" width="32" height="32" alt="<%# Resources.SiteCommon.Download %>" title="<%# Resources.SiteCommon.Download %>" /></asp:HyperLink>
                                    &nbsp;&nbsp;
                                    <a class="Button_Delete" href='<%# Eval("Document_Connection_Id", "javascript:Delete_Document_Connection({0})") %>'><img 
                                        src="/Images/delete.png" width="32" height="32" alt="<%# Resources.SiteCommon.Delete %>" title="<%# Resources.SiteCommon.Delete %>" /></a>
                                </ItemTemplate>
                                <HeaderStyle Width="200px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid>
                
                    <asp:Panel runat="server" ID="panel_Connected_Documentation_No_Result" class="alert alert-primary" Visible="false">
                        <label><%= Resources.SiteCommon.Credit_Card_Statement_Transaction_No_Connected_Documents %></label>
                    </asp:Panel>
                
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="button_Remove_Document_Connection" />
                    <asp:AsyncPostBackTrigger ControlID="button_Popup_Save_Document_Connection_Details" />
                    <asp:AsyncPostBackTrigger ControlID="button_Add_Document_Connection" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:Button runat="server" ID="button_Remove_Document_Connection" CssClass="hidden" ClientIDMode="Static" OnClick="button_Remove_Document_Connection_Click" />
            <asp:HiddenField runat="server" ID="hidden_Document_Connection_Id_To_Remove" ClientIDMode="Static" />

            <asp:UpdatePanel runat="server" ID="up_Suggested_Documents" UpdateMode="Conditional">
                <ContentTemplate>

                    <asp:Panel runat="server" ID="panel_Suggested_Documents_Title">
                        <hr />
                        <div class="page-title my-3 text-center">
                            <h2 class="display-5"><% = Resources.SiteCommon.Credit_Card_Statement_Transaction_Documents_Suggested_Documents_Title %></h2>
                            <p class="lead"><% = Resources.SiteCommon.Credit_Card_Statement_Transaction_Documents_Suggested_Documents_SubTitle %></p>
                        </div>
                        <hr />
                    </asp:Panel>

                    <asp:DataGrid runat="server" ID="grid_Suggested_Documents" AutoGenerateColumns="False" CssClass="CustomTable" OnItemDataBound="grid_Suggested_Documents_ItemDataBound">
                        <Columns>
                            <asp:TemplateColumn HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Suggested_Documents_Type %>">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbl_Document_Type"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Suggested_Documents_Title %>">
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" ID="link_Document_Title" NavigateUrl="#" Target="_blank"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn DataField="Document_Date" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Suggested_Documents_Document_Date %>" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Description" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Suggested_Documents_Description %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Country_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Suggested_Documents_Country %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="City" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Suggested_Documents_City %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Email" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Suggested_Documents_Email %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Creation_DateTime" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Suggested_Documents_Creation_Date %>" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>
                            <asp:TemplateColumn>
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" ID="link_Document_Add_Image_Button" NavigateUrl="#" Target="_blank">
                                        <img src="/Images/addmore2.png" width="32" height="32" alt="<%# Resources.SiteCommon.Add_Record %>" title="<%# Resources.SiteCommon.Add_Record %>" />
                                    </asp:HyperLink>
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:HyperLink runat="server" ID="link_Document_Edit_Image_Button" NavigateUrl="#" Target="_blank">
                                        <img src="/Images/edit.png" width="32" height="32" alt="<%# Resources.SiteCommon.Edit %>" title="<%# Resources.SiteCommon.Edit %>" />
                                    </asp:HyperLink>
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:HyperLink runat="server" ID="link_Document_View_Image_Button" NavigateUrl="#" Target="_blank">
                                        <img src="/Images/viewdetails.png" width="32" height="32" alt="<%# Resources.SiteCommon.View_More %>" title="<%# Resources.SiteCommon.View_More %>" />
                                    </asp:HyperLink>
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:HyperLink runat="server" ID="link_Document_Download_Image_Button" NavigateUrl="#" Target="_blank">
                                        <img src="/Images/download.png" width="32" height="32" alt="<%# Resources.SiteCommon.Download %>" title="<%# Resources.SiteCommon.Download %>" />
                                    </asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle Width="130px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid>

                    <asp:Panel runat="server" ID="panel_Suggested_Documents_No_Results" class="alert alert-warning" Visible="false">
                        <label>
                            <%= Resources.SiteCommon.Credit_Card_Statement_Transaction_No_Documents_To_Suggest %><br />
                            <%= Resources.SiteCommon.Credit_Card_Statement_Transaction_Please_Use_Search_Panel %>
                        </label>
                    </asp:Panel>

                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="button_Add_Document_Connection" />
                </Triggers>
            </asp:UpdatePanel>
        
            <asp:Button runat="server" ID="button_Add_Document_Connection" CssClass="hidden" ClientIDMode="Static" OnClick="button_Add_Document_Connection_Click" />
            <asp:HiddenField runat="server" ID="hidden_Document_Type_Id_To_Add_As_Connection" ClientIDMode="Static" />
            <asp:HiddenField runat="server" ID="hidden_Document_Id_To_Add_As_Connection" ClientIDMode="Static" />

            <br />
            <hr />
            <div class="page-title my-3 text-center">
                <h2 class="display-5"><%= Resources.SiteCommon.Credit_Card_Statement_Transaction_Documents_Search_Title %></h2>
                <p class="lead"><%= Resources.SiteCommon.Credit_Card_Statement_Transaction_Documents_Search_SubTitle %></p>
            </div>
            <hr />

            <div class="Search-Settings">
                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating">
                            <asp:TextBox runat="server" ID="text_Filter_By_From_Date" CssClass="form-control InitializeDatePicker" ClientIDMode="Static" 
                                placeholder="<%$ Resources:SiteCommon, Filter_From_Date %>" autocomplete="nope"></asp:TextBox>
                            <label for="text_Filter_By_From_Date"><%= Resources.SiteCommon.Filter_From_Date %></label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <asp:TextBox runat="server" ID="text_Filter_By_To_Date" CssClass="form-control InitializeDatePicker" ClientIDMode="Static" 
                                placeholder="<%$ Resources:SiteCommon, Filter_To_Date %>" autocomplete="nope"></asp:TextBox>
                            <label for="text_Filter_By_To_Date"><%= Resources.SiteCommon.Filter_To_Date %></label>
                        </div>
                    </div>
                </div>
                <asp:UpdatePanel runat="server" ID="updatePanel_States" class="row g-2" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-md">
                            <div class="form-floating">
                                <asp:DropDownList runat="server" ID="dropdown_Type" ClientIDMode="Static" aria-label="<%$ Resources:SiteCommon, Credit_Card_Statement_Transaction_Documents_Search_Select_Type %>"
                                    CssClass="form-select">
                                </asp:DropDownList>
                                <label><asp:Literal runat="server" ID="label_Filter_By_Type" Text="<%$ Resources:SiteCommon, Credit_Card_Statement_Transaction_Documents_Search_Filter_By_Type %>"></asp:Literal></label>
                            </div>
                        </div>

                        <div class="col-md">
                            <div class="form-floating">
                                <asp:DropDownList runat="server" ID="dropdown_Country" ClientIDMode="Static" aria-label="<%$ Resources:SiteCommon, Select_Country %>"
                                    CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Country_SelectedIndexChanged">
                                </asp:DropDownList>
                                <label>
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

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dropdown_Country" />
                    </Triggers>
                </asp:UpdatePanel>
                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating">
                            <asp:TextBox runat="server" ID="text_Filter_By_CityAddressZipCode" ClientIDMode="Static" 
                                CssClass="form-control" placeholder="<%$ Resources:SiteCommon, Filter_By_CityAddressZipCode %>"></asp:TextBox>
                            <label for="text_Filter_By_CityAddressZipCode"><%= Resources.SiteCommon.Filter_By_CityAddressZipCode %></label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <asp:TextBox runat="server" ID="text_Filter_By_CompanyNamePeopleName" ClientIDMode="Static" 
                                CssClass="form-control" placeholder="<%$ Resources:SiteCommon, Filter_By_CompanyNamePeopleName %>"></asp:TextBox>
                            <label for="text_Filter_By_CompanyNamePeopleName"><%= Resources.SiteCommon.Filter_By_CompanyNamePeopleName %></label>
                        </div>
                    </div>
                </div>
            </div>
            <br />

            <asp:Button runat="server" ID="button_Search_Documents" OnClick="button_Search_Documents_Click" 
                Text="<%$ Resources:SiteCommon, Credit_Card_Statement_Transaction_Documents_Search_Button %>" CssClass="btn btn-primary" />
            <asp:UpdatePanel runat="server" ID="updatePanel_Search_Result">
                <ContentTemplate>
                    <hr />
                    <asp:DataGrid runat="server" ID="dataGrid_Documents_List" AutoGenerateColumns="False" CssClass="CustomTable" 
                        Visible="False" OnItemDataBound="dataGrid_Documents_List_ItemDataBound">
                        <Columns>
                            <asp:TemplateColumn HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Suggested_Documents_Type %>">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbl_Document_Type"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Suggested_Documents_Title %>">
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" ID="link_Document_Title" NavigateUrl="#" Target="_blank"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn DataField="Document_Date" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Suggested_Documents_Document_Date %>" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Description" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Suggested_Documents_Description %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Country_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Suggested_Documents_Country %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="City" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Suggested_Documents_City %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Email_Address" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Suggested_Documents_Email %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Creation_DateTime" HeaderText="<%$ Resources:SiteCommon, GridTable_Credit_Card_Statement_Transaction_Suggested_Documents_Creation_Date %>" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>
                            <asp:TemplateColumn>
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" ID="link_Document_Add_Image_Button" NavigateUrl="#"><img 
                                        src="/Images/addmore2.png" width="32" height="32" alt="<%# Resources.SiteCommon.Credit_Card_Statement_Transaction_Documents_Connect_Document %>" title="<%# Resources.SiteCommon.Credit_Card_Statement_Transaction_Documents_Connect_Document %>" /></asp:HyperLink>
                                    &nbsp;&nbsp;
                                    <asp:HyperLink runat="server" ID="link_Document_Edit_Image_Button" NavigateUrl="#" Target="_blank"><img 
                                        src="/Images/edit.png" width="32" height="32" alt="<%# Resources.SiteCommon.Edit %>" title="<%# Resources.SiteCommon.Edit %>" /></asp:HyperLink>
                                    &nbsp;&nbsp;
                                    <asp:HyperLink runat="server" ID="link_Document_View_Image_Button" NavigateUrl="#" Target="_blank"><img 
                                        src="/Images/viewdetails.png" width="32" height="32" alt="<%# Resources.SiteCommon.View_More %>" title="<%# Resources.SiteCommon.View_More %>" /></asp:HyperLink>
                                    &nbsp;&nbsp;
                                    <asp:HyperLink runat="server" ID="link_Document_Download_Image_Button" NavigateUrl="#" Target="_blank"><img 
                                        src="/Images/download.png" width="32" height="32" alt="<%# Resources.SiteCommon.Download %>" title="<%# Resources.SiteCommon.Download %>" /></asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle Width="200px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid>

                    <asp:Panel runat="server" ID="panel_Please_Search" class="alert alert-primary">
                        <label><%= Resources.SiteCommon.Credit_Card_Statement_Transaction_Documents_Search_Please_Use_Search_Criteria %></label>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="False" class="alert alert-warning">
                        <%= Resources.SiteCommon.Credit_Card_Statement_Transaction_Documents_Search_No_Results_Were_Found %>
                    </asp:Panel>

                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="button_Search_Documents" />
                </Triggers>

            </asp:UpdatePanel>

            <br />
        </asp:Panel>
    </div>
    <br /><br />

    <div class="Popup_Background_Wrapper hidden">
        <div class="Popup_Inner_Wrapper Document_Connection_Popup">
            <img class="Close-Button" alt="<%= Resources.SiteCommon.Close_Window %>" title="<%= Resources.SiteCommon.Close_Window %>" height="32" width="32" src="/Images/Close.png" onclick="Hide_Edit_Popup();" />
            <div class="Header_Title">
                <%= Resources.SiteCommon.Credit_Card_Statement_Transaction_Documents_Edit_Document_Connection_Settings %>
            </div>
            <div class="Edit_Document_Connection_Template">
                <asp:HiddenField runat="server" ID="hidden_Edit_Document_Connection_Id" ClientIDMode="Static" />
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= checkbox_DocumentConnection_Is_Visible_To_Anonymous_Users.ClientID %>"><%= Resources.SiteCommon.Is_Visible_To_Public %>?</label>
                    </div>
                    <div class="Form_Control">
                        <asp:CheckBox runat="server" ID="checkbox_DocumentConnection_Is_Visible_To_Anonymous_Users" ClientIDMode="Static" />
                    </div>
                </div>
                <br />
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= checkbox_DocumentConnection_Is_Available_For_Download_For_Anonymous_Users.ClientID %>"><%= Resources.SiteCommon.Is_Downloadable_To_Public %>?</label>
                    </div>
                    <div class="Form_Control">
                        <asp:CheckBox runat="server" ID="checkbox_DocumentConnection_Is_Available_For_Download_For_Anonymous_Users" ClientIDMode="Static" />
                    </div>
                </div>
                <br />
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= checkbox_DocumentConnection_Is_Visible_To_Followers_Users.ClientID %>"><%= Resources.SiteCommon.Is_Visible_To_Followers %>?</label>
                    </div>
                    <div class="Form_Control">
                        <asp:CheckBox runat="server" ID="checkbox_DocumentConnection_Is_Visible_To_Followers_Users" ClientIDMode="Static" />
                    </div>
                </div>
                <br />
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= checkbox_DocumentConnection_Is_Available_For_Download_For_Followers_Users.ClientID %>"><%= Resources.SiteCommon.Can_Followers_Download_File %>?</label>
                    </div>
                    <div class="Form_Control">
                        <asp:CheckBox runat="server" ID="checkbox_DocumentConnection_Is_Available_For_Download_For_Followers_Users" ClientIDMode="Static" />
                    </div>
                </div>
            </div>
            <div class="Edit_Transaction_Template_Commands">
                <asp:Button runat="server" ID="button_Popup_Save_Document_Connection_Details" OnClientClick="Hide_Transaction_Popup();"
                    OnClick="button_Popup_Save_Document_Connection_Details_Click" 
                    Text="<%$ Resources:SiteCommon, Credit_Card_Statement_Transaction_Documents_Edit_Document_Connection_Settings_Save_Button %>" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>

    <asp:HiddenField runat="server" ID="hidden_Add_Document_Connection_Document_Record_Id" ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID="hidden_Add_Document_Connection_Type" ClientIDMode="Static" />
    <asp:Button runat="server" ID="button1" ClientIDMode="Static" CssClass="hidden" Text="" OnClick="button_Add_Document_Connection_Click" />
    <asp:HiddenField runat="server" ID="hidden_Delete_Document_Connection_Id" ClientIDMode="Static" />


    <script type="text/javascript">

        function Add_Document_Connection(p_Document_Record_Id, p_Connection_Type) {

            document.getElementById('hidden_Add_Document_Connection_Document_Record_Id').value = p_Document_Record_Id;
            document.getElementById('hidden_Add_Document_Connection_Type').value = p_Connection_Type;
            document.getElementById('button_Add_Document_Connection').click();
        }

        function Edit_Document_Connection(p_Document_Connection_Id) {

            $('#hidden_Edit_Document_Connection_Id').val(p_Document_Connection_Id)

            var l_Is_Visible_To_Anonymous_Users = Boolean.parse($('.Is_Visible_To_Anonymous_Users_' + p_Document_Connection_Id).val());
            var l_Is_Available_For_Download_For_Anonymous_Users = Boolean.parse($('.Is_Available_For_Download_For_Anonymous_Users_' + p_Document_Connection_Id).val());
            var l_Is_Visible_To_Followers_Users = Boolean.parse($('.Is_Visible_To_Followers_Users_' + p_Document_Connection_Id).val());
            var l_Is_Available_For_Download_For_Followers_Users = Boolean.parse($('.Is_Available_For_Download_For_Followers_Users_' + p_Document_Connection_Id).val());

            $('#checkbox_DocumentConnection_Is_Visible_To_Anonymous_Users').prop('checked', l_Is_Visible_To_Anonymous_Users);
            $('#checkbox_DocumentConnection_Is_Available_For_Download_For_Anonymous_Users').prop('checked', l_Is_Available_For_Download_For_Anonymous_Users);
            $('#checkbox_DocumentConnection_Is_Visible_To_Followers_Users').prop('checked', l_Is_Visible_To_Followers_Users);
            $('#checkbox_DocumentConnection_Is_Available_For_Download_For_Followers_Users').prop('checked', l_Is_Available_For_Download_For_Followers_Users);

            $('.Popup_Background_Wrapper').removeClass('hidden');
        }

        function Delete_Document_Connection(p_Document_Connection_Id) {

            document.getElementById('hidden_Document_Connection_Id_To_Remove').value = p_Document_Connection_Id;
            document.getElementById('button_Remove_Document_Connection').click();
        }

        function Hide_Transaction_Popup() {
            $('.Popup_Background_Wrapper').addClass('hidden');
        }

        function Hide_Edit_Popup() {
            Hide_Transaction_Popup();
        }

        $(document).keyup(function (e) {
            if (e.key === "Escape") {
                Hide_Edit_Popup();
            }
        });


        $(function () {

            if (document.location.hash) {
                var l_Hash = document.location.hash.toLowerCase();
                l_Hash = l_Hash.replace('#', '');

                if (l_Hash == 'general_info') {
                    $('#General_Info').addClass('active');
                    $('#tab_Button_General_Info').addClass('active');
                }
                else if (l_Hash == 'documents') {
                    $('#Documents').addClass('active');
                    $('#tab_Button_Documents').addClass('active');
                }
                else {
                    $('#General_Info').addClass('active');
                    $('#tab_Button_General_Info').addClass('active');
                }
            }
            else {
                $('#General_Info').addClass('active');
                $('#tab_Button_General_Info').addClass('active');
            }
        });

    </script>


</asp:Content>

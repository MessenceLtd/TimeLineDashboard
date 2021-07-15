<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_BankAccountTransaction.aspx.cs" Inherits="WebformsPOCDemo.manage_BankAccountTransaction" Culture="auto" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5"><%= Resources.SiteCommon.Manage_Bank_Account_Transaction_Title %></h2>
        <p class="lead"><%= Resources.SiteCommon.Manage_Bank_Account_Transaction_SubTitle %></p>
    </div>

    <hr />
    <!-- Nav tabs -->
    <asp:UpdatePanel runat="server" ID="upTabs">
        <ContentTemplate>
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <asp:HyperLink runat="server" ID="tab_Button_General_Info" ClientIDMode="Static" CssClass="nav-link" data-toggle="tab" 
                        NavigateUrl="#General_Info" role="tab" aria-controls="general_info" aria-selected="true" Text="<%$ Resources:SiteCommon, Bank_Account_Transaction_General_Info_Tab %>"></asp:HyperLink>
                </li>
                <asp:PlaceHolder runat="server" ID="phTab_Documents" Visible="true">
                    <li class="nav-item">
                        <asp:HyperLink runat="server" ID="tab_Button_Documents" ClientIDMode="Static" CssClass="nav-link" 
                            data-toggle="tab" NavigateUrl="#Documents" role="tab" aria-controls="Documents" aria-selected="true" Text="<%$ Resources:SiteCommon, Bank_Account_Transaction_Documents_Tab %>"></asp:HyperLink>
                    </li>
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="phTab_CreditCardStatement" Visible="true">
                    <li class="nav-item" runat="server" id="liTab_CreditCardStatement">
                        <asp:HyperLink runat="server" ID="tab_Button_CreditCardStatement" ClientIDMode="Static" 
                            CssClass="nav-link" data-toggle="tab" NavigateUrl="#CCStatement" role="tab" aria-controls="Statement" 
                            aria-selected="true" Text="<%$ Resources:SiteCommon, Bank_Account_Transaction_Credit_Card_Statement_Tab %>">CREDIT CARD STATEMENT</asp:HyperLink>
                    </li>
                </asp:PlaceHolder>
            </ul>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="button_Save_Statement_Connection" />
            <asp:AsyncPostBackTrigger ControlID="button_Delete_Statement_Connection" />
        </Triggers>
    </asp:UpdatePanel>

    <!-- Tab panes -->
    <div class="tab-content">
        <asp:Panel runat="server" ID="General_Info" ClientIDMode="Static" CssClass="tab-pane" role="tabpanel" aria-labelledby="general_info-tab">
            <asp:UpdatePanel runat="server" ID="updatePanel_General_Info">
                <ContentTemplate>
                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">    
                            <label for="<%= textbox_Transaction_Account_Balance.ClientID %>"><%= Resources.SiteCommon.Account_Balance %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_Transaction_Account_Balance" runat="server" CssClass="Form_Control">
                            <asp:TextBox runat="server" ID="textbox_Transaction_Account_Balance" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Transaction_Account_Balance" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Transaction_Account_Balance"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= textbox_Transaction_Actual_DateTime.ClientID %>"><%= Resources.SiteCommon.Transaction_Date %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_Transaction_Actual_DateTime" runat="server" CssClass="Form_Control">
                            <asp:TextBox runat="server" ID="textbox_Transaction_Actual_DateTime" ClientIDMode="Static" 
                                CssClass="form-control InitializeDatePicker" autocomplete="nope"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Transaction_Actual_DateTime" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Transaction_Actual_DateTime"></asp:Label>
                        </asp:Panel>
                        <asp:RequiredFieldValidator runat="server" ID="validator_Transaction_Actual_DateTime" ErrorMessage="<%$ Resources:SiteCommon, Validator_Transaction_Actual_DateTime %>"
                            Display="Dynamic" ControlToValidate="textbox_Transaction_Actual_DateTime" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= textbox_Positive_Amount_Entered.ClientID %>"><%= Resources.SiteCommon.Bank_Account_Transaction_Amount_Entered %></label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_Positive_Amount_Entered" runat="server" CssClass="Form_Control">
                            <asp:TextBox runat="server" ID="textbox_Positive_Amount_Entered" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Positive_Amount_Entered" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Positive_Amount_Entered"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= textbox_Negative_Amount_Paid.ClientID %>"><%= Resources.SiteCommon.Bank_Account_Transaction_Amount_Paid %></label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_Negative_Amount_Paid" runat="server" CssClass="Form_Control">
                            <asp:TextBox runat="server" ID="textbox_Negative_Amount_Paid" ClientIDMode="Static" CssClass="form-control" autocomplete="nope"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Negative_Amount_Paid" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Negative_Amount_Paid"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= textbox_Transaction_Value_DateTime.ClientID %>"><%= Resources.SiteCommon.Bank_Account_Transaction_Value_DateTime %></label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_Transaction_Value_DateTime" runat="server" CssClass="Form_Control">
                            <asp:TextBox runat="server" ID="textbox_Transaction_Value_DateTime" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Transaction_Value_DateTime" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Transaction_Value_DateTime"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= textbox_Reference_Number.ClientID %>"><%= Resources.SiteCommon.Bank_Account_Transaction_Reference_Number %></label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_Reference_Number" runat="server" CssClass="Form_Control">
                            <asp:TextBox runat="server" ID="textbox_Reference_Number" ClientIDMode="Static" CssClass="form-control" autocomplete="nope"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Reference_Number" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Reference_Number"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= textbox_Transaction_Bank_Description.ClientID %>"><%= Resources.SiteCommon.Bank_Account_Transaction_Bank_Description %></label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_Transaction_Bank_Description" runat="server" CssClass="Form_Control">
                            <asp:TextBox runat="server" ID="textbox_Transaction_Bank_Description" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Transaction_Bank_Description" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Transaction_Bank_Description"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= textbox_Transaction_Bank_Inner_Reference_Code.ClientID %>"><%= Resources.SiteCommon.Bank_Account_Transaction_Bank_Inner_Reference %></label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_Transaction_Bank_Inner_Reference_Code" runat="server" CssClass="Form_Control">
                            <asp:TextBox runat="server" ID="textbox_Transaction_Bank_Inner_Reference_Code" ClientIDMode="Static" CssClass="form-control" autocomplete="nope"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Transaction_Bank_Inner_Reference_Code" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Transaction_Bank_Inner_Reference_Code"></asp:Label>
                        </asp:Panel>
                    </div>

                    <hr />

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= textbox_Transaction_User_Description.ClientID %>"><%= Resources.SiteCommon.Bank_Account_Transaction_My_Description %></label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_Transaction_User_Description" runat="server" CssClass="Form_Control">
                            <asp:TextBox runat="server" ID="textbox_Transaction_User_Description" ClientIDMode="Static" CssClass="form-control long-input" MaxLength="200" TextMode="MultiLine" autocomplete="nope"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Transaction_User_Description" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Transaction_User_Description"></asp:Label>
                        </asp:Panel>
                    </div>

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label for="<%= textbox_Transaction_User_Comments.ClientID %>"><%= Resources.SiteCommon.Bank_Account_Transaction_My_Comments %></label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Edit_Transaction_User_Comments" runat="server" CssClass="Form_Control">
                            <asp:TextBox runat="server" ID="textbox_Transaction_User_Comments" ClientIDMode="Static" 
                                CssClass="form-control long-input" MaxLength="200" TextMode="MultiLine" autocomplete="nope"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Transaction_User_Comments" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Transaction_User_Comments"></asp:Label>
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
                            <label for="<%= checkbox_Is_Visible_To_Followers_Users.ClientID %>"><%= Resources.SiteCommon.Is_Visible_To_Followers %>?</label>
                        </div>
                        <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Visible_To_Followers_Users" CssClass="Form_Control">
                            <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Followers_Users" ClientIDMode="Static" />
                        </asp:Panel>
                        <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Visible_To_Followers_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Is_Visible_To_Followers_Users"></asp:Label>
                        </asp:Panel>
                    </div>

                    <hr />

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label><%= Resources.SiteCommon.Created_By %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Record_Created_By_User" runat="server" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Record_Created_By_User"></asp:Label>
                        </asp:Panel>
                    </div>
                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label><%= Resources.SiteCommon.Created_On %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Record_Creation_DateTime_UTC" runat="server" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Record_Creation_DateTime_UTC"></asp:Label>
                        </asp:Panel>
                    </div>
                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label><%= Resources.SiteCommon.Last_Modified_By %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_By_User" runat="server" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Record_Last_Updated_By_User"></asp:Label>
                        </asp:Panel>
                    </div>
                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label><%= Resources.SiteCommon.Last_Modified_Date %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_DateTime_UTC" runat="server" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Record_Last_Updated_DateTime_UTC"></asp:Label>
                        </asp:Panel>
                    </div>

                    <hr />
                    <div>

                        <asp:Button runat="server" ID="button_Edit_BankAccount_Transaction_Details"
                            Text="<%$ Resources:SiteCommon, Bank_Account_Transaction_Edit %>" OnClick="button_Edit_BankAccount_Transaction_Details_Click" CausesValidation="False" CssClass="btn btn-primary" />

                        <asp:Button runat="server" ID="button_Update_BankAccount_Transaction_Details"
                            Text="<%$ Resources:SiteCommon, Bank_Account_Transaction_Save_Changes %>" OnClick="button_Update_BankAccount_Transaction_Details_Click" CssClass="btn btn-success" />

                        <asp:Button runat="server" ID="button_CancelEdit_BankAccount_Transaction_Details"
                            Text="<%$ Resources:SiteCommon, Bank_Account_Transaction_Cancel_Editing %>" OnClick="button_CancelEdit_BankAccount_Transaction_Details_Click" CausesValidation="False" OnClientClick="if (!confirm('Are you sure you want to cancel edit?')) return false;" CssClass="btn btn-danger" />

                    </div>
                    <div>
                        <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result"></asp:Label>
                    </div>
                </ContentTemplate>
                <Triggers>

                </Triggers>
            </asp:UpdatePanel>
            
        </asp:Panel>
        <asp:Panel runat="server" ID="Documents" ClientIDMode="Static" CssClass="tab-pane" role="tabpanel" aria-labelledby="documents-tab">
            <asp:UpdatePanel runat="server" ID="up_Transaction_Connected_Documents" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Panel runat="server" ID="pConnected_Documents_Title">
                        <br />
                        <asp:Label runat="server" ID="lblConnected_Documents_Title_Message" Text="Connected documents:"></asp:Label> 
                        <br />
                        <br />
                    </asp:Panel>
                    <asp:DataGrid runat="server" ID="grid_Connected_Documents" AutoGenerateColumns="False" CssClass="CustomTable" 
                        OnItemDataBound="grid_Connected_Documents_ItemDataBound" Visible="False">
                        <Columns>
                            <asp:TemplateColumn HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Connected_Documents_Type %>">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbl_Document_Type"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Connected_Documents_Title %>">
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" ID="link_Document_Title" NavigateUrl="#" Target="_blank"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn DataField="Document_Date" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Connected_Documents_Date %>" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Description" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Connected_Documents_Description %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Country_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Connected_Documents_Country %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="City" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Connected_Documents_City %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Email_Address" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Connected_Documents_Email %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Creation_DateTime" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Connected_Documents_Creation_Date %>" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>
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
                    <asp:Panel runat="server" ID="pConnected_Documents_Empty_Results">
                        <br />
                        <asp:Label runat="server" ID="lblConnected_Documents_Empty_Results_Message" 
                            Text="<%$ Resources:SiteCommon, Bank_Account_Transaction_There_Are_No_Connected_Documents %>"></asp:Label>
                    </asp:Panel>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="button_Add_Document_Connection" />
                    <asp:AsyncPostBackTrigger ControlID="button_Delete_Document_Connection" />
                    <asp:AsyncPostBackTrigger ControlID="button_Popup_Save_Document_Connection_Details" />
                </Triggers>
            </asp:UpdatePanel>
            <br />
            <asp:UpdatePanel runat="server" ID="upTransaction_Suggested_Documents" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Panel runat="server" ID="pSuggested_Documents_Title">
                        <hr />
                        <asp:Label runat="server" ID="lblSuggested_Documents_Title_Message" Text="<%$ Resources:SiteCommon, Bank_Account_Transaction_Suggested_Documents_Title_Message %>"></asp:Label> 
                        <br />
                    </asp:Panel>
                    <asp:DataGrid runat="server" ID="grid_Suggested_Documents" AutoGenerateColumns="False" CssClass="CustomTable" 
                        OnItemDataBound="grid_Suggested_Documents_ItemDataBound" Visible="False">
                        <Columns>
                            <asp:TemplateColumn HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Suggested_Documents_Type %>">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbl_Document_Type"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Suggested_Documents_Title %>">
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" ID="link_Document_Title" NavigateUrl="#" Target="_blank"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn DataField="Document_Date" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Suggested_Documents_Date %>" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Description" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Suggested_Documents_Description %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Country_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Suggested_Documents_Country %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="City" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Suggested_Documents_City %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Email" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Suggested_Documents_Email %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Creation_DateTime" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Suggested_Documents_Creation_Date %>" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>
                            <asp:TemplateColumn>
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" ID="link_Document_Add_Image_Button" NavigateUrl="#" Target="_blank">
                                        <img src="/Images/addmore2.png" width="32" height="32" alt="<%# Resources.SiteCommon.Bank_Account_Transaction_Connect_Suggested_Document %>" title="<%# Resources.SiteCommon.Bank_Account_Transaction_Connect_Suggested_Document %>" />
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

                    <asp:Panel runat="server" ID="pSuggested_Documents_Empty_Message">
                        <asp:Label runat="server" ID="lbl_No_Suggested_Documents" Text="<%$ Resources:SiteCommon, Bank_Account_Transaction_There_Are_No_Suggested_Documents %>"></asp:Label>
                    </asp:Panel>

                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="button_Add_Document_Connection" />
                </Triggers>
            </asp:UpdatePanel>
            <hr />
            <br />
            <span><%= Resources.SiteCommon.Bank_Account_Transaction_Search_For_Documents_To_Connect %></span>
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
                                <asp:DropDownList runat="server" ID="dropdown_Type" ClientIDMode="Static" aria-label="<%$ Resources:SiteCommon, Select_Document_Type %>" CssClass="form-select">
                                </asp:DropDownList>
                                <label><asp:Literal runat="server" ID="label_Filter_By_Type" Text="<%$ Resources:SiteCommon, Documents_Filter_By_Type %>"></asp:Literal></label>
                            </div>
                        </div>

                        <div class="col-md">
                            <div class="form-floating">
                                <asp:DropDownList runat="server" ID="dropdown_Country" ClientIDMode="Static" aria-label="<%$ Resources:SiteCommon, Select_Country %>"
                                    CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Country_SelectedIndexChanged">
                                </asp:DropDownList>
                                <label><asp:Literal runat="server" ID="label_Filter_By_Country" Text="<%$ Resources:SiteCommon, Filter_By_Country %>"></asp:Literal></label>
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
                            <asp:TextBox runat="server" ID="text_Filter_By_CityAddressZipCode" ClientIDMode="Static" CssClass="form-control" 
                                placeholder="<%$ Resources:SiteCommon, Filter_By_CityAddressZipCode %>"></asp:TextBox>
                            <label for="text_Filter_By_CityAddressZipCode"><%= Resources.SiteCommon.Filter_By_CityAddressZipCode %></label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <asp:TextBox runat="server" ID="text_Filter_By_CompanyNamePeopleName" ClientIDMode="Static" CssClass="form-control" 
                                placeholder="<%$ Resources:SiteCommon, Filter_By_CompanyNamePeopleName %>"></asp:TextBox>
                            <label for="text_Filter_By_CompanyNamePeopleName"><%= Resources.SiteCommon.Filter_By_CompanyNamePeopleName %></label>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <asp:Button runat="server" ID="button_Search_Documents" OnClick="button_Search_Documents_Click" 
                Text="<%$ Resources:SiteCommon, Search_Documents %>" CssClass="btn btn-primary" />
            <asp:UpdatePanel runat="server" ID="updatePanel_Search_Result">
                <ContentTemplate>
                    <hr />
                    <asp:DataGrid runat="server" ID="dataGrid_Documents_List" AutoGenerateColumns="False" CssClass="CustomTable" 
                        OnItemDataBound="dataGrid_Documents_List_ItemDataBound" Visible="False">
                        <Columns>
                            <asp:TemplateColumn HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Suggested_Documents_Type %>">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbl_Document_Type"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Suggested_Documents_Title %>">
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" ID="link_Document_Title" NavigateUrl="#" Target="_blank"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn DataField="Document_Date" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Suggested_Documents_Date %>" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Description" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Suggested_Documents_Description %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Country_Name" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Suggested_Documents_Country %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="City" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Suggested_Documents_City %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Email_Address" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Suggested_Documents_Email %>"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Creation_DateTime" HeaderText="<%$ Resources:SiteCommon, GridTable_Bank_Account_Transaction_Suggested_Documents_Creation_Date %>" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>
                            <asp:TemplateColumn>
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" ID="link_Document_Add_Image_Button" NavigateUrl="#"><img 
                                        src="/Images/addmore2.png" width="32" height="32" alt="<%# Resources.SiteCommon.Bank_Account_Transaction_Connect_Suggested_Document %>" title="<%# Resources.SiteCommon.Bank_Account_Transaction_Connect_Suggested_Document %>" /></asp:HyperLink>
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
                        <label><%= Resources.SiteCommon.Bank_Account_Transaction_Documents_Use_Search_Criteria %></label>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="panel_No_Results_Message" Visible="False" class="alert alert-warning">
                        <%= Resources.SiteCommon.Bank_Account_Transaction_Documents_No_Results_Were_Found %>
                    </asp:Panel>

                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="button_Search_Documents" />
                    <asp:AsyncPostBackTrigger ControlID="button_Add_Document_Connection" />
                </Triggers>

            </asp:UpdatePanel>
        </asp:Panel>
        <asp:Panel runat="server" ID="CCStatement" ClientIDMode="Static" CssClass="tab-pane" role="tabpanel" aria-labelledby="ccstatement-tab">
            <asp:UpdatePanel runat="server" ID="up_CCStatement_Details" UpdateMode="Conditional" >
                <ContentTemplate>
                    
                    <asp:Panel runat="server" ID="panel_Statement_Unconnected" Visible="true">
                        <br /><br />
                        <%= Resources.SiteCommon.Bank_Account_Transaction_Not_Connected_To_Credit_Card_Statement %>
                        <br />
                        <%= Resources.SiteCommon.Bank_Account_Transaction_It_Is_Not_Possible_To_Both_Connect_Statement_And_Documents %>
                        <br />
                        <%= Resources.SiteCommon.Bank_Account_Transaction_Each_Transaction_In_Credit_Card_Statement_Has_Own_Documents %>
                        <br />

                        <%= Resources.SiteCommon.Bank_Account_Transaction_Connect_With_A_Credit_Card_Statement %>
                        <asp:DropDownList runat="server" ID="dropdown_CreditCardStatements" CssClass="form-control" style="display:inline-block" Width="400px"></asp:DropDownList>
                        <asp:button runat="server" ID="button_Save_Statement_Connection" CssClass="btn btn-primary" Text="<%$ Resources:SiteCommon, Connect_Credit_Card_Statement %>" OnClick="button_Save_Statement_Connection_Click" /> 
                    </asp:Panel>

                    <asp:Panel runat="server" ID="panel_Statement_Info" Visible="false">
                        <br />
                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><% = Resources.SiteCommon.Bank_Name %>:</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_BankAccount"></asp:Label>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><% = Resources.SiteCommon.Credit_Card %>:</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_CreditCard"></asp:Label>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><% = Resources.SiteCommon.CC_Statement_Date %>:</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_CCStatement_DateTime"></asp:Label>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><% = Resources.SiteCommon.Currency %>:</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Currency"></asp:Label>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><% = Resources.SiteCommon.Total_Amount %>:</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Total_Amount"></asp:Label>
                            </div>
                        </div>

                        <asp:Panel runat="server" ID="p_Edit_Statement_File_Download" Visible="false" class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label style="font-weight: bold"><%= Resources.SiteCommon.Filename %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="panel_Image_Download_CCStatement" CssClass="Form_Control Read_Only_Panel">
                                <asp:HyperLink runat="server" ID="link_Download_CCStatement"></asp:HyperLink> &nbsp; &nbsp;
                                <asp:HyperLink runat="server" ID="link_Download_CCStatement2">
                                    <img src="/Images/download.png" width="32" height="32" alt="<%= Resources.SiteCommon.Download %>" title="<%= Resources.SiteCommon.Download %>" />
                                </asp:HyperLink>
                            </asp:Panel>
                        </asp:Panel>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><%= Resources.SiteCommon.Is_Visible_To_Public %>?</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_CCStatement_Is_Visible_To_Anonymous_Users"></asp:Label>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><%= Resources.SiteCommon.Is_Downloadable_To_Public %>?</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_CCStatement_Is_Available_For_Download_For_Anonymous_Users"></asp:Label>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><%= Resources.SiteCommon.Is_Visible_To_Followers %>?</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_CCStatement_Is_Visible_To_Followers_Users"></asp:Label>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><%= Resources.SiteCommon.Can_Followers_Download_File %>?</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_CCStatement_Is_Available_For_Download_For_Followers_Users"></asp:Label>
                            </div>
                        </div>

                        <hr />
                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><% = Resources.SiteCommon.Created_By %>:</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_CCStatement_Record_Created_By_User"></asp:Label>
                            </div>
                        </div>
                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><% = Resources.SiteCommon.Created_On %>:</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_CCStatement_Record_Creation_DateTime_UTC"></asp:Label>
                            </div>
                        </div>
                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><% = Resources.SiteCommon.Last_Modified_By %>:</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_CCStatement_Record_Last_Updated_By_User"></asp:Label>
                            </div>
                        </div>
                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><% = Resources.SiteCommon.Last_Modified_Date %>:</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_CCStatement_Record_Last_Updated_DateTime_UTC"></asp:Label>
                            </div>
                        </div>
                        <hr />
                        <asp:HiddenField runat="server" ID="hidden_Credit_Card_Statement_Id" />
                        <asp:HyperLink runat="server" ID="link_Statement_ViewMore" CssClass="btn btn-primary" 
                            Target="_blank" NavigateUrl="#" Text="<%$ Resources:SiteCommon, View_More %>">
                        </asp:HyperLink>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:HyperLink runat="server" ID="link_Statement_EditDetails" CssClass="btn btn-secondary" Target="_blank" 
                            NavigateUrl="#" Text="<%$ Resources:SiteCommon, Edit_Details %>">
                        </asp:HyperLink>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:button runat="server" ID="button_Delete_Statement_Connection" CssClass="btn btn-danger" 
                            Text="<%$ Resources:SiteCommon, Remove_Credit_Card_Statement %>" OnClick="button_Delete_Statement_Connection_Click" />
                        
                    </asp:Panel>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="button_Save_Statement_Connection" />
                    <asp:AsyncPostBackTrigger ControlID="button_Delete_Statement_Connection" />
                </Triggers>
            </asp:UpdatePanel>
        </asp:panel>
    </div>

    <div class="Popup_Background_Wrapper hidden">
        <div class="Popup_Inner_Wrapper Document_Connection_Popup">
            <img class="Close-Button" alt="<%= Resources.SiteCommon.Close_Window %>" title="<%= Resources.SiteCommon.Close_Window %>" height="32" width="32" src="/Images/Close.png" onclick="Hide_Edit_Popup();" />
            <div class="Header_Title">
                <%= Resources.SiteCommon.Bank_Account_Transaction_Edit_Document_Connection_Settings %>
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
                    OnClick="button_Popup_Save_Document_Connection_Details_Click" Text="<%$ Resources:SiteCommon, Bank_Account_Transaction_Save_Document_Connection_Details %>" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>

    <asp:HiddenField runat="server" ID="hidden_Add_Document_Connection_Document_Record_Id" ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID="hidden_Add_Document_Connection_Type" ClientIDMode="Static" />
    <asp:Button runat="server" ID="button_Add_Document_Connection" ClientIDMode="Static" CssClass="hidden" Text="" OnClick="button_Add_Document_Connection_Click" />
    <asp:HiddenField runat="server" ID="hidden_Delete_Document_Connection_Id" ClientIDMode="Static" />
    <asp:Button runat="server" ID="button_Delete_Document_Connection" ClientIDMode="Static" CssClass="hidden" Text="" OnClick="button_Delete_Document_Connection_Click" />

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

            document.getElementById('hidden_Delete_Document_Connection_Id').value = p_Document_Connection_Id;
            document.getElementById('button_Delete_Document_Connection').click();
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
                    if ($('#Documents').length > 0) {
                        $('#Documents').addClass('active');
                        $('#tab_Button_Documents').addClass('active');
                    }
                    else {
                        $('#General_Info').addClass('active');
                        $('#tab_Button_General_Info').addClass('active');
                    }
                }
                else if (l_Hash.indexOf('statement') > -1) {
                    $('#CCStatement').addClass('active');
                    $('#tab_Button_CreditCardStatement').addClass('active');
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

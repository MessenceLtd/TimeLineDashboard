<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_CreditCardStatement.aspx.cs" Inherits="WebformsPOCDemo.manage_CreditCardStatement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5"><% = Resources.SiteCommon.Manage_Credit_Card_Statement_Title %></h2>
        <p class="lead"><% = Resources.SiteCommon.Manage_Credit_Card_Statement_SubTitle %></p>
    </div>

    <hr />

    <asp:Panel runat="server" ID="panel_Tabs" Visible="true">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <asp:HyperLink runat="server" ID="tab_Button_General_Info" ClientIDMode="Static" CssClass="nav-link" data-toggle="tab" 
                    NavigateUrl="#General_Info" role="tab" aria-controls="general_info" aria-selected="true" Text="<%$ Resources:SiteCommon, Manage_Credit_Card_Statement_General_Info_Tab %>"></asp:HyperLink>
            </li>
            <li class="nav-item" runat="server" id="liTab_CreditCardStatement">
                <asp:HyperLink runat="server" ID="tab_Button_Transaction" ClientIDMode="Static" 
                    CssClass="nav-link" data-toggle="tab" NavigateUrl="#Transaction" role="tab" 
                    aria-controls="Transaction" aria-selected="true" Text="<%$ Resources:SiteCommon, Manage_Credit_Card_Statement_Bank_Account_Transaction_Tab %>"></asp:HyperLink>
            </li>
        </ul>
        <br />
    </asp:Panel>

    <div class="tab-content">
        <asp:Panel runat="server" ID="General_Info" ClientIDMode="Static" CssClass="tab-pane" role="tabpanel" aria-labelledby="general_info-tab">
            <div>
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label><% = Resources.SiteCommon.Bank_Name %>:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_BankAccount" Visible="true" CssClass="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_BankAccounts" ClientIDMode="Static" CssClass="Regular_ComboBox form-control"></asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_BankAccount" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_BankAccount"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Select_Bank_Account" ErrorMessage="<%$ Resources:SiteCommon, Validator_Select_Bank_Account %>" 
                        Display="Dynamic" ControlToValidate="dropdown_BankAccounts" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label><% = Resources.SiteCommon.Credit_Card %>:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Credit_Card" Visible="true" CssClass="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_CreditCard" ClientIDMode="Static" CssClass="Regular_ComboBox form-control"></asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_CreditCard" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_CreditCard"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Select_Credit_Card" ErrorMessage="<%$ Resources:SiteCommon, Validator_Select_Credit_Card %>" 
                        Display="Dynamic" ControlToValidate="dropdown_CreditCard" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_CCStatement_DateTime.ClientID %>"><% = Resources.SiteCommon.CC_Statement_Date %>:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_CCStatement_DateTime" Visible="true" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_CCStatement_DateTime" ClientIDMode="Static" autocomplete="off" CssClass="form-control InitializeDatePicker"
                            AutoPostBack="true" OnTextChanged="textbox_CCStatement_DateTime_TextChanged"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_CCStatement_DateTime" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_CCStatement_DateTime"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_CCStatement_DateTime_Required"
                        ErrorMessage="<%$ Resources:SiteCommon, Validator_CCStatement_DateTime_Required %>" Display="Dynamic" ControlToValidate="textbox_CCStatement_DateTime" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Currency.ClientID %>"><% = Resources.SiteCommon.Currency %>:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Currency" Visible="true" CssClass="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control"></asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Currency" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Currency"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Currency_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Currency_Required %>" 
                        Display="Dynamic" ControlToValidate="dropdown_Currency" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Total_Amount.ClientID %>"><% = Resources.SiteCommon.Total_Amount %>:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Total_Amount" Visible="true" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Total_Amount" ClientIDMode="Static"
                            CssClass="form-control" autocomplete="off"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Total_Amount" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Total_Amount"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Total_Amount_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Total_Amount_Required %>" Display="Dynamic"
                        ControlToValidate="textbox_Total_Amount" CssClass="text-danger"></asp:RequiredFieldValidator>
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
                <asp:Panel runat="server" ID="p_Edit_Statement_File" Visible="false" class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= fileUpload_CCStatement_File.ClientID %>"><%= Resources.SiteCommon.Upload_File %>:</label>
                    </div>
                    <div class="Form_Control">
                        <asp:FileUpload runat="server" ID="fileUpload_CCStatement_File" ClientIDMode="Static" CssClass="form-control" />
                    </div>
                </asp:Panel>

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

                <asp:Panel runat="server" ID="panel_Last_Updates_Info" Visible="false">

                    <hr />

                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label><% = Resources.SiteCommon.Created_By %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Record_Created_By_User" runat="server" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Record_Created_By_User"></asp:Label>
                        </asp:Panel>
                    </div>
                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label><% = Resources.SiteCommon.Created_On %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Record_Creation_DateTime_UTC" runat="server" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Record_Creation_DateTime_UTC"></asp:Label>
                        </asp:Panel>
                    </div>
                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label><% = Resources.SiteCommon.Last_Modified_By %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_By_User" runat="server" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Record_Last_Updated_By_User"></asp:Label>
                        </asp:Panel>
                    </div>
                    <div class="Form_Group">
                        <div class="Form_Label_Wrapper">
                            <label><% = Resources.SiteCommon.Last_Modified_Date %>:</label>
                        </div>
                        <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_DateTime_UTC" runat="server" CssClass="Form_Control Read_Only_Panel">
                            <asp:Label runat="server" ID="label_Record_Last_Updated_DateTime_UTC"></asp:Label>
                        </asp:Panel>
                    </div>
                </asp:Panel>

                <asp:Panel runat="server" ID="panel_Top_Buttons" Visible="true">
            
                    <hr />
                    <asp:Button runat="server" ID="button_Edit_CreditCardStatement_Details_Top" OnClick="button_Edit_Credit_Card_Statement_Details_Click"
                        Text="Edit Statement" CausesValidation="False" CssClass="btn btn-primary" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button runat="server" ID="button_Update_CreditCardStatement_Details_Top" OnClick="button_Update_Credit_Card_Statement_Details_Click"
                                    Text="Save Statement" CssClass="btn btn-success" CausesValidation="true" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button runat="server" ID="button_CancelEdit_CreditCardStatement_Details_Top"
                        Text="Cancel Editing" OnClick="button_CancelEdit_Credit_Card_Statement_Details_Click" CausesValidation="False"
                        CssClass="btn btn-danger" />

                </asp:Panel>
                <hr />

                <div class="page-title my-3 text-center">
                    <p class="lead"><% = Resources.SiteCommon.Statement_Charges %></p>
                </div>
                <hr />

                <asp:UpdatePanel runat="server" ID="up_Credit_Card_Transactions1">
                    <ContentTemplate>

                        <asp:Panel runat="server" ID="panel_Add_New_CCStatement_Transaction_In_The_Begining">
                            <asp:Button runat="server" ID="button_Add_New_Bank_Account_Transactions_In_The_Begining" ClientIDMode="Static" CausesValidation="false"
                                Text="<%$ Resources:SiteCommon, Credit_Card_Statement_Add_New_Transaction_Record_On_Top %>" CssClass="btn btn-primary" OnClick="button_Add_New_Credit_Card_Transactions_Click" />
                            <br />
                        </asp:Panel>
                        <br />
                        <div class="Responsive-Table">
                            <asp:Repeater runat="server" ID="repeater" OnItemDataBound="Repeater_ItemDataBound">
                                <HeaderTemplate>
                                    <div class="tr">
                                        <div class="th"><%# Resources.SiteCommon.Date %></div>
                                        <div class="th"><%# Resources.SiteCommon.Business_Name %></div>
                                        <div class="th"><%# Resources.SiteCommon.Payment_Amount %></div>
                                        <div class="th"><%# Resources.SiteCommon.Charged_Amount %></div>
                                        <div class="th"><%# Resources.SiteCommon.Short_Description %></div>
                                        <div class="th"><%# Resources.SiteCommon.Operations %></div>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div id='<%# Eval("Credit_Card_Statement_Transaction_Id", "Transaction_Record_Row_{0}") %>' class="hidden">
                                    </div>
                                    <asp:Panel runat="server" ID="panel_Bank_Account_Transaction_Id" CssClass="tr">
                                        <div class="td">
                                            <asp:TextBox runat="server" ID="txt_Transaction_Date" CssClass="form-control InitializeDatePicker Transaction_Date" 
                                                autocomplete="nope" placeHolder="<%# Resources.SiteCommon.Credit_Card_Statement_Transactions_Transaction_Date %>" LastEditedValue='<%# Eval("Transaction_Date", "{0:dd/MM/yyyy}" ) %>' Text='<%# Bind("Transaction_Date", "{0:dd/MM/yyyy}" ) %>'></asp:TextBox>
                                            <asp:Label runat="server" ID="label_Transaction_Date" CssClass="Transaction_Date" Text='<%# Bind("Transaction_Date", "{0:dd/MM/yyyy}" ) %>'></asp:Label>
                                        </div>

                                        <div class="td">
                                            <asp:TextBox runat="server" ID="txt_Business_Name" CssClass="form-control Business_Name" autocomplete="nope" 
                                                placeHolder="<%# Resources.SiteCommon.Credit_Card_Statement_Transactions_Business_Name %>" LastEditedValue='<%# Eval("Business_Name") %>' Text='<%# Bind("Business_Name") %>'></asp:TextBox>
                                            <asp:Label runat="server" ID="label_Business_Name" CssClass="Business_Name" Text='<%# Bind("Business_Name" ) %>'></asp:Label>
                                        </div>

                                        <div class="td">
                                            <asp:TextBox runat="server" ID="txt_Transaction_Amount" CssClass="form-control Transaction_Amount" autocomplete="nope" 
                                                placeHolder="<%# Resources.SiteCommon.Credit_Card_Statement_Transactions_Transaction_Amount %>"
                                                LastEditedValue='<%# Eval("Transaction_Amount") %>' Text='<%# Bind("Transaction_Amount", "{0:#,#.##}") %>'></asp:TextBox>
                                            <asp:DropDownList runat="server" ID="dropdown_Transaction_Amount_Currency" Width="80px"
                                                CssClass="form-control Transaction_Amount_Currency">
                                            </asp:DropDownList>
                                            <asp:Label runat="server" ID="label_Transaction_Amount" CssClass="Transaction_Amount">
                                            </asp:Label>
                                        </div>

                                        <div class="td">
                                            <asp:TextBox runat="server" ID="txt_Transaction_Actual_Payment_Amount" CssClass="form-control Transaction_Actual_Payment_Amount" autocomplete="nope" 
                                                placeHolder="<%# Resources.SiteCommon.Credit_Card_Statement_Transactions_Actual_Payment_Amount %>"
                                                LastEditedValue='<%# Eval("Transaction_Actual_Payment_Amount", "{0:#,#.##}") %>' Text='<%# Bind("Transaction_Actual_Payment_Amount", "{0:#,#.##}") %>'></asp:TextBox>
                                            <asp:Label runat="server" ID="label_Transaction_Actual_Payment_Amount" CssClass="Transaction_Actual_Payment_Amount" Text='<%# Bind("Transaction_Actual_Payment_Amount", "{0:#,#.##}") %>'></asp:Label>
                                        </div>

                                        <div class="td">
                                            <asp:TextBox runat="server" ID="txt_Description" CssClass="form-control Description" autocomplete="nope" 
                                                placeHolder="<%# Resources.SiteCommon.Description %>" LastEditedValue='<%# Eval("Description") %>' Text='<%# Bind("Description") %>'></asp:TextBox>
                                            <asp:Label runat="server" ID="label_Description" CssClass="Description" Text='<%# Bind("Description" ) %>'></asp:Label>
                                        </div>

                                        <div class="td" style="text-align: center">
                                            <asp:HiddenField runat="server" ID="hidden_Transaction_Record_ID" Value='<%# Bind( "Credit_Card_Statement_Transaction_Id" ) %>' />
                                            <asp:HiddenField runat="server" ID="hidden_IsNewRecord" Value='<%# Bind( "Is_New_Record" ) %>' />
                                            <asp:HiddenField runat="server" ID="hidden_PendingChanges" Value='<%# Bind( "Has_Pending_Changes" ) %>' />
                                            <asp:HiddenField runat="server" ID="hidden_IsDeleted" Value='<%# Bind( "Is_Deleted" ) %>' />
                                            <% if (l_Is_Create_Or_Edit_View)
                                                { %>
                                            <a class="Button_Edit" href='<%# Eval("Credit_Card_Statement_Transaction_Id", "javascript:EditCreditCardTransactionRow({0})") %>' id="EditRow">
                                                <img src="/Images/edit.png" width="32" height="32" alt="<%# Resources.SiteCommon.Edit %>" title="<%# Resources.SiteCommon.Edit %>" /></a>
                                            <a class="Button_SaveEdit" href='<%# Eval("Credit_Card_Statement_Transaction_Id", "javascript:SaveEditCreditCardTransactionRow({0})") %>' id="SaveEditRow">
                                                <img src="/Images/save.png" width="32" height="32" alt="<%# Resources.SiteCommon.Save %>" title="<%# Resources.SiteCommon.Save %>" /></a>
                                            <a class="Button_CancelEdit" href='<%# Eval("Credit_Card_Statement_Transaction_Id", "javascript:CancelEditCreditCardTransactionRow({0})") %>' id="CancelEditRow">
                                                <img src="/Images/cancel.png" width="32" height="32" alt="<%# Resources.SiteCommon.Cancel_Edit %>" title="<%# Resources.SiteCommon.Cancel_Edit %>" /></a>
                                            <a class="Button_AddMore" href='<%# Eval("Credit_Card_Statement_Transaction_Id", "javascript:AddNewTransactionRow({0})") %>'>
                                                <img src="/Images/addmore2.png" width="32" height="32" alt="<%# Resources.SiteCommon.Add_Record %>" title="<%# Resources.SiteCommon.Add_Record %>" /></a>
                                            <a class="Button_Delete" href='<%# Eval("Credit_Card_Statement_Transaction_Id", "javascript:DeleteCreditCardTransactionRow({0})") %>' id="DeleteRow">
                                                <img src="/Images/delete.png" width="32" height="32" alt="<%# Resources.SiteCommon.Delete %>" title="<%# Resources.SiteCommon.Delete %>" /></a>
                                            <% } %>

                                            <asp:PlaceHolder runat="server" ID="phCreditCardStatementTransactionDetails" Visible='<%# (((long)Eval("Credit_Card_Statement_Transaction_Id")) > 0) %>'>
                                                <a class="Button_ViewMore" target="_blank" href='<%# Eval("Credit_Card_Statement_Transaction_Id", "manage_CreditCardStatementTransaction.aspx?id={0}") %>'><img 
                                                    src="/Images/viewdetails2.png" width="32" height="32" alt="<%# Resources.SiteCommon.View_More %>" title="<%# Resources.SiteCommon.View_More %>" /></a>
                                                <a class="Button_ViewMore" target="_blank" href='<%# Eval("Credit_Card_Statement_Transaction_Id", "manage_CreditCardStatementTransaction.aspx?id={0}#documents") %>'><img 
                                                    src="/Images/documents.png" width="32" height="32" alt="<%# Resources.SiteCommon.View_Documents %>" title="<%# Resources.SiteCommon.View_Documents  %>" /></a>
                                            </asp:PlaceHolder>

                                        </div>
                                    </asp:Panel>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>

                            </asp:Repeater>
                        </div>

                        <asp:HiddenField runat="server" ID="hidden_Pending_Changes" ClientIDMode="Static" Value="false" />
                        <asp:Panel runat="server" ID="panel_Add_New_CCStatement_Transaction_In_The_End">
                            <br />
                            <asp:Button runat="server" ID="button_Add_New_Bank_Account_Transactions_In_The_End" ClientIDMode="Static" CausesValidation="false"
                                Text="<%$ Resources:SiteCommon, Credit_Card_Statement_Add_New_Transaction_Record_On_Bottom %>" CssClass="btn btn-primary" OnClick="button_Add_New_Credit_Card_Transactions_Click" />
                        </asp:Panel>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="button_Add_New_Transaction_After_Transaction_Id" />
                        <asp:AsyncPostBackTrigger ControlID="button_Add_New_Bank_Account_Transactions_In_The_Begining" />
                        <asp:AsyncPostBackTrigger ControlID="button_Add_New_Bank_Account_Transactions_In_The_End" />
                    </Triggers>
                </asp:UpdatePanel>

                <hr />

                <div>

                    <asp:Button runat="server" ID="button_Edit_CreditCardStatement_Details" OnClick="button_Edit_Credit_Card_Statement_Details_Click"
                        Text="<%$ Resources:SiteCommon, Manage_Credit_Card_Statement_Edit_Statement %>" CausesValidation="False" CssClass="btn btn-primary" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button runat="server" ID="button_Update_CreditCardStatement_Details" OnClick="button_Update_Credit_Card_Statement_Details_Click"
                        Text="<%$ Resources:SiteCommon, Manage_Credit_Card_Statement_Save_Statement %>" CssClass="btn btn-success" CausesValidation="true" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button runat="server" ID="button_Create_CreditCardStatement_Details" OnClick="button_Create_Credit_Card_Statement_Details_Click"
                        Text="<%$ Resources:SiteCommon, Manage_Credit_Card_Statement_Create_Statement %>" CssClass="btn btn-success" CausesValidation="true" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button runat="server" ID="button_CancelEdit_CreditCardStatement_Details"
                        Text="<%$ Resources:SiteCommon, Manage_Credit_Card_Statement_Cancel_Editing %>" OnClick="button_CancelEdit_Credit_Card_Statement_Details_Click" CausesValidation="False"
                        CssClass="btn btn-danger" />

                    <asp:HiddenField runat="server" ID="hidden_New_Credit_Card_Transaction_After_Transaction_ID" ClientIDMode="Static" />

                    <asp:Button runat="server" ID="button_Add_New_Transaction_After_Transaction_Id" ClientIDMode="Static" CausesValidation="false"
                        Text="Add new after transaction" Style="display: none" OnClick="button_Add_New_Transaction_After_Transaction_Id_Click" />

            

                    <asp:HiddenField runat="server" ID="hidden_User_Id_Owner" />

                </div>

                <div>
                    <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result"></asp:Label>
                </div>

            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="Transaction" ClientIDMode="Static" CssClass="tab-pane" role="tabpanel" aria-labelledby="BankAccountTransaction-tab">
            <asp:UpdatePanel runat="server" ID="up_BankAccountTransaction_Details" UpdateMode="Conditional" >
                <ContentTemplate>
                    
                    <asp:Panel runat="server" ID="panel_BankAccountTransaction_Unconnected" Visible="true">
                        <br /><br />
                        <%= Resources.SiteCommon.Credit_Card_Statement_Unconnected_To_Bank_Account_Transaction %>
                        <br />
                        <br />
                        <%= Resources.SiteCommon.Credit_Card_Statement_Connect_Statement_To_Bank_Account_Transaction %>
                        <asp:DropDownList runat="server" ID="dropdown_BankAccountTransaction" CssClass="form-control" style="display:inline-block" Width="400px"></asp:DropDownList>
                        <asp:button runat="server" ID="button_Save_BankAccountTransaction_Connection" 
                            CssClass="btn btn-primary" Text="<%$ Resources:SiteCommon, Credit_Card_Statement_Connect_Bank_Transaction_Button %>" OnClick="button_Save_BankAccountTransaction_Connection_Click" /> 
                    </asp:Panel>

                    <asp:Panel runat="server" ID="panel_BankAccountTransaction_Info" Visible="false">
                        
                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">    
                                <label><%= Resources.SiteCommon.Account_Balance %>:</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_BankAccountTransaction_Transaction_Account_Balance"></asp:Label>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><%= Resources.SiteCommon.Transaction_Date %>:</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_BankAccountTransaction_Transaction_Actual_DateTime"></asp:Label>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><%= Resources.SiteCommon.Bank_Account_Transaction_Amount_Entered %></label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_BankAccountTransaction_Positive_Amount_Entered"></asp:Label>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><%= Resources.SiteCommon.Bank_Account_Transaction_Amount_Paid %></label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_BankAccountTransaction_Negative_Amount_Paid"></asp:Label>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><%= Resources.SiteCommon.Bank_Account_Transaction_Value_DateTime %></label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_BankAccountTransaction_Transaction_Value_DateTime"></asp:Label>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><%= Resources.SiteCommon.Bank_Account_Transaction_Reference_Number %></label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_BankAccountTransaction_Reference_Number"></asp:Label>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><%= Resources.SiteCommon.Bank_Account_Transaction_Bank_Description %></label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_BankAccountTransaction_Transaction_Bank_Description"></asp:Label>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><%= Resources.SiteCommon.Bank_Account_Transaction_Bank_Inner_Reference %></label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_BankAccountTransaction_Transaction_Bank_Inner_Reference_Code"></asp:Label>
                            </div>
                        </div>

                        <hr />

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><%= Resources.SiteCommon.Bank_Account_Transaction_My_Description %></label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_BankAccountTransaction_Transaction_User_Description"></asp:Label>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><%= Resources.SiteCommon.Bank_Account_Transaction_My_Comments %></label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_BankAccountTransaction_Transaction_User_Comments"></asp:Label>
                            </div>
                        </div>

                        <hr />

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><%= Resources.SiteCommon.Is_Visible_To_Public %>?</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_BankAccountTransaction_Is_Visible_To_Anonymous_Users"></asp:Label>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><%= Resources.SiteCommon.Is_Visible_To_Followers %>?</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_BankAccountTransaction_Is_Visible_To_Followers_Users"></asp:Label>
                            </div>
                        </div>

                        <hr />

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><% = Resources.SiteCommon.Created_By %>:</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_BankAccountTransaction_Record_Created_By_User"></asp:Label>
                            </div>
                        </div>
                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><% = Resources.SiteCommon.Created_On %>:</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_BankAccountTransaction_Record_Creation_DateTime_UTC"></asp:Label>
                            </div>
                        </div>
                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><% = Resources.SiteCommon.Last_Modified_By %>:</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_BankAccountTransaction_Record_Last_Updated_By_User"></asp:Label>
                            </div>
                        </div>
                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label><% = Resources.SiteCommon.Last_Modified_Date %>:</label>
                            </div>
                            <div class="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_BankAccountTransaction_Record_Last_Updated_DateTime_UTC"></asp:Label>
                            </div>
                        </div>
                        <hr />
                        <asp:HiddenField runat="server" ID="hidden_Bank_Account_Transaction_Id" />
                        <asp:HyperLink runat="server" ID="link_BankAccountTransaction_ViewMore" CssClass="btn btn-primary" 
                            Target="_blank" NavigateUrl="#" Text="<%$ Resources:SiteCommon, Credit_Card_Statement_Bank_Transaction_Connection_View_More %>">
                        </asp:HyperLink>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:HyperLink runat="server" ID="link_BankAccountTransaction_EditDetails" CssClass="btn btn-secondary" Target="_blank" 
                            NavigateUrl="#" Text="<%$ Resources:SiteCommon, Credit_Card_Statement_Bank_Transaction_Connection_Edit_Details %>">
                        </asp:HyperLink>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:button runat="server" ID="button_Delete_BankAccountTransaction_Connection" CssClass="btn btn-danger" 
                            Text="<%$ Resources:SiteCommon, Credit_Card_Statement_Bank_Transaction_Connection_Remove %>" OnClick="button_Delete_BankAccountTransaction_Connection_Click" />
                        
                    </asp:Panel>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="button_Save_BankAccountTransaction_Connection" />
                    <asp:AsyncPostBackTrigger ControlID="button_Delete_BankAccountTransaction_Connection" />
                </Triggers>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>

    <script type="text/javascript">

        function EditCreditCardTransactionRow(Transaction_Id) {
            var rowToMarkEditing = $('#Transaction_Record_Row_' + Transaction_Id + ' + .tr');
            if (rowToMarkEditing && rowToMarkEditing.length > 0) {
                rowToMarkEditing.addClass("Editing");

                var selected_Currency_Name = $(rowToMarkEditing).find('select.Transaction_Amount_Currency option:selected').text().split(' - ')[1];
                if (!selected_Currency_Name) {
                    $(rowToMarkEditing).find('select.Transaction_Amount_Currency').val(
                        $('#dropdown_Currency').val()
                    );
                }
            }
        }

        function StartEditFirstRowOnCreateView() {
            EditCreditCardTransactionRow(0);
        }

        function CancelEditCreditCardTransactionRow(Transaction_Id) {
            var rowToMarkEditing = $('#Transaction_Record_Row_' + Transaction_Id + ' + .tr');
            if (rowToMarkEditing && rowToMarkEditing.length > 0) {
                $(rowToMarkEditing).find('input.Transaction_Date').val($(rowToMarkEditing).find('input.Transaction_Date').attr('LastEditedValue'));
                $(rowToMarkEditing).find('span.Transaction_Date').text($(rowToMarkEditing).find('input.Transaction_Date').attr('LastEditedValue'));

                $(rowToMarkEditing).find('input.Business_Name').val($(rowToMarkEditing).find('input.Business_Name').attr('LastEditedValue'));
                $(rowToMarkEditing).find('span.Business_Name').text($(rowToMarkEditing).find('input.Business_Name').attr('LastEditedValue'));

                $(rowToMarkEditing).find('input.Transaction_Amount').val($(rowToMarkEditing).find('input.Transaction_Amount').attr('LastEditedValue'));

                var Transaction_Amount_With_Currency = $(rowToMarkEditing).find('input.Transaction_Amount').attr('LastEditedValue')
                var last_Edited_CurrencyId = $(rowToMarkEditing).find('select.Transaction_Amount_Currency').attr('LastEditedValue');
                if (last_Edited_CurrencyId && last_Edited_CurrencyId > 0) {
                    $(rowToMarkEditing).find('select.Transaction_Amount_Currency').val(last_Edited_CurrencyId);
                }
                var currency_Name = $(rowToMarkEditing).find('select.Transaction_Amount_Currency option:selected').text().split(' - ')[1];
                if (currency_Name && Transaction_Amount_With_Currency)
                    Transaction_Amount_With_Currency += currency_Name;
                $(rowToMarkEditing).find('span.Transaction_Amount').text(Transaction_Amount_With_Currency);

                $(rowToMarkEditing).find('input.Transaction_Actual_Payment_Amount').val($(rowToMarkEditing).find('input.Transaction_Actual_Payment_Amount').attr('LastEditedValue'));
                $(rowToMarkEditing).find('span.Transaction_Actual_Payment_Amount').text($(rowToMarkEditing).find('input.Transaction_Actual_Payment_Amount').attr('LastEditedValue'));

                $(rowToMarkEditing).find('input.Description').val($(rowToMarkEditing).find('input.Description').attr('LastEditedValue'));
                $(rowToMarkEditing).find('span.Description').text($(rowToMarkEditing).find('input.Description').attr('LastEditedValue'));

                rowToMarkEditing.removeClass("Editing");
            }
        }

        function SaveEditCreditCardTransactionRow(Transaction_Id) {
            var rowToMarkEditing = $('#Transaction_Record_Row_' + Transaction_Id + ' + .tr');
            if (rowToMarkEditing && rowToMarkEditing.length > 0) {
                $(rowToMarkEditing).find('input.Transaction_Date').attr('LastEditedValue', $(rowToMarkEditing).find('input.Transaction_Date').val());
                $(rowToMarkEditing).find('span.Transaction_Date').text($(rowToMarkEditing).find('input.Transaction_Date').attr('LastEditedValue'));

                $(rowToMarkEditing).find('input.Business_Name').attr('LastEditedValue', $(rowToMarkEditing).find('input.Business_Name').val());
                $(rowToMarkEditing).find('span.Business_Name').text($(rowToMarkEditing).find('input.Business_Name').attr('LastEditedValue'));

                $(rowToMarkEditing).find('input.Transaction_Amount').attr('LastEditedValue', $(rowToMarkEditing).find('input.Transaction_Amount').val());
                $(rowToMarkEditing).find('select.Transaction_Amount_Currency').attr('LastEditedValue', $(rowToMarkEditing).find('select.Transaction_Amount_Currency').val());

                var Transaction_Amount_With_Currency = $(rowToMarkEditing).find('input.Transaction_Amount').attr('LastEditedValue')
                Transaction_Amount_With_Currency += $(rowToMarkEditing).find('select.Transaction_Amount_Currency option:selected').text().split(' - ')[1];

                $(rowToMarkEditing).find('span.Transaction_Amount').text(Transaction_Amount_With_Currency);

                $(rowToMarkEditing).find('input.Transaction_Actual_Payment_Amount').attr('LastEditedValue', $(rowToMarkEditing).find('input.Transaction_Actual_Payment_Amount').val());
                $(rowToMarkEditing).find('span.Transaction_Actual_Payment_Amount').text($(rowToMarkEditing).find('input.Transaction_Actual_Payment_Amount').attr('LastEditedValue'));

                $(rowToMarkEditing).find('input.Description').attr('LastEditedValue', $(rowToMarkEditing).find('input.Description').val());
                $(rowToMarkEditing).find('span.Description').text($(rowToMarkEditing).find('input.Description').attr('LastEditedValue'));

                rowToMarkEditing.removeClass("Editing");

                $(rowToMarkEditing).find("[id*='hidden_PendingChanges']").val(true);

                document.getElementById('hidden_Pending_Changes').value = 'true';
            }
        }

        function DeleteCreditCardTransactionRow(Transaction_Id) {
            var rowToMarkEditing = $('#Transaction_Record_Row_' + Transaction_Id + ' + .tr');
            if (rowToMarkEditing && rowToMarkEditing.length > 0) {
                rowToMarkEditing.removeClass("Editing");
                rowToMarkEditing.addClass("Deleted");
                rowToMarkEditing.removeClass("tr");

                $(rowToMarkEditing).find("[id*='hidden_PendingChanges']").val(true);
                $(rowToMarkEditing).find("[id*='hidden_IsDeleted']").val(true);

                // Manually use jQuery to fix last .tr cells bottom border (could not find CSS selector solution..)
                $('.Responsive-Table > .tr:last > .td').css('border-bottom', '1px solid #ced4da');
                $('.dark-mode .Responsive-Table > .tr:last > .td').css('border-bottom', '1px solid #404040');
            }
        }

        function AddNewTransactionRow(Transaction_Id) {
            document.getElementById('<%= hidden_New_Credit_Card_Transaction_After_Transaction_ID.ClientID %>').value = Transaction_Id;
            document.getElementById('<%= button_Add_New_Transaction_After_Transaction_Id.ClientID %>').click();
        }

        $(function () {

            if (document.location.hash) {
                var l_Hash = document.location.hash.toLowerCase();
                l_Hash = l_Hash.replace('#', '');

                if (l_Hash == 'general_info') {
                    $('#General_Info').addClass('active');
                    $('#tab_Button_General_Info').addClass('active');
                }
                else if (l_Hash == 'transaction') {
                    if ($('#Transaction').length > 0) {
                        $('#Transaction').addClass('active');
                        $('#tab_Button_Transaction').addClass('active');
                    }
                    else {
                        $('#General_Info').addClass('active');
                        $('#tab_Button_General_Info').addClass('active');
                    }
                }
                else {
                    if ($('#General_Info').length > 0) {
                        $('#General_Info').addClass('active');
                        $('#tab_Button_General_Info').addClass('active');
                    }
                }
            }
            else {
                $('#General_Info').addClass('active');
                $('#tab_Button_General_Info').addClass('active');
            }
        });

    </script>

</asp:Content>

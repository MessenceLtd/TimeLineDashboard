<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_BankAccountTransaction.aspx.cs" Inherits="WebformsPOCDemo.manage_BankAccountTransaction" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5">Manage Bank Transaction</h2>
        <p class="lead">Audit and add more details for your bank account transactions.</p>
    </div>

    <hr />
    <%--<!-- Nav tabs -->
    <ul class="nav nav-tabs" id="myTab" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Profile</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="messages-tab" data-toggle="tab" href="#messages" role="tab" aria-controls="messages" aria-selected="false">Messages</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="settings-tab" data-toggle="tab" href="#settings" role="tab" aria-controls="settings" aria-selected="false">Settings</a>
      </li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
      <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab">...1</div>
      <div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab">...2</div>
      <div class="tab-pane" id="messages" role="tabpanel" aria-labelledby="messages-tab">...3</div>
      <div class="tab-pane" id="settings" role="tabpanel" aria-labelledby="settings-tab">...4</div>
    </div>--%>

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Transaction_Account_Balance.ClientID %>">Account Balance:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Edit_Transaction_Account_Balance" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Transaction_Account_BalanceResource1">
                <asp:TextBox
                    runat="server" ID="textbox_Transaction_Account_Balance" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope" meta:resourcekey="textbox_Transaction_Account_BalanceResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Transaction_Account_Balance" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Transaction_Account_BalanceResource1">
                <asp:Label
                    runat="server" ID="label_Transaction_Account_Balance" meta:resourcekey="label_Transaction_Account_BalanceResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Transaction_Actual_DateTime.ClientID %>">Transaction Date:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Edit_Transaction_Actual_DateTime" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Transaction_Actual_DateTimeResource1">
                <asp:TextBox
                    runat="server" ID="textbox_Transaction_Actual_DateTime" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_Transaction_Actual_DateTimeResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Transaction_Actual_DateTime" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Transaction_Actual_DateTimeResource1">
                <asp:Label
                    runat="server" ID="label_Transaction_Actual_DateTime" meta:resourcekey="label_Transaction_Actual_DateTimeResource1"></asp:Label>
            </asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Transaction_Actual_DateTime" ErrorMessage="Please select a transaction date"
                Display="Dynamic" ControlToValidate="textbox_Transaction_Actual_DateTime" CssClass="text-danger" meta:resourcekey="validator_Transaction_Actual_DateTimeResource1"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Positive_Amount_Entered.ClientID %>">Amount Entered:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Edit_Positive_Amount_Entered" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Positive_Amount_EnteredResource1">
                <asp:TextBox
                    runat="server" ID="textbox_Positive_Amount_Entered" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope" meta:resourcekey="textbox_Positive_Amount_EnteredResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Positive_Amount_Entered" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Positive_Amount_EnteredResource1">
                <asp:Label
                    runat="server" ID="label_Positive_Amount_Entered" meta:resourcekey="label_Positive_Amount_EnteredResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Negative_Amount_Paid.ClientID %>">Negative Amount Paid:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Edit_Negative_Amount_Paid" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Negative_Amount_PaidResource1">
                <asp:TextBox
                    runat="server" ID="textbox_Negative_Amount_Paid" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourcekey="textbox_Negative_Amount_PaidResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Negative_Amount_Paid" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Negative_Amount_PaidResource1">
                <asp:Label
                    runat="server" ID="label_Negative_Amount_Paid" meta:resourcekey="label_Negative_Amount_PaidResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Transaction_Value_DateTime.ClientID %>">Effective Date:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Edit_Transaction_Value_DateTime" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Transaction_Value_DateTimeResource1">
                <asp:TextBox
                    runat="server" ID="textbox_Transaction_Value_DateTime" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_Transaction_Value_DateTimeResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Transaction_Value_DateTime" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Transaction_Value_DateTimeResource1">
                <asp:Label
                    runat="server" ID="label_Transaction_Value_DateTime" meta:resourcekey="label_Transaction_Value_DateTimeResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Reference_Number.ClientID %>">Reference Number:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Edit_Reference_Number" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Reference_NumberResource1">
                <asp:TextBox
                    runat="server" ID="textbox_Reference_Number" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourcekey="textbox_Reference_NumberResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Reference_Number" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Reference_NumberResource1">
                <asp:Label
                    runat="server" ID="label_Reference_Number" meta:resourcekey="label_Reference_NumberResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Transaction_Bank_Description.ClientID %>">Bank Description:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Edit_Transaction_Bank_Description" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Transaction_Bank_DescriptionResource1">
                <asp:TextBox
                    runat="server" ID="textbox_Transaction_Bank_Description" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope" meta:resourcekey="textbox_Transaction_Bank_DescriptionResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Transaction_Bank_Description" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Transaction_Bank_DescriptionResource1">
                <asp:Label
                    runat="server" ID="label_Transaction_Bank_Description" meta:resourcekey="label_Transaction_Bank_DescriptionResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Transaction_Bank_Inner_Reference_Code.ClientID %>">Bank Inner Reference:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Edit_Transaction_Bank_Inner_Reference_Code" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Transaction_Bank_Inner_Reference_CodeResource1">
                <asp:TextBox
                    runat="server" ID="textbox_Transaction_Bank_Inner_Reference_Code" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourcekey="textbox_Transaction_Bank_Inner_Reference_CodeResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Transaction_Bank_Inner_Reference_Code" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Transaction_Bank_Inner_Reference_CodeResource1">
                <asp:Label
                    runat="server" ID="label_Transaction_Bank_Inner_Reference_Code" meta:resourcekey="label_Transaction_Bank_Inner_Reference_CodeResource1"></asp:Label>
            </asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Transaction_User_Description.ClientID %>">My Description:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Edit_Transaction_User_Description" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Transaction_User_DescriptionResource1">
                <asp:TextBox
                    runat="server" ID="textbox_Transaction_User_Description" ClientIDMode="Static" CssClass="form-control long-input" MaxLength="200" TextMode="MultiLine" autocomplete="nope" meta:resourcekey="textbox_Transaction_User_DescriptionResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Transaction_User_Description" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Transaction_User_DescriptionResource1">
                <asp:Label
                    runat="server" ID="label_Transaction_User_Description" meta:resourcekey="label_Transaction_User_DescriptionResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Transaction_User_Comments.ClientID %>">My Comments:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Edit_Transaction_User_Comments" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Transaction_User_CommentsResource1">
                <asp:TextBox
                    runat="server" ID="textbox_Transaction_User_Comments" ClientIDMode="Static" CssClass="form-control long-input" MaxLength="200" TextMode="MultiLine" autocomplete="nope" meta:resourcekey="textbox_Transaction_User_CommentsResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Transaction_User_Comments" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Transaction_User_CommentsResource1">
                <asp:Label
                    runat="server" ID="label_Transaction_User_Comments" meta:resourcekey="label_Transaction_User_CommentsResource1"></asp:Label>
            </asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Anonymous_Users.ClientID %>">Is Visible To Public?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Visible_To_Anonymous_Users" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Is_Visible_To_Anonymous_UsersResource1">
                <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Anonymous_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Visible_To_Anonymous_UsersResource1" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Visible_To_Anonymous_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Is_Visible_To_Anonymous_UsersResource1">
                <asp:Label
                    runat="server" ID="label_Is_Visible_To_Anonymous_Users" meta:resourcekey="label_Is_Visible_To_Anonymous_UsersResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Followers_Users.ClientID %>">Is Visible To Followers?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Visible_To_Followers_Users" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Is_Visible_To_Followers_UsersResource1">
                <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Followers_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Visible_To_Followers_UsersResource1" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Visible_To_Followers_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Is_Visible_To_Followers_UsersResource1">
                <asp:Label runat="server" ID="label_Is_Visible_To_Followers_Users" meta:resourcekey="label_Is_Visible_To_Followers_UsersResource1"></asp:Label>
            </asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label>Created by:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Record_Created_By_User" runat="server" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_Record_Created_By_UserResource1">
                <asp:Label
                    runat="server" ID="label_Record_Created_By_User" meta:resourcekey="label_Record_Created_By_UserResource1"></asp:Label>
            </asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label>Created at:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Record_Creation_DateTime_UTC" runat="server" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_Record_Creation_DateTime_UTCResource1">
                <asp:Label
                    runat="server" ID="label_Record_Creation_DateTime_UTC" meta:resourcekey="label_Record_Creation_DateTime_UTCResource1"></asp:Label>
            </asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label>Last Modified by:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_By_User" runat="server" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_Record_Last_Updated_By_UserResource1">
                <asp:Label
                    runat="server" ID="label_Record_Last_Updated_By_User" meta:resourcekey="label_Record_Last_Updated_By_UserResource1"></asp:Label>
            </asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label>Last Modified Date:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_DateTime_UTC" runat="server" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_Record_Last_Updated_DateTime_UTCResource1">
                <asp:Label
                    runat="server" ID="label_Record_Last_Updated_DateTime_UTC" meta:resourcekey="label_Record_Last_Updated_DateTime_UTCResource1"></asp:Label>
            </asp:Panel>
        </div>

        <hr />
        <div>

            <asp:Button runat="server" ID="button_Edit_BankAccount_Transaction_Details"
                Text="Edit Details" OnClick="button_Edit_BankAccount_Transaction_Details_Click" CausesValidation="False" CssClass="btn btn-primary" meta:resourcekey="button_Edit_BankAccount_Transaction_DetailsResource1" />

            <asp:Button runat="server" ID="button_Update_BankAccount_Transaction_Details"
                Text="Save Changes" OnClick="button_Update_BankAccount_Transaction_Details_Click" CssClass="btn btn-success" meta:resourcekey="button_Update_BankAccount_Transaction_DetailsResource1" />

            <asp:Button runat="server" ID="button_CancelEdit_BankAccount_Transaction_Details"
                Text="Cancel Editing" OnClick="button_CancelEdit_BankAccount_Transaction_Details_Click" CausesValidation="False" OnClientClick="if (!confirm('Are you sure you want to cancel edit?')) return false;" CssClass="btn btn-danger" meta:resourcekey="button_CancelEdit_BankAccount_Transaction_DetailsResource1" />

        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result" meta:resourcekey="lbl_Insert_Process_Error_ResultResource1"></asp:Label>
        </div>
        <br />
        <br />

        <hr />
        <div class="page-title my-3 text-center">
            <h2 class="display-5">Connect With Documentation</h2>
            <p class="lead">Audit and add connect with documents for stronger timeline.</p>
        </div>
        <hr />
        <br />
        List of connected documents will go here

        <asp:UpdatePanel runat="server" ID="up_Transaction_Connected_Documents" UpdateMode="Conditional">
            <ContentTemplate>

                <asp:DataGrid runat="server" ID="grid_Connected_Documents" AutoGenerateColumns="False" CssClass="CustomTable" Visible="False" meta:resourcekey="grid_Connected_DocumentsResource1">
                    <Columns>
                        <asp:HyperLinkColumn DataTextField="Transaction_Connected_Document_Id" HeaderText="ID" Visible="False"
                            DataNavigateUrlField="Transaction_Connected_Document_Id" DataNavigateUrlFormatString="view_transcation_document.aspx?tcdid={0}" Target="_blank" meta:resourcekey="HyperLinkColumnResource1"></asp:HyperLinkColumn>
                        
                        <asp:BoundColumn DataField="Transaction_Connected_Document_Type" HeaderText="Type"></asp:BoundColumn>

                        <asp:HyperLinkColumn DataTextField="Title" HeaderText="Title" DataNavigateUrlField="Transaction_Connected_Document_Id"
                            DataNavigateUrlFormatString="view_transcation_document.aspx?tcdid={0}" Target="_blank" meta:resourcekey="HyperLinkColumnResource2"></asp:HyperLinkColumn>
                        
                        <asp:BoundColumn DataField="Transaction_Connected_Document_Date" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>

                        <asp:BoundColumn DataField="Description" HeaderText="Description"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Sent_By_Entity_Country_Name" HeaderText="From Country"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Sent_By_Entity_City" HeaderText="From City"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Sent_By_Entity_Email_Address" HeaderText="From Email"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Document_Creation_DateTime" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>

                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <a href='<%# DataBinder.Eval(Container, "DataItem.General_Document_Id" , "manage_Document.aspx?id={0}&mode=edit") %>'>
                                    <img src="/Images/edit.png" width="32" height="32" alt="Edit" title="Edit" /></a>
                                &nbsp;&nbsp;&nbsp;
                            <a href='<%# DataBinder.Eval(Container, "DataItem.General_Document_Id" , "manage_Document.aspx?id={0}&mode=view") %>'>
                                <img src="/Images/viewdetails.png" width="32" height="32" alt="Edit" title="View more" /></a>
                            </ItemTemplate>
                            <HeaderStyle Width="100px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>

        <br />
        <hr />

        <br />
        List of suggested documents will go here (unless it is a credit card statement)
        <br />
        <hr />

        <br />
        Ability to add/search and connect with documents will go here (unless it is a credit card statement)

        <div class="row g-2">
            <div class="col-md">
                <div class="form-floating">
                    <asp:TextBox runat="server" ID="text_Filter_By_From_Date" CssClass="form-control InitializeDatePicker" ClientIDMode="Static" placeholder="Filter from date" autocomplete="nope" meta:resourcekey="text_Filter_By_From_DateResource1"></asp:TextBox>
                    <label for="text_Filter_By_From_Date">Filter from date</label>
                </div>
            </div>

            <div class="col-md">
                <div class="form-floating">
                    <asp:TextBox runat="server" ID="text_Filter_By_To_Date" CssClass="form-control InitializeDatePicker" ClientIDMode="Static" placeholder="Filter to date" autocomplete="nope" meta:resourcekey="text_Filter_By_To_DateResource1"></asp:TextBox>
                    <label for="text_Filter_By_To_Date">Filter to date</label>
                </div>
            </div>
        </div>
        <asp:UpdatePanel runat="server" ID="updatePanel_States" class="row g-2" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="col-md">
                    <div class="form-floating">
                        <asp:DropDownList runat="server" ID="dropdown_Type" ClientIDMode="Static" aria-label="Select type"
                            CssClass="form-select" meta:resourcekey="dropdown_TypeResource1">
                        </asp:DropDownList>
                        <label for="">
                            <asp:Literal runat="server" ID="label_Filter_By_Type" meta:resourcekey="label_Filter_By_TypeResource1" Text="Filter by Type"></asp:Literal></label>
                    </div>
                </div>

                <div class="col-md">
                    <div class="form-floating">
                        <asp:DropDownList runat="server" ID="dropdown_Country" ClientIDMode="Static" aria-label="Select country"
                            CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Country_SelectedIndexChanged" meta:resourcekey="dropdown_CountryResource1">
                        </asp:DropDownList>
                        <label for="">
                            <asp:Literal runat="server" ID="label_Filter_By_Country" meta:resourcekey="label_Filter_By_CountryResource1" Text="Filter by Country"></asp:Literal></label>
                    </div>
                </div>

                <asp:Panel runat="server" ID="panel_States" CssClass="col-md" Visible="False" meta:resourcekey="panel_StatesResource1">
                    <div class="form-floating">
                        <asp:DropDownList runat="server" ID="dropdown_State" ClientIDMode="Static" aria-label="Select state" CssClass="form-select" meta:resourcekey="dropdown_StateResource1"></asp:DropDownList>
                        <label for="<%= dropdown_State.ClientID %>">
                            <asp:Literal runat="server" ID="label_Filter_By_State" meta:resourcekey="label_Filter_By_StateResource1" Text="Filter by Type"></asp:Literal></label>
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
                    <asp:TextBox runat="server" ID="text_Filter_By_CityAddressZipCode" ClientIDMode="Static" CssClass="form-control" placeholder="Filter by City / Address / Zipcode" meta:resourcekey="text_Filter_By_CityAddressZipCodeResource1"></asp:TextBox>
                    <label for="text_Filter_By_CityAddressZipCode">Filter by City / Address / Zipcode</label>
                </div>
            </div>
            <div class="col-md">
                <div class="form-floating">
                    <asp:TextBox runat="server" ID="text_Filter_By_CompanyNamePeopleName" ClientIDMode="Static" CssClass="form-control" placeholder="Filter by Company name / People name" meta:resourcekey="text_Filter_By_CompanyNamePeopleNameResource1"></asp:TextBox>
                    <label for="text_Filter_By_CompanyNamePeopleName">Filter by Company name / People name</label>
                </div>
            </div>
        </div>

        <br />

        <asp:Button runat="server" ID="button_Search_Documents" OnClick="button_Search_Documents_Click" Text="Search" CssClass="btn btn-primary" meta:resourcekey="button_Search_DocumentsResource1" />

        <asp:UpdatePanel runat="server" ID="updatePanel_Search_Result">

            <ContentTemplate>

                <hr />

                <asp:DataGrid runat="server" ID="dataGrid_Documents_List" AutoGenerateColumns="False" CssClass="CustomTable" Visible="False" meta:resourcekey="dataGrid_Documents_ListResource1">
                    <Columns>
                        <asp:HyperLinkColumn DataTextField="General_Document_Id" HeaderText="ID"
                            DataNavigateUrlField="General_Document_Id" DataNavigateUrlFormatString="manage_Document.aspx?id={0}" meta:resourcekey="HyperLinkColumnResource3"></asp:HyperLinkColumn>
                        <asp:HyperLinkColumn DataTextField="Title" HeaderText="Title" DataNavigateUrlField="General_Document_Id"
                            DataNavigateUrlFormatString="manage_Document.aspx?id={0}" meta:resourcekey="HyperLinkColumnResource4"></asp:HyperLinkColumn>
                        <asp:HyperLinkColumn DataTextField="Sent_By_Entity_Name" HeaderText="Sent By" DataNavigateUrlField="General_Document_Id"
                            DataNavigateUrlFormatString="manage_Document.aspx?id={0}" meta:resourcekey="HyperLinkColumnResource5"></asp:HyperLinkColumn>

                        <asp:BoundColumn DataField="Description" HeaderText="Description"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Sent_By_Entity_Country_Name" HeaderText="From Country"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Sent_By_Entity_City" HeaderText="From City"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Sent_By_Entity_Email_Address" HeaderText="From Email"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Document_Creation_DateTime" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundColumn>

                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <a href='<%# DataBinder.Eval(Container, "DataItem.General_Document_Id" , "manage_Document.aspx?id={0}&mode=edit") %>'>
                                    <img
                                        src="/Images/edit.png" width="32" height="32" alt="Edit" title="Edit" /></a>
                                &nbsp;&nbsp;&nbsp;
                                <a href='<%# DataBinder.Eval(Container, "DataItem.General_Document_Id" , "manage_Document.aspx?id={0}&mode=view") %>'>
                                    <img
                                        src="/Images/viewdetails.png" width="32" height="32" alt="Edit" title="View more" /></a>
                            </ItemTemplate>
                            <HeaderStyle Width="100px" />
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
                <asp:PostBackTrigger ControlID="button_Search_Documents" />
            </Triggers>

        </asp:UpdatePanel>



        <br />
        <hr />

        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

    </div>


</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_BankAccount.aspx.cs" Inherits="WebformsPOCDemo.manage_BankAccount" culture="auto" meta:resourcekey="Page" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="page-title my-3 text-center">
        <h2 class="display-5">Manage Bank Account</h2>
        <p class="lead">Keep track, audit and add more details to bank account transactions.</p>
    </div>

    <hr />

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Bank_Name.ClientID %>"><%= Resources.SiteCommon.Bank_Name %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Bank_Name" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Bank_Name"><asp:TextBox 
                runat="server" ID="textbox_Bank_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope" meta:resourceKey="textbox_Bank_Name"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Bank_Name" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Bank_Name"><asp:Label 
                runat="server" ID="label_Bank_Name" meta:resourceKey="label_Bank_Name"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Bank_Number.ClientID %>"><%= Resources.SiteCommon.Bank_Number %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Bank_Number" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Bank_Number"><asp:TextBox 
                runat="server" ID="textbox_Bank_Number" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourceKey="textbox_Bank_Number"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Bank_Number" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Bank_Number"><asp:Label 
                runat="server" ID="label_Bank_Number" meta:resourceKey="label_Bank_Number"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Name.ClientID %>"><%= Resources.SiteCommon.Branch_Name %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Branch_Name" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Branch_Name"><asp:TextBox 
                runat="server" ID="textbox_Branch_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope" meta:resourceKey="textbox_Branch_Name"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_Name" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Branch_Name"><asp:Label 
                runat="server" ID="label_Branch_Name" meta:resourceKey="label_Branch_Name"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Number.ClientID %>"><%= Resources.SiteCommon.Branch_Number %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Branch_Number" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Branch_Number"><asp:TextBox 
                runat="server" ID="textbox_Branch_Number" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourceKey="textbox_Branch_Number"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_Number" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Branch_Number"><asp:Label 
                runat="server" ID="label_Branch_Number" meta:resourceKey="label_Branch_Number"></asp:Label></asp:Panel>
        </div>
        
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Number.ClientID %>"><%= Resources.SiteCommon.Account_Number %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Account_Number" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Account_Number"><asp:TextBox 
                runat="server" ID="textbox_Account_Number" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourceKey="textbox_Account_Number"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Account_Number" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Account_Number"><asp:Label 
                runat="server" ID="label_Account_Number" meta:resourceKey="label_Account_Number"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Name.ClientID %>"><%= Resources.SiteCommon.Account_Name %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Account_Name" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Account_Name"><asp:TextBox 
                runat="server" ID="textbox_Account_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope" meta:resourceKey="textbox_Account_Name"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Account_Name" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Account_Name"><asp:Label 
                runat="server" ID="label_Account_Name" meta:resourceKey="label_Account_Name"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Account_Name_Required" ErrorMessage="Please enter bank account name" 
                Display="Dynamic" ControlToValidate="textbox_Account_Name" SetFocusOnError="True" CssClass="text-danger" meta:resourcekey="validator_Account_Name_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Number.ClientID %>"><%= Resources.SiteCommon.Account_IBAN %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_IBAN" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_IBAN"><asp:TextBox 
                runat="server" ID="textbox_IBAN" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourceKey="textbox_IBAN"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_IBAN" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_IBAN"><asp:Label 
                runat="server" ID="label_IBAN" meta:resourceKey="label_IBAN"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Currency.ClientID %>"><%= Resources.SiteCommon.Currency %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Currency" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Currency"><asp:DropDownList 
                runat="server" ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control" meta:resourceKey="dropdown_Currency"></asp:DropDownList></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Currency" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Currency"><asp:Label 
                runat="server" ID="label_Currency" meta:resourceKey="label_Currency"></asp:Label></asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Opened_Account_DateTime.ClientID %>"><%= Resources.SiteCommon.Opening_Date %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Opened_Account_DateTime" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Opened_Account_DateTime"><asp:TextBox 
                runat="server" ID="textbox_Opened_Account_DateTime" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourceKey="textbox_Opened_Account_DateTime"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Opened_Account_DateTime" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Opened_Account_DateTime"><asp:Label 
                runat="server" ID="label_Opened_Account_DateTime" meta:resourceKey="label_Opened_Account_DateTime"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Branch_Country.ClientID %>"><%= Resources.SiteCommon.Branch_Country %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Branch_Country" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Branch_Country"><asp:DropDownList runat="server" ID="dropdown_Branch_Country" ClientIDMode="Static" AutoPostBack="True" 
                OnSelectedIndexChanged="dropdown_Branch_Country_SelectedIndexChanged" CssClass="Big_ComboBox form-control" meta:resourceKey="dropdown_Branch_Country"></asp:DropDownList></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_Country" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Branch_Country"><asp:Label 
                runat="server" ID="label_Branch_Country" meta:resourceKey="label_Branch_Country"></asp:Label></asp:Panel>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_StateUpdatePanel">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_State_Wrapper_Panel" class="Form_Group" Visible="False" meta:resourcekey="p_State_Wrapper_Panel">
                    <div class="Form_Label_Wrapper"><label for="<%= dropdown_Branch_State.ClientID %>"><%= Resources.SiteCommon.Branch_State %>:</label></div>
                    <asp:Panel ID="formControl_Wrapper_Edit_Branch_State" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Branch_State"><asp:DropDownList 
                        runat="server" ID="dropdown_Branch_State" ClientIDMode="Static" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Branch_State"></asp:DropDownList></asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_State" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Branch_State"><asp:Label 
                        runat="server" ID="label_Branch_State" meta:resourcekey="label_Branch_State"></asp:Label></asp:Panel>
                </asp:Panel>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Branch_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_City.ClientID %>"><%= Resources.SiteCommon.Branch_City %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Branch_City" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Branch_City"><asp:TextBox 
                runat="server" ID="textbox_Branch_City" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourceKey="textbox_Branch_City"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_City" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Branch_City"><asp:Label 
                runat="server" ID="label_Branch_City" meta:resourceKey="label_Branch_City"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Address.ClientID %>"><%= Resources.SiteCommon.Branch_Address %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Branch_Address" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Branch_Address"><asp:TextBox 
                runat="server" ID="textbox_Branch_Address" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope" meta:resourceKey="textbox_Branch_Address"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_Address" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Branch_Address"><asp:Label 
                runat="server" ID="label_Branch_Address" meta:resourceKey="label_Branch_Address"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Zipcode.ClientID %>"><%= Resources.SiteCommon.Branch_Zip_Code %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Branch_Zipcode" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Branch_Zipcode"><asp:TextBox 
                runat="server" ID="textbox_Branch_Zipcode" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourceKey="textbox_Branch_Zipcode"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_Zipcode" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Branch_Zipcode"><asp:Label 
                runat="server" ID="label_Branch_Zipcode" meta:resourceKey="label_Branch_Zipcode"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Phone.ClientID %>"><%= Resources.SiteCommon.Branch_Phone %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Branch_Phone" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Branch_Phone"><asp:TextBox 
                runat="server" ID="textbox_Branch_Phone" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourceKey="textbox_Branch_Phone"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_Phone" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Branch_Phone"><asp:Label 
                runat="server" ID="label_Branch_Phone" meta:resourceKey="label_Branch_Phone"></asp:Label></asp:Panel>
        </div>
        
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Main_Email_Address.ClientID %>"><%= Resources.SiteCommon.Branch_Main_Email %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Branch_Main_Email_Address" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Branch_Main_Email_Address"><asp:TextBox 
                runat="server" ID="textbox_Branch_Main_Email_Address" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope" meta:resourceKey="textbox_Branch_Main_Email_Address"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_Main_Email_Address" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Branch_Main_Email_Address"><asp:Label 
                runat="server" ID="label_Branch_Main_Email_Address" meta:resourceKey="label_Branch_Main_Email_Address"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Main_Contact.ClientID %>"><%= Resources.SiteCommon.Branch_Main_Contact %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Branch_Main_Contact" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Branch_Main_Contact"><asp:TextBox 
                runat="server" ID="textbox_Branch_Main_Contact" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourceKey="textbox_Branch_Main_Contact"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_Main_Contact" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Branch_Main_Contact"><asp:Label 
                runat="server" ID="label_Branch_Main_Contact" meta:resourceKey="label_Branch_Main_Contact"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_Phone_Number.ClientID %>"><%= Resources.SiteCommon.Branch_Contact_Phone %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Main_Contact_Phone_Number" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Main_Contact_Phone_Number"><asp:TextBox 
                runat="server" ID="textbox_Main_Contact_Phone_Number" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourceKey="textbox_Main_Contact_Phone_Number"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Main_Contact_Phone_Number" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Main_Contact_Phone_Number"><asp:Label 
                runat="server" ID="label_Main_Contact_Phone_Number" meta:resourceKey="label_Main_Contact_Phone_Number"></asp:Label></asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Active_From_Date.ClientID %>"><%= Resources.SiteCommon.Account_Active_From %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Account_Active_From_Date" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Account_Active_From_Date"><asp:TextBox 
                runat="server" ID="textbox_Account_Active_From_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourceKey="textbox_Account_Active_From_Date"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Account_Active_From_Date" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Account_Active_From_Date"><asp:Label 
                runat="server" ID="label_Account_Active_From_Date" meta:resourceKey="label_Account_Active_From_Date"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Active_To_Date.ClientID %>"><%= Resources.SiteCommon.Account_Active_To_Date %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Account_Active_To_Date" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Account_Active_To_Date"><asp:TextBox 
                runat="server" ID="textbox_Account_Active_To_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourceKey="textbox_Account_Active_To_Date"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Account_Active_To_Date" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Account_Active_To_Date"><asp:Label 
                runat="server" ID="label_Account_Active_To_Date" meta:resourceKey="label_Account_Active_To_Date"></asp:Label></asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Anonymous_Users.ClientID %>"><%= Resources.SiteCommon.Is_Visible_To_Public %>?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Visible_To_Anonymous_Users" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Is_Visible_To_Anonymous_Users">
                <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Anonymous_Users" ClientIDMode="Static" meta:resourceKey="checkbox_Is_Visible_To_Anonymous_Users" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Visible_To_Anonymous_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Is_Visible_To_Anonymous_Users">
                <asp:Label
                    runat="server" ID="label_Is_Visible_To_Anonymous_Users" meta:resourceKey="label_Is_Visible_To_Anonymous_Users"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Available_For_Download_For_Anonymous_Users.ClientID %>"><%= Resources.SiteCommon.Is_Downloadable_To_Public %>?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Available_For_Download_For_Anonymous_Users" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Is_Available_For_Download_For_Anonymous_Users">
                <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Anonymous_Users" ClientIDMode="Static" meta:resourceKey="checkbox_Is_Available_For_Download_For_Anonymous_Users" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Available_For_Download_For_Anonymous_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Is_Available_For_Download_For_Anonymous_Users">
                <asp:Label
                    runat="server" ID="label_Is_Available_For_Download_For_Anonymous_Users" meta:resourceKey="label_Is_Available_For_Download_For_Anonymous_Users"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Followers_Users.ClientID %>"><%= Resources.SiteCommon.Is_Visible_To_Followers %>?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Visible_To_Followers_Users" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Is_Visible_To_Followers_Users">
                <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Followers_Users" ClientIDMode="Static" meta:resourceKey="checkbox_Is_Visible_To_Followers_Users" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Visible_To_Followers_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Is_Visible_To_Followers_Users">
                <asp:Label
                    runat="server" ID="label_Is_Visible_To_Followers_Users" meta:resourceKey="label_Is_Visible_To_Followers_Users"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Available_For_Download_For_Followers_Users.ClientID %>"><%= Resources.SiteCommon.Can_Followers_Download_File %>?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Available_For_Download_For_Followers_Users" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Is_Available_For_Download_For_Followers_Users">
                <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Followers_Users" ClientIDMode="Static" meta:resourceKey="checkbox_Is_Available_For_Download_For_Followers_Users" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Available_For_Download_For_Followers_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Is_Available_For_Download_For_Followers_Users">
                <asp:Label
                    runat="server" ID="label_Is_Available_For_Download_For_Followers_Users" meta:resourceKey="label_Is_Available_For_Download_For_Followers_Users"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Active.ClientID %>"><%= Resources.SiteCommon.Is_Active %>?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Active" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Is_Active">
                <asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="True" ClientIDMode="Static" meta:resourceKey="checkbox_Is_Active" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Active" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Is_Active">
                <asp:Label
                    runat="server" ID="label_Is_Active" meta:resourceKey="label_Is_Active"></asp:Label>
            </asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label><%= Resources.SiteCommon.Created_By %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Created_By_User" runat="server" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_Record_Created_By_User"><asp:Label 
                runat="server" ID="label_Record_Created_By_User" meta:resourceKey="label_Record_Created_By_User"></asp:Label></asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label><%= Resources.SiteCommon.Created_On %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Creation_DateTime_UTC" runat="server" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_Record_Creation_DateTime_UTC"><asp:Label 
                runat="server" ID="label_Record_Creation_DateTime_UTC" meta:resourceKey="label_Record_Creation_DateTime_UTC"></asp:Label></asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label><%= Resources.SiteCommon.Last_Modified_By %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_By_User" runat="server" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_Record_Last_Updated_By_User"><asp:Label 
                runat="server" ID="label_Record_Last_Updated_By_User" meta:resourceKey="label_Record_Last_Updated_By_User"></asp:Label></asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label><%= Resources.SiteCommon.Last_Modified_Date %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_DateTime_UTC" runat="server" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_Record_Last_Updated_DateTime_UTC"><asp:Label 
                runat="server" ID="label_Record_Last_Updated_DateTime_UTC" meta:resourceKey="label_Record_Last_Updated_DateTime_UTC"></asp:Label></asp:Panel>
        </div>

        <hr />
        <div>

            <asp:Button runat="server" ID="button_Edit_BankAccount_Details" 
                Text="Edit BankAccount" OnClick="button_Edit_BankAccount_Details_Click" CausesValidation="False" CssClass="btn btn-primary" meta:resourcekey="button_Edit_BankAccount_Details" /> 

            <asp:Button runat="server" ID="button_Update_BankAccount_Details" 
                Text="Save Changes" OnClick="button_Update_BankAccount_Details_Click" CssClass="btn btn-success" meta:resourcekey="button_Update_BankAccount_Details" /> 

            <asp:Button runat="server" ID="button_CancelEdit_BankAccount_Details" 
                Text="Cancel Editing" OnClick="button_CancelEdit_BankAccount_Details_Click" CausesValidation="False" CssClass="btn btn-danger" meta:resourcekey="button_CancelEdit_BankAccount_Details" /> 
            
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result" meta:resourcekey="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br /><br /><br /><br />

    </div>


</asp:Content>

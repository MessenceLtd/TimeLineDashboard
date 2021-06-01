<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_BankAccount.aspx.cs" Inherits="WebformsPOCDemo.Add_BankAccount" culture="auto" meta:resourcekey="Page" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5">Add Bank Account</h2>
        <p class="lead">Keep track, audit and add more details to bank account transactions.</p>
    </div>

    <hr />

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Bank_Name.ClientID %>"><%= Resources.SiteCommon.Bank_Name %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Bank_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope" meta:resourcekey="textbox_Bank_Name"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Bank_Number.ClientID %>"><%= Resources.SiteCommon.Bank_Number %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Bank_Number" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourcekey="textbox_Bank_Number"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Name.ClientID %>"><%= Resources.SiteCommon.Branch_Name %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Branch_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope" meta:resourcekey="textbox_Branch_Name"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Number.ClientID %>"><%= Resources.SiteCommon.Branch_Number %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Branch_Number" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourcekey="textbox_Branch_Number"></asp:TextBox></div>
        </div>
        
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Number.ClientID %>"><%= Resources.SiteCommon.Account_Number %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Account_Number" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourcekey="textbox_Account_Number"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Name.ClientID %>"><%= Resources.SiteCommon.Account_Name %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Account_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope" meta:resourcekey="textbox_Account_Name"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Account_Name_Required" ErrorMessage="Please enter bank account name" 
                Display="Dynamic" ControlToValidate="textbox_Account_Name" SetFocusOnError="True" CssClass="text-danger" meta:resourcekey="validator_Account_Name_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Number.ClientID %>"><%= Resources.SiteCommon.Account_IBAN %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_IBAN" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourcekey="textbox_IBAN"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Currency.ClientID %>"><%= Resources.SiteCommon.Currency %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control" meta:resourcekey="dropdown_Currency"></asp:DropDownList></div>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Opened_Account_DateTime.ClientID %>"><%= Resources.SiteCommon.Opening_Date %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Opened_Account_DateTime" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_Opened_Account_DateTime"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Branch_Country.ClientID %>"><%= Resources.SiteCommon.Branch_Country %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Branch_Country" ClientIDMode="Static" AutoPostBack="True" 
                OnSelectedIndexChanged="dropdown_Branch_Country_SelectedIndexChanged" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Branch_Country"></asp:DropDownList></div>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_StateUpdatePanel">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_State_Wrapper_Panel" class="Form_Group" Visible="False" meta:resourcekey="p_State_Wrapper_Panel">
                    <div class="Form_Label_Wrapper"><label for="<%= dropdown_Branch_State.ClientID %>"><%= Resources.SiteCommon.Branch_State %>:</label></div>
                    <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Branch_State" ClientIDMode="Static" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Branch_State"></asp:DropDownList></div>
                </asp:Panel>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Branch_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_City.ClientID %>"><%= Resources.SiteCommon.Branch_City %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Branch_City" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourcekey="textbox_Branch_City"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Address.ClientID %>"><%= Resources.SiteCommon.Branch_Address %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Branch_Address" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope" meta:resourcekey="textbox_Branch_Address"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Zipcode.ClientID %>"><%= Resources.SiteCommon.Branch_Zip_Code %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Branch_Zipcode" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourcekey="textbox_Branch_Zipcode"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Phone.ClientID %>"><%= Resources.SiteCommon.Branch_Phone %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Branch_Phone" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourcekey="textbox_Branch_Phone"></asp:TextBox></div>
        </div>
        
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Main_Email_Address.ClientID %>"><%= Resources.SiteCommon.Branch_Main_Email %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Branch_Main_Email_Address" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope" meta:resourcekey="textbox_Branch_Main_Email_Address"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Main_Contact.ClientID %>"><%= Resources.SiteCommon.Branch_Main_Contact %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Branch_Main_Contact" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourcekey="textbox_Branch_Main_Contact"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_Phone_Number.ClientID %>"><%= Resources.SiteCommon.Branch_Contact_Phone %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Main_Contact_Phone_Number" ClientIDMode="Static" CssClass="form-control" autocomplete="nope" meta:resourcekey="textbox_Main_Contact_Phone_Number"></asp:TextBox></div>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Active_From_Date.ClientID %>"><%= Resources.SiteCommon.Account_Active_From %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Account_Active_From_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_Account_Active_From_Date"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Active_To_Date.ClientID %>"><%= Resources.SiteCommon.Account_Active_To_Date %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Account_Active_To_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_Account_Active_To_Date"></asp:TextBox></div>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Visible_To_Anonymous_Users.ClientID %>"><%= Resources.SiteCommon.Is_Visible_To_Public %>?</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Anonymous_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Visible_To_Anonymous_Users" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Available_For_Download_For_Anonymous_Users.ClientID %>"><%= Resources.SiteCommon.Is_Downloadable_To_Public %>?</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Anonymous_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Available_For_Download_For_Anonymous_Users" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Visible_To_Followers_Users.ClientID %>"><%= Resources.SiteCommon.Is_Visible_To_Followers %>?</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Followers_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Visible_To_Followers_Users" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Available_For_Download_For_Followers_Users.ClientID %>"><%= Resources.SiteCommon.Can_Followers_Download_File %>?</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Followers_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Available_For_Download_For_Followers_Users" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Active.ClientID %>"><%= Resources.SiteCommon.Is_Active %>:</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="True" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Active" /></div>
        </div>
        
        <hr />
        <div>
            <asp:Button runat="server" ID="button_Create_Client" Text="Create Bank Account" 
                OnClick="button_Create_Bank_Account_Click" CssClass="btn btn-primary" meta:resourcekey="button_Create_Client" /> 
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result" meta:resourcekey="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br /><br /><br /><br />

    </div>

</asp:Content>

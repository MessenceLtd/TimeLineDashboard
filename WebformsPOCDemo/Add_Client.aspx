<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_Client.aspx.cs" Inherits="WebformsPOCDemo.Add_Client" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5">Add Client</h2>
        <p class="lead">Keep track on all your client and contacts.</p>
    </div>

    <hr />

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Company_Name.ClientID %>"><%= Resources.SiteCommon.Company_Name %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Company_Name" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Company_NameResource1"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Company_Name_Required" ErrorMessage="Please enter an company name" Display="Dynamic" 
                ControlToValidate="textbox_Company_Name" CssClass="text-danger" meta:resourcekey="validator_Company_Name_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Website_URL.ClientID %>"><%= Resources.SiteCommon.Website_URL %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Website_URL" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Website_URLResource1"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Website_URL_Required" ErrorMessage="Please enter an website" Display="Dynamic" ControlToValidate="textbox_Website_URL" CssClass="text-danger" meta:resourcekey="validator_Website_URL_RequiredResource1"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="validator_Website_URL_Regex" ErrorMessage="Please enter a valid website url" Display="Dynamic" 
                ControlToValidate="textbox_Website_URL" CssClass="text-danger" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" meta:resourcekey="validator_Website_URL_RegexResource1"></asp:RegularExpressionValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Currency.ClientID %>"><%= Resources.SiteCommon.Default_Currency %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control" meta:resourcekey="dropdown_CurrencyResource1"></asp:DropDownList></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Country.ClientID %>"><%= Resources.SiteCommon.Country %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Country" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Country_SelectedIndexChanged" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_CountryResource1"></asp:DropDownList></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Country_Required" ErrorMessage="Please select a country" Display="Dynamic" ControlToValidate="dropdown_Country" CssClass="text-danger" meta:resourcekey="validator_Country_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_StateUpdatePanel">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_State_Wrapper_Panel" class="Form_Group" Visible="False" meta:resourcekey="p_State_Wrapper_PanelResource1">
                    <div class="Form_Label_Wrapper"><label for="<%= dropdown_State.ClientID %>"><%= Resources.SiteCommon.State %>:</label></div>
                    <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_State" ClientIDMode="Static" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_StateResource1"></asp:DropDownList></div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_State_Required" ErrorMessage="Please select a state" Display="Dynamic" ControlToValidate="textbox_City" CssClass="text-danger" meta:resourcekey="validator_State_RequiredResource1"></asp:RequiredFieldValidator>
                </asp:Panel>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_City.ClientID %>"><%= Resources.SiteCommon.City %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_City" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_CityResource1"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_City_Required" ErrorMessage="Please enter a city" Display="Dynamic" ControlToValidate="textbox_City" CssClass="text-danger" meta:resourcekey="validator_City_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Address.ClientID %>"><%= Resources.SiteCommon.Address %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Address" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_AddressResource1"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Address_Required" ErrorMessage="Please enter an address" Display="Dynamic" ControlToValidate="textbox_Address" CssClass="text-danger" meta:resourcekey="validator_Address_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Zipcode.ClientID %>"><%= Resources.SiteCommon.Zip_Code %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Zipcode" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_ZipcodeResource1"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Zipcode_Required" ErrorMessage="Please enter an address" Display="Dynamic" ControlToValidate="textbox_Zipcode" CssClass="text-danger" meta:resourcekey="validator_Zipcode_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Telephone.ClientID %>"><%= Resources.SiteCommon.Business_Phone %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Telephone" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_TelephoneResource1"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Mobile_Phone.ClientID %>"><%= Resources.SiteCommon.Mobile_Phone %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Mobile_Phone" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Mobile_PhoneResource1"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Mobile_Phone_Required" ErrorMessage="Please enter a mobile phone" 
                Display="Dynamic" ControlToValidate="textbox_Mobile_Phone" CssClass="text-danger" meta:resourcekey="validator_Mobile_Phone_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Client_Type.ClientID %>"><%= Resources.SiteCommon.Client_Type %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Client_Type" ClientIDMode="Static" 
                    CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Client_TypeResource1"></asp:DropDownList></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Client_Type_Required" ErrorMessage="Please select a client type" Display="Dynamic" 
                ControlToValidate="dropdown_Client_Type" CssClass="text-danger" meta:resourcekey="validator_Client_Type_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Client_Tax_Reference_Number.ClientID %>"><%= Resources.SiteCommon.Tax_Reference_Number %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Client_Tax_Reference_Number" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Client_Tax_Reference_NumberResource1"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Client_Tax_Reference_Number_Required" ErrorMessage="Please enter a tax reference number" 
                Display="Dynamic" ControlToValidate="textbox_Client_Tax_Reference_Number" CssClass="text-danger" meta:resourcekey="validator_Client_Tax_Reference_Number_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_FullName.ClientID %>"><%= Resources.SiteCommon.Contact_FullName %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Main_Contact_FullName" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Main_Contact_FullNameResource1"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Main_Contact_FullName_Required" ErrorMessage="Please enter a mobile phone" 
                Display="Dynamic" ControlToValidate="textbox_Main_Contact_FullName" CssClass="text-danger" meta:resourcekey="validator_Main_Contact_FullName_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_Email_Address.ClientID %>"><%= Resources.SiteCommon.Email_Address %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Main_Contact_Email_Address" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Main_Contact_Email_AddressResource1"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Main_Contact_Email_Address_Required" ErrorMessage="Please enter a main contact email address" 
                Display="Dynamic" ControlToValidate="textbox_Main_Contact_Email_Address" CssClass="text-danger" meta:resourcekey="validator_Main_Contact_Email_Address_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_Phone_Number.ClientID %>"><%= Resources.SiteCommon.Contact_Phone_Number %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Main_Contact_Phone_Number" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Main_Contact_Phone_NumberResource1"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Main_Contact_Phone_Number_Required" ErrorMessage="Please enter a main contact phone number" 
                Display="Dynamic" ControlToValidate="textbox_Main_Contact_Phone_Number" CssClass="text-danger" meta:resourcekey="validator_Main_Contact_Phone_Number_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Client_From_Date.ClientID %>"><%= Resources.SiteCommon.Client_From_Date %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Client_From_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_Client_From_DateResource1"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Client_To_Date.ClientID %>"><%= Resources.SiteCommon.Client_To_Date %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Client_To_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_Client_To_DateResource1"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Contract_Date.ClientID %>"><%= Resources.SiteCommon.First_Contract_Date %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_First_Contract_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_First_Contract_DateResource1"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Contract_Signed_With_Contact_Full_Name.ClientID %>"><%= Resources.SiteCommon.First_Contract_Contact %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_First_Contract_Signed_With_Contact_Full_Name" 
                ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_First_Contract_Signed_With_Contact_Full_NameResource1"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Contract_Signed_In_Location_Description.ClientID %>"><%= Resources.SiteCommon.First_Contract_Location %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_First_Contract_Signed_In_Location_Description" TextMode="MultiLine" 
                ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_First_Contract_Signed_In_Location_DescriptionResource1"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Active.ClientID %>"><%= Resources.SiteCommon.Is_Active %>:</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="True" ClientIDMode="Static" meta:resourcekey="checkbox_Is_ActiveResource1" /></div>
        </div>

        <hr />
        <div>
            <asp:Button runat="server" ID="button_Create_Client" Text="Create Client" OnClick="button_Create_Client_Click" CssClass="btn btn-primary" meta:resourcekey="button_Create_ClientResource1" /> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button runat="server" ID="button_Fill_Up_Form_Dummy_Data_For_Test" Text="Dummy Client Fillup" CssClass="btn btn-danger" 
                CausesValidation="False" OnClick="button_Fill_Up_Form_Dummy_Data_For_Test_Click" meta:resourcekey="button_Fill_Up_Form_Dummy_Data_For_TestResource1" />
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result" meta:resourcekey="lbl_Insert_Process_Error_ResultResource1"></asp:Label>
        </div>
        <br /><br /><br /><br />

    </div>


</asp:Content>

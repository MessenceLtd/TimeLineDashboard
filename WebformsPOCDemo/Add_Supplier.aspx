<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_Supplier.aspx.cs" Inherits="WebformsPOCDemo.Add_Supplier" culture="auto" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5"><%= Resources.SiteCommon.Add_Supplier_Title %>Add Supplier</h2>
        <p class="lead"><%= Resources.SiteCommon.Add_Supplier_SubTitle %></p>
    </div>

    <hr />

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Company_Name.ClientID %>"><%= Resources.SiteCommon.Company_Name %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Company_Name" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Company_Name_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Company_Name_Required %>" Display="Dynamic" 
                ControlToValidate="textbox_Company_Name" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Website_URL.ClientID %>"><%= Resources.SiteCommon.Website_URL %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Website_URL" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Website_URL_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Website_URL_Required %>" 
                Display="Dynamic" ControlToValidate="textbox_Website_URL" CssClass="text-danger" Enabled="False"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Country.ClientID %>"><%= Resources.SiteCommon.Country %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Country" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Country_SelectedIndexChanged" CssClass="Big_ComboBox form-control"></asp:DropDownList></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Country_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Country_Required %>" Display="Dynamic" ControlToValidate="dropdown_Country" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_StateUpdatePanel">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_State_Wrapper_Panel" class="Form_Group" Visible="False">
                    <div class="Form_Label_Wrapper"><label for="<%= dropdown_State.ClientID %>"><%= Resources.SiteCommon.State %>:</label></div>
                    <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_State" ClientIDMode="Static" CssClass="Big_ComboBox form-control"></asp:DropDownList></div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_State_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_State_Required %>" Display="Dynamic" ControlToValidate="textbox_City" CssClass="text-danger"></asp:RequiredFieldValidator>
                </asp:Panel>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_City.ClientID %>"><%= Resources.SiteCommon.City %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_City" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_City_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_City_Required %>" 
                Display="Dynamic" ControlToValidate="textbox_City" CssClass="text-danger" Enabled="False"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Address.ClientID %>"><%= Resources.SiteCommon.Address %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Address" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Address_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Address_Required %>" 
                Display="Dynamic" ControlToValidate="textbox_Address" CssClass="text-danger" Enabled="False"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Zipcode.ClientID %>"><%= Resources.SiteCommon.Zip_Code %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Zipcode" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Zipcode_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Zipcode_Required %>" 
                Display="Dynamic" ControlToValidate="textbox_Zipcode" CssClass="text-danger" Enabled="False"></asp:RequiredFieldValidator>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="updatePanel_Default_Currency">
            <ContentTemplate>
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper"><label for=""><%= Resources.SiteCommon.Default_Currency %>:</label></div>
                    <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control"></asp:DropDownList></div>
                </div>
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper"><label for="<%= textbox_Vat_Percentage.ClientID %>"><%= Resources.SiteCommon.Vat_Percentage_Text %>:</label></div>
                    <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Vat_Percentage" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
                </div>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Telephone.ClientID %>"><%= Resources.SiteCommon.Business_Phone %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Telephone" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Mobile_Phone.ClientID %>"><%= Resources.SiteCommon.Mobile_Phone %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Mobile_Phone" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Mobile_Phone_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Mobile_Phone_Required %>" 
                Display="Dynamic" ControlToValidate="textbox_Mobile_Phone" CssClass="text-danger" Enabled="False"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Supplier_Type.ClientID %>"><%= Resources.SiteCommon.Supplier_Type %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Supplier_Type" ClientIDMode="Static" 
                    CssClass="Big_ComboBox form-control"></asp:DropDownList></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Supplier_Type_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Supplier_Type_Required %>" Display="Dynamic" 
                ControlToValidate="dropdown_Supplier_Type" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Supplier_Tax_Reference_Number.ClientID %>"><%= Resources.SiteCommon.Tax_Reference_Number %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Supplier_Tax_Reference_Number" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Supplier_Tax_Reference_Number_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Supplier_Tax_Reference_Number_Required %>" 
                Display="Dynamic" ControlToValidate="textbox_Supplier_Tax_Reference_Number" CssClass="text-danger" Enabled="False"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_FullName.ClientID %>"><%= Resources.SiteCommon.Contact_FullName %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Main_Contact_FullName" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Main_Contact_FullName_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Main_Contact_FullName_Required %>" 
                Display="Dynamic" ControlToValidate="textbox_Main_Contact_FullName" CssClass="text-danger" Enabled="False"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_Email_Address.ClientID %>"><%= Resources.SiteCommon.Contact_Email_Address %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Main_Contact_Email_Address" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Main_Contact_Email_Address_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Main_Contact_Email_Address_Required %>" 
                Display="Dynamic" ControlToValidate="textbox_Main_Contact_Email_Address" CssClass="text-danger" Enabled="False"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_Phone_Number.ClientID %>"><%= Resources.SiteCommon.Contact_Phone_Number %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Main_Contact_Phone_Number" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Main_Contact_Phone_Number_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Main_Contact_Phone_Number_Required %>" 
                Display="Dynamic" ControlToValidate="textbox_Main_Contact_Phone_Number" CssClass="text-danger" Enabled="False"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Supplier_From_Date.ClientID %>"><%= Resources.SiteCommon.Supplier_From_Date %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Supplier_From_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Supplier_To_Date.ClientID %>"><%= Resources.SiteCommon.Supplier_To_Date %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Supplier_To_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Contract_Date.ClientID %>"><%= Resources.SiteCommon.First_Contract_Date %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_First_Contract_Date" 
                ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Contract_Signed_With_Contact_Full_Name.ClientID %>"><%= Resources.SiteCommon.First_Contract_Contact %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_First_Contract_Signed_With_Contact_Full_Name" 
                ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Contract_Signed_In_Location_Description.ClientID %>"><%= Resources.SiteCommon.First_Contract_Location %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_First_Contract_Signed_In_Location_Description" TextMode="MultiLine" 
                ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Active.ClientID %>"><%= Resources.SiteCommon.Is_Active %>:</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="True" ClientIDMode="Static" /></div>
        </div>

        <hr />
        <div>
            <asp:Button runat="server" ID="button_Create_Supplier" Text="Create Supplier" OnClick="button_Create_Supplier_Click" CssClass="btn btn-primary" /> 
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br /><br /><br /><br />

    </div>

</asp:Content>

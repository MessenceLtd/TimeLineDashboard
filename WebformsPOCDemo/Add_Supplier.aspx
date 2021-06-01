<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_Supplier.aspx.cs" Inherits="WebformsPOCDemo.Add_Supplier" culture="auto" meta:resourcekey="Page" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5">Add Supplier</h2>
        <p class="lead">Keep track on all your suppliers and contacts.</p>
    </div>

    <hr />

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Company_Name.ClientID %>"><%= Resources.SiteCommon.Company_Name %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Company_Name" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Company_Name"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Company_Name_Required" ErrorMessage="Please enter an company name" Display="Dynamic" 
                ControlToValidate="textbox_Company_Name" CssClass="text-danger" meta:resourcekey="validator_Company_Name_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Website_URL.ClientID %>"><%= Resources.SiteCommon.Website_URL %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Website_URL" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Website_URL"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Website_URL_Required" ErrorMessage="Please enter an website" 
                Display="Dynamic" ControlToValidate="textbox_Website_URL" CssClass="text-danger" Enabled="False" meta:resourcekey="validator_Website_URL_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Country.ClientID %>"><%= Resources.SiteCommon.Country %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Country" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Country_SelectedIndexChanged" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Country"></asp:DropDownList></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Country_Required" ErrorMessage="Please select a country" Display="Dynamic" ControlToValidate="dropdown_Country" CssClass="text-danger" meta:resourcekey="validator_Country_Required"></asp:RequiredFieldValidator>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_StateUpdatePanel">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_State_Wrapper_Panel" class="Form_Group" Visible="False" meta:resourcekey="p_State_Wrapper_Panel">
                    <div class="Form_Label_Wrapper"><label for="<%= dropdown_State.ClientID %>"><%= Resources.SiteCommon.State %>:</label></div>
                    <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_State" ClientIDMode="Static" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_State"></asp:DropDownList></div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_State_Required" ErrorMessage="Please select a state" Display="Dynamic" ControlToValidate="textbox_City" CssClass="text-danger" meta:resourcekey="validator_State_Required"></asp:RequiredFieldValidator>
                </asp:Panel>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_City.ClientID %>"><%= Resources.SiteCommon.City %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_City" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_City"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_City_Required" ErrorMessage="Please enter a city" 
                Display="Dynamic" ControlToValidate="textbox_City" CssClass="text-danger" Enabled="False" meta:resourcekey="validator_City_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Address.ClientID %>"><%= Resources.SiteCommon.Address %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Address" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Address"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Address_Required" ErrorMessage="Please enter an address" 
                Display="Dynamic" ControlToValidate="textbox_Address" CssClass="text-danger" Enabled="False" meta:resourcekey="validator_Address_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Zipcode.ClientID %>"><%= Resources.SiteCommon.Zip_Code %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Zipcode" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Zipcode"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Zipcode_Required" ErrorMessage="Please enter an zipcode" 
                Display="Dynamic" ControlToValidate="textbox_Zipcode" CssClass="text-danger" Enabled="False" meta:resourcekey="validator_Zipcode_Required"></asp:RequiredFieldValidator>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="updatePanel_Default_Currency">
            <ContentTemplate>
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper"><label for=""><%= Resources.SiteCommon.Default_Currency %>:</label></div>
                    <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control" meta:resourcekey="dropdown_Currency"></asp:DropDownList></div>
                </div>
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper"><label for="<%= textbox_Vat_Percentage.ClientID %>"><%= Resources.SiteCommon.Vat_Percentage_Text %>:</label></div>
                    <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Vat_Percentage" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Vat_Percentage"></asp:TextBox></div>
                </div>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Telephone.ClientID %>"><%= Resources.SiteCommon.Business_Phone %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Telephone" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Telephone"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Mobile_Phone.ClientID %>"><%= Resources.SiteCommon.Mobile_Phone %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Mobile_Phone" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Mobile_Phone"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Mobile_Phone_Required" ErrorMessage="Please enter a mobile phone" 
                Display="Dynamic" ControlToValidate="textbox_Mobile_Phone" CssClass="text-danger" Enabled="False" meta:resourcekey="validator_Mobile_Phone_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Supplier_Type.ClientID %>"><%= Resources.SiteCommon.Supplier_Type %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Supplier_Type" ClientIDMode="Static" 
                    CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Supplier_Type"></asp:DropDownList></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Supplier_Type_Required" ErrorMessage="Please select a supplier type" Display="Dynamic" 
                ControlToValidate="dropdown_Supplier_Type" CssClass="text-danger" meta:resourcekey="validator_Supplier_Type_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Supplier_Tax_Reference_Number.ClientID %>"><%= Resources.SiteCommon.Tax_Reference_Number %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Supplier_Tax_Reference_Number" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Supplier_Tax_Reference_Number"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Supplier_Tax_Reference_Number_Required" ErrorMessage="Please enter a tax reference number" 
                Display="Dynamic" ControlToValidate="textbox_Supplier_Tax_Reference_Number" CssClass="text-danger" Enabled="False" meta:resourcekey="validator_Supplier_Tax_Reference_Number_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_FullName.ClientID %>"><%= Resources.SiteCommon.Contact_FullName %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Main_Contact_FullName" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Main_Contact_FullName"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Main_Contact_FullName_Required" ErrorMessage="Please enter a mobile phone" 
                Display="Dynamic" ControlToValidate="textbox_Main_Contact_FullName" CssClass="text-danger" Enabled="False" meta:resourcekey="validator_Main_Contact_FullName_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_Email_Address.ClientID %>"><%= Resources.SiteCommon.Contact_Email_Address %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Main_Contact_Email_Address" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Main_Contact_Email_Address"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Main_Contact_Email_Address_Required" ErrorMessage="Please enter a main contact email address" 
                Display="Dynamic" ControlToValidate="textbox_Main_Contact_Email_Address" CssClass="text-danger" Enabled="False" meta:resourcekey="validator_Main_Contact_Email_Address_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_Phone_Number.ClientID %>"><%= Resources.SiteCommon.Contact_Phone_Number %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Main_Contact_Phone_Number" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Main_Contact_Phone_Number"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Main_Contact_Phone_Number_Required" ErrorMessage="Please enter a main contact phone number" 
                Display="Dynamic" ControlToValidate="textbox_Main_Contact_Phone_Number" CssClass="text-danger" Enabled="False" meta:resourcekey="validator_Main_Contact_Phone_Number_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Supplier_From_Date.ClientID %>"><%= Resources.SiteCommon.Supplier_From_Date %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Supplier_From_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_Supplier_From_Date"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Supplier_To_Date.ClientID %>"><%= Resources.SiteCommon.Supplier_To_Date %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Supplier_To_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_Supplier_To_Date"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Contract_Date.ClientID %>"><%= Resources.SiteCommon.First_Contract_Date %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_First_Contract_Date" 
                ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_First_Contract_Date"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Contract_Signed_With_Contact_Full_Name.ClientID %>"><%= Resources.SiteCommon.First_Contract_Contact %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_First_Contract_Signed_With_Contact_Full_Name" 
                ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_First_Contract_Signed_With_Contact_Full_Name"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Contract_Signed_In_Location_Description.ClientID %>"><%= Resources.SiteCommon.First_Contract_Location %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_First_Contract_Signed_In_Location_Description" TextMode="MultiLine" 
                ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_First_Contract_Signed_In_Location_Description"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Active.ClientID %>"><%= Resources.SiteCommon.Is_Active %>:</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="True" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Active" /></div>
        </div>

        <hr />
        <div>
            <asp:Button runat="server" ID="button_Create_Supplier" Text="Create Supplier" OnClick="button_Create_Supplier_Click" CssClass="btn btn-primary" meta:resourcekey="button_Create_Supplier" /> 
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result" meta:resourcekey="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br /><br /><br /><br />

    </div>

</asp:Content>

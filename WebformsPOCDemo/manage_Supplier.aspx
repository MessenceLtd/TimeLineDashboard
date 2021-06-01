<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_Supplier.aspx.cs" Inherits="WebformsPOCDemo.manage_Supplier" culture="auto" meta:resourcekey="Page" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5">Manage Supplier</h2>
        <p class="lead">Change or add more details for your suppliers and contacts.</p>
    </div>

    <hr />

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Company_Name.ClientID %>"><%= Resources.SiteCommon.Company_Name %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Company_Name" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Company_Name"><asp:TextBox runat="server" 
                ID="textbox_Company_Name" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Company_Name"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Company_Name" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Company_Name"><asp:Label 
                runat="server" ID="label_Company_Name" meta:resourcekey="label_Company_Name"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Company_Name_Required" ErrorMessage="Please enter an company name" Display="Dynamic" 
                ControlToValidate="textbox_Company_Name" CssClass="text-danger" meta:resourcekey="validator_Company_Name_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Website_URL.ClientID %>"><%= Resources.SiteCommon.Website_URL %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Website_URL" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Website_URL"><asp:TextBox runat="server" 
                ID="textbox_Website_URL" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Website_URL"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Website_URL" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Website_URL"><asp:Label 
                runat="server" ID="label_Website_URL" meta:resourcekey="label_Website_URL"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Website_URL_Required" ErrorMessage="Please enter an website" Display="Dynamic" Enabled="false" 
                ControlToValidate="textbox_Website_URL" CssClass="text-danger" meta:resourcekey="validator_Website_URL_Required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="validator_Website_URL_Regex" ErrorMessage="Please enter a valid website url" Display="Dynamic" 
                ControlToValidate="textbox_Website_URL" CssClass="text-danger" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" meta:resourcekey="validator_Website_URL_Regex"></asp:RegularExpressionValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Country.ClientID %>"><%= Resources.SiteCommon.Country %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Country" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Country"><asp:DropDownList runat="server" 
                ID="dropdown_Country" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Country_SelectedIndexChanged" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Country"></asp:DropDownList></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Country" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Country"><asp:Label 
                runat="server" ID="label_Country" meta:resourcekey="label_Country"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Country_Required" ErrorMessage="Please select a country" Display="Dynamic" ControlToValidate="dropdown_Country" CssClass="text-danger" meta:resourcekey="validator_Country_Required"></asp:RequiredFieldValidator>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_StateUpdatePanel">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_State_Wrapper_Panel" class="Form_Group" Visible="False" meta:resourcekey="p_State_Wrapper_Panel">
                    <div class="Form_Label_Wrapper"><label for="<%= dropdown_State.ClientID %>"><%= Resources.SiteCommon.State %>:</label></div>
                    <asp:Panel ID="formControl_Wrapper_Edit_State" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_State"><asp:DropDownList runat="server" 
                        ID="dropdown_State" ClientIDMode="Static" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_State"></asp:DropDownList></asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_State" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_State"><asp:Label 
                        runat="server" ID="label_State" meta:resourcekey="label_State"></asp:Label></asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_State_Required" ErrorMessage="Please select a state" Display="Dynamic" ControlToValidate="textbox_City" CssClass="text-danger" meta:resourcekey="validator_State_Required"></asp:RequiredFieldValidator>
                </asp:Panel>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_City.ClientID %>"><%= Resources.SiteCommon.City %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_City" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_City"><asp:TextBox runat="server" ID="textbox_City" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_City"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_City" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_City"><asp:Label 
                runat="server" ID="label_City" meta:resourcekey="label_City"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_City_Required" Enabled="false" 
                ErrorMessage="Please enter a city" Display="Dynamic" ControlToValidate="textbox_City" CssClass="text-danger" meta:resourcekey="validator_City_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Address.ClientID %>"><%= Resources.SiteCommon.Address %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Address" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Address"><asp:TextBox runat="server" ID="textbox_Address" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Address"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Address" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Address"><asp:Label 
                runat="server" ID="label_Address" meta:resourcekey="label_Address"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Address_Required" Enabled="false" 
                ErrorMessage="Please enter an address" Display="Dynamic" ControlToValidate="textbox_Address" CssClass="text-danger" meta:resourcekey="validator_Address_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Zipcode.ClientID %>"><%= Resources.SiteCommon.Zip_Code %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Zipcode" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Zipcode"><asp:TextBox runat="server" 
                ID="textbox_Zipcode" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Zipcode"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Zipcode" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Zipcode"><asp:Label 
                runat="server" ID="label_Zipcode" meta:resourcekey="label_Zipcode"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Zipcode_Required" Enabled="false" 
                ErrorMessage="Please enter a zip code" Display="Dynamic" ControlToValidate="textbox_Zipcode" CssClass="text-danger" meta:resourcekey="validator_Zipcode_Required"></asp:RequiredFieldValidator>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="updatePanel_Default_Currency">
            <ContentTemplate>
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper"><label for="<% = dropdown_Currency.ClientID %>"><%= Resources.SiteCommon.Default_Currency %>:</label></div>
                    <asp:Panel ID="formControl_Wrapper_Edit_Currency" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Currency"><asp:DropDownList runat="server" 
                        ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control" meta:resourcekey="dropdown_Currency"></asp:DropDownList></asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Currency" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Currency"><asp:Label 
                        runat="server" ID="label_Currency" meta:resourcekey="label_Currency"></asp:Label></asp:Panel>
                </div>
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper"><label for="<%= textbox_Default_Vat_Percentage.ClientID %>"><%= Resources.SiteCommon.Vat_Percentage_Text %>:</label></div>
                    <asp:Panel ID="formControl_Wrapper_Edit_Default_Vat_Percentage" runat="server" CssClass="Form_Control"><asp:TextBox runat="server" 
                        ID="textbox_Default_Vat_Percentage" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Default_Vat_Percentage" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Currency"><asp:Label 
                        runat="server" ID="label_Default_Vat_Percentage" meta:resourcekey="label_Currency"></asp:Label></asp:Panel>
                </div>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Telephone.ClientID %>"><%= Resources.SiteCommon.Business_Phone %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Telephone" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Telephone"><asp:TextBox runat="server" ID="textbox_Telephone" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Telephone"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Telephone" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Telephone"><asp:Label 
                runat="server" ID="label_Telephone" meta:resourcekey="label_Telephone"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Mobile_Phone.ClientID %>"><%= Resources.SiteCommon.Mobile_Phone %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Mobile_Phone" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Mobile_Phone"><asp:TextBox runat="server" ID="textbox_Mobile_Phone" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Mobile_Phone"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Mobile_Phone" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Mobile_Phone"><asp:Label runat="server" 
                ID="label_Mobile_Phone" meta:resourcekey="label_Mobile_Phone"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Mobile_Phone_Required" Enabled="false" 
                ErrorMessage="Please enter a mobile phone" Display="Dynamic" ControlToValidate="textbox_Mobile_Phone" CssClass="text-danger" meta:resourcekey="validator_Mobile_Phone_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Supplier_Type.ClientID %>"><%= Resources.SiteCommon.Supplier_Type %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Supplier_Type" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Supplier_Type"><asp:DropDownList runat="server" ID="dropdown_Supplier_Type" ClientIDMode="Static" 
                    CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Supplier_Type"></asp:DropDownList></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Supplier_Type" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Supplier_Type"><asp:Label runat="server" 
                ID="label_Supplier_Type" meta:resourcekey="label_Supplier_Type"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Supplier_Type_Required" ErrorMessage="Please select a supplier type" Display="Dynamic" 
                ControlToValidate="dropdown_Supplier_Type" CssClass="text-danger" meta:resourcekey="validator_Supplier_Type_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Supplier_Tax_Reference_Number.ClientID %>"><%= Resources.SiteCommon.Tax_Reference_Number %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Supplier_Tax_Reference_Number" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Supplier_Tax_Reference_Number"><asp:TextBox runat="server" 
                ID="textbox_Supplier_Tax_Reference_Number" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Supplier_Tax_Reference_Number"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Supplier_Tax_Reference_Number" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Supplier_Tax_Reference_Number"><asp:Label runat="server" 
                ID="label_Supplier_Tax_Reference_Number" meta:resourcekey="label_Supplier_Tax_Reference_Number"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Supplier_Tax_Reference_Number_Required" Enabled="false" ErrorMessage="Please enter a tax reference number" 
                Display="Dynamic" ControlToValidate="textbox_Supplier_Tax_Reference_Number" CssClass="text-danger" meta:resourcekey="validator_Supplier_Tax_Reference_Number_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_FullName.ClientID %>"><%= Resources.SiteCommon.Contact_FullName %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Main_Contact_FullName" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Main_Contact_FullName"><asp:TextBox runat="server" 
                ID="textbox_Main_Contact_FullName" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Main_Contact_FullName"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Main_Contact_FullName" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Main_Contact_FullName"><asp:Label runat="server" 
                ID="label_Main_Contact_FullName" meta:resourcekey="label_Main_Contact_FullName"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Main_Contact_FullName_Required" Enabled="false" ErrorMessage="Please enter a mobile phone" 
                Display="Dynamic" ControlToValidate="textbox_Main_Contact_FullName" CssClass="text-danger" meta:resourcekey="validator_Main_Contact_FullName_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_Email_Address.ClientID %>"><%= Resources.SiteCommon.Contact_Email_Address %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Main_Contact_Email_Address" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Main_Contact_Email_Address"><asp:TextBox runat="server" 
                ID="textbox_Main_Contact_Email_Address" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Main_Contact_Email_Address"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Main_Contact_Email_Address" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Main_Contact_Email_Address"><asp:Label runat="server" 
                ID="label_Main_Contact_Email_Address" meta:resourcekey="label_Main_Contact_Email_Address"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Main_Contact_Email_Address_Required" Enabled="false" ErrorMessage="Please enter a main contact email address" 
                Display="Dynamic" ControlToValidate="textbox_Main_Contact_Email_Address" CssClass="text-danger" meta:resourcekey="validator_Main_Contact_Email_Address_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_Phone_Number.ClientID %>"><%= Resources.SiteCommon.Contact_Phone_Number %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Main_Contact_Phone_Number" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Main_Contact_Phone_Number"><asp:TextBox runat="server" 
                ID="textbox_Main_Contact_Phone_Number" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Main_Contact_Phone_Number"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Main_Contact_Phone_Number" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Main_Contact_Phone_Number"><asp:Label runat="server" 
                ID="label_Main_Contact_Phone_Number" meta:resourcekey="label_Main_Contact_Phone_Number"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Main_Contact_Phone_Number_Required" Enabled="false" ErrorMessage="Please enter a main contact phone number" 
                Display="Dynamic" ControlToValidate="textbox_Main_Contact_Phone_Number" CssClass="text-danger" meta:resourcekey="validator_Main_Contact_Phone_Number_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Supplier_From_Date.ClientID %>"><%= Resources.SiteCommon.Supplier_From_Date %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Supplier_From_Date" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Supplier_From_Date"><asp:TextBox runat="server" 
                ID="textbox_Supplier_From_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_Supplier_From_Date"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Supplier_From_Date" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Supplier_From_Date"><asp:Label runat="server" 
                ID="label_Supplier_From_Date" meta:resourcekey="label_Supplier_From_Date"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Supplier_To_Date.ClientID %>"><%= Resources.SiteCommon.Supplier_To_Date %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Supplier_To_Date" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Supplier_To_Date"><asp:TextBox runat="server" 
                ID="textbox_Supplier_To_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_Supplier_To_Date"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Supplier_To_Date" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Supplier_To_Date"><asp:Label runat="server" 
                ID="label_Supplier_To_Date" meta:resourcekey="label_Supplier_To_Date"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Contract_Date.ClientID %>"><%= Resources.SiteCommon.First_Contract_Date %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_First_Contract_Date" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_First_Contract_Date"><asp:TextBox runat="server" ID="textbox_First_Contract_Date" 
                ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_First_Contract_Date"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_First_Contract_Date" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_First_Contract_Date"><asp:Label runat="server" 
                ID="label_First_Contract_Date" meta:resourcekey="label_First_Contract_Date"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Contract_Signed_With_Contact_Full_Name.ClientID %>"><%= Resources.SiteCommon.First_Contract_Contact %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_First_Contract_Signed_With_Contact_Full_Name" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_First_Contract_Signed_With_Contact_Full_Name"><asp:TextBox runat="server" 
                ID="textbox_First_Contract_Signed_With_Contact_Full_Name" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_First_Contract_Signed_With_Contact_Full_Name"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_First_Contract_Signed_With_Contact_Full_Name" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_First_Contract_Signed_With_Contact_Full_Name"><asp:Label runat="server" 
                ID="label_First_Contract_Signed_With_Contact_Full_Name" meta:resourcekey="label_First_Contract_Signed_With_Contact_Full_Name"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Contract_Signed_In_Location_Description.ClientID %>"><%= Resources.SiteCommon.First_Contract_Location %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_First_Contract_Signed_In_Location_Description" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_First_Contract_Signed_In_Location_Description"><asp:TextBox runat="server" 
                ID="textbox_First_Contract_Signed_In_Location_Description" TextMode="MultiLine" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_First_Contract_Signed_In_Location_Description"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_First_Contract_Signed_In_Location_Description" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_First_Contract_Signed_In_Location_Description"><asp:Label runat="server" 
                ID="label_First_Contract_Signed_In_Location_Description" meta:resourcekey="label_First_Contract_Signed_In_Location_Description"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Active.ClientID %>"><%= Resources.SiteCommon.Is_Active %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Is_Active" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Is_Active"><asp:CheckBox runat="server" 
                ID="checkbox_Is_Active" Checked="True" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Active" /></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Active" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Is_Active"><asp:Label runat="server" 
                ID="label_Is_Active" meta:resourcekey="label_Is_Active"></asp:Label></asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label><%= Resources.SiteCommon.Created_By %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Created_By_User" runat="server" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_Record_Created_By_User"><asp:Label 
                runat="server" ID="label_Record_Created_By_User" meta:resourcekey="label_Record_Created_By_User"></asp:Label></asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label><%= Resources.SiteCommon.Created_On %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Creation_DateTime_UTC" runat="server" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_Record_Creation_DateTime_UTC"><asp:Label 
                runat="server" ID="label_Record_Creation_DateTime_UTC" meta:resourcekey="label_Record_Creation_DateTime_UTC"></asp:Label></asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label><%= Resources.SiteCommon.Last_Modified_By %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_By_User" runat="server" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_Record_Last_Updated_By_User"><asp:Label 
                runat="server" ID="label_Record_Last_Updated_By_User" meta:resourcekey="label_Record_Last_Updated_By_User"></asp:Label></asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label><%= Resources.SiteCommon.Last_Modified_Date %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_DateTime_UTC" runat="server" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_Record_Last_Updated_DateTime_UTC"><asp:Label 
                runat="server" ID="label_Record_Last_Updated_DateTime_UTC" meta:resourcekey="label_Record_Last_Updated_DateTime_UTC"></asp:Label></asp:Panel>
        </div>

        <hr />
        <div>
            
            <asp:Button runat="server" ID="button_Edit_Supplier_Details" 
                Text="Edit Supplier" OnClick="button_Edit_Supplier_Details_Click" CausesValidation="False" CssClass="btn btn-primary" meta:resourcekey="button_Edit_Supplier_Details" /> 

            <asp:Button runat="server" ID="button_Update_Supplier_Details" 
                Text="Save Changes" OnClick="button_Update_Supplier_Details_Click" CssClass="btn btn-success" meta:resourcekey="button_Update_Supplier_Details" /> 

            <asp:Button runat="server" ID="button_CancelEdit_Supplier_Details" 
                Text="Cancel Editing" OnClick="button_CancelEdit_Supplier_Details_Click" CausesValidation="False" OnSupplierClick="if (!confirm('Are you sure you want to cancel edit?')) return false;" CssClass="btn btn-danger" meta:resourcekey="button_CancelEdit_Supplier_Details" /> 

        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result" meta:resourcekey="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br /><br /><br /><br />

    </div>

</asp:Content>

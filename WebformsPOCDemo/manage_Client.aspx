<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_Client.aspx.cs" Inherits="WebformsPOCDemo.manage_Client" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5">Manage Client</h2>
        <p class="lead">Change and add more details for your clients and contacts.</p>
    </div>

    <hr />

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Company_Name.ClientID %>">Company Name:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Company_Name" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_Company_Name" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Company_Name" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Company_Name"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Company_Name_Required" ErrorMessage="Please enter an company name" Display="Dynamic" 
                ControlToValidate="textbox_Company_Name" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Website_URL.ClientID %>">Website URL:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Website_URL" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox runat="server" ID="textbox_Website_URL" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Website_URL" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Website_URL"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Website_URL_Required" ErrorMessage="Please enter an website" Display="Dynamic" ControlToValidate="textbox_Website_URL" CssClass="text-danger"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="validator_Website_URL_Regex" ErrorMessage="Please enter a valid website url" Display="Dynamic" 
                ControlToValidate="textbox_Website_URL" CssClass="text-danger" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Currency.ClientID %>">Default Currency:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Currency" runat="server" Visible="true" CssClass="Form_Control"><asp:DropDownList 
                runat="server" ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control"></asp:DropDownList></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Currency" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Currency"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Country.ClientID %>">Country:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Country" runat="server" Visible="true" CssClass="Form_Control"><asp:DropDownList 
                runat="server" ID="dropdown_Country" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Country_SelectedIndexChanged" 
                CssClass="Big_ComboBox form-control"></asp:DropDownList></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Country" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Country"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Country_Required" ErrorMessage="Please select a country" Display="Dynamic" ControlToValidate="dropdown_Country" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_StateUpdatePanel">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_State_Wrapper_Panel" class="Form_Group" Visible="false">
                    <div class="Form_Label_Wrapper"><label for="<%= dropdown_State.ClientID %>">State:</label></div>
                    <asp:Panel ID="formControl_Wrapper_Edit_State" runat="server" Visible="true" CssClass="Form_Control"><asp:DropDownList runat="server" 
                        ID="dropdown_State" ClientIDMode="Static" CssClass="Big_ComboBox form-control"></asp:DropDownList></asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_State" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                        runat="server" ID="label_State"></asp:Label></asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_State_Required" ErrorMessage="Please select a state" Display="Dynamic" ControlToValidate="textbox_City" CssClass="text-danger"></asp:RequiredFieldValidator>
                </asp:Panel>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_City.ClientID %>">City:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_City" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                 runat="server" ID="textbox_City" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_City" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                        runat="server" ID="label_City"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_City_Required" ErrorMessage="Please enter a city" 
                Display="Dynamic" ControlToValidate="textbox_City" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Address.ClientID %>">Address:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Address" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_Address" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Address" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Address"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Address_Required" ErrorMessage="Please enter an address" Display="Dynamic" 
                ControlToValidate="textbox_Address" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Zipcode.ClientID %>">Zip Code:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Zipcode" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Zipcode" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Zipcode" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Zipcode"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Zipcode_Required" ErrorMessage="Please enter an address" Display="Dynamic" ControlToValidate="textbox_Zipcode" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Telephone.ClientID %>">Business Phone:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Telephone" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_Telephone" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Telephone" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Telephone"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Mobile_Phone.ClientID %>">Mobile Phone:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Mobile_Phone" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_Mobile_Phone" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Mobile_Phone" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Mobile_Phone"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Mobile_Phone_Required" ErrorMessage="Please enter a mobile phone" 
                Display="Dynamic" ControlToValidate="textbox_Mobile_Phone" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Client_Type.ClientID %>">Client Type:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Client_Type" runat="server" Visible="true" CssClass="Form_Control"><asp:DropDownList 
                runat="server" ID="dropdown_Client_Type" ClientIDMode="Static" CssClass="Big_ComboBox form-control"></asp:DropDownList></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Client_Type" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Client_Type"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Client_Type_Required" ErrorMessage="Please select a client type" Display="Dynamic" 
                ControlToValidate="dropdown_Client_Type" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Client_Tax_Reference_Number.ClientID %>">Tax Reference Number:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Client_Tax_Reference_Number" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_Client_Tax_Reference_Number" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Client_Tax_Reference_Number" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Client_Tax_Reference_Number"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Client_Tax_Reference_Number_Required" ErrorMessage="Please enter a tax reference number" 
                Display="Dynamic" ControlToValidate="textbox_Client_Tax_Reference_Number" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_FullName.ClientID %>">Contact Full-Name:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Main_Contact_FullName" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_Main_Contact_FullName" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Main_Contact_FullName" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Main_Contact_FullName"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Main_Contact_FullName_Required" ErrorMessage="Please enter a mobile phone" 
                Display="Dynamic" ControlToValidate="textbox_Main_Contact_FullName" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_Email_Address.ClientID %>">Email Address:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Main_Contact_Email_Address" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_Main_Contact_Email_Address" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Main_Contact_Email_Address" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Main_Contact_Email_Address"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Main_Contact_Email_Address_Required" ErrorMessage="Please enter a main contact email address" 
                Display="Dynamic" ControlToValidate="textbox_Main_Contact_Email_Address" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_Phone_Number.ClientID %>">Contact Phone number:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Main_Contact_Phone_Number" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_Main_Contact_Phone_Number" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Main_Contact_Phone_Number" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Main_Contact_Phone_Number"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Main_Contact_Phone_Number_Required" ErrorMessage="Please enter a main contact phone number" 
                Display="Dynamic" ControlToValidate="textbox_Main_Contact_Phone_Number" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Client_From_Date.ClientID %>">Client From Date:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Client_From_Date" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Client_From_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="Off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Client_From_Date" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Client_From_Date"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Client_To_Date.ClientID %>">Client To Date:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Client_To_Date" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_Client_To_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="Off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Client_To_Date" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Client_To_Date"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Contract_Date.ClientID %>">First Contract Date:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_First_Contract_Date" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox runat="server" ID="textbox_First_Contract_Date" 
                ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="Off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_First_Contract_Date" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_First_Contract_Date"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Contract_Signed_With_Contact_Full_Name.ClientID %>">First contract contact:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_First_Contract_Signed_With_Contact_Full_Name" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_First_Contract_Signed_With_Contact_Full_Name" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_First_Contract_Signed_With_Contact_Full_Name" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_First_Contract_Signed_With_Contact_Full_Name"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Contract_Signed_In_Location_Description.ClientID %>">First contract location:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_First_Contract_Signed_In_Location_Description" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_First_Contract_Signed_In_Location_Description" TextMode="MultiLine" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_First_Contract_Signed_In_Location_Description" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_First_Contract_Signed_In_Location_Description"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Active.ClientID %>">Is Active:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Is_Active" runat="server" Visible="true" CssClass="Form_Control"><asp:CheckBox runat="server" 
                ID="checkbox_Is_Active" Checked="true" ClientIDMode="Static" /></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Active" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Is_Active"></asp:Label></asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label>Created by:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Created_By_User" runat="server" Visible="true" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Record_Created_By_User"></asp:Label></asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label>Created at:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Creation_DateTime_UTC" runat="server" Visible="true" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Record_Creation_DateTime_UTC"></asp:Label></asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label>Last Modified by:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_By_User" runat="server" Visible="true" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Record_Last_Updated_By_User"></asp:Label></asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label>Last Modified Date:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_DateTime_UTC" runat="server" Visible="true" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Record_Last_Updated_DateTime_UTC"></asp:Label></asp:Panel>
        </div>

        <hr />
        <div>

            <asp:Button runat="server" ID="button_Edit_Client_Details" 
                Text="Edit Client" OnClick="button_Edit_Client_Details_Click" CausesValidation="false" CssClass="btn btn-primary" /> 

            <asp:Button runat="server" ID="button_Update_Client_Details" 
                Text="Save Changes" OnClick="button_Update_Client_Details_Click" CssClass="btn btn-success" /> 

            <asp:Button runat="server" ID="button_CancelEdit_Client_Details" 
                Text="Cancel Editing" OnClick="button_CancelEdit_Client_Details_Click" CausesValidation="false" OnClientClick="if (!confirm('Are you sure you want to cancel edit?')) return false;" CssClass="btn btn-danger" /> 
            
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br /><br /><br /><br />

    </div>


</asp:Content>

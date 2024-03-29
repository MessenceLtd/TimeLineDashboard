﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_User.aspx.cs" Inherits="WebformsPOCDemo.manage_User" culture="auto" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5"><%= Resources.SiteCommon.Manage_User_Title %></h2>
        <p class="lead"><%= Resources.SiteCommon.Manage_User_SubTitle %></p>
    </div>

    <hr />

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Username.ClientID %>"><%= Resources.SiteCommon.Username %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Username" runat="server" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_Username" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Username" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Username"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Username_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Username_Required %>" Display="Dynamic" 
                ControlToValidate="textbox_Username" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <asp:Panel runat="server" ID="p_App_Permission_Type_Visibility_Wrapper" CssClass="Form_Group" Visible="False">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_App_Permission_Type.ClientID %>"><%= Resources.SiteCommon.App_Permission_Type %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_App_Permission_Type" runat="server" CssClass="Form_Control"><asp:DropDownList 
                runat="server" ID="dropdown_App_Permission_Type" ClientIDMode="Static" CssClass="Regular_ComboBox form-control"></asp:DropDownList></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_App_Permission_Type" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_App_Permission_Type"></asp:Label></asp:Panel>
        </asp:Panel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Name.ClientID %>"><%= Resources.SiteCommon.First_Name %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_First_Name" runat="server" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_First_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_First_Name" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_First_Name"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_First_Name_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_First_Name_Required %>" Display="Dynamic" 
                ControlToValidate="textbox_First_Name" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Middle_Name.ClientID %>"><%= Resources.SiteCommon.Middle_Name %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Middle_Name" runat="server" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_Middle_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Middle_Name" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Middle_Name"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Last_Name.ClientID %>"><%= Resources.SiteCommon.Last_Name %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Last_Name" runat="server" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_Last_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Last_Name" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Last_Name"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Last_Name_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Last_Name_Required %>" Display="Dynamic" 
                ControlToValidate="textbox_Last_Name" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Email.ClientID %>"><%= Resources.SiteCommon.Email %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Email" runat="server" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_Email" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Email" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Email"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Email_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Email_Required %>" Display="Dynamic" 
                ControlToValidate="textbox_Email" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Country.ClientID %>"><%= Resources.SiteCommon.Country %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Country" runat="server" CssClass="Form_Control"><asp:DropDownList 
                runat="server" ID="dropdown_Country" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Country_SelectedIndexChanged" 
                CssClass="Big_ComboBox form-control"></asp:DropDownList></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Country" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Country"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Country_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Country_Required %>" 
                Display="Dynamic" ControlToValidate="dropdown_Country" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        
        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_StateUpdatePanel">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_State_Wrapper_Panel" class="Form_Group" Visible="False">
                    <div class="Form_Label_Wrapper"><label for="<%= dropdown_State.ClientID %>"><%= Resources.SiteCommon.State %>:</label></div>
                    <asp:Panel ID="formControl_Wrapper_Edit_State" runat="server" CssClass="Form_Control"><asp:DropDownList runat="server" 
                        ID="dropdown_State" ClientIDMode="Static" CssClass="Big_ComboBox form-control"></asp:DropDownList></asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_State" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                        runat="server" ID="label_State"></asp:Label></asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_State_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_State_Required %>" 
                        Display="Dynamic" ControlToValidate="textbox_City" CssClass="text-danger"></asp:RequiredFieldValidator>
                </asp:Panel>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_City.ClientID %>"><%= Resources.SiteCommon.City %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_City" runat="server" CssClass="Form_Control"><asp:TextBox 
                 runat="server" ID="textbox_City" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_City" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                        runat="server" ID="label_City"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_City_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_City_Required %>" 
                Display="Dynamic" ControlToValidate="textbox_City" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Address.ClientID %>"><%= Resources.SiteCommon.Address %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Address" runat="server" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_Address" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Address" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Address"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Address_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Address_Required %>" Display="Dynamic" 
                ControlToValidate="textbox_Address" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Zipcode.ClientID %>"><%= Resources.SiteCommon.Zip_Code %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Zipcode" runat="server" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Zipcode" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Zipcode" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Zipcode"></asp:Label></asp:Panel>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="updatePanel_Default_Currency">
            <ContentTemplate>
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper"><label for="<% = dropdown_Currency.ClientID %>"><%= Resources.SiteCommon.Default_Currency %>:</label></div>
                    <asp:Panel ID="formControl_Wrapper_Edit_Currency" runat="server" CssClass="Form_Control"><asp:DropDownList runat="server" 
                        ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control"></asp:DropDownList></asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Currency" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                        runat="server" ID="label_Currency"></asp:Label></asp:Panel>
                </div>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Mobile_Phone.ClientID %>"><%= Resources.SiteCommon.Mobile_Phone %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Mobile_Phone" runat="server" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_Mobile_Phone" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Mobile_Phone" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Mobile_Phone"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Additional_Phone_Number.ClientID %>"><%= Resources.SiteCommon.Additional_Phone_Number %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Additional_Phone_Number" runat="server" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_Additional_Phone_Number" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Additional_Phone_Number" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Additional_Phone_Number"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Birth_Date.ClientID %>"><%= Resources.SiteCommon.Birth_Date %>:</label></div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Birth_Date" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Birth_Date" ClientIDMode="Static" autocomplete="nope"
                    CssClass="form-control InitializeDatePicker"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Birth_Date" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Birth_Date"></asp:Label>
            </asp:Panel>
        </div>
        
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Gender.ClientID %>"><%= Resources.SiteCommon.Gender %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Gender" runat="server" CssClass="Form_Control"><asp:DropDownList 
                runat="server" ID="dropdown_Gender" ClientIDMode="Static" CssClass="Regular_ComboBox form-control">
                    <asp:ListItem Text="<%$ Resources:SiteCommon, Gender_Select %>" Value=""></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:SiteCommon, Gender_Type_1 %>" Value="1"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:SiteCommon, Gender_Type_2 %>" Value="2"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:SiteCommon, Gender_Type_3 %>" Value="3"></asp:ListItem>
                </asp:DropDownList></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Gender" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Gender"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Gender_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Gender_Required %>" 
                Display="Dynamic" ControlToValidate="dropdown_Gender" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Registration_DateTime.ClientID %>"><%= Resources.SiteCommon.Registration_Date %>:</label></div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Registration_DateTime" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Registration_DateTime" ClientIDMode="Static" autocomplete="nope"
                    CssClass="form-control InitializeDatePicker"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Registration_DateTime" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Registration_DateTime"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label 
                for="<%= dropdown_Registration_Time_Hours.ClientID %>"><%= Resources.SiteCommon.Registration_Time %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Registration_Time_Hours" runat="server" class="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Registration_Time_Hours" ClientIDMode="Static"
                    CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Registration_Time_Minutes"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Registration_Time_Seconds"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Registration_Time" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Registration_Time"></asp:Label>
            </asp:Panel>
        </div>

        <asp:Panel CssClass="Form_Group" runat="server" ID="panel_Azure_Container_Ref" Visible="false">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Azure_Container_Ref.ClientID %>"><% = Resources.SiteCommon.Azure_Container %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Azure_Container_Ref" runat="server" CssClass="Form_Control"><asp:TextBox runat="server" 
                ID="textbox_Azure_Container_Ref" ClientIDMode="Static" CssClass="form-control" ReadOnly="true" Enabled="false"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Azure_Container_Ref" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Azure_Container_Ref"></asp:Label></asp:Panel>
        </asp:Panel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Heard_About_Application_From.ClientID %>"><% = Resources.SiteCommon.Heard_About_Application_From %>:</label></div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Heard_About_Application_From" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Heard_About_Application_From" ClientIDMode="Static"
                    TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Heard_About_Application_From" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Heard_About_Application_From"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Our_Administrative_Side_Notes.ClientID %>"><% = Resources.SiteCommon.Adminstration_Notes %>:</label></div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Our_Administrative_Side_Notes" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Our_Administrative_Side_Notes" ClientIDMode="Static"
                    TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Our_Administrative_Side_Notes" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Our_Administrative_Side_Notes"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Active.ClientID %>"><% = Resources.SiteCommon.Is_Active %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Is_Active" runat="server" CssClass="Form_Control"><asp:CheckBox runat="server" 
                ID="checkbox_Is_Active" Checked="True" ClientIDMode="Static" /></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Active" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Is_Active"></asp:Label></asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label><% = Resources.SiteCommon.Created_By %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Created_By_User" runat="server" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Record_Created_By_User"></asp:Label></asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label><% = Resources.SiteCommon.Created_On %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Creation_DateTime_UTC" runat="server" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Record_Creation_DateTime_UTC"></asp:Label></asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label><% = Resources.SiteCommon.Last_Modified_By %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_By_User" runat="server" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Record_Last_Updated_By_User"></asp:Label></asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label><% = Resources.SiteCommon.Last_Modified_Date %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_DateTime_UTC" runat="server" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Record_Last_Updated_DateTime_UTC"></asp:Label></asp:Panel>
        </div>

        <hr />
        <div>

            <asp:Button runat="server" ID="button_Edit_User_Details" Text="<%$ Resources:SiteCommon, Manage_User_Button_Edit %>" 
                OnClick="button_Edit_User_Details_Click" CausesValidation="False" CssClass="btn btn-primary" /> 

            <asp:Button runat="server" ID="button_Update_User_Details" Text="<%$ Resources:SiteCommon, Manage_User_Button_Save_Changes %>" 
                OnClick="button_Update_User_Details_Click" CssClass="btn btn-success" /> 

            <asp:Button runat="server" ID="button_CancelEdit_User_Details" Text="<%$ Resources:SiteCommon, Manage_User_Button_Cancel_Editing %>" 
                OnClick="button_CancelEdit_User_Details_Click" CausesValidation="False" CssClass="btn btn-danger" /> 
            
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br /><br /><br /><br />

    </div>


</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_User.aspx.cs" Inherits="WebformsPOCDemo.Add_User" culture="auto" meta:resourcekey="Page" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links" meta:resourcekey="panel_HeaderLinks">       
        <asp:HyperLink runat="server" Text="Add New User" CssClass="active" NavigateUrl="Add_User.aspx" meta:resourcekey="HyperLink"></asp:HyperLink>
    </asp:Panel>

    <hr />

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Email_Address.ClientID %>"><%= Resources.SiteCommon.Email_Address %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Email_Address" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Email_Address"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Email_Address_Required" ErrorMessage="Please enter an email address" Display="Dynamic" ControlToValidate="textbox_Email_Address" CssClass="text-danger" meta:resourcekey="validator_Email_Address_Required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="validator_Email_Adress_Regex" ErrorMessage="Please enter a valid email address" Display="Dynamic" ControlToValidate="textbox_Email_Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="text-danger" meta:resourcekey="validator_Email_Adress_Regex"></asp:RegularExpressionValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Username.ClientID %>"><%= Resources.SiteCommon.Username %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Username" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Username"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Username_Required" ErrorMessage="Please enter an username" Display="Dynamic" ControlToValidate="textbox_Username" CssClass="text-danger" meta:resourcekey="validator_Username_Required"></asp:RequiredFieldValidator>
        </div>

        <asp:Panel runat="server" ID="panel_User_App_Permission_Type" CssClass="Form_Group" meta:resourcekey="panel_User_App_Permission_Type">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_App_Permission_Type.ClientID %>"><%= Resources.SiteCommon.Permission %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_App_Permission_Type" ClientIDMode="Static" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_App_Permission_Type"></asp:DropDownList></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_App_Permission_Type_Required" ErrorMessage="Please select a permission type" Display="Dynamic" 
                ControlToValidate="dropdown_App_Permission_Type" CssClass="text-danger" meta:resourcekey="validator_App_Permission_Type_Required"></asp:RequiredFieldValidator>
        </asp:Panel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Password.ClientID %>"><%= Resources.SiteCommon.Password %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Password" TextMode="Password" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Password"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Password_Required" ErrorMessage="Please enter an password" Display="Dynamic" ControlToValidate="textbox_Password" CssClass="text-danger" meta:resourcekey="validator_Password_Required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="validator_Password_Strength" ErrorMessage="Password must contain english charecters. Minimum 8 length with 1 upper case, 2 lower case chars, 2 digits chars and 1 of the special char !@#$%^&*()\-_+." 
                ValidationExpression="^(?=.*[A-Z])(?=.*[!@#$%^&*()\-_+.])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z]).{8,}$" CssClass="text-danger" ControlToValidate="textbox_Password" Display="Dynamic" meta:resourcekey="validator_Password_Strength"></asp:RegularExpressionValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Password_Repeat.ClientID %>"><%= Resources.SiteCommon.Repeat_Password %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Password_Repeat" TextMode="Password" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Password_Repeat"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Password_Repeat_Required" ErrorMessage="Please repeat the password" Display="Dynamic" ControlToValidate="textbox_Password_Repeat" CssClass="text-danger" meta:resourcekey="validator_Password_Repeat_Required"></asp:RequiredFieldValidator>
            <asp:CompareValidator runat="server" ID="validator_Password_Repeat_Matcher" ControlToValidate="textbox_Password_Repeat" ErrorMessage="The passwords do not match"
                ControlToCompare="textbox_Password" Display="Dynamic" CssClass="text-danger" meta:resourcekey="validator_Password_Repeat_Matcher"></asp:CompareValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Name.ClientID %>"><%= Resources.SiteCommon.First_Name %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_First_Name" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_First_Name"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_First_Name_Required" ErrorMessage="Please enter a first name" Display="Dynamic" ControlToValidate="textbox_First_Name" CssClass="text-danger" meta:resourcekey="validator_First_Name_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Middle_Name.ClientID %>"><%= Resources.SiteCommon.Middle_Name %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Middle_Name" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Middle_Name"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Last_Name.ClientID %>"><%= Resources.SiteCommon.Last_Name %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Last_Name" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Last_Name"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Last_Name_Required" ErrorMessage="Please enter a last name" Display="Dynamic" ControlToValidate="textbox_Last_Name" CssClass="text-danger" meta:resourcekey="validator_Last_Name_Required"></asp:RequiredFieldValidator>
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
            <asp:RequiredFieldValidator runat="server" ID="validator_City_Required" ErrorMessage="Please enter a city" Display="Dynamic" ControlToValidate="textbox_City" CssClass="text-danger" meta:resourcekey="validator_City_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Address.ClientID %>"><%= Resources.SiteCommon.Address %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Address" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Address"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Address_Required" ErrorMessage="Please enter an address" Display="Dynamic" ControlToValidate="textbox_Address" CssClass="text-danger" meta:resourcekey="validator_Address_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Zipcode.ClientID %>"><%= Resources.SiteCommon.Zip_Code %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Zipcode" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Zipcode"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Zipcode_Required" ErrorMessage="Please enter an address" Display="Dynamic" ControlToValidate="textbox_Zipcode" CssClass="text-danger" meta:resourcekey="validator_Zipcode_Required"></asp:RequiredFieldValidator>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="updatePanel_Default_Currency">
            <ContentTemplate>
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper"><label for=""><%= Resources.SiteCommon.Default_Currency %>:</label></div>
                    <asp:Panel ID="formControl_Wrapper_Edit_Currency" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Currency"><asp:DropDownList runat="server" 
                        ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control" meta:resourcekey="dropdown_Currency"></asp:DropDownList></asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Currency" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Currency"><asp:Label 
                        runat="server" ID="label_Currency" meta:resourcekey="label_Currency"></asp:Label></asp:Panel>
                </div>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Mobile_Phone.ClientID %>"><%= Resources.SiteCommon.Mobile_Phone %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Mobile_Phone" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Mobile_Phone"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Mobile_Phone_Required" ErrorMessage="Please enter a mobile phone" Display="Dynamic" ControlToValidate="textbox_Mobile_Phone" CssClass="text-danger" meta:resourcekey="validator_Mobile_Phone_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Additional_Phone_Number.ClientID %>"><%= Resources.SiteCommon.Additional_Phone_Number %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Additional_Phone_Number" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Additional_Phone_Number"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Birth_Date.ClientID %>"><%= Resources.SiteCommon.Birth_Date %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Birth_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_Birth_Date"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Birth_Date_Required" ErrorMessage="Please enter a birth date" Display="Dynamic" ControlToValidate="textbox_Birth_Date" CssClass="text-danger" meta:resourcekey="validator_Birth_Date_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Gender.ClientID %>"><%= Resources.SiteCommon.Gender %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Gender" ClientIDMode="Static" CssClass="Small_ComboBox form-control" meta:resourcekey="dropdown_Gender">
                    <asp:ListItem Text="-- Select --" Value="" meta:resourcekey="ListItem"></asp:ListItem>
                    <asp:ListItem Text="Male" Value="1" meta:resourcekey="ListItemResource2"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="2" meta:resourcekey="ListItemResource3"></asp:ListItem>
                    <asp:ListItem Text="Other" Value="3" meta:resourcekey="ListItemResource4"></asp:ListItem>
                 </asp:DropDownList></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Gender_Required" ErrorMessage="Please enter a gender" Display="Dynamic" ControlToValidate="dropdown_Gender" CssClass="text-danger" meta:resourcekey="validator_Gender_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Heard_About_Application_From.ClientID %>"><%= Resources.SiteCommon.Heard_About_Application_From %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Heard_About_Application_From" TextMode="MultiLine" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Heard_About_Application_From"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Heard_About_Application_From.ClientID %>"><%= Resources.SiteCommon.Our_Administrative_Side_Notes %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Administrative_Side_Notes" TextMode="MultiLine" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Administrative_Side_Notes"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Active.ClientID %>"><%= Resources.SiteCommon.Is_Active %>:</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="True" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Active" /></div>
        </div>

        <hr />
        <div>
            <asp:Button runat="server" ID="button_Create_User" Text="Create User" OnClick="button_Create_User_Click" CssClass="btn btn-primary" meta:resourcekey="button_Create_User" /> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button runat="server" ID="button_Fill_Up_Form_Dummy_Data_For_Test" Text="Dummy User Fillup" CssClass="btn btn-danger" CausesValidation="False" OnClick="button_Fill_Up_Form_Dummy_Data_For_Test_Click" meta:resourcekey="button_Fill_Up_Form_Dummy_Data_For_Test" />
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result" meta:resourcekey="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br /><br /><br /><br />

    </div>


</asp:Content>

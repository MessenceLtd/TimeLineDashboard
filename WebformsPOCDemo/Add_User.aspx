<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_User.aspx.cs" Inherits="WebformsPOCDemo.Add_User" culture="auto" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Email_Address.ClientID %>"><%= Resources.SiteCommon.Email_Address %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Email_Address" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Email_Address_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Email_Address_Required %>" Display="Dynamic" ControlToValidate="textbox_Email_Address" CssClass="text-danger"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="validator_Email_Adress_Regex" ErrorMessage="<%$ Resources:SiteCommon, Validator_Email_Adress_Regex %>" Display="Dynamic" ControlToValidate="textbox_Email_Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="text-danger"></asp:RegularExpressionValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Username.ClientID %>"><%= Resources.SiteCommon.Username %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Username" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Username_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Username_Required %>" Display="Dynamic" ControlToValidate="textbox_Username" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <asp:Panel runat="server" ID="panel_User_App_Permission_Type" CssClass="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_App_Permission_Type.ClientID %>"><%= Resources.SiteCommon.Permission %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_App_Permission_Type" ClientIDMode="Static" CssClass="Big_ComboBox form-control"></asp:DropDownList></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_App_Permission_Type_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_App_Permission_Type_Required %>" Display="Dynamic" 
                ControlToValidate="dropdown_App_Permission_Type" CssClass="text-danger"></asp:RequiredFieldValidator>
        </asp:Panel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Password.ClientID %>"><%= Resources.SiteCommon.Password %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Password" TextMode="Password" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Password_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Password_Required %>" Display="Dynamic" ControlToValidate="textbox_Password" CssClass="text-danger"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="validator_Password_Strength" ErrorMessage="<%$ Resources:SiteCommon, Validator_Password_Strength %>" 
                ValidationExpression="^(?=.*[A-Z])(?=.*[!@#$%^&*()\-_+.])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z]).{8,}$" CssClass="text-danger" ControlToValidate="textbox_Password" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Password_Repeat.ClientID %>"><%= Resources.SiteCommon.Repeat_Password %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Password_Repeat" TextMode="Password" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Password_Repeat_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Password_Repeat_Required %>" Display="Dynamic" ControlToValidate="textbox_Password_Repeat" CssClass="text-danger"></asp:RequiredFieldValidator>
            <asp:CompareValidator runat="server" ID="validator_Password_Repeat_Matcher" ControlToValidate="textbox_Password_Repeat" ErrorMessage="<%$ Resources:SiteCommon, Validator_Password_Repeat_Matcher %>"
                ControlToCompare="textbox_Password" Display="Dynamic" CssClass="text-danger"></asp:CompareValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Name.ClientID %>"><%= Resources.SiteCommon.First_Name %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_First_Name" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_First_Name_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_First_Name_Required %>" Display="Dynamic" ControlToValidate="textbox_First_Name" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Middle_Name.ClientID %>"><%= Resources.SiteCommon.Middle_Name %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Middle_Name" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Last_Name.ClientID %>"><%= Resources.SiteCommon.Last_Name %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Last_Name" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Last_Name_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Last_Name_Required %>" Display="Dynamic" ControlToValidate="textbox_Last_Name" CssClass="text-danger"></asp:RequiredFieldValidator>
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
            <asp:RequiredFieldValidator runat="server" ID="validator_City_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_City_Required %>" Display="Dynamic" ControlToValidate="textbox_City" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Address.ClientID %>"><%= Resources.SiteCommon.Address %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Address" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Address_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Address_Required %>" Display="Dynamic" ControlToValidate="textbox_Address" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Zipcode.ClientID %>"><%= Resources.SiteCommon.Zip_Code %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Zipcode" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Zipcode_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Zipcode_Required %>" Display="Dynamic" ControlToValidate="textbox_Zipcode" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="updatePanel_Default_Currency">
            <ContentTemplate>
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper"><label for=""><%= Resources.SiteCommon.Default_Currency %>:</label></div>
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
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Mobile_Phone" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Mobile_Phone_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Mobile_Phone_Required %>" Display="Dynamic" ControlToValidate="textbox_Mobile_Phone" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Additional_Phone_Number.ClientID %>"><%= Resources.SiteCommon.Additional_Phone_Number %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Additional_Phone_Number" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Birth_Date.ClientID %>"><%= Resources.SiteCommon.Birth_Date %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Birth_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Birth_Date_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Birth_Date_Required %>" Display="Dynamic" ControlToValidate="textbox_Birth_Date" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Gender.ClientID %>"><%= Resources.SiteCommon.Gender %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Gender" ClientIDMode="Static" CssClass="Small_ComboBox form-control">
                    <asp:ListItem Text="<%$ Resources:SiteCommon, Gender_Select %>" Value=""></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:SiteCommon, Gender_Type_1 %>" Value="1"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:SiteCommon, Gender_Type_2 %>" Value="2"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:SiteCommon, Gender_Type_3 %>" Value="3"></asp:ListItem>
                 </asp:DropDownList></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Gender_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Gender_Required %>" Display="Dynamic" ControlToValidate="dropdown_Gender" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Heard_About_Application_From.ClientID %>"><%= Resources.SiteCommon.Heard_About_Application_From %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Heard_About_Application_From" TextMode="MultiLine" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Heard_About_Application_From.ClientID %>"><%= Resources.SiteCommon.Our_Administrative_Side_Notes %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Administrative_Side_Notes" TextMode="MultiLine" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Active.ClientID %>"><%= Resources.SiteCommon.Is_Active %>:</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="True" ClientIDMode="Static" /></div>
        </div>

        <hr />
        <div>
            <asp:Button runat="server" ID="button_Create_User" Text="Create User" OnClick="button_Create_User_Click" CssClass="btn btn-primary" /> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button runat="server" ID="button_Fill_Up_Form_Dummy_Data_For_Test" Text="Dummy User Fillup" CssClass="btn btn-danger" CausesValidation="False" OnClick="button_Fill_Up_Form_Dummy_Data_For_Test_Click" />
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br /><br /><br /><br />

    </div>


</asp:Content>

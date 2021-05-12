<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_User.aspx.cs" Inherits="WebformsPOCDemo.manage_User" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5">Manage User Details</h2>
        <p class="lead">Change and add more details for your users.</p>
    </div>

    <hr />

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Username.ClientID %>">Username:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Username" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_UsernameResource1"><asp:TextBox runat="server" 
                ID="textbox_Username" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_UsernameResource1"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Username" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_UsernameResource1"><asp:Label 
                runat="server" ID="label_Username" meta:resourcekey="label_UsernameResource1"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Username_Required" ErrorMessage="Please enter an username" Display="Dynamic" 
                ControlToValidate="textbox_Username" CssClass="text-danger" meta:resourcekey="validator_Username_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <asp:Panel runat="server" ID="p_App_Permission_Type_Visibility_Wrapper" CssClass="Form_Group" Visible="False" meta:resourcekey="p_App_Permission_Type_Visibility_WrapperResource1">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_App_Permission_Type.ClientID %>">App Permission Type:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_App_Permission_Type" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_App_Permission_TypeResource1"><asp:DropDownList 
                runat="server" ID="dropdown_App_Permission_Type" ClientIDMode="Static" CssClass="Regular_ComboBox form-control" meta:resourcekey="dropdown_App_Permission_TypeResource1"></asp:DropDownList></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_App_Permission_Type" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_App_Permission_TypeResource1"><asp:Label 
                runat="server" ID="label_App_Permission_Type" meta:resourcekey="label_App_Permission_TypeResource1"></asp:Label></asp:Panel>
        </asp:Panel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Name.ClientID %>">First Name:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_First_Name" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_First_NameResource1"><asp:TextBox runat="server" 
                ID="textbox_First_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope" meta:resourcekey="textbox_First_NameResource1"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_First_Name" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_First_NameResource1"><asp:Label 
                runat="server" ID="label_First_Name" meta:resourcekey="label_First_NameResource1"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_First_Name_Required" ErrorMessage="Please enter a first name" Display="Dynamic" 
                ControlToValidate="textbox_First_Name" CssClass="text-danger" meta:resourcekey="validator_First_Name_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Middle_Name.ClientID %>">Middle Name:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Middle_Name" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Middle_NameResource1"><asp:TextBox runat="server" 
                ID="textbox_Middle_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope" meta:resourcekey="textbox_Middle_NameResource1"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Middle_Name" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Middle_NameResource1"><asp:Label 
                runat="server" ID="label_Middle_Name" meta:resourcekey="label_Middle_NameResource1"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Last_Name.ClientID %>">Last Name:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Last_Name" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Last_NameResource1"><asp:TextBox runat="server" 
                ID="textbox_Last_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope" meta:resourcekey="textbox_Last_NameResource1"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Last_Name" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Last_NameResource1"><asp:Label 
                runat="server" ID="label_Last_Name" meta:resourcekey="label_Last_NameResource1"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Last_Name_Required" ErrorMessage="Please enter a last name" Display="Dynamic" 
                ControlToValidate="textbox_Last_Name" CssClass="text-danger" meta:resourcekey="validator_Last_Name_RequiredResource1"></asp:RequiredFieldValidator>
        </div>
        
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Email.ClientID %>">Email:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Email" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_EmailResource1"><asp:TextBox runat="server" 
                ID="textbox_Email" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="nope" meta:resourcekey="textbox_EmailResource1"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Email" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_EmailResource1"><asp:Label 
                runat="server" ID="label_Email" meta:resourcekey="label_EmailResource1"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Email_Required" ErrorMessage="Please enter an email" Display="Dynamic" 
                ControlToValidate="textbox_Email" CssClass="text-danger" meta:resourcekey="validator_Email_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Country.ClientID %>">Country:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Country" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_CountryResource1"><asp:DropDownList 
                runat="server" ID="dropdown_Country" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Country_SelectedIndexChanged" 
                CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_CountryResource1"></asp:DropDownList></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Country" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_CountryResource1"><asp:Label 
                runat="server" ID="label_Country" meta:resourcekey="label_CountryResource1"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Country_Required" ErrorMessage="Please select a country" Display="Dynamic" ControlToValidate="dropdown_Country" CssClass="text-danger" meta:resourcekey="validator_Country_RequiredResource1"></asp:RequiredFieldValidator>
        </div>
        
        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_StateUpdatePanel">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_State_Wrapper_Panel" class="Form_Group" Visible="False" meta:resourcekey="p_State_Wrapper_PanelResource1">
                    <div class="Form_Label_Wrapper"><label for="<%= dropdown_State.ClientID %>">State:</label></div>
                    <asp:Panel ID="formControl_Wrapper_Edit_State" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_StateResource1"><asp:DropDownList runat="server" 
                        ID="dropdown_State" ClientIDMode="Static" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_StateResource1"></asp:DropDownList></asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_State" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_StateResource1"><asp:Label 
                        runat="server" ID="label_State" meta:resourcekey="label_StateResource1"></asp:Label></asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_State_Required" ErrorMessage="Please select a state" Display="Dynamic" ControlToValidate="textbox_City" CssClass="text-danger" meta:resourcekey="validator_State_RequiredResource1"></asp:RequiredFieldValidator>
                </asp:Panel>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_City.ClientID %>">City:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_City" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_CityResource1"><asp:TextBox 
                 runat="server" ID="textbox_City" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_CityResource1"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_City" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_CityResource1"><asp:Label 
                        runat="server" ID="label_City" meta:resourcekey="label_CityResource1"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_City_Required" ErrorMessage="Please enter a city" 
                Display="Dynamic" ControlToValidate="textbox_City" CssClass="text-danger" meta:resourcekey="validator_City_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Address.ClientID %>">Address:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Address" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_AddressResource1"><asp:TextBox runat="server" 
                ID="textbox_Address" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_AddressResource1"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Address" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_AddressResource1"><asp:Label 
                runat="server" ID="label_Address" meta:resourcekey="label_AddressResource1"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Address_Required" ErrorMessage="Please enter an address" Display="Dynamic" 
                ControlToValidate="textbox_Address" CssClass="text-danger" meta:resourcekey="validator_Address_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Zipcode.ClientID %>">Zip Code:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Zipcode" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_ZipcodeResource1"><asp:TextBox 
                runat="server" ID="textbox_Zipcode" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_ZipcodeResource1"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Zipcode" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_ZipcodeResource1"><asp:Label 
                runat="server" ID="label_Zipcode" meta:resourcekey="label_ZipcodeResource1"></asp:Label></asp:Panel>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="updatePanel_Default_Currency">
            <ContentTemplate>
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper"><label for="">Default Currency:</label></div>
                    <asp:Panel ID="formControl_Wrapper_Edit_Currency" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_CurrencyResource1"><asp:DropDownList runat="server" 
                        ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control" meta:resourcekey="dropdown_CurrencyResource1"></asp:DropDownList></asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Currency" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_CurrencyResource1"><asp:Label 
                        runat="server" ID="label_Currency" meta:resourcekey="label_CurrencyResource1"></asp:Label></asp:Panel>
                </div>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Mobile_Phone.ClientID %>">Mobile Phone:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Mobile_Phone" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Mobile_PhoneResource1"><asp:TextBox runat="server" 
                ID="textbox_Mobile_Phone" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Mobile_PhoneResource1"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Mobile_Phone" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Mobile_PhoneResource1"><asp:Label 
                runat="server" ID="label_Mobile_Phone" meta:resourcekey="label_Mobile_PhoneResource1"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Additional_Phone_Number.ClientID %>">Additional Phone:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Additional_Phone_Number" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Additional_Phone_NumberResource1"><asp:TextBox runat="server" 
                ID="textbox_Additional_Phone_Number" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Additional_Phone_NumberResource1"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Additional_Phone_Number" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Additional_Phone_NumberResource1"><asp:Label 
                runat="server" ID="label_Additional_Phone_Number" meta:resourcekey="label_Additional_Phone_NumberResource1"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Birth_Date.ClientID %>">Birth Date:</label></div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Birth_Date" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Birth_DateResource1">
                <asp:TextBox runat="server" ID="textbox_Birth_Date" ClientIDMode="Static" autocomplete="nope"
                    CssClass="form-control InitializeDatePicker" meta:resourcekey="textbox_Birth_DateResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Birth_Date" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Birth_DateResource1">
                <asp:Label runat="server" ID="label_Birth_Date" meta:resourcekey="label_Birth_DateResource1"></asp:Label>
            </asp:Panel>
        </div>
        
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Gender.ClientID %>">Gender:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Gender" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_GenderResource1"><asp:DropDownList 
                runat="server" ID="dropdown_Gender" ClientIDMode="Static" CssClass="Regular_ComboBox form-control" meta:resourcekey="dropdown_GenderResource1">
                <asp:ListItem Text="-- Select --" meta:resourcekey="ListItemResource1"></asp:ListItem>
                    <asp:ListItem Text="Male" Value="1" meta:resourcekey="ListItemResource2"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="2" meta:resourcekey="ListItemResource3"></asp:ListItem>
                    <asp:ListItem Text="Other" Value="3" meta:resourcekey="ListItemResource4"></asp:ListItem>
                </asp:DropDownList></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Gender" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_GenderResource1"><asp:Label 
                runat="server" ID="label_Gender" meta:resourcekey="label_GenderResource1"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Gender_Required" ErrorMessage="Please enter a gender" 
                Display="Dynamic" ControlToValidate="dropdown_Gender" CssClass="text-danger" meta:resourcekey="validator_Gender_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Registration_DateTime.ClientID %>">Registration Date:</label></div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Registration_DateTime" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Registration_DateTimeResource1">
                <asp:TextBox runat="server" ID="textbox_Registration_DateTime" ClientIDMode="Static" autocomplete="nope"
                    CssClass="form-control InitializeDatePicker" meta:resourcekey="textbox_Registration_DateTimeResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Registration_DateTime" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Registration_DateTimeResource1">
                <asp:Label runat="server" ID="label_Registration_DateTime" meta:resourcekey="label_Registration_DateTimeResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label 
                for="<%= dropdown_Registration_Time_Hours.ClientID %>">Registration Time:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Registration_Time_Hours" runat="server" class="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Registration_Time_HoursResource1">
                <asp:DropDownList runat="server" ID="dropdown_Registration_Time_Hours" ClientIDMode="Static"
                    CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Registration_Time_HoursResource1">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Registration_Time_Minutes"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Registration_Time_MinutesResource1">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Registration_Time_Seconds"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Registration_Time_SecondsResource1">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Registration_Time" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Registration_TimeResource1">
                <asp:Label runat="server" ID="label_Registration_Time" meta:resourcekey="label_Registration_TimeResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Azure_Container_Ref.ClientID %>">Azure Container:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Azure_Container_Ref" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Azure_Container_RefResource1"><asp:TextBox runat="server" 
                ID="textbox_Azure_Container_Ref" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Azure_Container_RefResource1"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Azure_Container_Ref" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Azure_Container_RefResource1"><asp:Label 
                runat="server" ID="label_Azure_Container_Ref" meta:resourcekey="label_Azure_Container_RefResource1"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Heard_About_Application_From.ClientID %>">Heard Us From:</label></div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Heard_About_Application_From" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Heard_About_Application_FromResource1">
                <asp:TextBox runat="server" ID="textbox_Heard_About_Application_From" ClientIDMode="Static"
                    TextMode="MultiLine" CssClass="form-control" meta:resourcekey="textbox_Heard_About_Application_FromResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Heard_About_Application_From" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Heard_About_Application_FromResource1">
                <asp:Label runat="server" ID="label_Heard_About_Application_From" meta:resourcekey="label_Heard_About_Application_FromResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Our_Administrative_Side_Notes.ClientID %>">Adminstration notes:</label></div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Our_Administrative_Side_Notes" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Our_Administrative_Side_NotesResource1">
                <asp:TextBox runat="server" ID="textbox_Our_Administrative_Side_Notes" ClientIDMode="Static"
                    TextMode="MultiLine" CssClass="form-control" meta:resourcekey="textbox_Our_Administrative_Side_NotesResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Our_Administrative_Side_Notes" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Our_Administrative_Side_NotesResource1">
                <asp:Label runat="server" ID="label_Our_Administrative_Side_Notes" meta:resourcekey="label_Our_Administrative_Side_NotesResource1"></asp:Label>
            </asp:Panel>
        </div>


        

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Active.ClientID %>">Is Active:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Is_Active" runat="server" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Is_ActiveResource1"><asp:CheckBox runat="server" 
                ID="checkbox_Is_Active" Checked="True" ClientIDMode="Static" meta:resourcekey="checkbox_Is_ActiveResource1" /></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Active" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Is_ActiveResource1"><asp:Label 
                runat="server" ID="label_Is_Active" meta:resourcekey="label_Is_ActiveResource1"></asp:Label></asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label>Created by:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Created_By_User" runat="server" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_Record_Created_By_UserResource1"><asp:Label 
                runat="server" ID="label_Record_Created_By_User" meta:resourcekey="label_Record_Created_By_UserResource1"></asp:Label></asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label>Created at:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Creation_DateTime_UTC" runat="server" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_Record_Creation_DateTime_UTCResource1"><asp:Label 
                runat="server" ID="label_Record_Creation_DateTime_UTC" meta:resourcekey="label_Record_Creation_DateTime_UTCResource1"></asp:Label></asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label>Last Modified by:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_By_User" runat="server" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_Record_Last_Updated_By_UserResource1"><asp:Label 
                runat="server" ID="label_Record_Last_Updated_By_User" meta:resourcekey="label_Record_Last_Updated_By_UserResource1"></asp:Label></asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label>Last Modified Date:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_DateTime_UTC" runat="server" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_Record_Last_Updated_DateTime_UTCResource1"><asp:Label 
                runat="server" ID="label_Record_Last_Updated_DateTime_UTC" meta:resourcekey="label_Record_Last_Updated_DateTime_UTCResource1"></asp:Label></asp:Panel>
        </div>

        


        <hr />
        <div>

            <asp:Button runat="server" ID="button_Edit_User_Details" 
                Text="Edit Client" OnClick="button_Edit_User_Details_Click" CausesValidation="False" CssClass="btn btn-primary" meta:resourcekey="button_Edit_User_DetailsResource1" /> 

            <asp:Button runat="server" ID="button_Update_User_Details" 
                Text="Save Changes" OnClick="button_Update_User_Details_Click" CssClass="btn btn-success" meta:resourcekey="button_Update_User_DetailsResource1" /> 

            <asp:Button runat="server" ID="button_CancelEdit_User_Details" 
                Text="Cancel Editing" OnClick="button_CancelEdit_User_Details_Click" CausesValidation="False" OnClientClick="if (!confirm('Are you sure you want to cancel edit?')) return false;" CssClass="btn btn-danger" meta:resourcekey="button_CancelEdit_User_DetailsResource1" /> 
            
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result" meta:resourcekey="lbl_Insert_Process_Error_ResultResource1"></asp:Label>
        </div>
        <br /><br /><br /><br />

    </div>


</asp:Content>

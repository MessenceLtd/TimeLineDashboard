<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_User.aspx.cs" Inherits="WebformsPOCDemo.Add_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">

        $(function ()
        {
            $("#<%= textbox_Birth_Date.ClientID %>").datepicker(
                {
                    showWeek: false,
                    dateFormat: "dd/mm/yy", 
                    changeMonth: true,
                    changeYear: true, 
                    yearRange: "-120:+0",
                    regional: 'he'
                });
        });
        
    </script>


    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links">       
        <asp:HyperLink runat="server" Text="Add New User" CssClass="active" NavigateUrl="Add_User.aspx"></asp:HyperLink>
    </asp:Panel>

    <hr />

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Email_Address.ClientID %>">Email Address:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Email_Address" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Email_Address_Required" ErrorMessage="Please enter an email address" Display="Dynamic" ControlToValidate="textbox_Email_Address" CssClass="text-danger"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="validator_Email_Adress_Regex" ErrorMessage="Please enter a valid email address" Display="Dynamic" ControlToValidate="textbox_Email_Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="text-danger"></asp:RegularExpressionValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Username.ClientID %>">Username:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Username" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Username_Required" ErrorMessage="Please enter an username" Display="Dynamic" ControlToValidate="textbox_Username" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Password.ClientID %>">Password:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Password" TextMode="Password" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Password_Required" ErrorMessage="Please enter an password" Display="Dynamic" ControlToValidate="textbox_Password" CssClass="text-danger"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="validator_Password_Strength" ErrorMessage="Password must contain english charecters. Minimum 8 length with 1 upper case, 2 lower case chars, 2 digits chars and 1 of the special char !@#$%^&*()\-_+." 
                ValidationExpression="^(?=.*[A-Z])(?=.*[!@#$%^&*()\-_+.])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z]).{8,}$" CssClass="text-danger" ControlToValidate="textbox_Password" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Password_Repeat.ClientID %>">Repeat Password:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Password_Repeat" TextMode="Password" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Password_Repeat_Required" ErrorMessage="Please repeat the password" Display="Dynamic" ControlToValidate="textbox_Password_Repeat" CssClass="text-danger"></asp:RequiredFieldValidator>
            <asp:CompareValidator runat="server" ID="validator_Password_Repeat_Matcher" ControlToValidate="textbox_Password_Repeat" ErrorMessage="The passwords do not match"
                ControlToCompare="textbox_Password" Display="Dynamic" CssClass="text-danger" Operator="Equal"></asp:CompareValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Name.ClientID %>">First Name:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_First_Name" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_First_Name_Required" ErrorMessage="Please enter a first name" Display="Dynamic" ControlToValidate="textbox_First_Name" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Middle_Name.ClientID %>">Middle Name:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Middle_Name" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Last_Name.ClientID %>">Last Name:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Last_Name" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Last_Name_Required" ErrorMessage="Please enter a last name" Display="Dynamic" ControlToValidate="textbox_Last_Name" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Country.ClientID %>">Country:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Country" ClientIDMode="Static" Width="400px" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Country_SelectedIndexChanged" CssClass="Big_ComboBox form-control"></asp:DropDownList></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Country_Required" ErrorMessage="Please select a country" Display="Dynamic" ControlToValidate="dropdown_Country" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_StateUpdatePanel">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_State_Wrapper_Panel" class="Form_Group" Visible="false">
                    <div class="Form_Label_Wrapper"><label for="<%= dropdown_State.ClientID %>">State:</label></div>
                    <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_State" ClientIDMode="Static" CssClass="Big_ComboBox form-control"></asp:DropDownList></div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_State_Required" ErrorMessage="Please select a state" Display="Dynamic" ControlToValidate="textbox_City" CssClass="text-danger"></asp:RequiredFieldValidator>
                </asp:Panel>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Country" /></Triggers>
        </asp:UpdatePanel>
        

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_City.ClientID %>">City:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_City" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_City_Required" ErrorMessage="Please enter a city" Display="Dynamic" ControlToValidate="textbox_City" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Address.ClientID %>">Address:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Address" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Address_Required" ErrorMessage="Please enter an address" Display="Dynamic" ControlToValidate="textbox_Address" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Zipcode.ClientID %>">Zip Code:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Zipcode" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Zipcode_Required" ErrorMessage="Please enter an address" Display="Dynamic" ControlToValidate="textbox_Zipcode" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Mobile_Phone.ClientID %>">Mobile Phone:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Mobile_Phone" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Mobile_Phone_Required" ErrorMessage="Please enter a mobile phone" Display="Dynamic" ControlToValidate="textbox_Mobile_Phone" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Additional_Phone_Number.ClientID %>">Additional Phone Number:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Additional_Phone_Number" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Birth_Date.ClientID %>">Birth Date:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Birth_Date" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Birth_Date_Required" ErrorMessage="Please enter a birth date" Display="Dynamic" ControlToValidate="textbox_Birth_Date" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Gender.ClientID %>">Gender:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Gender" ClientIDMode="Static" CssClass="Small_ComboBox form-control">
                    <asp:ListItem Text="-- Select --" Value=""></asp:ListItem>
                    <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Other" Value="3"></asp:ListItem>
                 </asp:DropDownList></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Gender_Required" ErrorMessage="Please enter a gender" Display="Dynamic" ControlToValidate="dropdown_Gender" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Heard_About_Application_From.ClientID %>">Heard About Application From:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Heard_About_Application_From" TextMode="MultiLine" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Heard_About_Application_From.ClientID %>">Our Administrative Side Notes:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Administrative_Side_Notes" TextMode="MultiLine" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Active.ClientID %>">Is Active:</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="true" ClientIDMode="Static" /></div>
        </div>

        <hr />
        <div>
            <asp:Button runat="server" ID="button_Create_User" Text="Create User" OnClick="button_Create_User_Click" CssClass="btn btn-primary" /> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button runat="server" ID="button_Fill_Up_Form_Dummy_Data_For_Test" Text="Dummy User Fillup" CssClass="btn btn-danger" CausesValidation="false" OnClick="button_Fill_Up_Form_Dummy_Data_For_Test_Click" />
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br /><br /><br /><br />

    </div>


</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_User.aspx.cs" Inherits="WebformsPOCDemo.Add_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links">       
        <asp:HyperLink runat="server" Text="Add New User" CssClass="active" NavigateUrl="Add_User.aspx"></asp:HyperLink>
    </asp:Panel>
    <hr />
    

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Email_Address.ClientID %>">Email Address:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Email_Address" ClientIDMode="Static"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Username.ClientID %>">Username:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Username" ClientIDMode="Static"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Password.ClientID %>">Password:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Password" TextMode="Password" ClientIDMode="Static"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Password_Repeat.ClientID %>">Repeat Password:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Password_Repeat" TextMode="Password" ClientIDMode="Static"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Name.ClientID %>">First Name:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_First_Name" ClientIDMode="Static"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_First_Name.ClientID %>">Middle Name:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Middle_Name" ClientIDMode="Static"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Last_Name.ClientID %>">Last Name:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Last_Name" ClientIDMode="Static"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Last_Name.ClientID %>">Country:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Country" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Country_SelectedIndexChanged"></asp:DropDownList></div>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_StateUpdatePanel">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_State_Wrapper_Panel" class="Form_Group" Visible="false">
                    <div class="Form_Label_Wrapper"><label for="<%= dropdown_State.ClientID %>">State:</label></div>
                    <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_State" ClientIDMode="Static"></asp:DropDownList></div>
                </asp:Panel>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Country" /></Triggers>
        </asp:UpdatePanel>
        

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_State.ClientID %>">City:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_City" ClientIDMode="Static"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Address.ClientID %>">Address:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Address" ClientIDMode="Static"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Zipcode.ClientID %>">ZipCode:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Zipcode" ClientIDMode="Static"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Mobile_Phone.ClientID %>">Mobile Phone:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Mobile_Phone" ClientIDMode="Static"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Additional_Phone_Number.ClientID %>">Additional PhoneNumber:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Additional_Phone_Number" ClientIDMode="Static"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Birth_Date.ClientID %>">Birth Date:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Birth_Date" ClientIDMode="Static"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Gender.ClientID %>">Gender:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Gender" ClientIDMode="Static">
                    <asp:ListItem Text="-- Select --" Value=""></asp:ListItem>
                    <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Other" Value="3"></asp:ListItem>
                 </asp:DropDownList></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Heard_About_Application_From.ClientID %>">Heard About Application From:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Heard_About_Application_From" ClientIDMode="Static"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Heard_About_Application_From.ClientID %>">Our Administrative Side Notes:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Administrative_Side_Notes" ClientIDMode="Static"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Active.ClientID %>">Is Active:</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Active" ClientIDMode="Static" /></div>
        </div>

        <hr />
        <br />
        <div>
            <asp:Button runat="server" ID="button_Create_User" Text="Create User" OnClick="button_Create_User_Click" /> 
        </div>


    </div>


</asp:Content>

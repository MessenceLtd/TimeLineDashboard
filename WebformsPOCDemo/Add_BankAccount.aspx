<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_BankAccount.aspx.cs" Inherits="WebformsPOCDemo.Add_BankAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5">Add Bank Account</h2>
        <p class="lead">Keep track, audit and add more details to bank account transactions.</p>
    </div>

    <hr />

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Bank_Name.ClientID %>">Bank Name:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Bank_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="off"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Bank_Number.ClientID %>">Bank Number:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Bank_Number" ClientIDMode="Static" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Name.ClientID %>">Branch Name:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Branch_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="off"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Number.ClientID %>">Branch Number:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Branch_Number" ClientIDMode="Static" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
        </div>
        
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Number.ClientID %>">Account Number:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Account_Number" ClientIDMode="Static" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Name.ClientID %>">Account Name:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Account_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="off"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Account_Name_Required" ErrorMessage="Please enter bank account name" 
                Display="Dynamic" ControlToValidate="textbox_Account_Name" SetFocusOnError="true" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Number.ClientID %>">Account IBAN:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_IBAN" ClientIDMode="Static" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Currency.ClientID %>">Currency:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control"></asp:DropDownList></div>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Opened_Account_DateTime.ClientID %>">Opening Date:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Opened_Account_DateTime" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="off"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Branch_Country.ClientID %>">Branch Country:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Branch_Country" ClientIDMode="Static" AutoPostBack="True" 
                OnSelectedIndexChanged="dropdown_Branch_Country_SelectedIndexChanged" CssClass="Big_ComboBox form-control"></asp:DropDownList></div>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_StateUpdatePanel">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_State_Wrapper_Panel" class="Form_Group" Visible="false">
                    <div class="Form_Label_Wrapper"><label for="<%= dropdown_Branch_State.ClientID %>">Branch State:</label></div>
                    <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Branch_State" ClientIDMode="Static" CssClass="Big_ComboBox form-control"></asp:DropDownList></div>
                </asp:Panel>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Branch_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_City.ClientID %>">Branch City:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Branch_City" ClientIDMode="Static" CssClass="form-control" autocomplete="Off"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Address.ClientID %>">Branch Address:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Branch_Address" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="off"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Zipcode.ClientID %>">Branch Zip Code:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Branch_Zipcode" ClientIDMode="Static" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Phone.ClientID %>">Branch Phone:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Branch_Phone" ClientIDMode="Static" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
        </div>
        
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Main_Email_Address.ClientID %>">Branch Main Email:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Branch_Main_Email_Address" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="off"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Main_Contact.ClientID %>">Branch Main Contact:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Branch_Main_Contact" ClientIDMode="Static" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_Phone_Number.ClientID %>">Branch Contact Phone:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Main_Contact_Phone_Number" ClientIDMode="Static" CssClass="form-control" autocomplete="off"></asp:TextBox></div>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Active_From_Date.ClientID %>">Account Active From:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Account_Active_From_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="Off"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Active_To_Date.ClientID %>">Account Active To Date:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Account_Active_To_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="Off"></asp:TextBox></div>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Visible_To_Anonymous_Users.ClientID %>">Is Visible To Public?</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Anonymous_Users" Checked="false" ClientIDMode="Static" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Available_For_Download_For_Anonymous_Users.ClientID %>">Is Downloadable To Public?</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Anonymous_Users" Checked="false" ClientIDMode="Static" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Visible_To_Followers_Users.ClientID %>">Is Visible To Followers?</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Followers_Users" Checked="false" ClientIDMode="Static" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Available_For_Download_For_Followers_Users.ClientID %>">Can Followers Download File?</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Followers_Users" Checked="false" ClientIDMode="Static" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Active.ClientID %>">Is Active:</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="true" ClientIDMode="Static" /></div>
        </div>
        
        <hr />
        <div>
            <asp:Button runat="server" ID="button_Create_Client" Text="Create Bank Account" 
                OnClick="button_Create_Bank_Account_Click" CssClass="btn btn-primary" /> 
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br /><br /><br /><br />

    </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_BankAccount.aspx.cs" Inherits="WebformsPOCDemo.manage_BankAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="page-title my-3 text-center">
        <h2 class="display-5">Manage Bank Account</h2>
        <p class="lead">Keep track, audit and add more details to bank account transactions.</p>
    </div>

    <hr />

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Bank_Name.ClientID %>">Bank Name:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Bank_Name" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Bank_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Bank_Name" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Bank_Name"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Bank_Number.ClientID %>">Bank Number:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Bank_Number" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Bank_Number" ClientIDMode="Static" CssClass="form-control" autocomplete="off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Bank_Number" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Bank_Number"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Name.ClientID %>">Branch Name:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Branch_Name" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Branch_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_Name" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Branch_Name"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Number.ClientID %>">Branch Number:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Branch_Number" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Branch_Number" ClientIDMode="Static" CssClass="form-control" autocomplete="off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_Number" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Branch_Number"></asp:Label></asp:Panel>
        </div>
        
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Number.ClientID %>">Account Number:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Account_Number" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Account_Number" ClientIDMode="Static" CssClass="form-control" autocomplete="off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Account_Number" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Account_Number"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Name.ClientID %>">Account Name:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Account_Name" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Account_Name" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Account_Name" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Account_Name"></asp:Label></asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Account_Name_Required" ErrorMessage="Please enter bank account name" 
                Display="Dynamic" ControlToValidate="textbox_Account_Name" SetFocusOnError="true" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Number.ClientID %>">Account IBAN:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_IBAN" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_IBAN" ClientIDMode="Static" CssClass="form-control" autocomplete="off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_IBAN" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_IBAN"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Currency.ClientID %>">Currency:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Currency" runat="server" Visible="true" CssClass="Form_Control"><asp:DropDownList 
                runat="server" ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control"></asp:DropDownList></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Currency" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Currency"></asp:Label></asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Opened_Account_DateTime.ClientID %>">Opening Date:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Opened_Account_DateTime" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Opened_Account_DateTime" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Opened_Account_DateTime" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Opened_Account_DateTime"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Branch_Country.ClientID %>">Branch Country:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Branch_Country" runat="server" Visible="true" CssClass="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Branch_Country" ClientIDMode="Static" AutoPostBack="True" 
                OnSelectedIndexChanged="dropdown_Branch_Country_SelectedIndexChanged" CssClass="Big_ComboBox form-control"></asp:DropDownList></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_Country" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Branch_Country"></asp:Label></asp:Panel>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_StateUpdatePanel">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_State_Wrapper_Panel" class="Form_Group" Visible="false">
                    <div class="Form_Label_Wrapper"><label for="<%= dropdown_Branch_State.ClientID %>">Branch State:</label></div>
                    <asp:Panel ID="formControl_Wrapper_Edit_Branch_State" runat="server" Visible="true" CssClass="Form_Control"><asp:DropDownList 
                        runat="server" ID="dropdown_Branch_State" ClientIDMode="Static" CssClass="Big_ComboBox form-control"></asp:DropDownList></asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_State" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                        runat="server" ID="label_Branch_State"></asp:Label></asp:Panel>
                </asp:Panel>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Branch_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_City.ClientID %>">Branch City:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Branch_City" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Branch_City" ClientIDMode="Static" CssClass="form-control" autocomplete="Off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_City" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Branch_City"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Address.ClientID %>">Branch Address:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Branch_Address" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Branch_Address" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_Address" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Branch_Address"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Zipcode.ClientID %>">Branch Zip Code:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Branch_Zipcode" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Branch_Zipcode" ClientIDMode="Static" CssClass="form-control" autocomplete="off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_Zipcode" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Branch_Zipcode"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Phone.ClientID %>">Branch Phone:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Branch_Phone" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Branch_Phone" ClientIDMode="Static" CssClass="form-control" autocomplete="off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_Phone" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Branch_Phone"></asp:Label></asp:Panel>
        </div>
        
        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Main_Email_Address.ClientID %>">Branch Main Email:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Branch_Main_Email_Address" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Branch_Main_Email_Address" ClientIDMode="Static" CssClass="form-control long-input" autocomplete="off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_Main_Email_Address" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Branch_Main_Email_Address"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Branch_Main_Contact.ClientID %>">Branch Main Contact:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Branch_Main_Contact" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Branch_Main_Contact" ClientIDMode="Static" CssClass="form-control" autocomplete="off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Branch_Main_Contact" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Branch_Main_Contact"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Main_Contact_Phone_Number.ClientID %>">Branch Contact Phone:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Main_Contact_Phone_Number" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Main_Contact_Phone_Number" ClientIDMode="Static" CssClass="form-control" autocomplete="off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Main_Contact_Phone_Number" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Main_Contact_Phone_Number"></asp:Label></asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Active_From_Date.ClientID %>">Account Active From:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Account_Active_From_Date" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Account_Active_From_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="Off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Account_Active_From_Date" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Account_Active_From_Date"></asp:Label></asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Account_Active_To_Date.ClientID %>">Account Active To Date:</label></div>
            <asp:Panel ID="formControl_Wrapper_Edit_Account_Active_To_Date" runat="server" Visible="true" CssClass="Form_Control"><asp:TextBox 
                runat="server" ID="textbox_Account_Active_To_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="Off"></asp:TextBox></asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Account_Active_To_Date" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel"><asp:Label 
                runat="server" ID="label_Account_Active_To_Date"></asp:Label></asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Anonymous_Users.ClientID %>">Is Visible To Public?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Visible_To_Anonymous_Users" CssClass="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Anonymous_Users" Checked="false" ClientIDMode="Static" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Visible_To_Anonymous_Users" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label
                    runat="server" ID="label_Is_Visible_To_Anonymous_Users"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Available_For_Download_For_Anonymous_Users.ClientID %>">Is Downloadable To Public?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Available_For_Download_For_Anonymous_Users" CssClass="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Anonymous_Users" Checked="false" ClientIDMode="Static" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Available_For_Download_For_Anonymous_Users" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label
                    runat="server" ID="label_Is_Available_For_Download_For_Anonymous_Users"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Followers_Users.ClientID %>">Is Visible To Followers?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Visible_To_Followers_Users" CssClass="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Followers_Users" Checked="false" ClientIDMode="Static" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Visible_To_Followers_Users" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label
                    runat="server" ID="label_Is_Visible_To_Followers_Users"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Available_For_Download_For_Followers_Users.ClientID %>">Can Followers Download File?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Available_For_Download_For_Followers_Users" CssClass="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Followers_Users" Checked="false" ClientIDMode="Static" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Available_For_Download_For_Followers_Users" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label
                    runat="server" ID="label_Is_Available_For_Download_For_Followers_Users"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Active.ClientID %>">Is Active?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Active" CssClass="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="true" ClientIDMode="Static" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Active" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label
                    runat="server" ID="label_Is_Active"></asp:Label>
            </asp:Panel>
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

            <asp:Button runat="server" ID="button_Edit_BankAccount_Details" 
                Text="Edit BankAccount" OnClick="button_Edit_BankAccount_Details_Click" CausesValidation="false" CssClass="btn btn-primary" /> 

            <asp:Button runat="server" ID="button_Update_BankAccount_Details" 
                Text="Save Changes" OnClick="button_Update_BankAccount_Details_Click" CssClass="btn btn-success" /> 

            <asp:Button runat="server" ID="button_CancelEdit_BankAccount_Details" 
                Text="Cancel Editing" OnClick="button_CancelEdit_BankAccount_Details_Click" CausesValidation="false" OnClientClick="if (!confirm('Are you sure you want to cancel edit?')) return false;" CssClass="btn btn-danger" /> 
            
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br /><br /><br /><br />

    </div>


</asp:Content>

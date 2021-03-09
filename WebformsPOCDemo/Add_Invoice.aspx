<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_Invoice.aspx.cs" Inherits="WebformsPOCDemo.Add_Invoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5">Add Invoice</h2>
        <p class="lead">The advanced way to keep track on all your invoices.</p>
    </div>

    <hr />

    <div>

        <asp:Panel runat="server" ID="panel_User_Selection" CssClass="Form_Group" Visible="true">
            <div class="Form_Label_Wrapper">
                <label style="font-weight: bold" for="<%= dropdown_User_Selection.ClientID %>">User:</label></div>
            <div class="Form_Control">
            <asp:DropDownList runat="server" ID="dropdown_User_Selection" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="dropdown_User_SelectedIndexChanged" CssClass="Big_ComboBox form-control"></asp:DropDownList></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_User_Selection_Required" ErrorMessage="Please select an user" Display="Dynamic" ControlToValidate="dropdown_User_Selection" CssClass="text-danger"></asp:RequiredFieldValidator>
        </asp:Panel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label style="font-weight: bold" for="<%= textbox_Invoice_DateTime.ClientID %>">Invoice Date:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Invoice_DateTime" autocomplete="off" ClientIDMode="Static" 
                CssClass="form-control InitializeDatePicker" AutoPostBack="true" OnTextChanged="textbox_Invoice_DateTime_TextChanged"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Invoice_DateTime_Required" ErrorMessage="Please enter an invoice date" Display="Dynamic" ControlToValidate="textbox_Invoice_DateTime" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Invoice_Time_Hours.ClientID %>">Invoice Time:</label></div>
            <div class="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Hours" ClientIDMode="Static"
                    CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Minutes"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Seconds"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList>
            </div>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Supplier">
            <ContentTemplate>
                <asp:Panel runat="server" ID="panel_Supplier_Selection" CssClass="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Client.ClientID %>">Client:</label></div>
                    <div class="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Client" ClientIDMode="Static" AutoPostBack="True" 
                            OnSelectedIndexChanged="dropdown_Client_SelectedIndexChanged" CssClass="Big_ComboBox form-control"></asp:DropDownList></div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Client_Required" ErrorMessage="Please select a client" Display="Dynamic" ControlToValidate="dropdown_Client" CssClass="text-danger"></asp:RequiredFieldValidator>
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="dropdown_User_Selection" />
                <asp:AsyncPostBackTrigger ControlID="textbox_Invoice_DateTime" />
            </Triggers>
        </asp:UpdatePanel>

        <asp:UpdatePanel runat="server" ID="up_AddExpense_AutoComplete" ClientIDMode="Static">
            <ContentTemplate>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Currency.ClientID %>">Currency:</label></div>
                    <div class="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control"></asp:DropDownList></div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Currency_Required" ErrorMessage="Please select a currency" Display="Dynamic" ControlToValidate="dropdown_Currency" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Total_Amount.ClientID %>">Total Amount:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Total_Amount" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Total_Amount_Required" ErrorMessage="Please enter total amount" Display="Dynamic"
                        ControlToValidate="textbox_Total_Amount" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Vat_Percentage.ClientID %>">Vat %:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Vat_Percentage" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Vat_Percentage_Required" ErrorMessage="Please enter vat percentage" Display="Dynamic"
                        ControlToValidate="textbox_Vat_Percentage" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Total_Without_Vat.ClientID %>">Total Without Vat:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Total_Without_Vat" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Total_Without_Vat_Required" ErrorMessage="Please enter total amount without vat" Display="Dynamic"
                        ControlToValidate="textbox_Total_Without_Vat" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Total_Vat.ClientID %>">Total Vat:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Total_Vat" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Total_Vat_Required" ErrorMessage="Please enter total vat amount" Display="Dynamic"
                        ControlToValidate="textbox_Total_Vat" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label style="font-weight: bold" for="<%= textbox_Creation_DateTime.ClientID %>">Creation Date:</label></div>
                    <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Creation_DateTime" ClientIDMode="Static" autocomplete="off"
                        CssClass="form-control InitializeDatePicker"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Invoice_Creation_Time_Hours.ClientID %>">Creation Time:</label></div>
                    <div class="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Invoice_Creation_Time_Hours" ClientIDMode="Static"
                            CssClass="form-control Tiny_ComboBox">
                        </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Creation_Time_Minutes"
                            ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                        </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Creation_Time_Seconds"
                            ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoiced_On_User_Location_Id.ClientID %>">Invoiced On Location:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_On_User_Location_Id" ClientIDMode="Static" Enabled="false" CssClass="form-control"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoiced_To_CompanyName.ClientID %>">Invoiced to Company:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_To_CompanyName" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoiced_To_Tax_Reference.ClientID %>">Invoiced Client Tax#:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_To_Tax_Reference" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoiced_To_PersonName.ClientID %>">Invoiced To Person Name:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_To_PersonName" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoiced_Client_To_PhoneNumber.ClientID %>">Invoiced To Phone:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_PhoneNumber" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
                </div>

                <div class="Form_Group" >
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Invoiced_Client_To_Country.ClientID %>">Invoiced For Country:</label></div>
                    <div class="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Invoiced_Client_To_Country" ClientIDMode="Static"
                            CssClass="Big_ComboBox form-control" AutoPostBack="true" OnSelectedIndexChanged="dropdown_Invoiced_Client_To_Country_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>

                <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Invoice">
                    <ContentTemplate>
                        <asp:Panel runat="server" ID="p_Invoiced_Client_To_State_Wrapper_Panel" class="Form_Group" Visible="false">
                            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Invoiced_Client_To_State.ClientID %>">Invoiced For State:</label></div>
                            <div class="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Invoiced_Client_To_State" ClientIDMode="Static"
                                    CssClass="Big_ComboBox form-control">
                                </asp:DropDownList>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dropdown_Invoiced_Client_To_Country" />
                    </Triggers>
                </asp:UpdatePanel>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper"><label for="<%= textbox_Invoiced_Client_To_City.ClientID %>">Invoiced To City:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_City" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper"><label for="<%= textbox_Invoiced_Client_To_Address.ClientID %>">Invoiced To Address:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Address" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper"><label for="<%= textbox_Invoiced_Client_To_Zip.ClientID %>">Invoiced To Zip Code:</label></div>
                    <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Zip" ClientIDMode="Static" 
                        CssClass="form-control"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper"><label for="<%= textbox_Invoiced_Client_To_EmailAddress.ClientID %>">Invoiced To Email:</label></div>
                    <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_EmailAddress" ClientIDMode="Static" 
                        CssClass="form-control"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Invoice_Type.ClientID %>">Invoice Type:</label></div>
                    <div class="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Invoice_Type" ClientIDMode="Static" CssClass="form-control Big_ComboBox"></asp:DropDownList></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoice_Number.ClientID %>">Invoice Number:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Number" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoice_Reference_Number.ClientID %>">Invoice Reference Number:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Reference_Number" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="dropdown_Client" />
                <asp:AsyncPostBackTrigger ControlID="textbox_Invoice_DateTime" />
            </Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Invoice_Content_Long_Description.ClientID %>">Invoice Content Description:</label></div>
            <div class="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Invoice_Content_Long_Description" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_User_Description.ClientID %>">User Description:</label></div>
            <div class="Form_Control">
                <asp:TextBox runat="server" ID="textbox_User_Description" ClientIDMode="Static"
                    TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_User_Comments.ClientID %>">User Comments:</label></div>
            <div class="Form_Control">
                <asp:TextBox runat="server" ID="textbox_User_Comments" ClientIDMode="Static"
                    TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Original_File_Name.ClientID %>">Filename:</label></div>
            <div class="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Original_File_Name" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Anonymous_Users.ClientID %>">Is Visible To Public?</label></div>
            <div class="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Anonymous_Users" Checked="false" ClientIDMode="Static" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Anonymous_Users.ClientID %>">Is Downloadable To Public?</label></div>
            <div class="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Anonymous_Users" Checked="false" ClientIDMode="Static" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Followers_Users.ClientID %>">Is Visible To Followers?</label></div>
            <div class="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Followers_Users" Checked="false" ClientIDMode="Static" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Available_For_Download_For_Followers_Users.ClientID %>">Can Followers Download File?</label></div>
            <div class="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Followers_Users" Checked="false" ClientIDMode="Static" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Active.ClientID %>">Is Active?</label></div>
            <div class="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="true" ClientIDMode="Static" /></div>
        </div>

        <hr />
        <div>
            <asp:Button runat="server" ID="button_Create_Invoice" Text="Create Invoice" OnClick="button_Create_Invoice_Click" CssClass="btn btn-primary" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button runat="server" ID="button_Fill_Up_Form_Dummy_Data_For_Test" Text="Dummy Invoice Fillup" CssClass="btn btn-danger"
                CausesValidation="false" OnClick="button_Fill_Up_Form_Dummy_Data_For_Test_Click" />
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br />
        <br />

    </div>

</asp:Content>

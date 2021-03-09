<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_Expense.aspx.cs" Inherits="WebformsPOCDemo.manage_Expense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5">Manage Expense</h2>
        <p class="lead">Change and add more details for your expenses.</p>
    </div>

    <hr />

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label style="font-weight: bold" for="<%= textbox_Expense_Invoice_DateTime.ClientID %>">Expense Date:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Expense_Invoice_DateTime" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Expense_Invoice_DateTime" ClientIDMode="Static" autocomplete="off"
                    CssClass="form-control InitializeDatePicker" AutoPostBack="true" OnTextChanged="textbox_Expense_Invoice_DateTime_TextChanged"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Expense_Invoice_DateTime" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label
                    runat="server" ID="label_Expense_Invoice_DateTime"></asp:Label>
            </asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Expense_Invoice_DateTime_Required" ErrorMessage="Please enter an expense date" Display="Dynamic" ControlToValidate="textbox_Expense_Invoice_DateTime" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Invoice_Time_Hours.ClientID %>">Expense Time:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Edit_Expense_Invoice_Time_Hours" runat="server" Visible="true" class="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Hours" ClientIDMode="Static"
                    CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Minutes"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Seconds"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Expense_Invoice_Time" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Expense_Invoice_Time"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Supplier.ClientID %>">Supplier:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Supplier" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Supplier" ClientIDMode="Static" CssClass="Big_ComboBox form-control"></asp:DropDownList>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Supplier" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Supplier"></asp:Label>
            </asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Supplier_Required" ErrorMessage="Please select a supplier"
                Display="Dynamic" ControlToValidate="dropdown_Supplier" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <asp:UpdatePanel runat="server" ID="up_EditExpense_AutoComplete" ClientIDMode="Static">
            <ContentTemplate>
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Currency.ClientID %>">Currency:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Currency" CssClass="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control"></asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Currency" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Currency"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Currency_Required" ErrorMessage="Please select a currency" Display="Dynamic"
                        ControlToValidate="dropdown_Currency" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Total_Amount.ClientID %>">Total Amount:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Total_Amount" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Total_Amount" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Total_Amount" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Total_Amount"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Total_Amount_Required" ErrorMessage="Please enter total amount" Display="Dynamic"
                        ControlToValidate="textbox_Total_Amount" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Vat_Percentage.ClientID %>">Vat %:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Vat_Percentage" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Vat_Percentage" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Vat_Percentage" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Vat_Percentage"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Vat_Percentage_Required" ErrorMessage="Please enter vat percentage" Display="Dynamic"
                        ControlToValidate="textbox_Vat_Percentage" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Total_Without_Vat.ClientID %>">Total Without Vat:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Total_Without_Vat" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Total_Without_Vat" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Total_Without_Vat" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Total_Without_Vat"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Total_Without_Vat_Required" ErrorMessage="Please enter total amount without vat" Display="Dynamic"
                        ControlToValidate="textbox_Total_Without_Vat" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Total_Vat.ClientID %>">Total Vat:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Total_Vat" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Total_Vat" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Total_Vat" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Total_Vat"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Total_Vat_Required" ErrorMessage="Please enter total vat amount" Display="Dynamic"
                        ControlToValidate="textbox_Total_Vat" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoiced_On_User_Location_Id.ClientID %>">Invoiced On Location:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_On_User_Location_Id" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_On_User_Location_Id" ClientIDMode="Static" Enabled="false" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_On_User_Location_Id" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoiced_On_User_Location_Id"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoiced_Client_To_CompanyName.ClientID %>">Invoiced to Company:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_CompanyName" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_CompanyName" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_CompanyName" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoiced_Client_To_CompanyName"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoiced_Client_To_Tax_Reference.ClientID %>">Invoiced to TAX Reference:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_Tax_Reference" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Tax_Reference" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_Tax_Reference" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoiced_Client_To_Tax_Reference"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoiced_Client_To_PersonName.ClientID %>">Invoiced To Person Name:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_PersonName" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_PersonName" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_PersonName" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoiced_Client_To_PersonName"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoiced_Client_To_PhoneNumber.ClientID %>">Invoiced To Phone:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_PhoneNumber" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_PhoneNumber" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_PhoneNumber" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoiced_Client_To_PhoneNumber"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Invoiced_Client_To_Country.ClientID %>">Invoiced For Country:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_Country" CssClass="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Invoiced_Client_To_Country" ClientIDMode="Static"
                            CssClass="Big_ComboBox form-control" AutoPostBack="true" OnSelectedIndexChanged="dropdown_Invoiced_Client_To_Country_SelectedIndexChanged">
                        </asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_Country" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoiced_Client_To_Country"></asp:Label>
                    </asp:Panel>
                </div>

                <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Invoice">
                    <ContentTemplate>
                        <asp:Panel runat="server" ID="p_Invoiced_Client_To_State_Wrapper_Panel" class="Form_Group" Visible="false">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= dropdown_Invoiced_Client_To_State.ClientID %>">Invoiced For State:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_State" CssClass="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Invoiced_Client_To_State" ClientIDMode="Static"
                                    CssClass="Big_ComboBox form-control">
                                </asp:DropDownList>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_State" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_State"></asp:Label>
                            </asp:Panel>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dropdown_Invoiced_Client_To_Country" />
                    </Triggers>
                </asp:UpdatePanel>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoiced_Client_To_City.ClientID %>">Invoiced To City:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_City" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_City" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_City" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoiced_Client_To_City"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoiced_Client_To_Address.ClientID %>">Invoiced To Address:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_Address" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Address" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_Address" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoiced_Client_To_Address"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoiced_Client_To_Zip.ClientID %>">Invoiced To Zip Code:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_Zip" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Zip" ClientIDMode="Static"
                            CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_Zip" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoiced_Client_To_Zip"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoiced_Client_To_EmailAddress.ClientID %>">Invoiced To Email:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_EmailAddress" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_EmailAddress" ClientIDMode="Static"
                            CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_EmailAddress" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoiced_Client_To_EmailAddress"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Expense_Type.ClientID %>">Expense Type:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Expense_Type" CssClass="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Expense_Type" ClientIDMode="Static" CssClass="form-control Big_ComboBox"></asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Expense_Type" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Expense_Type"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoice_Number.ClientID %>">Invoice Number:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Number" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Number" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Number" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoice_Number"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoice_Reference_Number.ClientID %>">Invoice Reference Number:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Reference_Number" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Reference_Number" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Reference_Number" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoice_Reference_Number"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoice_Supplier_Company_Details.ClientID %>">Invoice Supplier Company:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_Company_Details" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Company_Details" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_Company_Details" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoice_Supplier_Company_Details"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoice_Supplier_Tax_Reference.ClientID %>">Invoice Supplier Tax Ref:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_Tax_Reference" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Tax_Reference" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_Tax_Reference" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoice_Supplier_Tax_Reference"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Invoice_Supplier_Country.ClientID %>">Invoice Supplier Country:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_Country" CssClass="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Invoice_Supplier_Country" ClientIDMode="Static" AutoPostBack="True"
                            OnSelectedIndexChanged="dropdown_Invoice_Supplier_Country_SelectedIndexChanged" CssClass="Big_ComboBox form-control">
                        </asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_Country" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoice_Supplier_Country"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_dropdown_Invoice_Supplier_Country_Required" ErrorMessage="Please select a country"
                        Display="Dynamic" ControlToValidate="dropdown_Invoice_Supplier_Country" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_StateUpdatePanel">
                    <ContentTemplate>
                        <asp:Panel runat="server" ID="p_Invoice_Supplier_State_Wrapper_Panel" class="Form_Group" Visible="false">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= dropdown_Invoice_Supplier_State.ClientID %>">Invoice Supplier State:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_State" CssClass="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Invoice_Supplier_State" ClientIDMode="Static"
                                    CssClass="Big_ComboBox form-control">
                                </asp:DropDownList>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_State" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoice_Supplier_State"></asp:Label>
                            </asp:Panel>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dropdown_Invoice_Supplier_Country" />
                    </Triggers>
                </asp:UpdatePanel>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoice_Supplier_City.ClientID %>">Invoice Supplier City:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_City" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_City" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_City" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoice_Supplier_City"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoice_Supplier_Address_Description.ClientID %>">Invoice Address Desc:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_Address_Description" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Address_Description" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_Address_Description" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoice_Supplier_Address_Description"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoice_Supplier_ZipCode.ClientID %>">Invoice Supplier ZipCode:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_ZipCode" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_ZipCode" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_ZipCode" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoice_Supplier_ZipCode"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoice_Supplier_WebAddress.ClientID %>">Invoice Supplier Web Address:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_WebAddress" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_WebAddress" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_WebAddress" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoice_Supplier_WebAddress"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoice_Supplier_Phone_Number.ClientID %>">Invoice Supplier Phone:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_Phone_Number" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Phone_Number" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_Phone_Number" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoice_Supplier_Phone_Number"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoice_Supplier_Contact_FullName.ClientID %>">Supplier Contact Person:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_Contact_FullName" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Contact_FullName" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_Contact_FullName" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoice_Supplier_Contact_FullName"></asp:Label>
                    </asp:Panel>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="dropdown_Supplier" />
            </Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Invoice_Content_Long_Description.ClientID %>">Invoice Content Description:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Content_Long_Description" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Invoice_Content_Long_Description" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Content_Long_Description" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Invoice_Content_Long_Description"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_User_Description.ClientID %>">User Description:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_User_Description" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_User_Description" ClientIDMode="Static"
                    TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_User_Description" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_User_Description"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_User_Comments.ClientID %>">User Comments:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_User_Comments" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_User_Comments" ClientIDMode="Static"
                    TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_User_Comments" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_User_Comments"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Original_File_Name.ClientID %>">Filename:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Original_File_Name" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Original_File_Name" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Original_File_Name" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Original_File_Name"></asp:Label>
            </asp:Panel>
        </div>

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

            <asp:Button runat="server" ID="button_Edit_Expense_Details" 
                Text="Edit Expense" OnClick="button_Edit_Expense_Details_Click" CausesValidation="false" CssClass="btn btn-primary" /> 

            <asp:Button runat="server" ID="button_Update_Expense_Details" 
                Text="Save Changes" OnClick="button_Update_Expense_Details_Click" CssClass="btn btn-success" /> 

            <asp:Button runat="server" ID="button_CancelEdit_Expense_Details" 
                Text="Cancel Editing" OnClick="button_CancelEdit_Expense_Details_Click" CausesValidation="false" OnClientClick="if (!confirm('Are you sure you want to cancel edit?')) return false;" CssClass="btn btn-danger" /> 
            
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br /><br /><br /><br />

    </div>

</asp:Content>

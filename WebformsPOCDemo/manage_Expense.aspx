<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_Expense.aspx.cs" Inherits="WebformsPOCDemo.manage_Expense" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

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
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Expense_Invoice_DateTime" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Expense_Invoice_DateTimeResource1">
                <asp:TextBox runat="server" ID="textbox_Expense_Invoice_DateTime" ClientIDMode="Static" autocomplete="nope"
                    CssClass="form-control InitializeDatePicker" AutoPostBack="True" OnTextChanged="textbox_Expense_Invoice_DateTime_TextChanged" meta:resourcekey="textbox_Expense_Invoice_DateTimeResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Expense_Invoice_DateTime" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Expense_Invoice_DateTimeResource1">
                <asp:Label
                    runat="server" ID="label_Expense_Invoice_DateTime" meta:resourcekey="label_Expense_Invoice_DateTimeResource1"></asp:Label>
            </asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Expense_Invoice_DateTime_Required" ErrorMessage="Please enter an expense date" Display="Dynamic" ControlToValidate="textbox_Expense_Invoice_DateTime" CssClass="text-danger" meta:resourcekey="validator_Expense_Invoice_DateTime_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Invoice_Time_Hours.ClientID %>">Expense Time:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Edit_Expense_Invoice_Time_Hours" runat="server" class="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Expense_Invoice_Time_HoursResource1">
                <asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Hours" ClientIDMode="Static"
                    CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Invoice_Time_HoursResource1">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Minutes"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Invoice_Time_MinutesResource1">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Seconds"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Invoice_Time_SecondsResource1">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Expense_Invoice_Time" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Expense_Invoice_TimeResource1">
                <asp:Label runat="server" ID="label_Expense_Invoice_Time" meta:resourcekey="label_Expense_Invoice_TimeResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Supplier.ClientID %>">Supplier:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Supplier" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_SupplierResource1">
                <asp:DropDownList runat="server" ID="dropdown_Supplier" ClientIDMode="Static" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_SupplierResource1"></asp:DropDownList>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Supplier" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_SupplierResource1">
                <asp:Label runat="server" ID="label_Supplier" meta:resourcekey="label_SupplierResource1"></asp:Label>
            </asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Supplier_Required" ErrorMessage="Please select a supplier"
                Display="Dynamic" ControlToValidate="dropdown_Supplier" CssClass="text-danger" meta:resourcekey="validator_Supplier_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <asp:UpdatePanel runat="server" ID="up_EditExpense_AutoComplete" ClientIDMode="Static">
            <ContentTemplate>
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Currency:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Currency" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_CurrencyResource1">
                        <asp:DropDownList runat="server" ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control" meta:resourcekey="dropdown_CurrencyResource1"></asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Currency" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_CurrencyResource1">
                        <asp:Label runat="server" ID="label_Currency" meta:resourcekey="label_CurrencyResource1"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Currency_Required" ErrorMessage="Please select a currency" Display="Dynamic"
                        ControlToValidate="dropdown_Currency" CssClass="text-danger" meta:resourcekey="validator_Currency_RequiredResource1"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Total Amount:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Total_Amount" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Total_AmountResource1">
                        <asp:TextBox runat="server" ID="textbox_Total_Amount" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Total_AmountResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Total_Amount" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Total_AmountResource1">
                        <asp:Label runat="server" ID="label_Total_Amount" meta:resourcekey="label_Total_AmountResource1"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Total_Amount_Required" ErrorMessage="Please enter total amount" Display="Dynamic"
                        ControlToValidate="textbox_Total_Amount" CssClass="text-danger" meta:resourcekey="validator_Total_Amount_RequiredResource1"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Vat %:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Vat_Percentage" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Vat_PercentageResource1">
                        <asp:TextBox runat="server" ID="textbox_Vat_Percentage" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Vat_PercentageResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Vat_Percentage" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Vat_PercentageResource1">
                        <asp:Label runat="server" ID="label_Vat_Percentage" meta:resourcekey="label_Vat_PercentageResource1"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Vat_Percentage_Required" ErrorMessage="Please enter vat percentage" Display="Dynamic"
                        ControlToValidate="textbox_Vat_Percentage" CssClass="text-danger" meta:resourcekey="validator_Vat_Percentage_RequiredResource1"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Total Without Vat:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Total_Without_Vat" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Total_Without_VatResource1">
                        <asp:TextBox runat="server" ID="textbox_Total_Without_Vat" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Total_Without_VatResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Total_Without_Vat" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Total_Without_VatResource1">
                        <asp:Label runat="server" ID="label_Total_Without_Vat" meta:resourcekey="label_Total_Without_VatResource1"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Total_Without_Vat_Required" ErrorMessage="Please enter total amount without vat" Display="Dynamic"
                        ControlToValidate="textbox_Total_Without_Vat" CssClass="text-danger" meta:resourcekey="validator_Total_Without_Vat_RequiredResource1"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Total Vat:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Total_Vat" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Total_VatResource1">
                        <asp:TextBox runat="server" ID="textbox_Total_Vat" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Total_VatResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Total_Vat" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Total_VatResource1">
                        <asp:Label runat="server" ID="label_Total_Vat" meta:resourcekey="label_Total_VatResource1"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Total_Vat_Required" ErrorMessage="Please enter total vat amount" Display="Dynamic"
                        ControlToValidate="textbox_Total_Vat" CssClass="text-danger" meta:resourcekey="validator_Total_Vat_RequiredResource1"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoiced On Location:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_On_User_Location_Id" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoiced_On_User_Location_IdResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_On_User_Location_Id" ClientIDMode="Static" Enabled="False" CssClass="form-control" meta:resourcekey="textbox_Invoiced_On_User_Location_IdResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_On_User_Location_Id" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoiced_On_User_Location_IdResource1">
                        <asp:Label runat="server" ID="label_Invoiced_On_User_Location_Id" meta:resourcekey="label_Invoiced_On_User_Location_IdResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoiced to Company:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_CompanyName" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoiced_Client_To_CompanyNameResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_CompanyName" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_CompanyNameResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_CompanyName" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoiced_Client_To_CompanyNameResource1">
                        <asp:Label runat="server" ID="label_Invoiced_Client_To_CompanyName" meta:resourcekey="label_Invoiced_Client_To_CompanyNameResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoiced to TAX Reference:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_Tax_Reference" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoiced_Client_To_Tax_ReferenceResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Tax_Reference" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_Tax_ReferenceResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_Tax_Reference" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoiced_Client_To_Tax_ReferenceResource1">
                        <asp:Label runat="server" ID="label_Invoiced_Client_To_Tax_Reference" meta:resourcekey="label_Invoiced_Client_To_Tax_ReferenceResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoiced To Person Name:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_PersonName" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoiced_Client_To_PersonNameResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_PersonName" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_PersonNameResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_PersonName" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoiced_Client_To_PersonNameResource1">
                        <asp:Label runat="server" ID="label_Invoiced_Client_To_PersonName" meta:resourcekey="label_Invoiced_Client_To_PersonNameResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoiced To Phone:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_PhoneNumber" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoiced_Client_To_PhoneNumberResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_PhoneNumber" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_PhoneNumberResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_PhoneNumber" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoiced_Client_To_PhoneNumberResource1">
                        <asp:Label runat="server" ID="label_Invoiced_Client_To_PhoneNumber" meta:resourcekey="label_Invoiced_Client_To_PhoneNumberResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoiced For Country:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_Country" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoiced_Client_To_CountryResource1">
                        <asp:DropDownList runat="server" ID="dropdown_Invoiced_Client_To_Country" ClientIDMode="Static"
                            CssClass="Big_ComboBox form-control" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Invoiced_Client_To_Country_SelectedIndexChanged" meta:resourcekey="dropdown_Invoiced_Client_To_CountryResource1">
                        </asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_Country" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoiced_Client_To_CountryResource1">
                        <asp:Label runat="server" ID="label_Invoiced_Client_To_Country" meta:resourcekey="label_Invoiced_Client_To_CountryResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Invoice">
                    <ContentTemplate>
                        <asp:Panel runat="server" ID="p_Invoiced_Client_To_State_Wrapper_Panel" class="Form_Group" Visible="False" meta:resourcekey="p_Invoiced_Client_To_State_Wrapper_PanelResource1">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= dropdown_Invoiced_Client_To_State.ClientID %>">Invoiced For State:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_State" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoiced_Client_To_StateResource1">
                                <asp:DropDownList runat="server" ID="dropdown_Invoiced_Client_To_State" ClientIDMode="Static"
                                    CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Invoiced_Client_To_StateResource1">
                                </asp:DropDownList>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_State" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoiced_Client_To_StateResource1">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_State" meta:resourcekey="label_Invoiced_Client_To_StateResource1"></asp:Label>
                            </asp:Panel>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dropdown_Invoiced_Client_To_Country" />
                    </Triggers>
                </asp:UpdatePanel>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoiced To City:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_City" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoiced_Client_To_CityResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_City" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_CityResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_City" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoiced_Client_To_CityResource1">
                        <asp:Label runat="server" ID="label_Invoiced_Client_To_City" meta:resourcekey="label_Invoiced_Client_To_CityResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoiced To Address:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_Address" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoiced_Client_To_AddressResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Address" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_AddressResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_Address" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoiced_Client_To_AddressResource1">
                        <asp:Label runat="server" ID="label_Invoiced_Client_To_Address" meta:resourcekey="label_Invoiced_Client_To_AddressResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoiced To Zip Code:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_Zip" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoiced_Client_To_ZipResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Zip" ClientIDMode="Static"
                            CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_ZipResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_Zip" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoiced_Client_To_ZipResource1">
                        <asp:Label runat="server" ID="label_Invoiced_Client_To_Zip" meta:resourcekey="label_Invoiced_Client_To_ZipResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoiced To Email:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_EmailAddress" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoiced_Client_To_EmailAddressResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_EmailAddress" ClientIDMode="Static"
                            CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_EmailAddressResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_EmailAddress" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoiced_Client_To_EmailAddressResource1">
                        <asp:Label runat="server" ID="label_Invoiced_Client_To_EmailAddress" meta:resourcekey="label_Invoiced_Client_To_EmailAddressResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Expense Type:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Expense_Type" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Expense_TypeResource1">
                        <asp:DropDownList runat="server" ID="dropdown_Expense_Type" ClientIDMode="Static" CssClass="form-control Big_ComboBox" meta:resourcekey="dropdown_Expense_TypeResource1"></asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Expense_Type" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Expense_TypeResource1">
                        <asp:Label runat="server" ID="label_Expense_Type" meta:resourcekey="label_Expense_TypeResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoice Number:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Number" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoice_NumberResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Number" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_NumberResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Number" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoice_NumberResource1">
                        <asp:Label runat="server" ID="label_Invoice_Number" meta:resourcekey="label_Invoice_NumberResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoice Reference Number:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Reference_Number" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoice_Reference_NumberResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Reference_Number" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Reference_NumberResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Reference_Number" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoice_Reference_NumberResource1">
                        <asp:Label runat="server" ID="label_Invoice_Reference_Number" meta:resourcekey="label_Invoice_Reference_NumberResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoice Supplier Company:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_Company_Details" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoice_Supplier_Company_DetailsResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Company_Details" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Supplier_Company_DetailsResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_Company_Details" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoice_Supplier_Company_DetailsResource1">
                        <asp:Label runat="server" ID="label_Invoice_Supplier_Company_Details" meta:resourcekey="label_Invoice_Supplier_Company_DetailsResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoice Supplier Tax Ref:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_Tax_Reference" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoice_Supplier_Tax_ReferenceResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Tax_Reference" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Supplier_Tax_ReferenceResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_Tax_Reference" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoice_Supplier_Tax_ReferenceResource1">
                        <asp:Label runat="server" ID="label_Invoice_Supplier_Tax_Reference" meta:resourcekey="label_Invoice_Supplier_Tax_ReferenceResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoice Supplier Country:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_Country" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoice_Supplier_CountryResource1">
                        <asp:DropDownList runat="server" ID="dropdown_Invoice_Supplier_Country" ClientIDMode="Static" AutoPostBack="True"
                            OnSelectedIndexChanged="dropdown_Invoice_Supplier_Country_SelectedIndexChanged" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Invoice_Supplier_CountryResource1">
                        </asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_Country" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoice_Supplier_CountryResource1">
                        <asp:Label runat="server" ID="label_Invoice_Supplier_Country" meta:resourcekey="label_Invoice_Supplier_CountryResource1"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_dropdown_Invoice_Supplier_Country_Required" ErrorMessage="Please select a country"
                        Display="Dynamic" ControlToValidate="dropdown_Invoice_Supplier_Country" CssClass="text-danger" meta:resourcekey="validator_dropdown_Invoice_Supplier_Country_RequiredResource1"></asp:RequiredFieldValidator>
                </div>

                <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_StateUpdatePanel">
                    <ContentTemplate>
                        <asp:Panel runat="server" ID="p_Invoice_Supplier_State_Wrapper_Panel" class="Form_Group" Visible="False" meta:resourcekey="p_Invoice_Supplier_State_Wrapper_PanelResource1">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= dropdown_Invoice_Supplier_State.ClientID %>">Invoice Supplier State:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_State" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoice_Supplier_StateResource1">
                                <asp:DropDownList runat="server" ID="dropdown_Invoice_Supplier_State" ClientIDMode="Static"
                                    CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Invoice_Supplier_StateResource1">
                                </asp:DropDownList>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_State" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoice_Supplier_StateResource1">
                                <asp:Label runat="server" ID="label_Invoice_Supplier_State" meta:resourcekey="label_Invoice_Supplier_StateResource1"></asp:Label>
                            </asp:Panel>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dropdown_Invoice_Supplier_Country" />
                    </Triggers>
                </asp:UpdatePanel>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoice Supplier City:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_City" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoice_Supplier_CityResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_City" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Supplier_CityResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_City" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoice_Supplier_CityResource1">
                        <asp:Label runat="server" ID="label_Invoice_Supplier_City" meta:resourcekey="label_Invoice_Supplier_CityResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoice Address Desc:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_Address_Description" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoice_Supplier_Address_DescriptionResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Address_Description" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Supplier_Address_DescriptionResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_Address_Description" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoice_Supplier_Address_DescriptionResource1">
                        <asp:Label runat="server" ID="label_Invoice_Supplier_Address_Description" meta:resourcekey="label_Invoice_Supplier_Address_DescriptionResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoice Supplier ZipCode:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_ZipCode" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoice_Supplier_ZipCodeResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_ZipCode" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Supplier_ZipCodeResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_ZipCode" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoice_Supplier_ZipCodeResource1">
                        <asp:Label runat="server" ID="label_Invoice_Supplier_ZipCode" meta:resourcekey="label_Invoice_Supplier_ZipCodeResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoice Supplier Web Address:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_WebAddress" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoice_Supplier_WebAddressResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_WebAddress" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Supplier_WebAddressResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_WebAddress" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoice_Supplier_WebAddressResource1">
                        <asp:Label runat="server" ID="label_Invoice_Supplier_WebAddress" meta:resourcekey="label_Invoice_Supplier_WebAddressResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Invoice Supplier Phone:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_Phone_Number" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoice_Supplier_Phone_NumberResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Phone_Number" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Supplier_Phone_NumberResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_Phone_Number" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoice_Supplier_Phone_NumberResource1">
                        <asp:Label runat="server" ID="label_Invoice_Supplier_Phone_Number" meta:resourcekey="label_Invoice_Supplier_Phone_NumberResource1"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="">Supplier Contact Person:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_Contact_FullName" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoice_Supplier_Contact_FullNameResource1">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Contact_FullName" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Supplier_Contact_FullNameResource1"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_Contact_FullName" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoice_Supplier_Contact_FullNameResource1">
                        <asp:Label runat="server" ID="label_Invoice_Supplier_Contact_FullName" meta:resourcekey="label_Invoice_Supplier_Contact_FullNameResource1"></asp:Label>
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
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Content_Long_Description" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Invoice_Content_Long_DescriptionResource1">
                <asp:TextBox runat="server" ID="textbox_Invoice_Content_Long_Description" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control" meta:resourcekey="textbox_Invoice_Content_Long_DescriptionResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Content_Long_Description" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Invoice_Content_Long_DescriptionResource1">
                <asp:Label runat="server" ID="label_Invoice_Content_Long_Description" meta:resourcekey="label_Invoice_Content_Long_DescriptionResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_User_Description.ClientID %>">User Description:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_User_Description" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_User_DescriptionResource1">
                <asp:TextBox runat="server" ID="textbox_User_Description" ClientIDMode="Static"
                    TextMode="MultiLine" CssClass="form-control" meta:resourcekey="textbox_User_DescriptionResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_User_Description" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_User_DescriptionResource1">
                <asp:Label runat="server" ID="label_User_Description" meta:resourcekey="label_User_DescriptionResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_User_Comments.ClientID %>">User Comments:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_User_Comments" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_User_CommentsResource1">
                <asp:TextBox runat="server" ID="textbox_User_Comments" ClientIDMode="Static"
                    TextMode="MultiLine" CssClass="form-control" meta:resourcekey="textbox_User_CommentsResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_User_Comments" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_User_CommentsResource1">
                <asp:Label runat="server" ID="label_User_Comments" meta:resourcekey="label_User_CommentsResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Original_File_Name.ClientID %>">Filename:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Original_File_Name" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Original_File_NameResource1">
                <asp:TextBox runat="server" ID="textbox_Original_File_Name" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Original_File_NameResource1"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Original_File_Name" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Original_File_NameResource1">
                <asp:Label runat="server" ID="label_Original_File_Name" meta:resourcekey="label_Original_File_NameResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Anonymous_Users.ClientID %>">Is Visible To Public?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Visible_To_Anonymous_Users" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Is_Visible_To_Anonymous_UsersResource1">
                <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Anonymous_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Visible_To_Anonymous_UsersResource1" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Visible_To_Anonymous_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Is_Visible_To_Anonymous_UsersResource1">
                <asp:Label
                    runat="server" ID="label_Is_Visible_To_Anonymous_Users" meta:resourcekey="label_Is_Visible_To_Anonymous_UsersResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Available_For_Download_For_Anonymous_Users.ClientID %>">Is Downloadable To Public?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Available_For_Download_For_Anonymous_Users" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Is_Available_For_Download_For_Anonymous_UsersResource1">
                <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Anonymous_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Available_For_Download_For_Anonymous_UsersResource1" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Available_For_Download_For_Anonymous_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Is_Available_For_Download_For_Anonymous_UsersResource1">
                <asp:Label
                    runat="server" ID="label_Is_Available_For_Download_For_Anonymous_Users" meta:resourcekey="label_Is_Available_For_Download_For_Anonymous_UsersResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Followers_Users.ClientID %>">Is Visible To Followers?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Visible_To_Followers_Users" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Is_Visible_To_Followers_UsersResource1">
                <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Followers_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Visible_To_Followers_UsersResource1" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Visible_To_Followers_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Is_Visible_To_Followers_UsersResource1">
                <asp:Label
                    runat="server" ID="label_Is_Visible_To_Followers_Users" meta:resourcekey="label_Is_Visible_To_Followers_UsersResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Available_For_Download_For_Followers_Users.ClientID %>">Can Followers Download File?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Available_For_Download_For_Followers_Users" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Is_Available_For_Download_For_Followers_UsersResource1">
                <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Followers_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Available_For_Download_For_Followers_UsersResource1" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Available_For_Download_For_Followers_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Is_Available_For_Download_For_Followers_UsersResource1">
                <asp:Label
                    runat="server" ID="label_Is_Available_For_Download_For_Followers_Users" meta:resourcekey="label_Is_Available_For_Download_For_Followers_UsersResource1"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Active.ClientID %>">Is Active?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Active" CssClass="Form_Control" meta:resourcekey="formControl_Wrapper_Edit_Is_ActiveResource1">
                <asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="True" ClientIDMode="Static" meta:resourcekey="checkbox_Is_ActiveResource1" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Active" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel" meta:resourcekey="formControl_Wrapper_ReadOnly_Is_ActiveResource1">
                <asp:Label
                    runat="server" ID="label_Is_Active" meta:resourcekey="label_Is_ActiveResource1"></asp:Label>
            </asp:Panel>
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

            <asp:Button runat="server" ID="button_Edit_Expense_Details" 
                Text="Edit Expense" OnClick="button_Edit_Expense_Details_Click" CausesValidation="False" CssClass="btn btn-primary" meta:resourcekey="button_Edit_Expense_DetailsResource1" /> 

            <asp:Button runat="server" ID="button_Update_Expense_Details" 
                Text="Save Changes" OnClick="button_Update_Expense_Details_Click" CssClass="btn btn-success" meta:resourcekey="button_Update_Expense_DetailsResource1" /> 

            <asp:Button runat="server" ID="button_CancelEdit_Expense_Details" 
                Text="Cancel Editing" OnClick="button_CancelEdit_Expense_Details_Click" CausesValidation="False" OnClientClick="if (!confirm('Are you sure you want to cancel edit?')) return false;" CssClass="btn btn-danger" meta:resourcekey="button_CancelEdit_Expense_DetailsResource1" /> 
            
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result" meta:resourcekey="lbl_Insert_Process_Error_ResultResource1"></asp:Label>
        </div>
        <br /><br /><br /><br />

    </div>

</asp:Content>

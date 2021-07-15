<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_Expense.aspx.cs" Inherits="WebformsPOCDemo.manage_Expense" Culture="auto" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5"><%= Resources.SiteCommon.Manage_Expense_Title %></h2>
        <p class="lead"><%= Resources.SiteCommon.Manage_Expense_SubTitle %></p>
    </div>

    <hr />

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label style="font-weight: bold"><%= Resources.SiteCommon.Filename %>:</label>
            </div>
            <asp:HyperLink runat="server" ID="link_Download_Expense"></asp:HyperLink>&nbsp;&nbsp;
            <asp:Panel runat="server" ID="panel_Image_Download_Expense" Style="display: inline">
                <asp:HyperLink runat="server" ID="link_Download_Expense2">
                    <img src="/Images/download.png" width="32" height="32" alt="<%= Resources.SiteCommon.Download %>" title="<%= Resources.SiteCommon.Download %>" />
                </asp:HyperLink>
            </asp:Panel>
        </div>

        <asp:Panel runat="server" ID="p_Edit_Expense_File" Visible="false" class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= fileUpload_Expense_File.ClientID %>"><%= Resources.SiteCommon.Upload_File %>:</label>
            </div>
            <div class="Form_Control">
                <asp:FileUpload runat="server" ID="fileUpload_Expense_File" ClientIDMode="Static" CssClass="form-control" onchange="Run_Auto_Complete_Helper_On_Uploaded_File_Name(this)" />
                <asp:HiddenField runat="server" ClientIDMode="Static" ID="hidden_Uploading_FileName_For_AutoComplete_Helper" />
                <asp:Button runat="server" ID="button_Run_Auto_Complete_Based_On_Selected_FileName" ClientIDMode="Static"
                    OnClick="Button_Run_Auto_Complete_Based_On_Selected_FileName_Click" CausesValidation="False" Style="display: none" />
            </div>
        </asp:Panel>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="UpdatePanel1">
            <ContentTemplate>
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label style="font-weight: bold" for="<%= textbox_Expense_Invoice_DateTime.ClientID %>"><%= Resources.SiteCommon.Expense_Date %>:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Expense_Invoice_DateTime" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Expense_Invoice_DateTime" ClientIDMode="Static" autocomplete="nope"
                            CssClass="form-control InitializeDatePicker" AutoPostBack="True" OnTextChanged="textbox_Expense_Invoice_DateTime_TextChanged"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Expense_Invoice_DateTime" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Expense_Invoice_DateTime"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Expense_Invoice_DateTime_Required" 
                        ErrorMessage="<%$ Resources:SiteCommon, Validator_Expense_Invoice_DateTime_Required %>" Display="Dynamic" ControlToValidate="textbox_Expense_Invoice_DateTime" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Invoice_Time_Hours.ClientID %>"><%= Resources.SiteCommon.Expense_Time %>:</label>
                    </div>
                    <asp:Panel ID="formControl_Wrapper_Edit_Expense_Invoice_Time_Hours" runat="server" class="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Hours" ClientIDMode="Static"
                            CssClass="form-control Tiny_ComboBox">
                        </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Minutes"
                            ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                        </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Seconds"
                            ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                        </asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Expense_Invoice_Time" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Expense_Invoice_Time"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Supplier.ClientID %>"><%= Resources.SiteCommon.Supplier %>:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Supplier" CssClass="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Supplier" ClientIDMode="Static" CssClass="Big_ComboBox form-control"></asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Supplier" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Supplier"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Supplier_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Supplier_Required %>"
                        Display="Dynamic" ControlToValidate="dropdown_Supplier" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <asp:UpdatePanel runat="server" ID="up_EditExpense_AutoComplete" ClientIDMode="Static">
                    <ContentTemplate>
                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= dropdown_Currency.ClientID %>"><%= Resources.SiteCommon.Currency %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Currency" CssClass="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control"></asp:DropDownList>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Currency" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Currency"></asp:Label>
                            </asp:Panel>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Currency_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Currency_Required %>" Display="Dynamic"
                                ControlToValidate="dropdown_Currency" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Total_Amount.ClientID %>"><%= Resources.SiteCommon.Total_Amount %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Total_Amount" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Total_Amount" ClientIDMode="Static"
                                    OnTextChanged="textbox_Total_Amount_TextChanged" AutoPostBack="true" AutoCompleteType="None"
                                    CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Total_Amount" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Total_Amount"></asp:Label>
                            </asp:Panel>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Total_Amount_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Total_Amount_Required %>" Display="Dynamic"
                                ControlToValidate="textbox_Total_Amount" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = textbox_Vat_Percentage.ClientID  %>"><%= Resources.SiteCommon.Vat_Percentage_Text %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Vat_Percentage" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Vat_Percentage" ClientIDMode="Static" CssClass="form-control" autocomplete="nope"
                                    OnTextChanged="textbox_Vat_Percentage_TextChanged" AutoPostBack="true"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Vat_Percentage" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Vat_Percentage"></asp:Label>
                            </asp:Panel>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Vat_Percentage_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Vat_Percentage_Required %>" Display="Dynamic"
                                ControlToValidate="textbox_Vat_Percentage" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Total_Without_Vat.ClientID %>"><%= Resources.SiteCommon.Total_Without_Vat %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Total_Without_Vat" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Total_Without_Vat" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Total_Without_Vat" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Total_Without_Vat"></asp:Label>
                            </asp:Panel>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Total_Without_Vat_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Total_Without_Vat_Required %>" Display="Dynamic"
                                ControlToValidate="textbox_Total_Without_Vat" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Total_Vat.ClientID %>"><%= Resources.SiteCommon.Total_Vat %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Total_Vat" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Total_Vat" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Total_Vat" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Total_Vat"></asp:Label>
                            </asp:Panel>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Total_Vat_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Total_Vat_Required %>" Display="Dynamic"
                                ControlToValidate="textbox_Total_Vat" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group hidden">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = textbox_Invoiced_On_User_Location_Id.ClientID %>"><%= Resources.SiteCommon.Invoiced_On_Location %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_On_User_Location_Id" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_On_User_Location_Id" ClientIDMode="Static" Enabled="False" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_On_User_Location_Id" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_On_User_Location_Id"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = textbox_Invoiced_Client_To_CompanyName.ClientID %>"><%= Resources.SiteCommon.Invoiced_To_Company %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_CompanyName" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_CompanyName" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_CompanyName" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_CompanyName"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = textbox_Invoiced_Client_To_Tax_Reference.ClientID %>"><% = Resources.SiteCommon.Invoiced_To_TAX_Reference %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_Tax_Reference" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Tax_Reference" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_Tax_Reference" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_Tax_Reference"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = textbox_Invoiced_Client_To_PersonName.ClientID %>"><% = Resources.SiteCommon.Invoiced_To_Person_Name %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_PersonName" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_PersonName" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_PersonName" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_PersonName"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = textbox_Invoiced_Client_To_PhoneNumber.ClientID %>"><% = Resources.SiteCommon.Invoiced_To_Phone %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_PhoneNumber" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_PhoneNumber" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_PhoneNumber" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_PhoneNumber"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= dropdown_Invoiced_Client_To_Country.ClientID %>"><% = Resources.SiteCommon.Invoiced_For_Country %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_Country" CssClass="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Invoiced_Client_To_Country" ClientIDMode="Static"
                                    CssClass="Big_ComboBox form-control" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Invoiced_Client_To_Country_SelectedIndexChanged">
                                </asp:DropDownList>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_Country" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_Country"></asp:Label>
                            </asp:Panel>
                        </div>

                        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Invoice">
                            <ContentTemplate>
                                <asp:Panel runat="server" ID="p_Invoiced_Client_To_State_Wrapper_Panel" class="Form_Group" Visible="False">
                                    <div class="Form_Label_Wrapper">
                                        <label for="<%= dropdown_Invoiced_Client_To_State.ClientID %>"><% = Resources.SiteCommon.Invoiced_For_State %>:</label>
                                    </div>
                                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_State" CssClass="Form_Control">
                                        <asp:DropDownList runat="server" ID="dropdown_Invoiced_Client_To_State" ClientIDMode="Static"
                                            CssClass="Big_ComboBox form-control">
                                        </asp:DropDownList>
                                    </asp:Panel>
                                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_State" Visible="False" CssClass="Form_Control Read_Only_Panel">
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
                                <label for="<% = textbox_Invoiced_Client_To_City.ClientID %>"><% = Resources.SiteCommon.Invoiced_To_City %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_City" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_City" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_City" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_City"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = textbox_Invoiced_Client_To_Address.ClientID %>"><% = Resources.SiteCommon.Invoiced_To_Address %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_Address" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Address" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_Address" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_Address"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = textbox_Invoiced_Client_To_Zip.ClientID %>"><% = Resources.SiteCommon.Invoiced_To_Zip_Code %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_Zip" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Zip" ClientIDMode="Static"
                                    CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_Zip" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_Zip"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Invoiced_Client_To_EmailAddress.ClientID %>"><% = Resources.SiteCommon.Invoiced_To_Email %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_EmailAddress" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_EmailAddress" ClientIDMode="Static"
                                    CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_EmailAddress" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_EmailAddress"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = dropdown_Expense_Type.ClientID %>"><% = Resources.SiteCommon.Expense_Type %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Expense_Type" CssClass="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Expense_Type" ClientIDMode="Static" CssClass="form-control Big_ComboBox"></asp:DropDownList>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Expense_Type" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Expense_Type"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = textbox_Invoice_Number.ClientID %>"><% = Resources.SiteCommon.Invoice_Number %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Number" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Number" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Number" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoice_Number"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = textbox_Invoice_Reference_Number.ClientID %>"><% = Resources.SiteCommon.Invoice_Reference_Number %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Reference_Number" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Reference_Number" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Reference_Number" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoice_Reference_Number"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = textbox_Invoice_Supplier_Company_Details.ClientID %>"><% = Resources.SiteCommon.Invoice_Supplier_Company %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_Company_Details" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Company_Details" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_Company_Details" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoice_Supplier_Company_Details"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = textbox_Invoice_Supplier_Tax_Reference.ClientID %>"><% = Resources.SiteCommon.Invoice_Supplier_Tax_Ref %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_Tax_Reference" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Tax_Reference" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_Tax_Reference" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoice_Supplier_Tax_Reference"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = dropdown_Invoice_Supplier_Country.ClientID %>"><% = Resources.SiteCommon.Invoice_Supplier_Country %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_Country" CssClass="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Invoice_Supplier_Country" ClientIDMode="Static" AutoPostBack="True"
                                    OnSelectedIndexChanged="dropdown_Invoice_Supplier_Country_SelectedIndexChanged" CssClass="Big_ComboBox form-control">
                                </asp:DropDownList>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_Country" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoice_Supplier_Country"></asp:Label>
                            </asp:Panel>
                            <asp:RequiredFieldValidator runat="server" ID="validator_dropdown_Invoice_Supplier_Country_Required" Enabled="false" ErrorMessage="<%$ Resources:SiteCommon, Validator_dropdown_Invoice_Supplier_Country_Required %>"
                                Display="Dynamic" ControlToValidate="dropdown_Invoice_Supplier_Country" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>

                        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_StateUpdatePanel">
                            <ContentTemplate>
                                <asp:Panel runat="server" ID="p_Invoice_Supplier_State_Wrapper_Panel" class="Form_Group" Visible="False">
                                    <div class="Form_Label_Wrapper">
                                        <label for="<%= dropdown_Invoice_Supplier_State.ClientID %>"><% = Resources.SiteCommon.Invoice_Supplier_State %>:</label>
                                    </div>
                                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_State" CssClass="Form_Control">
                                        <asp:DropDownList runat="server" ID="dropdown_Invoice_Supplier_State" ClientIDMode="Static"
                                            CssClass="Big_ComboBox form-control">
                                        </asp:DropDownList>
                                    </asp:Panel>
                                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_State" Visible="False" CssClass="Form_Control Read_Only_Panel">
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
                                <label for="<% = textbox_Invoice_Supplier_City.ClientID %>"><% = Resources.SiteCommon.Invoice_Supplier_City %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_City" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_City" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_City" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoice_Supplier_City"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = textbox_Invoice_Supplier_Address_Description.ClientID %>"><% = Resources.SiteCommon.Invoice_Address_Desc %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_Address_Description" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Address_Description" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_Address_Description" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoice_Supplier_Address_Description"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = textbox_Invoice_Supplier_ZipCode.ClientID %>"><% = Resources.SiteCommon.Invoice_Supplier_ZipCode %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_ZipCode" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_ZipCode" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_ZipCode" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoice_Supplier_ZipCode"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = textbox_Invoice_Supplier_WebAddress.ClientID %>"><% = Resources.SiteCommon.Invoice_Supplier_Web_Address %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_WebAddress" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_WebAddress" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_WebAddress" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoice_Supplier_WebAddress"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = textbox_Invoice_Supplier_Phone_Number.ClientID %>"><% = Resources.SiteCommon.Invoice_Supplier_Phone %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_Phone_Number" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Phone_Number" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_Phone_Number" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoice_Supplier_Phone_Number"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<% = textbox_Invoice_Supplier_Contact_FullName.ClientID %>"><% = Resources.SiteCommon.Supplier_Contact_Person %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Supplier_Contact_FullName" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Contact_FullName" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Supplier_Contact_FullName" Visible="False" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoice_Supplier_Contact_FullName"></asp:Label>
                            </asp:Panel>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dropdown_Supplier" />
                        <asp:AsyncPostBackTrigger ControlID="textbox_Total_Amount" />
                        <asp:AsyncPostBackTrigger ControlID="textbox_Vat_Percentage" />
                    </Triggers>
                </asp:UpdatePanel>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoice_Content_Long_Description.ClientID %>"><% = Resources.SiteCommon.Invoice_Content_Description %>:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Content_Long_Description" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Content_Long_Description" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Invoice_Content_Long_Description" Visible="False" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoice_Content_Long_Description"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_User_Description.ClientID %>"><% = Resources.SiteCommon.User_Description %>:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_User_Description" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_User_Description" ClientIDMode="Static"
                            TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_User_Description" Visible="False" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_User_Description"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_User_Comments.ClientID %>"><% = Resources.SiteCommon.User_Comments %>:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_User_Comments" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_User_Comments" ClientIDMode="Static"
                            TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_User_Comments" Visible="False" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_User_Comments"></asp:Label>
                    </asp:Panel>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="button_Run_Auto_Complete_Based_On_Selected_FileName" />
            </Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Anonymous_Users.ClientID %>"><% = Resources.SiteCommon.Is_Visible_To_Public %>?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Visible_To_Anonymous_Users" CssClass="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Anonymous_Users" ClientIDMode="Static" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Visible_To_Anonymous_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Is_Visible_To_Anonymous_Users"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Available_For_Download_For_Anonymous_Users.ClientID %>"><% = Resources.SiteCommon.Is_Downloadable_To_Public %>?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Available_For_Download_For_Anonymous_Users" CssClass="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Anonymous_Users" ClientIDMode="Static" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Available_For_Download_For_Anonymous_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Is_Available_For_Download_For_Anonymous_Users"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Followers_Users.ClientID %>"><% = Resources.SiteCommon.Is_Visible_To_Followers %>?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Visible_To_Followers_Users" CssClass="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Followers_Users" ClientIDMode="Static" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Visible_To_Followers_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Is_Visible_To_Followers_Users"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Available_For_Download_For_Followers_Users.ClientID %>"><% = Resources.SiteCommon.Can_Followers_Download_File %>?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Available_For_Download_For_Followers_Users" CssClass="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Followers_Users" ClientIDMode="Static" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Available_For_Download_For_Followers_Users" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Is_Available_For_Download_For_Followers_Users"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Active.ClientID %>"><% = Resources.SiteCommon.Is_Active %>?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Active" CssClass="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="True" ClientIDMode="Static" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Active" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label
                    runat="server" ID="label_Is_Active"></asp:Label>
            </asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label><% = Resources.SiteCommon.Created_By %>:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Record_Created_By_User" runat="server" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Record_Created_By_User"></asp:Label>
            </asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label><% = Resources.SiteCommon.Created_On %>:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Record_Creation_DateTime_UTC" runat="server" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Record_Creation_DateTime_UTC"></asp:Label>
            </asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label><% = Resources.SiteCommon.Last_Modified_By %>:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_By_User" runat="server" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Record_Last_Updated_By_User"></asp:Label>
            </asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label><% = Resources.SiteCommon.Last_Modified_Date %>:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_DateTime_UTC" runat="server" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Record_Last_Updated_DateTime_UTC"></asp:Label>
            </asp:Panel>
        </div>

        <hr />
        <div>

            <asp:Button runat="server" ID="button_Edit_Expense_Details"
                Text="<%$ Resources:SiteCommon, Manage_Expense_Edit_Button %>" OnClick="button_Edit_Expense_Details_Click" 
                CausesValidation="False" CssClass="btn btn-primary" />

            <asp:Button runat="server" ID="button_Update_Expense_Details"
                Text="<%$ Resources:SiteCommon, Manage_Expense_Save_Changes_Button %>" OnClick="button_Update_Expense_Details_Click" 
                CssClass="btn btn-success" />

            <asp:Button runat="server" ID="button_CancelEdit_Expense_Details"
                Text="<%$ Resources:SiteCommon, Manage_Expense_Cancel_Editing_Button %>" OnClick="button_CancelEdit_Expense_Details_Click" 
                CausesValidation="False" CssClass="btn btn-danger" />

            <asp:HiddenField runat="server" ID="hidden_User_Id_Expense_Owner" />

        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br />
        <br />
        <br />
        <br />

    </div>

</asp:Content>

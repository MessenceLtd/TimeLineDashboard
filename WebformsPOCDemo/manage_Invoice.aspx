<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_Invoice.aspx.cs" Inherits="WebformsPOCDemo.manage_Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5">Manage Invoice</h2>
        <p class="lead">Change and add more details for your Invoices.</p>
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
                    <img src="/Images/download.png" width="32" height="32" alt="Download" title="Download" />
                </asp:HyperLink>
            </asp:Panel>
        </div>

        <asp:Panel runat="server" ID="p_Edit_Expense_File" Visible="false" class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= fileUpload_Expense_File.ClientID %>"><%= Resources.SiteCommon.Upload_File %>:</label>
            </div>
            <div class="Form_Control">
                <asp:FileUpload runat="server" ID="fileUpload_Expense_File" ClientIDMode="Static" CssClass="form-control" onchange="Run_Auto_Complete_Helper_On_Uploaded_File_Name(this)" meta:resourcekey="fileUpload_Expense_File" />
                <asp:HiddenField runat="server" ClientIDMode="Static" ID="hidden_Uploading_FileName_For_AutoComplete_Helper" />
                <asp:Button runat="server" ID="button_Run_Auto_Complete_Based_On_Selected_FileName" ClientIDMode="Static"
                    OnClick="Button_Run_Auto_Complete_Based_On_Selected_FileName_Click" CausesValidation="False" Style="display: none" />
            </div>
        </asp:Panel>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="UpdatePanel1">
            <ContentTemplate>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label style="font-weight: bold" for="<%= textbox_Invoice_DateTime.ClientID %>"><% = Resources.SiteCommon.Invoice_Date %>:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_DateTime" Visible="true" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_DateTime" ClientIDMode="Static" autocomplete="nope" CssClass="form-control InitializeDatePicker"
                            AutoPostBack="true" OnTextChanged="textbox_Invoice_DateTime_TextChanged"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Invoice_DateTime" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoice_DateTime"></asp:Label>
                    </asp:Panel>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Invoice_DateTime_Required" ErrorMessage="Please enter an invoice date" Display="Dynamic" ControlToValidate="textbox_Invoice_DateTime" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Invoice_Time_Hours.ClientID %>"><% = Resources.SiteCommon.Invoice_Time %>:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Time" Visible="true" CssClass="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Hours" ClientIDMode="Static"
                            CssClass="form-control Tiny_ComboBox">
                        </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Minutes"
                            ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                        </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Seconds"
                            ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                        </asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Invoice_Time" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoice_Time"></asp:Label>
                    </asp:Panel>
                </div>

                <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Supplier">
                    <ContentTemplate>
                        <asp:Panel runat="server" ID="panel_Supplier_Selection" CssClass="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= dropdown_Client.ClientID %>"><% = Resources.SiteCommon.Client %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Client" Visible="true" CssClass="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Client" ClientIDMode="Static" AutoPostBack="True"
                                    OnSelectedIndexChanged="dropdown_Client_SelectedIndexChanged" CssClass="Big_ComboBox form-control">
                                </asp:DropDownList>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Client" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Client"></asp:Label>
                            </asp:Panel>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Client_Required" ErrorMessage="Please select a client" Display="Dynamic" ControlToValidate="dropdown_Client" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="textbox_Invoice_DateTime" />
                    </Triggers>
                </asp:UpdatePanel>

                <asp:UpdatePanel runat="server" ID="up_AddExpense_AutoComplete" ClientIDMode="Static">
                    <ContentTemplate>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= dropdown_Invoice_Type.ClientID %>"><% = Resources.SiteCommon.Invoice_Type %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Type" Visible="true" CssClass="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Invoice_Type" ClientIDMode="Static" CssClass="form-control Big_ComboBox"></asp:DropDownList>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Invoice_Type" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoice_Type"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Invoice_Number.ClientID %>"><% = Resources.SiteCommon.Invoice_Number %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Number" Visible="true" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Number" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Invoice_Number" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoice_Number"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Invoice_Reference_Number.ClientID %>"><% = Resources.SiteCommon.Invoice_Reference_Number %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Reference_Number" Visible="true" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Reference_Number" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Invoice_Reference_Number" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoice_Reference_Number"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= dropdown_Currency.ClientID %>"><% = Resources.SiteCommon.Currency %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Currency" Visible="true" CssClass="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control"></asp:DropDownList>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Currency" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Currency"></asp:Label>
                            </asp:Panel>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Currency_Required" ErrorMessage="Please select a currency" Display="Dynamic" ControlToValidate="dropdown_Currency" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Total_Amount.ClientID %>"><% = Resources.SiteCommon.Total_Amount %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Total_Amount" Visible="true" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Total_Amount" ClientIDMode="Static" 
                                    OnTextChanged="textbox_Total_Amount_TextChanged" AutoPostBack="true" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Total_Amount" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Total_Amount"></asp:Label>
                            </asp:Panel>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Total_Amount_Required" ErrorMessage="Please enter total amount" Display="Dynamic"
                                ControlToValidate="textbox_Total_Amount" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Vat_Percentage.ClientID %>"><% = Resources.SiteCommon.Vat_Percentage_Text %>:</label></div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Vat_Percentage" Visible="true" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Vat_Percentage" ClientIDMode="Static" 
                                    OnTextChanged="textbox_Vat_Percentage_TextChanged" AutoPostBack="true" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Vat_Percentage" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Vat_Percentage"></asp:Label>
                            </asp:Panel>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Vat_Percentage_Required" ErrorMessage="Please enter vat percentage" Display="Dynamic"
                                ControlToValidate="textbox_Vat_Percentage" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Total_Without_Vat.ClientID %>"><% = Resources.SiteCommon.Total_Without_Vat %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Total_Without_Vat" Visible="true" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Total_Without_Vat" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Total_Without_Vat" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Total_Without_Vat"></asp:Label>
                            </asp:Panel>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Total_Without_Vat_Required" ErrorMessage="Please enter total amount without vat" Display="Dynamic"
                                ControlToValidate="textbox_Total_Without_Vat" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Total_Vat.ClientID %>"><% = Resources.SiteCommon.Total_Vat %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Total_Vat" Visible="true" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Total_Vat" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Total_Vat" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Total_Vat"></asp:Label>
                            </asp:Panel>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Total_Vat_Required" ErrorMessage="Please enter total vat amount" Display="Dynamic"
                                ControlToValidate="textbox_Total_Vat" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label style="font-weight: bold" for="<%= textbox_Creation_DateTime.ClientID %>"><% = Resources.SiteCommon.Creation_Date %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Creation_DateTime" Visible="true" CssClass="Form_Control" autocomplete="nope">
                                <asp:TextBox
                                    runat="server" ID="textbox_Creation_DateTime" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Creation_DateTime" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Creation_DateTime"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= dropdown_Invoice_Creation_Time_Hours.ClientID %>"><% = Resources.SiteCommon.Creation_Time %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Creation_Time" Visible="true" CssClass="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Invoice_Creation_Time_Hours" ClientIDMode="Static"
                                    CssClass="form-control Tiny_ComboBox">
                                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Creation_Time_Minutes"
                                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Creation_Time_Seconds"
                                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                                </asp:DropDownList>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Invoice_Creation_Time" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoice_Creation_Time"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Invoiced_On_User_Location_Id.ClientID %>"><% = Resources.SiteCommon.Invoiced_On_Location %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_On_User_Location_Id" Visible="true" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_On_User_Location_Id" ClientIDMode="Static" Enabled="false" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Invoiced_On_User_Location_Id" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_On_User_Location_Id"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Invoiced_Client_To_CompanyName.ClientID %>"><% = Resources.SiteCommon.Invoiced_To_Company %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_CompanyName" Visible="true" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_CompanyName" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_CompanyName" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_CompanyName"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Invoiced_Client_To_Tax_Reference.ClientID %>"><% = Resources.SiteCommon.Invoiced_Client_Tax_Reference %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_Tax_Reference" Visible="true" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Tax_Reference" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_Tax_Reference" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_Tax_Reference"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Invoiced_Client_To_PersonName.ClientID %>"><% = Resources.SiteCommon.Invoiced_To_Person_Name %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_PersonName" Visible="true" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_PersonName" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_PersonName" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_PersonName"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Invoiced_Client_To_PhoneNumber.ClientID %>"><% = Resources.SiteCommon.Invoiced_To_Phone %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_PhoneNumber" Visible="true" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_PhoneNumber" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_PhoneNumber" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_PhoneNumber"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= dropdown_Invoiced_Client_To_Country.ClientID %>"><% = Resources.SiteCommon.Invoiced_For_Country %>:</label>
                            </div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_Country" Visible="true" CssClass="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Invoiced_Client_To_Country" ClientIDMode="Static"
                                    CssClass="Big_ComboBox form-control" AutoPostBack="true" OnSelectedIndexChanged="dropdown_Invoiced_Client_To_Country_SelectedIndexChanged">
                                </asp:DropDownList>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_Country" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_Country"></asp:Label>
                            </asp:Panel>
                        </div>

                        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Invoice">
                            <ContentTemplate>
                                <asp:Panel runat="server" ID="p_Invoiced_Client_To_State_Wrapper_Panel" class="Form_Group" Visible="false">
                                    <div class="Form_Label_Wrapper">
                                        <label for="<%= dropdown_Invoiced_Client_To_State.ClientID %>"><% = Resources.SiteCommon.Invoiced_For_State %>:</label></div>
                                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_State" Visible="true" CssClass="Form_Control">
                                        <asp:DropDownList runat="server" ID="dropdown_Invoiced_Client_To_State" ClientIDMode="Static"
                                            CssClass="Big_ComboBox form-control">
                                        </asp:DropDownList>
                                    </asp:Panel>
                                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_State" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
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
                                <label for="<%= textbox_Invoiced_Client_To_City.ClientID %>"><% = Resources.SiteCommon.Invoiced_To_City %>:</label></div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_City" Visible="true" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_City" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_City" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_City"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Invoiced_Client_To_Address.ClientID %>"><% = Resources.SiteCommon.Invoiced_To_Address %>:</label></div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_Address" Visible="true" CssClass="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Address" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_Address" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_Address"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Invoiced_Client_To_Zip.ClientID %>"><% = Resources.SiteCommon.Invoiced_To_Zip_Code %>:</label></div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_Zip" Visible="true" CssClass="Form_Control">
                                <asp:TextBox
                                    runat="server" ID="textbox_Invoiced_Client_To_Zip" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_Zip" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_Zip"></asp:Label>
                            </asp:Panel>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Invoiced_Client_To_EmailAddress.ClientID %>"><% = Resources.SiteCommon.Invoiced_To_Email %>:</label></div>
                            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoiced_Client_To_EmailAddress" Visible="true" CssClass="Form_Control">
                                <asp:TextBox
                                    runat="server" ID="textbox_Invoiced_Client_To_EmailAddress" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="formControl_Wrapper_ReadOnly_Invoiced_Client_To_EmailAddress" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                                <asp:Label runat="server" ID="label_Invoiced_Client_To_EmailAddress"></asp:Label>
                            </asp:Panel>
                        </div>

                        

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dropdown_Client" />
                        <asp:AsyncPostBackTrigger ControlID="textbox_Invoice_DateTime" />
                    </Triggers>
                </asp:UpdatePanel>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoice_Content_Long_Description.ClientID %>"><% = Resources.SiteCommon.Invoice_Content_Description %>:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Invoice_Content_Long_Description" Visible="true" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Content_Long_Description" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_Invoice_Content_Long_Description" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Invoice_Content_Long_Description"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_User_Description.ClientID %>"><% = Resources.SiteCommon.User_Description %>:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_User_Description" Visible="true" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_User_Description" ClientIDMode="Static"
                            TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_User_Description" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_User_Description"></asp:Label>
                    </asp:Panel>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_User_Comments.ClientID %>"><% = Resources.SiteCommon.User_Comments %>:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_User_Comments" Visible="true" CssClass="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_User_Comments" ClientIDMode="Static"
                            TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </asp:Panel>
                    <asp:Panel ID="formControl_Wrapper_ReadOnly_User_Comments" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
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
                <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Anonymous_Users" Checked="false" ClientIDMode="Static" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Visible_To_Anonymous_Users" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label
                    runat="server" ID="label_Is_Visible_To_Anonymous_Users"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Available_For_Download_For_Anonymous_Users.ClientID %>"><% = Resources.SiteCommon.Is_Downloadable_To_Public %>?</label>
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
                <label for="<%= checkbox_Is_Visible_To_Followers_Users.ClientID %>"><% = Resources.SiteCommon.Is_Visible_To_Followers %>?</label>
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
                <label for="<%= checkbox_Is_Available_For_Download_For_Followers_Users.ClientID %>"><% = Resources.SiteCommon.Can_Followers_Download_File %>?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Available_For_Download_For_Followers_Users" CssClass="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Followers_Users" Checked="false" ClientIDMode="Static" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Available_For_Download_For_Followers_Users" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Is_Available_For_Download_For_Followers_Users"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Active.ClientID %>"><% = Resources.SiteCommon.Is_Active %>?</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Is_Active" CssClass="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="true" ClientIDMode="Static" />
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Is_Active" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Is_Active"></asp:Label>
            </asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label><% = Resources.SiteCommon.Created_By %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Created_By_User" runat="server" Visible="true" CssClass="Form_Control Read_Only_Panel">
                <asp:Label
                    runat="server" ID="label_Record_Created_By_User"></asp:Label>
            </asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label><% = Resources.SiteCommon.Created_On %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Creation_DateTime_UTC" runat="server" Visible="true" CssClass="Form_Control Read_Only_Panel">
                <asp:Label
                    runat="server" ID="label_Record_Creation_DateTime_UTC"></asp:Label>
            </asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label><% = Resources.SiteCommon.Last_Modified_By %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_By_User" runat="server" Visible="true" CssClass="Form_Control Read_Only_Panel">
                <asp:Label
                    runat="server" ID="label_Record_Last_Updated_By_User"></asp:Label>
            </asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label><% = Resources.SiteCommon.Last_Modified_Date %>:</label></div>
            <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_DateTime_UTC" runat="server" Visible="true" CssClass="Form_Control Read_Only_Panel">
                <asp:Label
                    runat="server" ID="label_Record_Last_Updated_DateTime_UTC"></asp:Label>
            </asp:Panel>
        </div>

        <hr />
        <div>

            <asp:Button runat="server" ID="button_Edit_Invoice_Details"
                Text="Edit Invoice" OnClick="button_Edit_Invoice_Details_Click" CausesValidation="false" CssClass="btn btn-primary" />

            <asp:Button runat="server" ID="button_Update_Invoice_Details"
                Text="Save Changes" OnClick="button_Update_Invoice_Details_Click" CssClass="btn btn-success" />

            <asp:Button runat="server" ID="button_CancelEdit_Invoice_Details"
                Text="Cancel Editing" OnClick="button_CancelEdit_Invoice_Details_Click" CausesValidation="false" OnClientClick="if (!confirm('Are you sure you want to cancel edit?')) return false;" CssClass="btn btn-danger" />

            <asp:HiddenField runat="server" ID="hidden_User_Id_Invoice_Owner" />

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

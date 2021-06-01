<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_Expense.aspx.cs" Inherits="WebformsPOCDemo.Add_Expense" Culture="auto" meta:resourcekey="Page" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5">Add Expense</h2>
        <p class="lead">The advanced way to keep track on all your expenses.</p>
    </div>

    <hr />

    <div>

        <asp:Panel runat="server" ID="panel_User_Selection" CssClass="Form_Group" meta:resourcekey="panel_User_Selection">
            <div class="Form_Label_Wrapper">
                <label style="font-weight: bold" for="<%= dropdown_User_Selection.ClientID %>"><%= Resources.SiteCommon.User %>:</label>
            </div>
            <div class="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_User_Selection" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="dropdown_User_SelectedIndexChanged" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_User_Selection"></asp:DropDownList>
            </div>
            <asp:RequiredFieldValidator runat="server" ID="validator_User_Selection_Required" ErrorMessage="Please select an user" Display="Dynamic" ControlToValidate="dropdown_User_Selection" CssClass="text-danger" meta:resourcekey="validator_User_Selection_Required"></asp:RequiredFieldValidator>
        </asp:Panel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= fileUpload_Expense_File.ClientID %>"><%= Resources.SiteCommon.Upload_File %>:</label>
            </div>
            <div class="Form_Control">
                <asp:FileUpload runat="server" ID="fileUpload_Expense_File" ClientIDMode="Static" CssClass="form-control" onchange="Run_Auto_Complete_Helper_On_Uploaded_File_Name(this)" meta:resourcekey="fileUpload_Expense_File" />
                <asp:HiddenField runat="server" ClientIDMode="Static" ID="hidden_Uploading_FileName_For_AutoComplete_Helper" />
                <asp:Button runat="server" ID="button_Run_Auto_Complete_Based_On_Selected_FileName" ClientIDMode="Static"
                    OnClick="Button_Run_Auto_Complete_Based_On_Selected_FileName_Click" CausesValidation="False" Style="display: none" meta:resourcekey="button_Run_Auto_Complete_Based_On_Selected_FileName" />
            </div>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="UpdatePanel1">
            <ContentTemplate>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label style="font-weight: bold" for="<%= textbox_Expense_Invoice_DateTime.ClientID %>"><%= Resources.SiteCommon.Expense_Date %>:</label>
                    </div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Expense_Invoice_DateTime" ClientIDMode="Static" autocomplete="nope"
                            CssClass="form-control InitializeDatePicker" AutoPostBack="True" OnTextChanged="textbox_Expense_Invoice_DateTime_TextChanged" meta:resourcekey="textbox_Expense_Invoice_DateTime"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Expense_Invoice_DateTime_Required"
                        ErrorMessage="Please enter an expense date" Display="Dynamic" ControlToValidate="textbox_Expense_Invoice_DateTime"
                        CssClass="text-danger" SetFocusOnError="True" meta:resourcekey="validator_Expense_Invoice_DateTime_Required"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Expense_Time %>:</label>
                    </div>
                    <div class="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Hours" ClientIDMode="Static"
                            CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Invoice_Time_Hours">
                        </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Minutes"
                            ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Invoice_Time_Minutes">
                        </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Seconds"
                            ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Invoice_Time_Seconds">
                        </asp:DropDownList>
                    </div>
                </div>

                <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Supplier">
                    <ContentTemplate>
                        <asp:Panel runat="server" ID="panel_Supplier_Selection" CssClass="Form_Group" meta:resourcekey="panel_Supplier_Selection">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= dropdown_Supplier.ClientID %>"><%= Resources.SiteCommon.Supplier %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Supplier" ClientIDMode="Static" AutoPostBack="True"
                                    OnSelectedIndexChanged="dropdown_Supplier_SelectedIndexChanged" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Supplier">
                                </asp:DropDownList>
                            </div>
                            <asp:HyperLink runat="server" ID="link_Add_Suppliers" Target="_blank" NavigateUrl="~/Add_Supplier.aspx"
                                ToolTip="Add new supplier"><img src="/Images/addmore2.png" width="32" height="32" 
                                    alt="Add" title="Add new supplier"></asp:HyperLink>
                            <a href="javascript:Refresh_Suppliers()" title="Refresh Suppliers List">
                                <img
                                    src="/Images/refresh.png" width="32" height="32" alt="Add" title="Refresh Supplier List"
                                    style="margin-right: 10px; margin-left: 10px;"></a>
                            <asp:Button runat="server" ID="button_Refresh_Suppliers" CssClass="hidden" CausesValidation="false" Text="Refresh suppliers" ClientIDMode="Static" OnClick="button_Refresh_Suppliers_Click" />
                            <asp:RequiredFieldValidator runat="server" ID="validator_Supplier_Required" ErrorMessage="Please select a supplier"
                                Display="Dynamic" ControlToValidate="dropdown_Supplier" CssClass="text-danger" SetFocusOnError="True" meta:resourcekey="validator_Supplier_Required"></asp:RequiredFieldValidator>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dropdown_User_Selection" />
                        <asp:AsyncPostBackTrigger ControlID="textbox_Expense_Invoice_DateTime" />
                    </Triggers>
                </asp:UpdatePanel>

                <asp:UpdatePanel runat="server" ID="up_AddExpense_AutoComplete" ClientIDMode="Static">
                    <ContentTemplate>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Currency %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control" meta:resourcekey="dropdown_Currency"></asp:DropDownList>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Currency_Required" ErrorMessage="Please select a currency"
                                Display="Dynamic" ControlToValidate="dropdown_Currency" CssClass="text-danger" SetFocusOnError="True" meta:resourcekey="validator_Currency_Required"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Total_Amount %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Total_Amount" ClientIDMode="Static"
                                    OnTextChanged="textbox_Total_Amount_TextChanged" AutoPostBack="true" AutoCompleteType="None"
                                    CssClass="form-control"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Total_Amount_Required" ErrorMessage="Please enter total amount" Display="Dynamic"
                                ControlToValidate="textbox_Total_Amount" CssClass="text-danger" SetFocusOnError="True" meta:resourcekey="validator_Total_Amount_Required"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for="<%= textbox_Vat_Percentage.ClientID %>"><%= Resources.SiteCommon.Vat_Percentage_Text %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Vat_Percentage" ClientIDMode="Static" 
                                    CssClass="form-control" OnTextChanged="textbox_Vat_Percentage_TextChanged" AutoPostBack="true"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Vat_Percentage_Required" ErrorMessage="Please enter vat percentage" Display="Dynamic"
                                ControlToValidate="textbox_Vat_Percentage" CssClass="text-danger" Enabled="False" meta:resourcekey="validator_Vat_Percentage_Required"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Total_Without_Vat %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Total_Without_Vat" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Total_Without_Vat"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Total_Without_Vat_Required" ErrorMessage="Please enter total amount without vat" Display="Dynamic"
                                ControlToValidate="textbox_Total_Without_Vat" CssClass="text-danger" Enabled="False" meta:resourcekey="validator_Total_Without_Vat_Required"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Total_Vat %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Total_Vat" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Total_Vat"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Total_Vat_Required" ErrorMessage="Please enter total vat amount" Display="Dynamic"
                                ControlToValidate="textbox_Total_Vat" CssClass="text-danger" meta:resourcekey="validator_Total_Vat_Required"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group hidden">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoiced_On_Location %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_On_User_Location_Id" ClientIDMode="Static" Enabled="False" CssClass="form-control" meta:resourcekey="textbox_Invoiced_On_User_Location_Id"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoiced_To_Company %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_To_CompanyName" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_To_CompanyName"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoiced_To_TAX_Reference %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Tax_Reference" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_Tax_Reference"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoiced_To_Person_Name %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_To_PersonName" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_To_PersonName"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoiced_To_Phone %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_PhoneNumber" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_PhoneNumber"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoiced_For_Country %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Invoiced_Client_To_Country" ClientIDMode="Static"
                                    CssClass="Big_ComboBox form-control" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Invoiced_Client_To_Country_SelectedIndexChanged" meta:resourcekey="dropdown_Invoiced_Client_To_Country">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Invoice">
                            <ContentTemplate>
                                <asp:Panel runat="server" ID="p_Invoiced_Client_To_State_Wrapper_Panel" class="Form_Group" Visible="False" meta:resourcekey="p_Invoiced_Client_To_State_Wrapper_Panel">
                                    <div class="Form_Label_Wrapper">
                                        <label for="<%= dropdown_Invoiced_Client_To_State.ClientID %>"><%= Resources.SiteCommon.Invoiced_For_State %>:</label>
                                    </div>
                                    <div class="Form_Control">
                                        <asp:DropDownList runat="server" ID="dropdown_Invoiced_Client_To_State" ClientIDMode="Static"
                                            CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Invoiced_Client_To_State">
                                        </asp:DropDownList>
                                    </div>
                                </asp:Panel>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="dropdown_Invoiced_Client_To_Country" />
                            </Triggers>
                        </asp:UpdatePanel>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoiced_To_City %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_City" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_City"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoiced_To_Address %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Address" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_Address"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoiced_To_Zip_Code %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Zip" ClientIDMode="Static"
                                    CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_Zip"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoiced_To_Email %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_EmailAddress" ClientIDMode="Static"
                                    CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_EmailAddress"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Expense_Type %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Expense_Type" ClientIDMode="Static" CssClass="form-control Big_ComboBox" meta:resourcekey="dropdown_Expense_Type"></asp:DropDownList>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ID="validator_dropdown_Expense_Type_Required" ErrorMessage="Please select an expense type"
                                Display="Dynamic" ControlToValidate="dropdown_Expense_Type" CssClass="text-danger"
                                meta:resourcekey="validator_dropdown_Expense_Type_Required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoice_Number %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Number" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Number"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoice_Reference_Number %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Reference_Number" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Reference_Number"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoice_Supplier_Company %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Company_Details" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Supplier_Company_Details"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoice_Supplier_Tax_Ref %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Tax_Reference" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Supplier_Tax_Reference"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoice_Supplier_Country %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Invoice_Supplier_Country" ClientIDMode="Static" AutoPostBack="True"
                                    OnSelectedIndexChanged="dropdown_Invoice_Supplier_Country_SelectedIndexChanged" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Invoice_Supplier_Country">
                                </asp:DropDownList>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ID="validator_dropdown_Invoice_Supplier_Country_Required" ErrorMessage="Please select a country"
                                Display="Dynamic" ControlToValidate="dropdown_Invoice_Supplier_Country" CssClass="text-danger" Enabled="False" meta:resourcekey="validator_dropdown_Invoice_Supplier_Country_Required"></asp:RequiredFieldValidator>
                        </div>

                        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_StateUpdatePanel">
                            <ContentTemplate>
                                <asp:Panel runat="server" ID="p_Invoice_Supplier_State_Wrapper_Panel" class="Form_Group" Visible="False" meta:resourcekey="p_Invoice_Supplier_State_Wrapper_Panel">
                                    <div class="Form_Label_Wrapper">
                                        <label for="<%= dropdown_Invoice_Supplier_State.ClientID %>"><%= Resources.SiteCommon.Invoice_Supplier_State %>:</label>
                                    </div>
                                    <div class="Form_Control">
                                        <asp:DropDownList runat="server" ID="dropdown_Invoice_Supplier_State" ClientIDMode="Static"
                                            CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Invoice_Supplier_State">
                                        </asp:DropDownList>
                                    </div>
                                </asp:Panel>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="dropdown_Invoice_Supplier_Country" />
                            </Triggers>
                        </asp:UpdatePanel>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoice_Supplier_City %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_City" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Supplier_City"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoice_Address_Desc %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Address_Description" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Supplier_Address_Description"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoice_Supplier_ZipCode %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_ZipCode" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Supplier_ZipCode"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoice_Supplier_Web_Address %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_WebAddress" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Supplier_WebAddress"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoice_Supplier_Phone %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Phone_Number" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Supplier_Phone_Number"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Supplier_Contact_Person %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoice_Supplier_Contact_FullName" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Supplier_Contact_FullName"></asp:TextBox>
                            </div>
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
                        <label for=""><%= Resources.SiteCommon.Invoice_Content_Description %>:</label>
                    </div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Content_Long_Description" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control" meta:resourcekey="textbox_Invoice_Content_Long_Description"></asp:TextBox>
                    </div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.User_Description %>:</label>
                    </div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_User_Description" ClientIDMode="Static"
                            TextMode="MultiLine" CssClass="form-control" meta:resourcekey="textbox_User_Description"></asp:TextBox>
                    </div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.User_Comments %>:</label>
                    </div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_User_Comments" ClientIDMode="Static"
                            TextMode="MultiLine" CssClass="form-control" meta:resourcekey="textbox_User_Comments"></asp:TextBox>
                    </div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Is_Visible_To_Public %>?</label>
                    </div>
                    <div class="Form_Control">
                        <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Anonymous_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Visible_To_Anonymous_Users" />
                    </div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Is_Downloadable_To_Public %>?</label>
                    </div>
                    <div class="Form_Control">
                        <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Anonymous_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Available_For_Download_For_Anonymous_Users" />
                    </div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Is_Visible_To_Followers %>?</label>
                    </div>
                    <div class="Form_Control">
                        <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Followers_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Visible_To_Followers_Users" />
                    </div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Can_Followers_Download_File %>?</label>
                    </div>
                    <div class="Form_Control">
                        <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Followers_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Available_For_Download_For_Followers_Users" />
                    </div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Is_Active %>?</label>
                    </div>
                    <div class="Form_Control">
                        <asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="True" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Active" />
                    </div>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="button_Run_Auto_Complete_Based_On_Selected_FileName" />
            </Triggers>
        </asp:UpdatePanel>

        <hr />
        <div>
            <asp:Button runat="server" ID="button_Create_Expense" Text="Create Expense" OnClick="button_Create_Expense_Click" CssClass="btn btn-primary" meta:resourcekey="button_Create_Expense" />
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result" meta:resourcekey="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br />
        <br />
        <br />
        <br />

    </div>

</asp:Content>

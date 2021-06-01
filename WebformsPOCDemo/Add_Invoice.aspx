<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_Invoice.aspx.cs" Inherits="WebformsPOCDemo.Add_Invoice" Culture="auto" meta:resourcekey="Page" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5">Add Invoice</h2>
        <p class="lead">The advanced way to keep track on all your invoices.</p>
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
                <label for="<%= fileUpload_Invoice_File.ClientID %>"><%= Resources.SiteCommon.Upload_File %>:</label>
            </div>
            <div class="Form_Control">
                <asp:FileUpload runat="server" ID="fileUpload_Invoice_File" ClientIDMode="Static" CssClass="form-control" onchange="Run_Auto_Complete_Helper_On_Uploaded_File_Name(this)" meta:resourcekey="fileUpload_Expense_File" />
                <asp:HiddenField runat="server" ClientIDMode="Static" ID="hidden_Uploading_FileName_For_AutoComplete_Helper" />
                <asp:Button runat="server" ID="button_Run_Auto_Complete_Based_On_Selected_FileName" ClientIDMode="Static"
                    OnClick="Button_Run_Auto_Complete_Based_On_Selected_FileName_Click" CausesValidation="False" Style="display: none" meta:resourcekey="button_Run_Auto_Complete_Based_On_Selected_FileName" />
            </div>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="UpdatePanel1">
            <ContentTemplate>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label style="font-weight: bold" for="<%= textbox_Invoice_DateTime.ClientID %>"><%= Resources.SiteCommon.Invoice_Date %>:</label>
                    </div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_DateTime" autocomplete="nope" ClientIDMode="Static"
                            CssClass="form-control InitializeDatePicker" AutoPostBack="True" OnTextChanged="textbox_Invoice_DateTime_TextChanged" meta:resourcekey="textbox_Invoice_DateTime"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Invoice_DateTime_Required" ErrorMessage="Please enter an invoice date" Display="Dynamic" ControlToValidate="textbox_Invoice_DateTime" CssClass="text-danger" meta:resourcekey="validator_Invoice_DateTime_Required"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Invoice_Time_Hours.ClientID %>"><%= Resources.SiteCommon.Invoice_Time %>:</label>
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
                                <label for="<%= dropdown_Client.ClientID %>"><%= Resources.SiteCommon.Client %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Client" ClientIDMode="Static" AutoPostBack="True"
                                    OnSelectedIndexChanged="dropdown_Client_SelectedIndexChanged" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Client">
                                </asp:DropDownList>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Client_Required" ErrorMessage="Please select a client" Display="Dynamic" ControlToValidate="dropdown_Client" CssClass="text-danger" meta:resourcekey="validator_Client_Required"></asp:RequiredFieldValidator>
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
                                <label for=""><%= Resources.SiteCommon.Invoice_Type %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Invoice_Type" ClientIDMode="Static" 
                                    OnSelectedIndexChanged="dropdown_Invoice_Type_SelectedIndexChanged" AutoPostBack="true"
                                    CssClass="form-control Big_ComboBox" meta:resourcekey="dropdown_Invoice_Type"></asp:DropDownList>
                            </div>
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
                                <label for=""><%= Resources.SiteCommon.Currency %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control" meta:resourcekey="dropdown_Currency"></asp:DropDownList>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Currency_Required" ErrorMessage="Please select a currency" Display="Dynamic" ControlToValidate="dropdown_Currency" CssClass="text-danger" meta:resourcekey="validator_Currency_Required"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Total_Amount %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Total_Amount" ClientIDMode="Static" CssClass="form-control"
                                    OnTextChanged="textbox_Total_Amount_TextChanged" AutoPostBack="true"
                                    meta:resourcekey="textbox_Total_Amount"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Total_Amount_Required" ErrorMessage="Please enter total amount" Display="Dynamic"
                                ControlToValidate="textbox_Total_Amount" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Vat_Percentage_Text %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Vat_Percentage" ClientIDMode="Static" CssClass="form-control" 
                                    OnTextChanged="textbox_Vat_Percentage_TextChanged" AutoPostBack="true"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Vat_Percentage_Required" ErrorMessage="Please enter vat percentage" Display="Dynamic"
                                ControlToValidate="textbox_Vat_Percentage" CssClass="text-danger" meta:resourcekey="validator_Vat_Percentage_Required"></asp:RequiredFieldValidator>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Total_Without_Vat %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Total_Without_Vat" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Total_Without_Vat"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ID="validator_Total_Without_Vat_Required" ErrorMessage="Please enter total amount without vat" Display="Dynamic"
                                ControlToValidate="textbox_Total_Without_Vat" CssClass="text-danger" meta:resourcekey="validator_Total_Without_Vat_Required"></asp:RequiredFieldValidator>
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

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label style="font-weight: bold" for=""><%= Resources.SiteCommon.Creation_Date %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Creation_DateTime" ClientIDMode="Static" autocomplete="nope"
                                    CssClass="form-control InitializeDatePicker" meta:resourcekey="textbox_Creation_DateTime"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Creation_Time %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Invoice_Creation_Time_Hours" ClientIDMode="Static"
                                    CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Invoice_Creation_Time_Hours">
                                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Creation_Time_Minutes"
                                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Invoice_Creation_Time_Minutes">
                                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Creation_Time_Seconds"
                                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Invoice_Creation_Time_Seconds">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="Form_Group">
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
                                <label for=""><%= Resources.SiteCommon.Invoiced_Client_Tax_Reference %>:</label>
                            </div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_To_Tax_Reference" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_To_Tax_Reference"></asp:TextBox>
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
                                        <label for="<%= dropdown_Invoiced_Client_To_State.ClientID %>"><%= Resources.SiteCommon.Invoiced_For_State %>:</label></div>
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
                                <label for=""><%= Resources.SiteCommon.Invoiced_To_City %>:</label></div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_City" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_City"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoiced_To_Address %>:</label></div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Address" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_Address"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoiced_To_Zip_Code %>:</label></div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Zip" ClientIDMode="Static"
                                    CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_Zip"></asp:TextBox>
                            </div>
                        </div>

                        <div class="Form_Group">
                            <div class="Form_Label_Wrapper">
                                <label for=""><%= Resources.SiteCommon.Invoiced_To_Email %>:</label></div>
                            <div class="Form_Control">
                                <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_EmailAddress" ClientIDMode="Static"
                                    CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_EmailAddress"></asp:TextBox>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dropdown_Client" />
                        <asp:AsyncPostBackTrigger ControlID="textbox_Invoice_DateTime" />
                        <asp:AsyncPostBackTrigger ControlID="dropdown_Invoice_Type" />
                        <asp:AsyncPostBackTrigger ControlID="textbox_Total_Amount" />
                        <asp:AsyncPostBackTrigger ControlID="textbox_Vat_Percentage" />
                    </Triggers>
                </asp:UpdatePanel>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Invoice_Content_Long_Description.ClientID %>"><%= Resources.SiteCommon.Invoice_Content_Description %>:</label>
                    </div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Content_Long_Description" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control" meta:resourcekey="textbox_Invoice_Content_Long_Description"></asp:TextBox>
                    </div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_User_Description.ClientID %>"><%= Resources.SiteCommon.User_Description %>:</label>
                    </div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_User_Description" ClientIDMode="Static"
                            TextMode="MultiLine" CssClass="form-control" meta:resourcekey="textbox_User_Description"></asp:TextBox>
                    </div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_User_Comments.ClientID %>"><%= Resources.SiteCommon.User_Comments %>:</label>
                    </div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_User_Comments" ClientIDMode="Static"
                            TextMode="MultiLine" CssClass="form-control" meta:resourcekey="textbox_User_Comments"></asp:TextBox>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="button_Run_Auto_Complete_Based_On_Selected_FileName" />
            </Triggers>
        </asp:UpdatePanel>


        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Original_File_Name.ClientID %>"><%= Resources.SiteCommon.Filename %>:</label>
            </div>
            <div class="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Original_File_Name" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Original_File_Name"></asp:TextBox>
            </div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Anonymous_Users.ClientID %>"><%= Resources.SiteCommon.Is_Visible_To_Public %>?</label>
            </div>
            <div class="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Anonymous_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Visible_To_Anonymous_Users" />
            </div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Anonymous_Users.ClientID %>"><%= Resources.SiteCommon.Is_Downloadable_To_Public %>?</label>
            </div>
            <div class="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Anonymous_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Available_For_Download_For_Anonymous_Users" />
            </div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Followers_Users.ClientID %>"><%= Resources.SiteCommon.Is_Visible_To_Followers %>?</label>
            </div>
            <div class="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Followers_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Visible_To_Followers_Users" />
            </div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Available_For_Download_For_Followers_Users.ClientID %>"><%= Resources.SiteCommon.Can_Followers_Download_File %>?</label>
            </div>
            <div class="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Followers_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Available_For_Download_For_Followers_Users" />
            </div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Active.ClientID %>"><%= Resources.SiteCommon.Is_Active %>?</label>
            </div>
            <div class="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="True" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Active" />
            </div>
        </div>

        <hr />
        <div>
            <asp:Button runat="server" ID="button_Create_Invoice" Text="Create Invoice" OnClick="button_Create_Invoice_Click" CssClass="btn btn-primary" meta:resourcekey="button_Create_Invoice" />
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result" meta:resourcekey="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br />
        <br />

    </div>

</asp:Content>

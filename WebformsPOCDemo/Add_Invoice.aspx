﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_Invoice.aspx.cs" Inherits="WebformsPOCDemo.Add_Invoice" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5">Add Invoice</h2>
        <p class="lead">The advanced way to keep track on all your invoices.</p>
    </div>

    <hr />

    <div>

        <asp:Panel runat="server" ID="panel_User_Selection" CssClass="Form_Group" meta:resourcekey="panel_User_SelectionResource1">
            <div class="Form_Label_Wrapper">
                <label style="font-weight: bold" for="<%= dropdown_User_Selection.ClientID %>"><%= Resources.SiteCommon.User %>:</label></div>
            <div class="Form_Control">
            <asp:DropDownList runat="server" ID="dropdown_User_Selection" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="dropdown_User_SelectedIndexChanged" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_User_SelectionResource1"></asp:DropDownList></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_User_Selection_Required" ErrorMessage="Please select an user" Display="Dynamic" ControlToValidate="dropdown_User_Selection" CssClass="text-danger" meta:resourcekey="validator_User_Selection_RequiredResource1"></asp:RequiredFieldValidator>
        </asp:Panel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label style="font-weight: bold" for="<%= textbox_Invoice_DateTime.ClientID %>"><%= Resources.SiteCommon.Invoice_Date %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Invoice_DateTime" autocomplete="nope" ClientIDMode="Static" 
                CssClass="form-control InitializeDatePicker" AutoPostBack="True" OnTextChanged="textbox_Invoice_DateTime_TextChanged" meta:resourcekey="textbox_Invoice_DateTimeResource1"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Invoice_DateTime_Required" ErrorMessage="Please enter an invoice date" Display="Dynamic" ControlToValidate="textbox_Invoice_DateTime" CssClass="text-danger" meta:resourcekey="validator_Invoice_DateTime_RequiredResource1"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Invoice_Time_Hours.ClientID %>"><%= Resources.SiteCommon.Invoice_Time %>:</label></div>
            <div class="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Hours" ClientIDMode="Static"
                    CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Invoice_Time_HoursResource1">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Minutes"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Invoice_Time_MinutesResource1">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Time_Seconds"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Invoice_Time_SecondsResource1">
                </asp:DropDownList>
            </div>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Supplier">
            <ContentTemplate>
                <asp:Panel runat="server" ID="panel_Supplier_Selection" CssClass="Form_Group" meta:resourcekey="panel_Supplier_SelectionResource1">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Client.ClientID %>"><%= Resources.SiteCommon.Client %>:</label></div>
                    <div class="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Client" ClientIDMode="Static" AutoPostBack="True" 
                            OnSelectedIndexChanged="dropdown_Client_SelectedIndexChanged" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_ClientResource1"></asp:DropDownList></div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Client_Required" ErrorMessage="Please select a client" Display="Dynamic" ControlToValidate="dropdown_Client" CssClass="text-danger" meta:resourcekey="validator_Client_RequiredResource1"></asp:RequiredFieldValidator>
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
                        <label for=""><%= Resources.SiteCommon.Currency %>:</label></div>
                    <div class="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Currency" ClientIDMode="Static" CssClass="Regular_ComboBox form-control" meta:resourcekey="dropdown_CurrencyResource1"></asp:DropDownList></div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Currency_Required" ErrorMessage="Please select a currency" Display="Dynamic" ControlToValidate="dropdown_Currency" CssClass="text-danger" meta:resourcekey="validator_Currency_RequiredResource1"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Total_Amount %>:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Total_Amount" ClientIDMode="Static" CssClass="form-control"
                             onchange="Update_Totals_Based_On_Total_Amount_Entry();" meta:resourcekey="textbox_Total_AmountResource1"></asp:TextBox></div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Total_Amount_Required" ErrorMessage="Please enter total amount" Display="Dynamic"
                        ControlToValidate="textbox_Total_Amount" CssClass="text-danger" meta:resourcekey="validator_Total_Amount_RequiredResource1"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Vat_Percentage_Text %>:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Vat_Percentage" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Vat_PercentageResource1"></asp:TextBox></div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Vat_Percentage_Required" ErrorMessage="Please enter vat percentage" Display="Dynamic"
                        ControlToValidate="textbox_Vat_Percentage" CssClass="text-danger" meta:resourcekey="validator_Vat_Percentage_RequiredResource1"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Total_Without_Vat %>:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Total_Without_Vat" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Total_Without_VatResource1"></asp:TextBox></div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Total_Without_Vat_Required" ErrorMessage="Please enter total amount without vat" Display="Dynamic"
                        ControlToValidate="textbox_Total_Without_Vat" CssClass="text-danger" meta:resourcekey="validator_Total_Without_Vat_RequiredResource1"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Total_Vat %>:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Total_Vat" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Total_VatResource1"></asp:TextBox></div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Total_Vat_Required" ErrorMessage="Please enter total vat amount" Display="Dynamic"
                        ControlToValidate="textbox_Total_Vat" CssClass="text-danger" meta:resourcekey="validator_Total_Vat_RequiredResource1"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label style="font-weight: bold" for=""><%= Resources.SiteCommon.Creation_Date %>:</label></div>
                    <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Creation_DateTime" ClientIDMode="Static" autocomplete="nope"
                        CssClass="form-control InitializeDatePicker" meta:resourcekey="textbox_Creation_DateTimeResource1"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Creation_Time %>:</label></div>
                    <div class="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Invoice_Creation_Time_Hours" ClientIDMode="Static"
                            CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Invoice_Creation_Time_HoursResource1">
                        </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Creation_Time_Minutes"
                            ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Invoice_Creation_Time_MinutesResource1">
                        </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Invoice_Creation_Time_Seconds"
                            ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Invoice_Creation_Time_SecondsResource1">
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Invoiced_On_Location %>:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_On_User_Location_Id" ClientIDMode="Static" Enabled="False" CssClass="form-control" meta:resourcekey="textbox_Invoiced_On_User_Location_IdResource1"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Invoiced_To_Company %>:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_To_CompanyName" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_To_CompanyNameResource1"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Invoiced_Client_Tax_Reference %>:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_To_Tax_Reference" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_To_Tax_ReferenceResource1"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Invoiced_To_Person_Name %>:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_To_PersonName" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_To_PersonNameResource1"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Invoiced_To_Phone %>:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_PhoneNumber" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_PhoneNumberResource1"></asp:TextBox></div>
                </div>

                <div class="Form_Group" >
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Invoiced_For_Country %>:</label></div>
                    <div class="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Invoiced_Client_To_Country" ClientIDMode="Static"
                            CssClass="Big_ComboBox form-control" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Invoiced_Client_To_Country_SelectedIndexChanged" meta:resourcekey="dropdown_Invoiced_Client_To_CountryResource1">
                        </asp:DropDownList>
                    </div>
                </div>

                <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Invoice">
                    <ContentTemplate>
                        <asp:Panel runat="server" ID="p_Invoiced_Client_To_State_Wrapper_Panel" class="Form_Group" Visible="False" meta:resourcekey="p_Invoiced_Client_To_State_Wrapper_PanelResource1">
                            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Invoiced_Client_To_State.ClientID %>"><%= Resources.SiteCommon.Invoiced_For_State %>:</label></div>
                            <div class="Form_Control">
                                <asp:DropDownList runat="server" ID="dropdown_Invoiced_Client_To_State" ClientIDMode="Static"
                                    CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Invoiced_Client_To_StateResource1">
                                </asp:DropDownList>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dropdown_Invoiced_Client_To_Country" />
                    </Triggers>
                </asp:UpdatePanel>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper"><label for=""><%= Resources.SiteCommon.Invoiced_To_City %>:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_City" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_CityResource1"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper"><label for=""><%= Resources.SiteCommon.Invoiced_To_Address %>:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Address" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_AddressResource1"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper"><label for=""><%= Resources.SiteCommon.Invoiced_To_Zip_Code %>:</label></div>
                    <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_Zip" ClientIDMode="Static" 
                        CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_ZipResource1"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper"><label for=""><%= Resources.SiteCommon.Invoiced_To_Email %>:</label></div>
                    <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Invoiced_Client_To_EmailAddress" ClientIDMode="Static" 
                        CssClass="form-control" meta:resourcekey="textbox_Invoiced_Client_To_EmailAddressResource1"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Invoice_Type %>:</label></div>
                    <div class="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Invoice_Type" ClientIDMode="Static" CssClass="form-control Big_ComboBox" meta:resourcekey="dropdown_Invoice_TypeResource1"></asp:DropDownList></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Invoice_Number %>:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Number" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_NumberResource1"></asp:TextBox></div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for=""><%= Resources.SiteCommon.Invoice_Reference_Number %>:</label></div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Invoice_Reference_Number" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Invoice_Reference_NumberResource1"></asp:TextBox></div>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="dropdown_Client" />
                <asp:AsyncPostBackTrigger ControlID="textbox_Invoice_DateTime" />
            </Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Invoice_Content_Long_Description.ClientID %>"><%= Resources.SiteCommon.Invoice_Content_Description %>:</label></div>
            <div class="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Invoice_Content_Long_Description" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control" meta:resourcekey="textbox_Invoice_Content_Long_DescriptionResource1"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_User_Description.ClientID %>"><%= Resources.SiteCommon.User_Description %>:</label></div>
            <div class="Form_Control">
                <asp:TextBox runat="server" ID="textbox_User_Description" ClientIDMode="Static"
                    TextMode="MultiLine" CssClass="form-control" meta:resourcekey="textbox_User_DescriptionResource1"></asp:TextBox>
            </div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_User_Comments.ClientID %>"><%= Resources.SiteCommon.User_Comments %>:</label></div>
            <div class="Form_Control">
                <asp:TextBox runat="server" ID="textbox_User_Comments" ClientIDMode="Static"
                    TextMode="MultiLine" CssClass="form-control" meta:resourcekey="textbox_User_CommentsResource1"></asp:TextBox>
            </div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Original_File_Name.ClientID %>"><%= Resources.SiteCommon.Filename %>:</label></div>
            <div class="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Original_File_Name" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Original_File_NameResource1"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Anonymous_Users.ClientID %>"><%= Resources.SiteCommon.Is_Visible_To_Public %>?</label></div>
            <div class="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Anonymous_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Visible_To_Anonymous_UsersResource1" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Anonymous_Users.ClientID %>"><%= Resources.SiteCommon.Is_Downloadable_To_Public %>?</label></div>
            <div class="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Anonymous_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Available_For_Download_For_Anonymous_UsersResource1" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Visible_To_Followers_Users.ClientID %>"><%= Resources.SiteCommon.Is_Visible_To_Followers %>?</label></div>
            <div class="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Followers_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Visible_To_Followers_UsersResource1" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Available_For_Download_For_Followers_Users.ClientID %>"><%= Resources.SiteCommon.Can_Followers_Download_File %>?</label></div>
            <div class="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Followers_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Available_For_Download_For_Followers_UsersResource1" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= checkbox_Is_Active.ClientID %>"><%= Resources.SiteCommon.Is_Active %>?</label></div>
            <div class="Form_Control">
                <asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="True" ClientIDMode="Static" meta:resourcekey="checkbox_Is_ActiveResource1" /></div>
        </div>

        <hr />
        <div>
            <asp:Button runat="server" ID="button_Create_Invoice" Text="Create Invoice" OnClick="button_Create_Invoice_Click" CssClass="btn btn-primary" meta:resourcekey="button_Create_InvoiceResource1" />
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result" meta:resourcekey="lbl_Insert_Process_Error_ResultResource1"></asp:Label>
        </div>
        <br />
        <br />

    </div>

</asp:Content>

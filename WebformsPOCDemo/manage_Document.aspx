<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_Document.aspx.cs" Inherits="WebformsPOCDemo.manage_Document" culture="auto" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5"><% = Resources.SiteCommon.Manage_Document_Title %></h2>
        <p class="lead"><% = Resources.SiteCommon.Manage_Document_SubTitle %></p>
    </div>

    <hr />

    <div>

        <asp:Panel runat="server" ID="panel_General_Document_Type_Selection" CssClass="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_General_Document_Type.ClientID %>"><% = Resources.SiteCommon.Document_Type %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_General_Document_Type" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_General_Document_Type" ClientIDMode="Static" CssClass="form-control Regular_ComboBox">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_General_Document_Type" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_General_Document_Type"></asp:Label>
            </asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Document_Type_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Document_Type_Required %>"
                Display="Dynamic" ControlToValidate="dropdown_General_Document_Type" CssClass="text-danger"></asp:RequiredFieldValidator>
        </asp:Panel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Document_Creation_Date.ClientID %>"><% = Resources.SiteCommon.Document_Creation_Date %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Document_Creation_Date" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Document_Creation_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Document_Creation_Date" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Document_Creation_Date"></asp:Label>
            </asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Document_Creation_Date_Required" ErrorMessage="<%$ Resources:SiteCommon, Validator_Document_Creation_Date_Required %>" Display="Dynamic"
                ControlToValidate="textbox_Document_Creation_Date" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Document_Creation_Time_Hours.ClientID %>"><% = Resources.SiteCommon.Document_Creation_Time %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Document_Creation_Time" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Document_Creation_Time_Hours" ClientIDMode="Static"
                    CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Document_Creation_Time_Minutes"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Document_Creation_Time_Seconds"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Document_Creation_Time" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Document_Creation_Time"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Title.ClientID %>"><% = Resources.SiteCommon.Title %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Title" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Title" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Title" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Title"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Description.ClientID %>"><% = Resources.SiteCommon.Description %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Description" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Description" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Description" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Description"></asp:Label>
            </asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_By_Entity_Name.ClientID %>"><% = Resources.SiteCommon.Sent_From %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_By_Entity_Name" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_By_Entity_Name" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_By_Entity_Name" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_By_Entity_Name"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Sent_By_Entity_Country.ClientID %>"><% = Resources.SiteCommon.Sent_From_Country %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_By_Entity_Country" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Sent_By_Entity_Country" ClientIDMode="Static"
                    CssClass="Big_ComboBox form-control" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Sent_By_Entity_Country_SelectedIndexChanged">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_By_Entity_Country" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_By_Entity_Country"></asp:Label>
            </asp:Panel>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Sent_By_Entity_State">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_Sent_By_Entity_State_Wrapper_Panel" class="Form_Group" Visible="False">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Sent_By_Entity_State.ClientID %>"><% = Resources.SiteCommon.Sent_From_State %>:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_By_Entity_State" CssClass="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Sent_By_Entity_State" ClientIDMode="Static"
                            CssClass="Big_ComboBox form-control">
                        </asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_By_Entity_State" Visible="False" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Sent_By_Entity_State"></asp:Label>
                    </asp:Panel>
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="dropdown_Sent_By_Entity_Country" />
            </Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_By_Entity_City.ClientID %>"><% = Resources.SiteCommon.Sent_From_City %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_By_Entity_City" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_By_Entity_City" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_By_Entity_City" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_By_Entity_City"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_By_Entity_Address.ClientID %>"><% = Resources.SiteCommon.Sent_From_Address %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_By_Entity_Address" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_By_Entity_Address" ClientIDMode="Static"
                    CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_By_Entity_Address" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_By_Entity_Address"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_By_Entity_ZipCode.ClientID %>"><% = Resources.SiteCommon.Sent_From_ZipCode %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_By_Entity_ZipCode" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_By_Entity_ZipCode" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_By_Entity_ZipCode" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_By_Entity_ZipCode"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_By_Entity_DateTime.ClientID %>"><% = Resources.SiteCommon.Sending_Date %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_By_Entity_DateTime" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_By_Entity_DateTime" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_By_Entity_DateTime" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_By_Entity_DateTime"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Sent_By_Entity_Time_Hours.ClientID %>"><% = Resources.SiteCommon.Sending_Time %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_By_Entity_Time" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Sent_By_Entity_Time_Hours" ClientIDMode="Static"
                    CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Sent_By_Entity_Time_Minutes"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Sent_By_Entity_Time_Seconds"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_By_Entity_Time" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_By_Entity_Time"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_By_Entity_Email_Address.ClientID %>"><% = Resources.SiteCommon.Sent_From_Email_Address %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_By_Entity_Email_Address" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_By_Entity_Email_Address" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_By_Entity_Email_Address" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_By_Entity_Email_Address"></asp:Label>
            </asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_To_Entity_Name.ClientID %>"><% = Resources.SiteCommon.Sent_To %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_To_Entity_Name" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_To_Entity_Name" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_To_Entity_Name" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_To_Entity_Name"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Sent_To_Entity_Country.ClientID %>"><% = Resources.SiteCommon.Sent_To_Country %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_To_Entity_Country" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Sent_To_Entity_Country" ClientIDMode="Static"
                    CssClass="Big_ComboBox form-control" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Sent_To_Entity_Country_SelectedIndexChanged">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_To_Entity_Country" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_To_Entity_Country"></asp:Label>
            </asp:Panel>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Sent_To_Entity_State">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_Sent_To_Entity_State_Wrapper_Panel" class="Form_Group" Visible="False">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Sent_To_Entity_State.ClientID %>"><% = Resources.SiteCommon.Sent_To_State %>:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_To_Entity_State" CssClass="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Sent_To_Entity_State" ClientIDMode="Static"
                            CssClass="Big_ComboBox form-control">
                        </asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_To_Entity_State" Visible="False" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Sent_To_Entity_State"></asp:Label>
                    </asp:Panel>
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="dropdown_Sent_To_Entity_Country" />
            </Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_To_Entity_City.ClientID %>"><% = Resources.SiteCommon.Sent_To_City %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_To_Entity_City" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_To_Entity_City" ClientIDMode="Static"
                    CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_To_Entity_City" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_To_Entity_City"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_To_Entity_Address.ClientID %>"><% = Resources.SiteCommon.Sent_To_Address %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_To_Entity_Address" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_To_Entity_Address"
                    ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_To_Entity_Address" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_To_Entity_Address"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_To_Entity_ZipCode.ClientID %>"><% = Resources.SiteCommon.Sent_To_ZipCode %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_To_Entity_ZipCode" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_To_Entity_ZipCode" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_To_Entity_ZipCode" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_To_Entity_ZipCode"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_To_Entity_Email_Address.ClientID %>"><% = Resources.SiteCommon.Sent_To_Email %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_To_Entity_Email_Address" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_To_Entity_Email_Address" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_To_Entity_Email_Address" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_To_Entity_Email_Address"></asp:Label>
            </asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Recieved_Document_DateTime.ClientID %>"><% = Resources.SiteCommon.Recieved_Document_Date %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_Document_DateTime" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Recieved_Document_DateTime" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="nope"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_Document_DateTime" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_Document_DateTime"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Recieved_Document_Time_Hours.ClientID %>"><% = Resources.SiteCommon.Recieved_Document_Time %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_Document_Time" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Recieved_Document_Time_Hours" ClientIDMode="Static"
                    CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Recieved_Document_Time_Minutes"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Recieved_Document_Time_Seconds"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_Document_Time" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_Document_Time"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Recieved_In_Country.ClientID %>"><% = Resources.SiteCommon.Recieved_In_Country %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_In_Country" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Recieved_In_Country" ClientIDMode="Static" AutoPostBack="True"
                    OnSelectedIndexChanged="dropdown_Recieved_In_Country_SelectedIndexChanged" CssClass="Big_ComboBox form-control">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_In_Country" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_In_Country"></asp:Label>
            </asp:Panel>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Recieved_In_State_UpdatePanel">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_Recieved_In_State_Wrapper_Panel" class="Form_Group" Visible="False">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Recieved_In_State.ClientID %>"><% = Resources.SiteCommon.Recieved_In_State %>:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_In_State" CssClass="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Recieved_In_State" ClientIDMode="Static" CssClass="Big_ComboBox form-control">
                        </asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_In_State" Visible="False" CssClass="Form_Control Read_Only_Panel">
                        <asp:Label runat="server" ID="label_Recieved_In_State"></asp:Label>
                    </asp:Panel>
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="dropdown_Recieved_In_Country" />
            </Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Recieved_In_City.ClientID %>"><% = Resources.SiteCommon.Recieved_In_City %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_In_City" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Recieved_In_City" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_In_City" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_In_City"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Recieved_In_Address.ClientID %>"><% = Resources.SiteCommon.Recieved_In_Address %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_In_Address" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Recieved_In_Address" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_In_Address" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_In_Address"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Recieved_In_ZipCode.ClientID %>"><% = Resources.SiteCommon.Recieved_In_ZipCode %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_In_ZipCode" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Recieved_In_ZipCode"
                    ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_In_ZipCode" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_In_ZipCode"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Recieved_In_Email_Address.ClientID %>"><% = Resources.SiteCommon.Recieved_In_Email %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_In_Email_Address" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Recieved_In_Email_Address" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_In_Email_Address" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_In_Email_Address"></asp:Label>
            </asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_User_Comments.ClientID %>"><% = Resources.SiteCommon.Comments %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_User_Comments" CssClass="Form_Control">
                <asp:TextBox
                    runat="server" ID="textbox_User_Comments" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_User_Comments" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_User_Comments"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Recieved_By_User.ClientID %>"><% = Resources.SiteCommon.Recieved_By_User %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_By_User" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Recieved_By_User" ClientIDMode="Static"
                    CssClass="Big_ComboBox form-control">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_By_User" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_By_User"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Recieved_DateTime.ClientID %>"><% = Resources.SiteCommon.Recieved_Date %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_DateTime" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Recieved_DateTime" ClientIDMode="Static"
                    CssClass="form-control InitializeDatePicker" autocomplete="nope"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_DateTime" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_DateTime"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Recieved_Time_Hours.ClientID %>"><% = Resources.SiteCommon.Recieved_Document_Time %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_Time" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Recieved_Time_Hours" ClientIDMode="Static"
                    CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Recieved_Time_Minutes"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Recieved_Time_Seconds"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_Time" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_Time"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Original_File_Name.ClientID %>"><% = Resources.SiteCommon.Filename %>:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Original_File_Name" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Original_File_Name" ClientIDMode="Static"
                    CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Original_File_Name" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Original_File_Name"></asp:Label>
            </asp:Panel>
        </div>

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
                <asp:Label runat="server" ID="label_Is_Active"></asp:Label>
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
            <asp:Button runat="server" ID="button_Edit_Document_Details"
                Text="<%$ Resources:SiteCommon, Manage_Document_Edit_Button %>" OnClick="button_Edit_Document_Details_Click" CausesValidation="False" CssClass="btn btn-primary" />
            <asp:Button runat="server" ID="button_Update_Document_Details"
                Text="<%$ Resources:SiteCommon, Manage_Document_Save_Changes %>" OnClick="button_Update_Document_Details_Click" CssClass="btn btn-success" />
            <asp:Button runat="server" ID="button_CancelEdit_Document_Details"
                Text="<%$ Resources:SiteCommon, Manage_Document_Cancel_Editing %>" OnClick="button_CancelEdit_Document_Details_Click" CausesValidation="False" CssClass="btn btn-danger" />
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

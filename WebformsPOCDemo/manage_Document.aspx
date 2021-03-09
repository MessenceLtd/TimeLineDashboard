<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_Document.aspx.cs" Inherits="WebformsPOCDemo.manage_Document" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5">Manage Document</h2>
        <p class="lead">Change and add more details for your documents.</p>
    </div>

    <hr />

    <div>

        <asp:Panel runat="server" ID="panel_General_Document_Type_Selection" CssClass="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_General_Document_Type.ClientID %>">Document type:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_General_Document_Type" Visible="true" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_General_Document_Type" ClientIDMode="Static" CssClass="form-control Regular_ComboBox">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_General_Document_Type" runat="server" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_General_Document_Type"></asp:Label>
            </asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Document_Type_Required" ErrorMessage="Please select a document type"
                Display="Dynamic" ControlToValidate="dropdown_General_Document_Type" CssClass="text-danger"></asp:RequiredFieldValidator>
        </asp:Panel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Document_Creation_Date.ClientID %>">Document Creation Date:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Document_Creation_Date" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Document_Creation_Date" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="Off"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Document_Creation_Date" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Document_Creation_Date"></asp:Label>
            </asp:Panel>
            <asp:RequiredFieldValidator runat="server" ID="validator_Document_Creation_Date_Required" ErrorMessage="Please enter a document date" Display="Dynamic"
                ControlToValidate="textbox_Document_Creation_Date" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Document_Creation_Time_Hours.ClientID %>">Document Creation Time:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Document_Creation_Time" Visible="true" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Document_Creation_Time_Hours" ClientIDMode="Static"
                    CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Document_Creation_Time_Minutes"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Document_Creation_Time_Seconds"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Document_Creation_Time" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Document_Creation_Time"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Title.ClientID %>">Title:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Title" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Title" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Title" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Title"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Description.ClientID %>">Description:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Description" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Description" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Description" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Description"></asp:Label>
            </asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_By_Entity_Name.ClientID %>">Sent From:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_By_Entity_Name" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_By_Entity_Name" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_By_Entity_Name" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_By_Entity_Name"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Sent_By_Entity_Country.ClientID %>">Sent From Country:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_By_Entity_Country" Visible="true" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Sent_By_Entity_Country" ClientIDMode="Static"
                    CssClass="Big_ComboBox form-control" AutoPostBack="true" OnSelectedIndexChanged="dropdown_Sent_By_Entity_Country_SelectedIndexChanged">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_By_Entity_Country" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_By_Entity_Country"></asp:Label>
            </asp:Panel>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Sent_By_Entity_State">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_Sent_By_Entity_State_Wrapper_Panel" class="Form_Group" Visible="false">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Sent_By_Entity_State.ClientID %>">Sent From State:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_By_Entity_State" Visible="true" CssClass="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Sent_By_Entity_State" ClientIDMode="Static"
                            CssClass="Big_ComboBox form-control">
                        </asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_By_Entity_State" Visible="false" CssClass="Form_Control Read_Only_Panel">
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
                <label for="<%= textbox_Sent_By_Entity_City.ClientID %>">Sent From City:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_By_Entity_City" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_By_Entity_City" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_By_Entity_City" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_By_Entity_City"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_By_Entity_Address.ClientID %>">Sent From Address:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_By_Entity_Address" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_By_Entity_Address" ClientIDMode="Static"
                    CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_By_Entity_Address" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_By_Entity_Address"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_By_Entity_ZipCode.ClientID %>">Sent From ZipCode:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_By_Entity_ZipCode" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_By_Entity_ZipCode" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_By_Entity_ZipCode" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_By_Entity_ZipCode"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_By_Entity_DateTime.ClientID %>">Sending Date:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_By_Entity_DateTime" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_By_Entity_DateTime" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="Off"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_By_Entity_DateTime" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_By_Entity_DateTime"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Sent_By_Entity_Time_Hours.ClientID %>">Sending Time:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_By_Entity_Time" Visible="true" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Sent_By_Entity_Time_Hours" ClientIDMode="Static"
                    CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Sent_By_Entity_Time_Minutes"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Sent_By_Entity_Time_Seconds"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_By_Entity_Time" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_By_Entity_Time"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_By_Entity_Email_Address.ClientID %>">Sent From Email Address:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_By_Entity_Email_Address" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_By_Entity_Email_Address" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_By_Entity_Email_Address" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_By_Entity_Email_Address"></asp:Label>
            </asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_To_Entity_Name.ClientID %>">Sent To:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_To_Entity_Name" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_To_Entity_Name" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_To_Entity_Name" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_To_Entity_Name"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Sent_To_Entity_Country.ClientID %>">Sent To Country:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_To_Entity_Country" Visible="true" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Sent_To_Entity_Country" ClientIDMode="Static"
                    CssClass="Big_ComboBox form-control" AutoPostBack="true" OnSelectedIndexChanged="dropdown_Sent_To_Entity_Country_SelectedIndexChanged">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_To_Entity_Country" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_To_Entity_Country"></asp:Label>
            </asp:Panel>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Sent_To_Entity_State">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_Sent_To_Entity_State_Wrapper_Panel" class="Form_Group" Visible="false">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Sent_To_Entity_State.ClientID %>">Sent To State:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_To_Entity_State" Visible="true" CssClass="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Sent_To_Entity_State" ClientIDMode="Static"
                            CssClass="Big_ComboBox form-control">
                        </asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_To_Entity_State" Visible="false" CssClass="Form_Control Read_Only_Panel">
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
                <label for="<%= textbox_Sent_To_Entity_City.ClientID %>">Sent To City:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_To_Entity_City" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_To_Entity_City" ClientIDMode="Static"
                    CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_To_Entity_City" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_To_Entity_City"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_To_Entity_Address.ClientID %>">Sent To Address:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_To_Entity_Address" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_To_Entity_Address"
                    ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_To_Entity_Address" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_To_Entity_Address"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_To_Entity_ZipCode.ClientID %>">Sent To ZipCode:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_To_Entity_ZipCode" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_To_Entity_ZipCode" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_To_Entity_ZipCode" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_To_Entity_ZipCode"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Sent_To_Entity_Email_Address.ClientID %>">Sent To Email:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Sent_To_Entity_Email_Address" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Sent_To_Entity_Email_Address" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Sent_To_Entity_Email_Address" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Sent_To_Entity_Email_Address"></asp:Label>
            </asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Recieved_Document_DateTime.ClientID %>">Recieved Document Date:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_Document_DateTime" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Recieved_Document_DateTime" ClientIDMode="Static" CssClass="form-control InitializeDatePicker" autocomplete="Off"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_Document_DateTime" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_Document_DateTime"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Recieved_Document_Time_Hours.ClientID %>">Recieved Document Time:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_Document_Time" Visible="true" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Recieved_Document_Time_Hours" ClientIDMode="Static"
                    CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Recieved_Document_Time_Minutes"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Recieved_Document_Time_Seconds"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_Document_Time" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_Document_Time"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Recieved_In_Country.ClientID %>">Recieved In Country:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_In_Country" Visible="true" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Recieved_In_Country" ClientIDMode="Static" AutoPostBack="True"
                    OnSelectedIndexChanged="dropdown_Recieved_In_Country_SelectedIndexChanged" CssClass="Big_ComboBox form-control">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_In_Country" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_In_Country"></asp:Label>
            </asp:Panel>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Recieved_In_State_UpdatePanel">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_Recieved_In_State_Wrapper_Panel" class="Form_Group" Visible="false">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= dropdown_Recieved_In_State.ClientID %>">Recieved In State:</label>
                    </div>
                    <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_In_State" Visible="true" CssClass="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Recieved_In_State" ClientIDMode="Static" CssClass="Big_ComboBox form-control">
                        </asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_In_State" Visible="false" CssClass="Form_Control Read_Only_Panel">
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
                <label for="<%= textbox_Recieved_In_City.ClientID %>">Recieved In City:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_In_City" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Recieved_In_City" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_In_City" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_In_City"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Recieved_In_Address.ClientID %>">Recieved In Address:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_In_Address" Visible="true" CssClass="Form_Control">
                <asp:TextBox
                    runat="server" ID="textbox_Recieved_In_Address" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_In_Address" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_In_Address"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Recieved_In_ZipCode.ClientID %>">Recieved In ZipCode:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_In_ZipCode" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Recieved_In_ZipCode"
                    ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_In_ZipCode" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_In_ZipCode"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Recieved_In_Email_Address.ClientID %>">Recieved In Email:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_In_Email_Address" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Recieved_In_Email_Address" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_In_Email_Address" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_In_Email_Address"></asp:Label>
            </asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_User_Comments.ClientID %>">Comments:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_User_Comments" Visible="true" CssClass="Form_Control">
                <asp:TextBox
                    runat="server" ID="textbox_User_Comments" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_User_Comments" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_User_Comments"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Recieved_By_User.ClientID %>">Recieved By User:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_By_User" Visible="true" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Recieved_By_User" ClientIDMode="Static"
                    CssClass="Big_ComboBox form-control">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_By_User" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_By_User"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Recieved_DateTime.ClientID %>">Recieved Date:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_DateTime" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Recieved_DateTime" ClientIDMode="Static"
                    CssClass="form-control InitializeDatePicker" autocomplete="Off"></asp:TextBox>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_DateTime" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_DateTime"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Recieved_Time_Hours.ClientID %>">Recieved Document Time:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Recieved_Time" Visible="true" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Recieved_Time_Hours" ClientIDMode="Static"
                    CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Recieved_Time_Minutes"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Recieved_Time_Seconds"
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel runat="server" ID="formControl_Wrapper_ReadOnly_Recieved_Time" Visible="false" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Recieved_Time"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Original_File_Name.ClientID %>">Filename:</label>
            </div>
            <asp:Panel runat="server" ID="formControl_Wrapper_Edit_Original_File_Name" Visible="true" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Original_File_Name" ClientIDMode="Static"
                    CssClass="form-control long-input"></asp:TextBox>
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
                <asp:Label runat="server" ID="label_Is_Visible_To_Anonymous_Users"></asp:Label>
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
                <asp:Label runat="server" ID="label_Is_Available_For_Download_For_Anonymous_Users"></asp:Label>
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
                <asp:Label runat="server" ID="label_Is_Visible_To_Followers_Users"></asp:Label>
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
                <asp:Label runat="server" ID="label_Is_Available_For_Download_For_Followers_Users"></asp:Label>
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
                <asp:Label runat="server" ID="label_Is_Active"></asp:Label>
            </asp:Panel>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label>Created by:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Record_Created_By_User" runat="server" Visible="true" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Record_Created_By_User"></asp:Label>
            </asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label>Created at:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Record_Creation_DateTime_UTC" runat="server" Visible="true" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Record_Creation_DateTime_UTC"></asp:Label>
            </asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label>Last Modified by:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_By_User" runat="server" Visible="true" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Record_Last_Updated_By_User"></asp:Label>
            </asp:Panel>
        </div>
        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label>Last Modified Date:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Record_Last_Updated_DateTime_UTC" runat="server" Visible="true" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Record_Last_Updated_DateTime_UTC"></asp:Label>
            </asp:Panel>
        </div>

        <hr />
        <div>
            <asp:Button runat="server" ID="button_Edit_Document_Details"
                Text="Edit Document" OnClick="button_Edit_Document_Details_Click" CausesValidation="false" CssClass="btn btn-primary" />
            <asp:Button runat="server" ID="button_Update_Document_Details"
                Text="Save Changes" OnClick="button_Update_Document_Details_Click" CssClass="btn btn-success" />
            <asp:Button runat="server" ID="button_CancelEdit_Document_Details"
                Text="Cancel Editing" OnClick="button_CancelEdit_Document_Details_Click" CausesValidation="false" OnClientClick="if (!confirm('Are you sure you want to cancel edit?')) return false;" CssClass="btn btn-danger" />
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

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_Document.aspx.cs" Inherits="WebformsPOCDemo.Add_Document" culture="auto" meta:resourcekey="Page" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5">Add Document</h2>
        <p class="lead">The advanced way to keep track on all your documentation.</p>
    </div>

    <hr />

    <div>

        <asp:Panel runat="server" ID="panel_User_Selection" CssClass="Form_Group" meta:resourcekey="panel_User_Selection">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_User_Selection.ClientID %>"><%= Resources.SiteCommon.User %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_User_Selection" ClientIDMode="Static" 
                AutoPostBack="True" OnSelectedIndexChanged="dropdown_User_SelectedIndexChanged" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_User_Selection"></asp:DropDownList></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_User_Selection_Required" ErrorMessage="Please select an user" Display="Dynamic" ControlToValidate="dropdown_User_Selection" CssClass="text-danger" meta:resourcekey="validator_User_Selection_Required"></asp:RequiredFieldValidator>
        </asp:Panel>

        <asp:Panel runat="server" ID="panel_General_Document_Type_Selection" CssClass="Form_Group" meta:resourcekey="panel_General_Document_Type_Selection">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_General_Document_Type.ClientID %>"><%= Resources.SiteCommon.Document_Type %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_General_Document_Type" 
                ClientIDMode="Static" CssClass="form-control Regular_ComboBox" meta:resourcekey="dropdown_General_Document_Type"></asp:DropDownList></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Document_Type_Required" ErrorMessage="Please select a document type" 
                Display="Dynamic" ControlToValidate="dropdown_General_Document_Type" CssClass="text-danger" meta:resourcekey="validator_Document_Type_Required"></asp:RequiredFieldValidator>
        </asp:Panel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Document_Creation_Date.ClientID %>"><%= Resources.SiteCommon.Document_Creation_Date %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Document_Creation_Date" ClientIDMode="Static" 
                CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_Document_Creation_Date"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Document_Creation_Date_Required" ErrorMessage="Please enter a document date" Display="Dynamic" 
                ControlToValidate="textbox_Document_Creation_Date" CssClass="text-danger" meta:resourcekey="validator_Document_Creation_Date_Required"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Document_Creation_Time_Hours.ClientID %>"><%= Resources.SiteCommon.Document_Creation_Time %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Document_Creation_Time_Hours" ClientIDMode="Static" 
                CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Document_Creation_Time_Hours"></asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Document_Creation_Time_Minutes" 
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Document_Creation_Time_Minutes"></asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Document_Creation_Time_Seconds" 
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Document_Creation_Time_Seconds"></asp:DropDownList></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Title.ClientID %>"><%= Resources.SiteCommon.Title %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Title" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Title"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Description.ClientID %>"><%= Resources.SiteCommon.Description %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Description" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control" meta:resourcekey="textbox_Description"></asp:TextBox></div>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Sent_By_Entity_Name.ClientID %>"><%= Resources.SiteCommon.Sent_From %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Sent_By_Entity_Name" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Sent_By_Entity_Name"></asp:TextBox></div>
        </div>

        <div class="Form_Group" >
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Sent_By_Entity_Country.ClientID %>"><%= Resources.SiteCommon.Sent_From_Country %>:</label></div>
            <div class="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Sent_By_Entity_Country" ClientIDMode="Static"
                    CssClass="Big_ComboBox form-control" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Sent_By_Entity_Country_SelectedIndexChanged" meta:resourcekey="dropdown_Sent_By_Entity_Country">
                </asp:DropDownList>
            </div>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Sent_By_Entity_State">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_Sent_By_Entity_State_Wrapper_Panel" class="Form_Group" Visible="False" meta:resourcekey="p_Sent_By_Entity_State_Wrapper_Panel">
                    <div class="Form_Label_Wrapper"><label for="<%= dropdown_Sent_By_Entity_State.ClientID %>"><%= Resources.SiteCommon.Sent_From_State %>:</label></div>
                    <div class="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Sent_By_Entity_State" ClientIDMode="Static"
                            CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Sent_By_Entity_State">
                        </asp:DropDownList>
                    </div>
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="dropdown_Sent_By_Entity_Country" />
            </Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Sent_By_Entity_City.ClientID %>"><%= Resources.SiteCommon.Sent_From_City %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Sent_By_Entity_City" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Sent_By_Entity_City"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Sent_By_Entity_Address.ClientID %>"><%= Resources.SiteCommon.Sent_From_Address %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Sent_By_Entity_Address" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Sent_By_Entity_Address"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Sent_By_Entity_ZipCode.ClientID %>"><%= Resources.SiteCommon.Sent_From_ZipCode %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Sent_By_Entity_ZipCode" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Sent_By_Entity_ZipCode"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Sent_By_Entity_DateTime.ClientID %>"><%= Resources.SiteCommon.Sending_Date %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Sent_By_Entity_DateTime" ClientIDMode="Static" 
                CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_Sent_By_Entity_DateTime"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Sent_By_Entity_Time_Hours.ClientID %>"><%= Resources.SiteCommon.Sending_Time %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Sent_By_Entity_Time_Hours" ClientIDMode="Static" 
                CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Sent_By_Entity_Time_Hours"></asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Sent_By_Entity_Time_Minutes" 
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Sent_By_Entity_Time_Minutes"></asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Sent_By_Entity_Time_Seconds" 
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Sent_By_Entity_Time_Seconds"></asp:DropDownList></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Sent_By_Entity_Email_Address.ClientID %>"><%= Resources.SiteCommon.Sent_From_Email_Address %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Sent_By_Entity_Email_Address" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Sent_By_Entity_Email_Address"></asp:TextBox></div>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Sent_To_Entity_Name.ClientID %>"><%= Resources.SiteCommon.Sent_To %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Sent_To_Entity_Name" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Sent_To_Entity_Name"></asp:TextBox></div>
        </div>

        <div class="Form_Group" >
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Sent_To_Entity_Country.ClientID %>"><%= Resources.SiteCommon.Sent_To_Country %>:</label></div>
            <div class="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Sent_To_Entity_Country" ClientIDMode="Static"
                    CssClass="Big_ComboBox form-control" AutoPostBack="True" OnSelectedIndexChanged="dropdown_Sent_To_Entity_Country_SelectedIndexChanged" meta:resourcekey="dropdown_Sent_To_Entity_Country">
                </asp:DropDownList>
            </div>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Sent_To_Entity_State">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_Sent_To_Entity_State_Wrapper_Panel" class="Form_Group" Visible="False" meta:resourcekey="p_Sent_To_Entity_State_Wrapper_Panel">
                    <div class="Form_Label_Wrapper"><label for="<%= dropdown_Sent_To_Entity_State.ClientID %>"><%= Resources.SiteCommon.Sent_To_State %>:</label></div>
                    <div class="Form_Control">
                        <asp:DropDownList runat="server" ID="dropdown_Sent_To_Entity_State" ClientIDMode="Static"
                            CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Sent_To_Entity_State">
                        </asp:DropDownList>
                    </div>
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="dropdown_Sent_To_Entity_Country" />
            </Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Sent_To_Entity_City.ClientID %>"><%= Resources.SiteCommon.Sent_To_City %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Sent_To_Entity_City" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Sent_To_Entity_City"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Sent_To_Entity_Address.ClientID %>"><%= Resources.SiteCommon.Sent_To_Address %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Sent_To_Entity_Address" 
                ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Sent_To_Entity_Address"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Sent_To_Entity_ZipCode.ClientID %>"><%= Resources.SiteCommon.Sent_To_ZipCode %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Sent_To_Entity_ZipCode" ClientIDMode="Static" CssClass="form-control" meta:resourcekey="textbox_Sent_To_Entity_ZipCode"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Sent_To_Entity_Email_Address.ClientID %>"><%= Resources.SiteCommon.Sent_To_Email %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Sent_To_Entity_Email_Address" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Sent_To_Entity_Email_Address"></asp:TextBox></div>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Recieved_Document_DateTime.ClientID %>"><%= Resources.SiteCommon.Recieved_Document_Date %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Recieved_Document_DateTime" ClientIDMode="Static" 
                CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_Recieved_Document_DateTime"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Recieved_Document_Time_Hours.ClientID %>"><%= Resources.SiteCommon.Recieved_Document_Time %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Recieved_Document_Time_Hours" ClientIDMode="Static" 
                CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Recieved_Document_Time_Hours"></asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Recieved_Document_Time_Minutes" 
                ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Recieved_Document_Time_Minutes"></asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Recieved_Document_Time_Seconds" 
                ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Recieved_Document_Time_Seconds"></asp:DropDownList></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Recieved_In_Country.ClientID %>"><%= Resources.SiteCommon.Recieved_In_Country %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Recieved_In_Country" ClientIDMode="Static" AutoPostBack="True" 
                OnSelectedIndexChanged="dropdown_Recieved_In_Country_SelectedIndexChanged" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Recieved_In_Country"></asp:DropDownList></div>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Recieved_In_State_UpdatePanel">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_Recieved_In_State_Wrapper_Panel" class="Form_Group" Visible="False" meta:resourcekey="p_Recieved_In_State_Wrapper_Panel">
                    <div class="Form_Label_Wrapper"><label for="<%= dropdown_Recieved_In_State.ClientID %>"><%= Resources.SiteCommon.Recieved_In_State %>:</label></div>
                    <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Recieved_In_State" 
                        ClientIDMode="Static" CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Recieved_In_State"></asp:DropDownList></div>
                </asp:Panel>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Recieved_In_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Recieved_In_City.ClientID %>"><%= Resources.SiteCommon.Recieved_In_City %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Recieved_In_City" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Recieved_In_City"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Recieved_In_Address.ClientID %>"><%= Resources.SiteCommon.Recieved_In_Address %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Recieved_In_Address" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Recieved_In_Address"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Recieved_In_ZipCode.ClientID %>"><%= Resources.SiteCommon.Recieved_In_ZipCode %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Recieved_In_ZipCode" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Recieved_In_ZipCode"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Recieved_In_Email_Address.ClientID %>"><%= Resources.SiteCommon.Recieved_In_Email %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Recieved_In_Email_Address" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Recieved_In_Email_Address"></asp:TextBox></div>
        </div>

        <hr />

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_User_Comments.ClientID %>"><%= Resources.SiteCommon.Comments %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_User_Comments" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control" meta:resourcekey="textbox_User_Comments"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Recieved_By_User.ClientID %>"><%= Resources.SiteCommon.Recieved_By_User %>:</label></div>
            <div class="Form_Control">
                <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Recieved_By_User" ClientIDMode="Static" 
                    CssClass="Big_ComboBox form-control" meta:resourcekey="dropdown_Recieved_By_User"></asp:DropDownList></div>
            </div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Recieved_DateTime.ClientID %>"><%= Resources.SiteCommon.Recieved_Date %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Recieved_DateTime" ClientIDMode="Static" 
                CssClass="form-control InitializeDatePicker" autocomplete="nope" meta:resourcekey="textbox_Recieved_DateTime"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Recieved_Time_Hours.ClientID %>"><%= Resources.SiteCommon.Recieved_Document_Time %>:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Recieved_Time_Hours" ClientIDMode="Static" 
                CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Recieved_Time_Hours"></asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Recieved_Time_Minutes" 
                ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Recieved_Time_Minutes"></asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Recieved_Time_Seconds" 
                ClientIDMode="Static" CssClass="form-control Tiny_ComboBox" meta:resourcekey="dropdown_Recieved_Time_Seconds"></asp:DropDownList></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Original_File_Name.ClientID %>"><%= Resources.SiteCommon.Filename %>:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Original_File_Name" ClientIDMode="Static" CssClass="form-control long-input" meta:resourcekey="textbox_Original_File_Name"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Visible_To_Anonymous_Users.ClientID %>"><%= Resources.SiteCommon.Is_Visible_To_Public %>?</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Anonymous_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Visible_To_Anonymous_Users" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Available_For_Download_For_Anonymous_Users.ClientID %>"><%= Resources.SiteCommon.Is_Downloadable_To_Public %>?</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Anonymous_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Available_For_Download_For_Anonymous_Users" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Visible_To_Followers_Users.ClientID %>"><%= Resources.SiteCommon.Is_Visible_To_Followers %>?</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Followers_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Visible_To_Followers_Users" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Available_For_Download_For_Followers_Users.ClientID %>"><%= Resources.SiteCommon.Can_Followers_Download_File %>?</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Followers_Users" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Available_For_Download_For_Followers_Users" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Active.ClientID %>"><%= Resources.SiteCommon.Is_Active %>?</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="True" ClientIDMode="Static" meta:resourcekey="checkbox_Is_Active" /></div>
        </div>

        <hr />
        <div>
            <asp:Button runat="server" ID="button_Create_Document" Text="Create Document" OnClick="button_Create_Document_Click" CssClass="btn btn-primary" meta:resourcekey="button_Create_Document" /> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button runat="server" ID="button_Fill_Up_Form_Dummy_Data_For_Test" Text="Dummy Expense Fillup" CssClass="btn btn-danger" 
                CausesValidation="False" OnClick="button_Fill_Up_Form_Dummy_Data_For_Test_Click" meta:resourcekey="button_Fill_Up_Form_Dummy_Data_For_Test" />
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result" meta:resourcekey="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br /><br /><br />
    </div>

</asp:Content>

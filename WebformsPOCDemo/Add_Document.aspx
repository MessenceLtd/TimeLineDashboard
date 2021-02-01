<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_Document.aspx.cs" Inherits="WebformsPOCDemo.Add_Document" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="panel_HeaderLinks" runat="server" CssClass="header-links">       
        <asp:HyperLink runat="server" Text="Add New Document" CssClass="active" NavigateUrl="Add_Document.aspx"></asp:HyperLink>
    </asp:Panel>

    <hr />

    <div>

        <asp:Panel runat="server" ID="panel_User_Selection" CssClass="Form_Group" Visible="true">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_User_Selection.ClientID %>">User:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_User_Selection" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="dropdown_User_SelectedIndexChanged" CssClass="Big_ComboBox form-control"></asp:DropDownList></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_User_Selection_Required" ErrorMessage="Please select an user" Display="Dynamic" ControlToValidate="dropdown_User_Selection" CssClass="text-danger"></asp:RequiredFieldValidator>
        </asp:Panel>

        <asp:Panel runat="server" ID="panel_Document_Type_Selection" CssClass="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Document_Type.ClientID %>">Document type:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Document_Type" ClientIDMode="Static" AutoPostBack="True" CssClass="form-control Regular_ComboBox"></asp:DropDownList></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Document_Type_Required" ErrorMessage="Please select a document type" Display="Dynamic" ControlToValidate="dropdown_Document_Type" CssClass="text-danger"></asp:RequiredFieldValidator>
        </asp:Panel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Document_Creation_Date.ClientID %>">Document Creation Date:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Document_Creation_Date" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
            <asp:RequiredFieldValidator runat="server" ID="validator_Document_Creation_Date_Required" ErrorMessage="Please enter an document date" Display="Dynamic" 
                ControlToValidate="textbox_Document_Creation_Date" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Document_Creation_Time_Hours.ClientID %>">Document Creation Time:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Document_Creation_Time_Hours" ClientIDMode="Static" 
                CssClass="form-control Tiny_ComboBox"></asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Document_Creation_Time_Minutes" 
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox"></asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Document_Creation_Time_Seconds" 
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox"></asp:DropDownList></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Title.ClientID %>">Title:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Title" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Description.ClientID %>">Description:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Description" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Sent_By_Entity_Name.ClientID %>">Sent By Entity Name:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Sent_By_Entity_Name" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Sent_To_Address.ClientID %>">Sent To Address:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Sent_To_Address" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Recieved_Document_Date.ClientID %>">Recieved Document Date:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Recieved_Document_Date" ClientIDMode="Static" CssClass="form-control"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Recieved_Document_Time_Hours.ClientID %>">Recieved Document Time:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Recieved_Document_Time_Hours" ClientIDMode="Static" 
                CssClass="form-control Tiny_ComboBox"></asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Recieved_Document_Time_Minutes" 
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox"></asp:DropDownList><asp:DropDownList runat="server" ID="dropdown_Recieved_Document_Time_Seconds" 
                    ClientIDMode="Static" CssClass="form-control Tiny_ComboBox"></asp:DropDownList></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= dropdown_Recieved_In_Country.ClientID %>">Recieved In Country:</label></div>
            <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Recieved_In_Country" ClientIDMode="Static" AutoPostBack="True" 
                OnSelectedIndexChanged="dropdown_Recieved_In_Country_SelectedIndexChanged" CssClass="Big_ComboBox form-control"></asp:DropDownList></div>
        </div>

        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="up_Recieved_In_State_UpdatePanel">
            <ContentTemplate>
                <asp:Panel runat="server" ID="p_Recieved_In_State_Wrapper_Panel" class="Form_Group" Visible="false">
                    <div class="Form_Label_Wrapper"><label for="<%= dropdown_Recieved_In_State.ClientID %>">Recieved In State:</label></div>
                    <div class="Form_Control"><asp:DropDownList runat="server" ID="dropdown_Recieved_In_State" ClientIDMode="Static" CssClass="Big_ComboBox form-control"></asp:DropDownList></div>
                </asp:Panel>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="dropdown_Recieved_In_Country" /></Triggers>
        </asp:UpdatePanel>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Recieved_In_City.ClientID %>">Recieved In City:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Recieved_In_City" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Recieved_In_Address.ClientID %>">Recieved In Address:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Recieved_In_Address" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_User_Comments.ClientID %>">Comments:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_User_Comments" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= textbox_Original_File_Name.ClientID %>">Filename:</label></div>
            <div class="Form_Control"><asp:TextBox runat="server" ID="textbox_Original_File_Name" ClientIDMode="Static" CssClass="form-control long-input"></asp:TextBox></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Visible_To_Anonymous_Users.ClientID %>">Is Visible To Public?</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Anonymous_Users" Checked="false" ClientIDMode="Static" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Visible_To_Anonymous_Users.ClientID %>">Is Downloadable To Public?</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Anonymous_Users" Checked="false" ClientIDMode="Static" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Visible_To_Followers_Users.ClientID %>">Is Visible To Followers?</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Visible_To_Followers_Users" Checked="false" ClientIDMode="Static" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Available_For_Download_For_Followers_Users.ClientID %>">Can Followers Download File?</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Available_For_Download_For_Followers_Users" Checked="false" ClientIDMode="Static" /></div>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper"><label for="<%= checkbox_Is_Active.ClientID %>">Is Active?</label></div>
            <div class="Form_Control"><asp:CheckBox runat="server" ID="checkbox_Is_Active" Checked="true" ClientIDMode="Static" /></div>
        </div>

        <hr />
        <div>
            <asp:Button runat="server" ID="button_Create_Document" Text="Create Document" OnClick="button_Create_Document_Click" CssClass="btn btn-primary" /> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button runat="server" ID="button_Fill_Up_Form_Dummy_Data_For_Test" Text="Dummy Expense Fillup" CssClass="btn btn-danger" 
                CausesValidation="false" OnClick="button_Fill_Up_Form_Dummy_Data_For_Test_Click" />
        </div>

        <div>
            <asp:Label runat="server" ID="lbl_Insert_Process_Error_Result"></asp:Label>
        </div>
        <br /><br /><br /><br />

    </div>

    <script type="text/javascript">

        $(function () {

            $("#<%= textbox_Document_Creation_Date.ClientID %>").datepicker(
                {
                    showWeek: false,
                    dateFormat: "dd/mm/yy",
                    changeMonth: true,
                    changeYear: true,
                    yearRange: "-120:+0",
                    regional: 'he'
                });

            $("#<%= textbox_Recieved_Document_Date.ClientID %>").datepicker(
                {
                    showWeek: false,
                    dateFormat: "dd/mm/yy",
                    changeMonth: true,
                    changeYear: true,
                    yearRange: "-120:+0",
                    regional: 'he'
                });
            

        });

    </script>

</asp:Content>

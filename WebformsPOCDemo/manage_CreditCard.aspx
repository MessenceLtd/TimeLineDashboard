<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_CreditCard.aspx.cs" Inherits="WebformsPOCDemo.manage_CreditCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-title my-3 text-center">
        <h2 class="display-5"><% = Resources.SiteCommon.Manage_Credit_Card_Title %></h2>
        <p class="lead"><% = Resources.SiteCommon.Manage_Credit_Card_SubTitle %></p>
    </div>

    <hr />

    <div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= dropdown_Bank_Account.ClientID %>"><% = Resources.SiteCommon.Bank_Account %>:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Edit_Bank_Account" runat="server" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Bank_Account" ClientIDMode="Static"
                    CssClass="Regular_ComboBox form-control">
                </asp:DropDownList>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Bank_Name" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Bank_Account"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Card_Name.ClientID %>"><% = Resources.SiteCommon.Credit_Card_Name %>:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Edit_Card_Name" runat="server" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Card_Name" ClientIDMode="Static" CssClass="form-control" autocomplete="off"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Card_Name" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Card_Name"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label for="<%= textbox_Four_Ending_Digits.ClientID %>"><% = Resources.SiteCommon.Four_Ending_Digits %>:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Edit_Four_Ending_Digits" runat="server" CssClass="Form_Control">
                <asp:TextBox runat="server" ID="textbox_Four_Ending_Digits" ClientIDMode="Static" CssClass="form-control" autocomplete="nope"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Four_Ending_Digits" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label runat="server" ID="label_Four_Ending_Digits"></asp:Label>
            </asp:Panel>
        </div>

        <div class="Form_Group">
            <div class="Form_Label_Wrapper">
                <label><% = Resources.SiteCommon.CC_Expiration_Date %>:</label>
            </div>
            <asp:Panel ID="formControl_Wrapper_Edit_Expiration_Date" runat="server" CssClass="Form_Control">
                <asp:DropDownList runat="server" ID="dropdown_Expiration_Date_Month" ClientIDMode="Static" CssClass="form-control Tiny_ComboBox"></asp:DropDownList>
                <asp:DropDownList runat="server" ID="dropdown_Expiration_Date_Year" ClientIDMode="Static" CssClass="form-control Tiny_ComboBox"></asp:DropDownList>
            </asp:Panel>
            <asp:Panel ID="formControl_Wrapper_ReadOnly_Expiration_Date" runat="server" Visible="False" CssClass="Form_Control Read_Only_Panel">
                <asp:Label
                    runat="server" ID="label_Expiration_Date"></asp:Label>
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

        <asp:Panel runat="server" ID="panel_Last_Updates_Info">

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
        </asp:Panel>

        <hr />
        <div>

            <asp:Button runat="server" ID="button_Edit_CreditCard_Details"
                Text="<%$ Resources:SiteCommon, Manage_Credit_Card_Edit_Details %>" OnClick="button_Edit_CreditCard_Details_Click" CausesValidation="False" CssClass="btn btn-primary" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button runat="server" ID="button_Update_CreditCard_Details"
                Text="<%$ Resources:SiteCommon, Manage_Credit_Card_Update_Details %>" OnClick="button_Update_CreditCard_Details_Click" CssClass="btn btn-success" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button runat="server" ID="button_Create_CreditCard_Details"
                Text="<%$ Resources:SiteCommon, Manage_Credit_Card_Create %>" OnClick="button_Create_CreditCard_Details_Click" CssClass="btn btn-success" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button runat="server" ID="button_CancelEdit_CreditCard_Details"
                Text="<%$ Resources:SiteCommon, Manage_Credit_Card_Cancel_Editing %>" OnClick="button_CancelEdit_CreditCard_Details_Click" CausesValidation="False" CssClass="btn btn-danger" />

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

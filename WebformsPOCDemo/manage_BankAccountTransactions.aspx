<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_BankAccountTransactions.aspx.cs" Inherits="WebformsPOCDemo.manage_BankAccountTransactions" Culture="auto" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">

        function AddNewTransactionRow(Transaction_Id) {

            if (typeof Transaction_Id == 'undefined') {
                
                Clean_Transaction_Popup();
                Edit_Transaction_In_Popup(null, null);
            }
            else {
                Edit_Transaction_In_Popup(Transaction_Id, null);
            }
        }

        function EditBankTransactionRow(p_Transaction_Id) {
            var rowToMarkEditing = $('#Transaction_Record_Row_' + p_Transaction_Id + ' + .tr');
            if (rowToMarkEditing && rowToMarkEditing.length > 0) {

                var l_Balance = $(rowToMarkEditing).find('input.Balance').val();
                var l_Transaction_Date = $(rowToMarkEditing).find('input.Transaction_Date').val();
                var l_Income_Value = $(rowToMarkEditing).find('input.Income_Value').val();
                var l_Obligo_Value = $(rowToMarkEditing).find('input.Obligo_Value').val();
                var l_Value_Date = $(rowToMarkEditing).find('input.Value_Date').val();
                var l_Reference = $(rowToMarkEditing).find('input.Reference').val();
                var l_Description = $(rowToMarkEditing).find('input.Description').val();
                var l_Bank_Ref = $(rowToMarkEditing).find('input.Bank_Ref').val();

                Edit_Transaction_In_Popup(
                    null,
                    p_Transaction_Id,
                    l_Balance,
                    l_Transaction_Date,
                    l_Income_Value,
                    l_Obligo_Value,
                    l_Value_Date,
                    l_Reference,
                    l_Description,
                    l_Bank_Ref);
            }
        }

        function Edit_Transaction_In_Popup(
            p_After_Transaction_Id,
            p_Transaction_Id,
            p_Balance,
            p_Transaction_Date,
            p_Income_Value,
            p_Obligo_Value,
            p_Value_Date,
            p_Reference,
            p_Description,
            p_Bank_Ref ) {

            $('#hidden_Save_Transaction_Info_Transaction_Id').val(p_Transaction_Id);
            $('#hidden_Save_Transaction_Info_After_Transaction_Id').val(p_After_Transaction_Id);
            $('#hidden_Save_Transaction_Info_Transaction_Id').val(p_Transaction_Id);
            $('#textbox_Edit_Transaction_Account_Balance').val(p_Balance);
            $('#textbox_Edit_Transaction_Actual_DateTime').val(p_Transaction_Date);
            $('#textbox_Edit_Positive_Amount_Entered').val(p_Income_Value);
            $('#textbox_Edit_Negative_Amount_Paid').val(p_Obligo_Value);
            $('#textbox_Edit_Transaction_Value_DateTime').val(p_Value_Date);
            $('#textbox_Edit_Reference_Number').val(p_Reference);
            $('#textbox_Transaction_Bank_Description').val(p_Description);
            $('#textbox_Transaction_Bank_Inner_Reference_Code').val(p_Bank_Ref);

            var l_Mode = p_Transaction_Id ? 'Edit' : 'Create';

            Show_Transaction_Popup(l_Mode);
        }

        function Show_Transaction_Popup(p_Mode) {
            $('.Popup_Background_Wrapper').removeClass('hidden');
            $('#textbox_Edit_Transaction_Account_Balance').focus();
            if (p_Mode == 'Create') {
                $('.Popup_Inner_Wrapper .Header_Title .Mode_Create').removeClass('hidden');
                $('.Popup_Inner_Wrapper .Header_Title .Mode_Edit').addClass('hidden');
            }
            else {
                $('.Popup_Inner_Wrapper .Header_Title .Mode_Create').addClass('hidden');
                $('.Popup_Inner_Wrapper .Header_Title .Mode_Edit').removeClass('hidden');
            }
        }

        function Hide_Transaction_Popup() {
            $('.Popup_Background_Wrapper').addClass('hidden');
        }

        function Clean_Transaction_Popup() {
            $('#hidden_Save_Transaction_Info_Transaction_Id').val('');
            $('#hidden_Save_Transaction_Info_After_Transaction_Id').val('');
            $('#textbox_Edit_Transaction_Account_Balance').val('');
            $('#textbox_Edit_Transaction_Actual_DateTime').val('');
            $('#textbox_Edit_Positive_Amount_Entered').val('');
            $('#textbox_Edit_Negative_Amount_Paid').val('');
            $('#textbox_Edit_Transaction_Value_DateTime').val('');
            $('#textbox_Edit_Reference_Number').val('');
            $('#textbox_Transaction_Bank_Description').val('');
            $('#textbox_Transaction_Bank_Inner_Reference_Code').val('');
        }

        function DeleteBankTransactionRow(Transaction_Id) {

            if (confirm('<%= Resources.SiteCommon.Bank_Account_Transaction_Confirm_Delete %>')) {
                $('#hidden_Delete_Transaction_Id').val(Transaction_Id)
                document.getElementById('button_Delete_Bank_Account_Transaction').click();
            }
        }

        function Hide_Edit_Popup() {
            Hide_Transaction_Popup();
        }

        $(document).keyup(function (e) {
            if (e.key === "Escape") {
                Hide_Edit_Popup();
            }
        });

    </script>

    <div class="page-title my-3 text-center">
        <h2 class="display-5"><%= Resources.SiteCommon.Manage_Bank_Account_Transactions_Title %></h2>
        <p class="lead"><%= Resources.SiteCommon.Manage_Bank_Account_Transactions_SubTitle %></p>
    </div>

    <hr />
    <input type="button" class="btn btn-primary" value="<%= Resources.SiteCommon.Add_New_Bank_Account_Transaction_Record %>" onclick="AddNewTransactionRow()" />

    &nbsp;&nbsp;&nbsp;&nbsp;
        
    <asp:UpdatePanel runat="server" ID="up_Transactions" UpdateMode="Conditional">
        <ContentTemplate>

            <hr />

            <div class="Responsive-Table">
                <asp:Repeater runat="server" ID="repeater" OnItemDataBound="Repeater_ItemDataBound" EnableViewState="false">
                    <HeaderTemplate>
                        <div class="tr">
                            <div class="th"><%# Resources.SiteCommon.Balance %></div>
                            <div class="th"><%# Resources.SiteCommon.Transaction_Date %></div>
                            <div class="th"><%# Resources.SiteCommon.Income_Value %></div>
                            <div class="th"><%# Resources.SiteCommon.Obligo_Value %></div>
                            <div class="th"><%# Resources.SiteCommon.Value_Date %></div>
                            <div class="th"><%# Resources.SiteCommon.Reference %></div>
                            <div class="th"><%# Resources.SiteCommon.Description %></div>
                            <div class="th"><%# Resources.SiteCommon.Ref %></div>
                            <div class="th"><%# Resources.SiteCommon.Operations %></div>
                        </div>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div id='<%# Eval("Bank_Account_Transaction_Id", "Transaction_Record_Row_{0}") %>' class="hidden">
                        </div>
                        <asp:Panel runat="server" ID="panel_Bank_Account_Transaction_Id" CssClass="tr">
                            <div class="td">
                                <asp:TextBox runat="server" ID="txt_Balance" CssClass="form-control Balance" autocomplete="nope" placeHolder="Balance" Text='<%# Bind("Transaction_Account_Balance", "{0:#,#.##}") %>'></asp:TextBox>
                                <asp:Label runat="server" ID="label_Balance" CssClass="Balance" Text='<%# Bind("Transaction_Account_Balance", "{0:#,#.##}") %>'></asp:Label>
                            </div>
                            <div class="td">
                                <asp:TextBox runat="server" ID="txt_Actual_DateTime" CssClass="form-control InitializeDatePicker Transaction_Date" autocomplete="nope" placeHolder="Transaction Date" Text='<%# Bind("Transaction_Actual_DateTime", "{0:dd/MM/yyyy}" ) %>'></asp:TextBox>
                                <asp:Label runat="server" ID="label_Transaction_Date" CssClass="Transaction_Date" Text='<%# Bind("Transaction_Actual_DateTime", "{0:dd/MM/yyyy}" ) %>'></asp:Label>
                            </div>
                            <div class="td">
                                <asp:TextBox runat="server" ID="txt_Income_Value" CssClass="form-control Income_Value" placeHolder="Income_Value" autocomplete="nope" Text='<%# Bind("Positive_Amount_Entered", "{0:#,#.##}" ) %>'></asp:TextBox>
                                <asp:Label runat="server" ID="label_Income_Value" CssClass="Income_Value" Text='<%# Bind("Positive_Amount_Entered", "{0:#,#.##}") %>'></asp:Label>
                            </div>
                            <div class="td">
                                <asp:TextBox runat="server" ID="txt_Obligo_Value" CssClass="form-control Obligo_Value" placeHolder="Obligo_Value" autocomplete="nope" Text='<%# Bind("Negative_Amount_Paid", "{0:#,#.##}" ) %>'></asp:TextBox>
                                <asp:Label runat="server" ID="label_Obligo_Value" CssClass="Obligo_Value" Text='<%# Bind("Negative_Amount_Paid", "{0:#,#.##}") %>'></asp:Label>
                            </div>
                            <div class="td">
                                <asp:TextBox runat="server" ID="txt_Value_Date" CssClass="form-control InitializeDatePicker Value_Date" placeHolder="Value_Date" autocomplete="nope" Text='<%# Bind("Transaction_Value_DateTime", "{0:dd/MM/yyyy}" ) %>'></asp:TextBox>
                                <asp:Label runat="server" ID="label_Value_Date" CssClass="Value_Date" Text='<%# Bind("Transaction_Value_DateTime", "{0:dd/MM/yyyy}" ) %>'></asp:Label>
                            </div>
                            <div class="td">
                                <asp:TextBox runat="server" ID="txt_Reference" CssClass="form-control Reference" placeHolder="Reference" autocomplete="nope" Text='<%# Bind( "Reference_Number" ) %>'></asp:TextBox>
                                <asp:Label runat="server" ID="label_Reference" CssClass="Reference" Text='<%# Bind("Reference_Number") %>'></asp:Label>
                            </div>
                            <div class="td">
                                <asp:TextBox runat="server" ID="txt_Description" CssClass="form-control Description" placeHolder="Description" autocomplete="nope" Text='<%# Bind( "Transaction_Bank_Description" ) %>'></asp:TextBox>
                                <asp:Label runat="server" ID="label_Description" CssClass="Description" Text='<%# Bind("Transaction_Bank_Description") %>'></asp:Label>
                            </div>
                            <div class="td">
                                <asp:TextBox runat="server" ID="txt_Bank_Ref" CssClass="form-control Bank_Ref" placeHolder="Bank_Ref" autocomplete="nope" Text='<%# Bind( "Transaction_Bank_Inner_Reference_Code" ) %>'></asp:TextBox>
                                <asp:Label runat="server" ID="label_Bank_Ref" CssClass="Bank_Ref" Text='<%# Bind("Transaction_Bank_Inner_Reference_Code") %>'></asp:Label>
                            </div>
                            <div class="td" style="text-align: center">
                                <asp:HiddenField runat="server" ID="hidden_Transaction_Record_ID" Value='<%# Bind( "Bank_Account_Transaction_Id" ) %>' />
                                <asp:HiddenField runat="server" ID="hidden_Is_Visible_To_Anonymous_Users" Value='<%# Bind( "Is_Visible_To_Anonymous_Users" ) %>' />
                                <asp:HiddenField runat="server" ID="hidden_Is_Visible_To_Followers_Users" Value='<%# Bind( "Is_Visible_To_Followers_Users" ) %>' />
                                <asp:HiddenField runat="server" ID="hidden_IsNewRecord" Value='<%# Bind( "Is_New_Record" ) %>' />
                                <asp:HiddenField runat="server" ID="hidden_PendingChanges" Value='<%# Bind( "Pending_Changes" ) %>' />
                                <asp:HiddenField runat="server" ID="hidden_IsDeleted" Value='<%# Bind( "Is_Deleted" ) %>' />
                                <a class="Button_Edit" href='<%# Eval("Bank_Account_Transaction_Id", "javascript:EditBankTransactionRow({0})") %>' id="EditRow">
                                    <img src="/Images/edit.png" width="32" height="32" alt="<%# Resources.SiteCommon.Edit %>" title="<%# Resources.SiteCommon.Edit %>" /></a>
                                <a class="Button_SaveEdit" href='<%# Eval("Bank_Account_Transaction_Id", "javascript:SaveEditBankTransactionRow({0})") %>' id="SaveEditRow">
                                    <img src="/Images/save.png" width="32" height="32" alt="<%# Resources.SiteCommon.Save %>" title="<%# Resources.SiteCommon.Save %>" /></a>
                                <a class="Button_CancelEdit" href='<%# Eval("Bank_Account_Transaction_Id", "javascript:CancelEditBankTransactionRow({0})") %>' id="CancelEditRow">
                                    <img src="/Images/cancel.png" width="32" height="32" alt="<%# Resources.SiteCommon.Cancel %>" title="<%# Resources.SiteCommon.Cancel %>" /></a>
                                <a class="Button_ViewMore" href='<%# Eval("Bank_Account_Transaction_Id", "manage_BankAccountTransaction.aspx?id={0}") %>' target="_blank">
                                    <img src="/Images/viewdetails2.png" width="32" height="32" alt="<%# Resources.SiteCommon.View_More %>" title="<%# Resources.SiteCommon.View_More %>" /></a>
                                <a class="Button_ViewMore" href='<%# Eval("Bank_Account_Transaction_Id", "manage_BankAccountTransaction.aspx?id={0}#documents") %>' target="_blank">
                                    <img src="/Images/documents.png" width="32" height="32" alt="<%# Resources.SiteCommon.Documents %>" title="<%# Resources.SiteCommon.Documents %>" /></a>
                                <a class="Button_AddMore" href='<%# Eval("Bank_Account_Transaction_Id", "javascript:AddNewTransactionRow({0})") %>'>
                                    <img src="/Images/addmore2.png" width="32" height="32" alt="<%# Resources.SiteCommon.Add_New_Record %>" title="<%# Resources.SiteCommon.Add_New_Record %>" /></a>
                                <a class="Button_Delete" href='<%# Eval("Bank_Account_Transaction_Id", "javascript:DeleteBankTransactionRow({0})") %>' id="DeleteRow">
                                    <img src="/Images/delete.png" width="32" height="32" alt="<%# Resources.SiteCommon.Delete %>" title="<%# Resources.SiteCommon.Delete %>" /></a>
                            </div>
                        </asp:Panel>
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>

                </asp:Repeater>

            </div>

            <asp:PlaceHolder runat="server" ID="ph_Pagination">
                <nav aria-label="Pages Navigation">
                    <ul class="pagination pagination-lg">
                        <li runat="server" id="pagination_li_Previous" class="page-item disabled">
                            <span class="page-link">Previous</span>
                        </li>
                        <asp:PlaceHolder runat="server" ID="ph_Pagination_Links"></asp:PlaceHolder>
                        <li runat="server" id="pagination_li_Next" class="page-item">
                            <a class="page-link">Next</a>
                        </li>
                    </ul>
                </nav>
            </asp:PlaceHolder>
            
            <asp:HiddenField runat="server" ClientIDMode="Static" ID="hidden_Delete_Transaction_Id" />
            <asp:Button runat="server" ClientIDMode="Static" ID="button_Delete_Bank_Account_Transaction" 
                CssClass="hidden" OnClick="button_Delete_Bank_Account_Transaction_Click" Text="__delete" />

        </ContentTemplate>
        <Triggers>
            
            <asp:AsyncPostBackTrigger ControlID="button_Popup_Save_Transaction_Details" />
            <asp:AsyncPostBackTrigger ControlID="button_Delete_Bank_Account_Transaction" />
            
        </Triggers>
    </asp:UpdatePanel>

    <hr />
    <div>
        
        &nbsp;&nbsp;&nbsp;&nbsp;
    </div>

    <div class="Popup_Background_Wrapper hidden">
        <div class="Popup_Inner_Wrapper">
            <img class="Close-Button" alt="<%= Resources.SiteCommon.Close_Window %>" title="<%= Resources.SiteCommon.Close_Window %>" height="32" width="32" src="/Images/Close.png" onclick="Hide_Edit_Popup();" />
            <div class="Header_Title">
                <span class="Mode_Create"><%= Resources.SiteCommon.Bank_Account_Transactions_Create_Bank_Account_Transaction %></span>
                <span class="Mode_Edit"><%= Resources.SiteCommon.Bank_Account_Transactions_Edit_Bank_Account_Transaction %></span>
            </div>
            <div class="Edit_Transaction_Template">
                <asp:HiddenField runat="server" ClientIDMode="Static" ID="hidden_Save_Transaction_Info_Transaction_Id" />
                <asp:HiddenField runat="server" ClientIDMode="Static" ID="hidden_Save_Transaction_Info_After_Transaction_Id" />
                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Edit_Transaction_Account_Balance.ClientID %>"><%= Resources.SiteCommon.Account_Balance %>:</label>
                    </div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Edit_Transaction_Account_Balance" ValidationGroup="Edit_Transaction_Details"
                            ClientIDMode="Static" CssClass="form-control" autocomplete="nope"></asp:TextBox>
                    </div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Edit_Transaction_Actual_DateTime.ClientID %>"><%= Resources.SiteCommon.Transaction_Date %>:</label>
                    </div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Edit_Transaction_Actual_DateTime" ValidationGroup="Edit_Transaction_Details" ClientIDMode="Static" 
                            CssClass="form-control InitializeDatePicker" autocomplete="nope"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator runat="server" ID="validator_Transaction_Actual_DateTime" ValidationGroup="Edit_Transaction_Details" ErrorMessage="*"
                        Display="Dynamic" ControlToValidate="textbox_Edit_Transaction_Actual_DateTime" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Edit_Positive_Amount_Entered.ClientID %>"><%= Resources.SiteCommon.Bank_Account_Transaction_Amount_Entered %></label>
                    </div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Edit_Positive_Amount_Entered" ValidationGroup="Edit_Transaction_Details" ClientIDMode="Static" 
                            CssClass="form-control" autocomplete="nope"></asp:TextBox>
                    </div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Edit_Negative_Amount_Paid.ClientID %>"><%= Resources.SiteCommon.Bank_Account_Transaction_Amount_Paid %></label>
                    </div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Edit_Negative_Amount_Paid" ValidationGroup="Edit_Transaction_Details" ClientIDMode="Static" 
                            CssClass="form-control" autocomplete="nope"></asp:TextBox>
                    </div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Edit_Transaction_Value_DateTime.ClientID %>"><%= Resources.SiteCommon.Bank_Account_Transaction_Value_DateTime%></label>
                    </div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Edit_Transaction_Value_DateTime" ValidationGroup="Edit_Transaction_Details" ClientIDMode="Static" 
                            CssClass="form-control InitializeDatePicker" autocomplete="nope"></asp:TextBox>
                    </div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Edit_Reference_Number.ClientID %>"><%= Resources.SiteCommon.Bank_Account_Transaction_Reference_Number %></label>
                    </div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Edit_Reference_Number" ValidationGroup="Edit_Transaction_Details" ClientIDMode="Static" CssClass="form-control" 
                            autocomplete="nope"></asp:TextBox>
                    </div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Transaction_Bank_Description.ClientID %>"><%= Resources.SiteCommon.Bank_Account_Transaction_Bank_Description %></label>
                    </div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Transaction_Bank_Description" ValidationGroup="Edit_Transaction_Details" ClientIDMode="Static" 
                            CssClass="form-control" autocomplete="nope"></asp:TextBox>
                    </div>
                </div>

                <div class="Form_Group">
                    <div class="Form_Label_Wrapper">
                        <label for="<%= textbox_Transaction_Bank_Inner_Reference_Code.ClientID %>"><%= Resources.SiteCommon.Bank_Account_Transaction_Bank_Inner_Reference %></label>
                    </div>
                    <div class="Form_Control">
                        <asp:TextBox runat="server" ID="textbox_Transaction_Bank_Inner_Reference_Code" ValidationGroup="Edit_Transaction_Details" ClientIDMode="Static" 
                            CssClass="form-control" autocomplete="nope"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="Edit_Transaction_Template_Commands">
                <asp:Button runat="server" ID="button_Popup_Save_Transaction_Details" ValidationGroup="Edit_Transaction_Details" OnClientClick="Hide_Transaction_Popup();"
                    OnClick="button_Popup_Save_Transaction_Details_Click" Text="<%$ Resources:SiteCommon, Bank_Account_Transaction_Save_Changes %>" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage_BankAccountTransactions.aspx.cs" Inherits="WebformsPOCDemo.manage_BankAccountTransactions" culture="auto" meta:resourcekey="Page" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">

        function EditBankTransactionRow(Transaction_Id)
        {
            var rowToMarkEditing = $('#Transaction_Record_Row_' + Transaction_Id + ' + .tr');
            if (rowToMarkEditing && rowToMarkEditing.length > 0)
            {
                rowToMarkEditing.addClass("Editing");
            }
        }

        function CancelEditBankTransactionRow(Transaction_Id)
        {
            var rowToMarkEditing = $('#Transaction_Record_Row_' + Transaction_Id + ' + .tr');
            if (rowToMarkEditing && rowToMarkEditing.length > 0)
            {
                $(rowToMarkEditing).find('input.Balance').val($(rowToMarkEditing).find('input.Balance').attr('LastEditedValue'));
                $(rowToMarkEditing).find('span.Balance').text($(rowToMarkEditing).find('input.Balance').attr('LastEditedValue'));
                $(rowToMarkEditing).find('input.Transaction_Date').val($(rowToMarkEditing).find('input.Transaction_Date').attr('LastEditedValue'));
                $(rowToMarkEditing).find('span.Transaction_Date').text($(rowToMarkEditing).find('input.Transaction_Date').attr('LastEditedValue'));
                $(rowToMarkEditing).find('input.Income_Value').val($(rowToMarkEditing).find('input.Income_Value').attr('LastEditedValue'));
                $(rowToMarkEditing).find('span.Income_Value').text($(rowToMarkEditing).find('input.Income_Value').attr('LastEditedValue'));
                $(rowToMarkEditing).find('input.Obligo_Value').val($(rowToMarkEditing).find('input.Obligo_Value').attr('LastEditedValue'));
                $(rowToMarkEditing).find('span.Obligo_Value').text($(rowToMarkEditing).find('input.Obligo_Value').attr('LastEditedValue'));
                $(rowToMarkEditing).find('input.Value_Date').val($(rowToMarkEditing).find('input.Value_Date').attr('LastEditedValue'));
                $(rowToMarkEditing).find('span.Value_Date').text($(rowToMarkEditing).find('input.Value_Date').attr('LastEditedValue'));
                $(rowToMarkEditing).find('input.Reference').val($(rowToMarkEditing).find('input.Reference').attr('LastEditedValue'));
                $(rowToMarkEditing).find('span.Reference').text($(rowToMarkEditing).find('input.Reference').attr('LastEditedValue'));
                $(rowToMarkEditing).find('input.Description').val($(rowToMarkEditing).find('input.Description').attr('LastEditedValue'));
                $(rowToMarkEditing).find('span.Description').text($(rowToMarkEditing).find('input.Description').attr('LastEditedValue'));
                $(rowToMarkEditing).find('input.Bank_Ref').val($(rowToMarkEditing).find('input.Bank_Ref').attr('LastEditedValue'));
                $(rowToMarkEditing).find('span.Bank_Ref').text($(rowToMarkEditing).find('input.Bank_Ref').attr('LastEditedValue'));

                rowToMarkEditing.removeClass("Editing");
            }
        }

        function SaveEditBankTransactionRow(Transaction_Id)
        {
            var rowToMarkEditing = $('#Transaction_Record_Row_' + Transaction_Id + ' + .tr');
            if (rowToMarkEditing && rowToMarkEditing.length > 0)
            {
                $(rowToMarkEditing).find('input.Balance').attr('LastEditedValue', $(rowToMarkEditing).find('input.Balance').val());
                $(rowToMarkEditing).find('span.Balance').text($(rowToMarkEditing).find('input.Balance').attr('LastEditedValue'));

                $(rowToMarkEditing).find('input.Transaction_Date').attr('LastEditedValue', $(rowToMarkEditing).find('input.Transaction_Date').val());
                $(rowToMarkEditing).find('span.Transaction_Date').text($(rowToMarkEditing).find('input.Transaction_Date').attr('LastEditedValue'));

                $(rowToMarkEditing).find('input.Income_Value').attr('LastEditedValue', $(rowToMarkEditing).find('input.Income_Value').val());
                $(rowToMarkEditing).find('span.Income_Value').text($(rowToMarkEditing).find('input.Income_Value').attr('LastEditedValue'));

                $(rowToMarkEditing).find('input.Obligo_Value').attr('LastEditedValue', $(rowToMarkEditing).find('input.Obligo_Value').val());
                $(rowToMarkEditing).find('span.Obligo_Value').text($(rowToMarkEditing).find('input.Obligo_Value').attr('LastEditedValue'));

                $(rowToMarkEditing).find('input.Value_Date').attr('LastEditedValue', $(rowToMarkEditing).find('input.Value_Date').val());
                $(rowToMarkEditing).find('span.Value_Date').text($(rowToMarkEditing).find('input.Value_Date').attr('LastEditedValue'));

                $(rowToMarkEditing).find('input.Reference').attr('LastEditedValue', $(rowToMarkEditing).find('input.Reference').val());
                $(rowToMarkEditing).find('span.Reference').text($(rowToMarkEditing).find('input.Reference').attr('LastEditedValue'));

                $(rowToMarkEditing).find('input.Description').attr('LastEditedValue', $(rowToMarkEditing).find('input.Description').val());
                $(rowToMarkEditing).find('span.Description').text($(rowToMarkEditing).find('input.Description').attr('LastEditedValue'));

                $(rowToMarkEditing).find('input.Bank_Ref').attr('LastEditedValue', $(rowToMarkEditing).find('input.Bank_Ref').val());
                $(rowToMarkEditing).find('span.Bank_Ref').text($(rowToMarkEditing).find('input.Bank_Ref').attr('LastEditedValue'));

                rowToMarkEditing.removeClass("Editing");
                rowToMarkEditing.addClass("alert-warning");

                $(rowToMarkEditing).find("[id*='hidden_PendingChanges']").val(true);

                document.getElementById('hidden_Pending_Changes').value = 'true';
            }
        }

        function DeleteBankTransactionRow(Transaction_Id)
        {
            var rowToMarkEditing = $('#Transaction_Record_Row_' + Transaction_Id + ' + .tr');
            if (rowToMarkEditing && rowToMarkEditing.length > 0)
            {
                rowToMarkEditing.removeClass("Editing");
                rowToMarkEditing.addClass("Deleted");
                rowToMarkEditing.removeClass("tr");

                $(rowToMarkEditing).find("[id*='hidden_PendingChanges']").val(true);
                $(rowToMarkEditing).find("[id*='hidden_IsDeleted']").val(true);

                // Manually use jQuery to fix last .tr cells bottom border (could not find CSS selector solution..)
                $('.Responsive-Table > .tr:last > .td').css('border-bottom', '1px solid #ced4da');
                $('.dark-mode .Responsive-Table > .tr:last > .td').css('border-bottom', '1px solid #404040');
            }
        }

        function AddNewTransactionRow(Transaction_Id)
        {
            if (document.getElementById('hidden_Prevent_Adding_New_Rows_Session_Expired') &&
                document.getElementById('hidden_Prevent_Adding_New_Rows_Session_Expired').value == 'true')
            {
                return;
            }

            document.getElementById('<%= hidden_New_Bank_Account_Transaction_After_Transaction_ID.ClientID %>').value = Transaction_Id;
            document.getElementById('<%= button_Add_New_Transaction_After_Transaction_Id.ClientID %>').click();
        }

        function onBeforeUnload(e)
        {
            if (document.getElementById('hidden_Pending_Changes') &&
                document.getElementById('hidden_Pending_Changes').value == 'true')
            {
                if (!e) e = window.event;

                e.cancelBubble = true;
                e.preventDefault();
                e.returnValue = '';

                if (e.stopPropagation)
                {
                    e.stopPropagation();
                }

                return;
            }

            delete e['returnValue'];
        }

        window.addEventListener('beforeunload', onBeforeUnload);

        var check_Session_Interval_Reference;

        function Start_Checking_Server_For_Expired_Session() {
            check_Session_Interval_Reference = setInterval(Check_If_Server_Session_Expired, 20000);
        }

        function Check_If_Server_Session_Expired()
        {

            $.get("manage_BankAccountTransactions.aspx?req=check_session&ajax=true", function (data, status) {
                if (status == 'success')
                {
                    // Prevent the user from adding new rows because session has expired and the user should save changes asap..
                    if (data == 'false') {

                        $('#button_Add_New_Bank_Account_Transactions').prop('disabled', true);
                        $('#button_Add_New_Bank_Account_Transactions2').prop('disabled', true);
                        $('#button_Add_New_Transaction_After_Transaction_Id').prop('disabled', true);

                        document.getElementById('hidden_Prevent_Adding_New_Rows_Session_Expired').value = 'true';
                        //clearInterval(check_Session_Interval_Reference);

                        document.getElementById('panel_Expired_Session_Warning').classList.remove('hidden');
                    }
                    else {
                        $('#button_Add_New_Bank_Account_Transactions').prop('disabled', false);
                        $('#button_Add_New_Bank_Account_Transactions2').prop('disabled', false);
                        $('#button_Add_New_Transaction_After_Transaction_Id').prop('disabled', false);

                        document.getElementById('hidden_Prevent_Adding_New_Rows_Session_Expired').value = 'false';
                        //clearInterval(check_Session_Interval_Reference);

                        document.getElementById('panel_Expired_Session_Warning').classList.add('hidden');
                    }
                }
            });
        }

        Start_Checking_Server_For_Expired_Session();

    </script>

    <div class="page-title my-3 text-center">
        <h2 class="display-5">Manage Bank Account</h2>
        <p class="lead">Change, add and hide details for your bank accounts. Connect records with documents.</p>
    </div>

    <hr />
        <asp:Button runat="server" ID="button_Add_New_Bank_Account_Transactions2" ClientIDMode="Static"
            Text="Add New Record" CssClass="btn btn-primary" OnClick="button_Add_New_Bank_Account_Transactions_Click" meta:resourcekey="button_Add_New_Bank_Account_Transactions2" /> 
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button runat="server" ID="button_Save_Bank_Account_Transactions2" 
            Text="Save Changes" OnClick="button_Save_Bank_Account_Transactions_Click" CssClass="btn btn-success" meta:resourcekey="button_Save_Bank_Account_Transactions2" /> 
        &nbsp;&nbsp;&nbsp;&nbsp;
        
    <asp:UpdatePanel runat="server" ID="up_Transactions" UpdateMode="Conditional">
        <ContentTemplate>

            <asp:Panel runat="server" ID="panel_Expired_Session_Warning" ClientIDMode="Static" CssClass="alert alert-warning hidden" 
                style="margin-top:12px;" meta:resourcekey="panel_Expired_Session_Warning">
                  <strong>Warning!</strong> Server session expired. Please save changes or refresh the page.
            </asp:Panel>
            <hr />

            <div class="Responsive-Table">
                <asp:Repeater runat="server" ID="repeater" OnItemDataBound="Repeater_ItemDataBound">
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
                        <asp:Panel runat="server" ID="panel_Bank_Account_Transaction_Id" CssClass="tr" meta:resourcekey="panel_Bank_Account_Transaction_Id">
                            <div class="td">
                                <asp:TextBox runat="server" ID="txt_Balance" CssClass="form-control Balance" autocomplete="nope" placeHolder="Balance" Text='<%# Bind("Transaction_Account_Balance", "{0:#,#.##}") %>' meta:resourcekey="txt_Balance"></asp:TextBox>
                                <asp:Label runat="server" ID="label_Balance" CssClass="Balance" Text='<%# Bind("Transaction_Account_Balance", "{0:#,#.##}") %>' meta:resourcekey="label_Balance"></asp:Label>
                            </div>
                            <div class="td">
                                <asp:TextBox runat="server" ID="txt_Actual_DateTime" CssClass="form-control InitializeDatePicker Transaction_Date" autocomplete="nope" placeHolder="Transaction Date" Text='<%# Bind("Transaction_Actual_DateTime", "{0:dd/MM/yyyy}" ) %>' meta:resourcekey="txt_Actual_DateTime"></asp:TextBox>
                                <asp:Label runat="server" ID="label_Transaction_Date" CssClass="Transaction_Date" Text='<%# Bind("Transaction_Actual_DateTime", "{0:dd/MM/yyyy}" ) %>' meta:resourcekey="label_Transaction_Date"></asp:Label>
                            </div>
                            <div class="td">
                                <asp:TextBox runat="server" ID="txt_Income_Value" CssClass="form-control Income_Value" placeHolder="Income_Value" autocomplete="nope" Text='<%# Bind("Positive_Amount_Entered", "{0:#,#.##}" ) %>' meta:resourcekey="txt_Income_Value"></asp:TextBox>
                                <asp:Label runat="server" ID="label_Income_Value" CssClass="Income_Value" Text='<%# Bind("Positive_Amount_Entered", "{0:#,#.##}") %>' meta:resourcekey="label_Income_Value"></asp:Label>
                            </div>
                            <div class="td">
                                <asp:TextBox runat="server" ID="txt_Obligo_Value" CssClass="form-control Obligo_Value" placeHolder="Obligo_Value" autocomplete="nope" Text='<%# Bind("Negative_Amount_Paid", "{0:#,#.##}" ) %>' meta:resourcekey="txt_Obligo_Value"></asp:TextBox>
                                <asp:Label runat="server" ID="label_Obligo_Value" CssClass="Obligo_Value" Text='<%# Bind("Negative_Amount_Paid", "{0:#,#.##}") %>' meta:resourcekey="label_Obligo_Value"></asp:Label>
                            </div>
                            <div class="td">
                                <asp:TextBox runat="server" ID="txt_Value_Date" CssClass="form-control InitializeDatePicker Value_Date" placeHolder="Value_Date" autocomplete="nope" Text='<%# Bind("Transaction_Value_DateTime", "{0:dd/MM/yyyy}" ) %>' meta:resourcekey="txt_Value_Date"></asp:TextBox>
                                <asp:Label runat="server" ID="label_Value_Date" CssClass="Value_Date" Text='<%# Bind("Transaction_Value_DateTime", "{0:dd/MM/yyyy}" ) %>' meta:resourcekey="label_Value_Date"></asp:Label>
                            </div>
                            <div class="td">
                                <asp:TextBox runat="server" ID="txt_Reference" CssClass="form-control Reference" placeHolder="Reference" autocomplete="nope" Text='<%# Bind( "Reference_Number" ) %>' meta:resourcekey="txt_Reference"></asp:TextBox>
                                <asp:Label runat="server" ID="label_Reference" CssClass="Reference" Text='<%# Bind("Reference_Number") %>' meta:resourcekey="label_Reference"></asp:Label>
                            </div>
                            <div class="td">
                                <asp:TextBox runat="server" ID="txt_Description" CssClass="form-control Description" placeHolder="Description" autocomplete="nope" Text='<%# Bind( "Transaction_Bank_Description" ) %>' meta:resourcekey="txt_Description"></asp:TextBox>
                                <asp:Label runat="server" ID="label_Description" CssClass="Description" Text='<%# Bind("Transaction_Bank_Description") %>' meta:resourcekey="label_Description"></asp:Label>
                            </div>
                            <div class="td">
                                <asp:TextBox runat="server" ID="txt_Bank_Ref" CssClass="form-control Bank_Ref" placeHolder="Bank_Ref" autocomplete="nope" Text='<%# Bind( "Transaction_Bank_Inner_Reference_Code" ) %>' meta:resourcekey="txt_Bank_Ref"></asp:TextBox>
                                <asp:Label runat="server" ID="label_Bank_Ref" CssClass="Bank_Ref" Text='<%# Bind("Transaction_Bank_Inner_Reference_Code") %>' meta:resourcekey="label_Bank_Ref"></asp:Label>
                            </div>
                            <div class="td" style="text-align:center">
                                <asp:HiddenField runat="server" ID="hidden_Transaction_Record_ID" Value='<%# Bind( "Bank_Account_Transaction_Id" ) %>' />
                                <asp:HiddenField runat="server" ID="hidden_Is_Visible_To_Anonymous_Users" Value='<%# Bind( "Is_Visible_To_Anonymous_Users" ) %>' />
                                <asp:HiddenField runat="server" ID="hidden_Is_Visible_To_Followers_Users" Value='<%# Bind( "Is_Visible_To_Followers_Users" ) %>' />
                                <asp:HiddenField runat="server" ID="hidden_IsNewRecord" Value='<%# Bind( "Is_New_Record" ) %>' />
                                <asp:HiddenField runat="server" ID="hidden_PendingChanges" Value='<%# Bind( "Pending_Changes" ) %>' />
                                <asp:HiddenField runat="server" ID="hidden_IsDeleted" Value='<%# Bind( "Is_Deleted" ) %>' />
                                <a class="Button_Edit" href='<%# Eval("Bank_Account_Transaction_Id", "javascript:EditBankTransactionRow({0})") %>' id="EditRow"><img src="/Images/edit.png" width="32" height="32" alt="Edit" title="Edit" /></a>
                                <a class="Button_SaveEdit" href='<%# Eval("Bank_Account_Transaction_Id", "javascript:SaveEditBankTransactionRow({0})") %>' id="SaveEditRow"><img src="/Images/save.png" width="32" height="32" alt="Edit" title="Save" /></a>
                                <a class="Button_CancelEdit" href='<%# Eval("Bank_Account_Transaction_Id", "javascript:CancelEditBankTransactionRow({0})") %>' id="CancelEditRow"><img src="/Images/cancel.png" width="32" height="32" alt="Edit" title="Cancel" /></a>
                                <a class="Button_ViewMore" href='<%# Eval("Bank_Account_Transaction_Id", "manage_BankAccountTransaction.aspx?id={0}") %>'><img src="/Images/viewdetails2.png" width="32" height="32" alt="Edit" title="View more" /></a>
                                <a class="Button_AddMore" href='<%# Eval("Bank_Account_Transaction_Id", "javascript:AddNewTransactionRow({0})") %>'><img src="/Images/addmore2.png" width="32" height="32" alt="Add" title="Add" /></a>
                                <a class="Button_Delete" href='<%# Eval("Bank_Account_Transaction_Id", "javascript:DeleteBankTransactionRow({0})") %>' id="DeleteRow"><img src="/Images/delete.png" width="32" height="32" alt="Delete" title="Delete" /></a>
                            </div>
                        </asp:Panel>
                    </ItemTemplate>
                    <FooterTemplate>

                    </FooterTemplate>

                </asp:Repeater>

            </div>

            <asp:HiddenField runat="server" ID="hidden_Pending_Changes" ClientIDMode="Static" Value="false" />
            <asp:HiddenField runat="server" ID="hidden_Prevent_Adding_New_Rows_Session_Expired" ClientIDMode="Static" Value="false" />
            
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="button_Add_New_Bank_Account_Transactions" />
            <asp:AsyncPostBackTrigger ControlID="button_Add_New_Bank_Account_Transactions2" />
            <asp:AsyncPostBackTrigger ControlID="button_Add_New_Transaction_After_Transaction_Id" />
            <asp:AsyncPostBackTrigger ControlID="button_Save_Bank_Account_Transactions" />
            <asp:AsyncPostBackTrigger ControlID="button_Save_Bank_Account_Transactions2" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:PlaceHolder runat="server" ID="ph_Pagination">
        <nav aria-label="Pages Navigation">
            <ul class="pagination pagination-lg">
                <li runat="server" id="pagination_li_Previous" class="page-item disabled">
                    <span class="page-link">Previous</span>
                </li>
                <asp:PlaceHolder runat="server" ID="ph_Pagination_Links">

                </asp:PlaceHolder>
                <li runat="server" id="pagination_li_Next" class="page-item">
                    <a class="page-link">Next</a>
                </li>
            </ul>
        </nav>
    </asp:PlaceHolder>
    

    <hr />
    <div>
        <asp:HiddenField runat="server" ID="hidden_New_Bank_Account_Transaction_After_Transaction_ID" ClientIDMode="Static" />
        
        <asp:Button runat="server" ID="button_Add_New_Transaction_After_Transaction_Id" ClientIDMode="Static" 
            Text="Add new after transaction" style="display:none" OnClick="button_Add_New_Transaction_After_Transaction_Id_Click" meta:resourcekey="button_Add_New_Transaction_After_Transaction_Id" />

        <asp:Button runat="server" ID="button_Add_New_Bank_Account_Transactions" ClientIDMode="Static"
            Text="Add New Record" CssClass="btn btn-primary" OnClick="button_Add_New_Bank_Account_Transactions_Click" meta:resourcekey="button_Add_New_Bank_Account_Transactions" /> 
        
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button runat="server" ID="button_Save_Bank_Account_Transactions" 
            Text="Save Changes" OnClick="button_Save_Bank_Account_Transactions_Click" CssClass="btn btn-success" meta:resourcekey="button_Save_Bank_Account_Transactions" /> 
        
    </div>

</asp:Content>

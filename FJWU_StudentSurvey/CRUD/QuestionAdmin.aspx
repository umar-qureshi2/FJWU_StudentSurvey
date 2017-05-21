<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="QuestionAdmin.aspx.cs" Inherits="FJWU_StudentSurvey.QuestionAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SearchPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">

            <!-- START DATATABLE EXPORT -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Courses Information</h3>
                    <div class="btn-group pull-right">
                        <button class="btn btn-danger dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i>Export Data</button>
                        <ul class="dropdown-menu">
                            <li><a href="#" onclick="$('#<%= QuestionsGrid.ClientID %>').tableExport({type:'excel',escape:'false'});">
                                <img src="<%= Page.ResolveUrl("~/html/img/icons/xls.png") %>" width="24" />
                                XLS</a></li>
                            <li><a href="#" onclick="$('#<%= QuestionsGrid.ClientID %>').tableExport({type:'pdf',escape:'false'});">
                                <img src="<%= Page.ResolveUrl("~/html/img/icons/pdf.png") %>" width="24" />
                                PDF</a></li>
                        </ul>
                    </div>

                </div>
                <div class="panel-body panel-body-table dataTables_wrapper no-footer">


                    <asp:GridView  CssClass="table datatable table-hover" ID="QuestionsGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="QuestionId" DataSourceID="QuestionsSource" AllowPaging="True" AllowSorting="True">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="QuestionId" HeaderText="QuestionId" ReadOnly="True" InsertVisible="False" SortExpression="QuestionId"></asp:BoundField>
                            <asp:BoundField DataField="QuestionText" HeaderText="QuestionText" SortExpression="QuestionText"></asp:BoundField>
                            <asp:BoundField DataField="QuestionType" HeaderText="QuestionType" SortExpression="QuestionType"></asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="QuestionsSource" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' DeleteCommand="DELETE FROM [Questions] WHERE [QuestionId] = @original_QuestionId AND (([QuestionText] = @original_QuestionText) OR ([QuestionText] IS NULL AND @original_QuestionText IS NULL)) AND (([QuestionType] = @original_QuestionType) OR ([QuestionType] IS NULL AND @original_QuestionType IS NULL))" InsertCommand="INSERT INTO [Questions] ([QuestionText], [QuestionType]) VALUES (@QuestionText, @QuestionType)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Questions]" UpdateCommand="UPDATE [Questions] SET [QuestionText] = @QuestionText, [QuestionType] = @QuestionType WHERE [QuestionId] = @original_QuestionId AND (([QuestionText] = @original_QuestionText) OR ([QuestionText] IS NULL AND @original_QuestionText IS NULL)) AND (([QuestionType] = @original_QuestionType) OR ([QuestionType] IS NULL AND @original_QuestionType IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_QuestionId" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_QuestionText" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_QuestionType" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="QuestionText" Type="String"></asp:Parameter>
                            <asp:Parameter Name="QuestionType" Type="Int32"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="QuestionText" Type="String"></asp:Parameter>
                            <asp:Parameter Name="QuestionType" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_QuestionId" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_QuestionText" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_QuestionType" Type="Int32"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>Add/Edit</strong> </h3>
                    <ul class="panel-controls">
                        <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                    </ul>
                </div>
                <div class="panel-body">
                    <strong class="error" style="color: red;">
                        <asp:Literal ID="warningtext" runat="server"></asp:Literal></strong>

                    <asp:FormView ID="QuestionsForm" runat="server" DataKeyNames="QuestionId" DataSourceID="QuestionsSource" AllowPaging="True">
                        <EditItemTemplate>
                            QuestionId:<asp:Label Text='<%# Eval("QuestionId") %>' runat="server" ID="QuestionIdLabel1" />
                            <br />
                            QuestionText:<asp:TextBox Text='<%# Bind("QuestionText") %>' runat="server" ID="QuestionTextTextBox" />
                            <br />
                            QuestionType:<asp:TextBox Text='<%# Bind("QuestionType") %>' runat="server" ID="QuestionTypeTextBox" />
                            <br />
                            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            QuestionText:<asp:TextBox Text='<%# Bind("QuestionText") %>' runat="server" ID="QuestionTextTextBox" />
                            <br />
                            QuestionType:<asp:TextBox Text='<%# Bind("QuestionType") %>' runat="server" ID="QuestionTypeTextBox" />
                            <br />
                            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            QuestionId:<asp:Label Text='<%# Eval("QuestionId") %>' runat="server" ID="QuestionIdLabel" />
                            <br />
                            QuestionText:<asp:Label Text='<%# Bind("QuestionText") %>' runat="server" ID="QuestionTextLabel" />
                            <br />
                            QuestionType:<asp:Label Text='<%# Bind("QuestionType") %>' runat="server" ID="QuestionTypeLabel" />
                            <br />
                            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JSAppendix1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="JSAppendix2" runat="server">
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="TeachersAdmin.aspx.cs" Inherits="FJWU_StudentSurvey.TeachersAdmin" %>

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
                            <li><a href="#" onclick="$('#<%= TeachersGrid.ClientID %>').tableExport({type:'excel',escape:'false'});">
                                <img src="<%= Page.ResolveUrl("~/html/img/icons/xls.png") %>" width="24" />
                                XLS</a></li>
                            <li><a href="#" onclick="$('#<%= TeachersGrid.ClientID %>').tableExport({type:'pdf',escape:'false'});">
                                <img src="<%= Page.ResolveUrl("~/html/img/icons/pdf.png") %>" width="24" />
                                PDF</a></li>
                        </ul>
                    </div>

                </div>
                <div class="panel-body panel-body-table dataTables_wrapper no-footer">


                    <asp:GridView ID="TeachersGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="TeacherId" DataSourceID="TeachersSource" AllowPaging="True" AllowSorting="True">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="TeacherId" HeaderText="TeacherId" ReadOnly="True" InsertVisible="False" SortExpression="TeacherId"></asp:BoundField>
                            <asp:BoundField DataField="TeacherName" HeaderText="TeacherName" SortExpression="TeacherName"></asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="TeachersSource" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' DeleteCommand="DELETE FROM [Teachers] WHERE [TeacherId] = @original_TeacherId AND [TeacherName] = @original_TeacherName" InsertCommand="INSERT INTO [Teachers] ([TeacherName]) VALUES (@TeacherName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Teachers]" UpdateCommand="UPDATE [Teachers] SET [TeacherName] = @TeacherName WHERE [TeacherId] = @original_TeacherId AND [TeacherName] = @original_TeacherName">
                        <DeleteParameters>
                            <asp:Parameter Name="original_TeacherId" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_TeacherName" Type="String"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="TeacherName" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="TeacherName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_TeacherId" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_TeacherName" Type="String"></asp:Parameter>
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
                    <h3 class="panel-title"><strong>Add/Edit Course</strong> </h3>
                    <ul class="panel-controls">
                        <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                    </ul>
                </div>
                <div class="panel-body">
                    <strong class="error" style="color: red;">
                        <asp:Literal ID="warningtext" runat="server"></asp:Literal></strong>

                    <asp:FormView ID="TeachersForm" runat="server" DataKeyNames="TeacherId" DataSourceID="TeachersSource" AllowPaging="True">
                        <EditItemTemplate>
                            TeacherId:
                <asp:Label Text='<%# Eval("TeacherId") %>' runat="server" ID="TeacherIdLabel1" /><br />
                            TeacherName:
                <asp:TextBox Text='<%# Bind("TeacherName") %>' runat="server" ID="TeacherNameTextBox" /><br />
                            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            TeacherName:
                <asp:TextBox Text='<%# Bind("TeacherName") %>' runat="server" ID="TeacherNameTextBox" /><br />
                            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            TeacherId:
                <asp:Label Text='<%# Eval("TeacherId") %>' runat="server" ID="TeacherIdLabel" /><br />
                            TeacherName:
                <asp:Label Text='<%# Bind("TeacherName") %>' runat="server" ID="TeacherNameLabel" /><br />
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

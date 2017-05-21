<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="SurveyAdmin.aspx.cs" Inherits="FJWU_StudentSurvey.SurveyAdmin" %>

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
                            <li><a href="#" onclick="$('#<%= SurveyGrid.ClientID %>').tableExport({type:'excel',escape:'false'});">
                                <img src="<%= Page.ResolveUrl("~/html/img/icons/xls.png") %>" width="24" />
                                XLS</a></li>
                            <li><a href="#" onclick="$('#<%= SurveyGrid.ClientID %>').tableExport({type:'pdf',escape:'false'});">
                                <img src="<%= Page.ResolveUrl("~/html/img/icons/pdf.png") %>" width="24" />
                                PDF</a></li>
                        </ul>
                    </div>

                </div>
                <div class="panel-body panel-body-table dataTables_wrapper no-footer">


                    <asp:GridView  CssClass="table datatable table-hover" ID="SurveyGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="SurveyId" DataSourceID="SurveySource" AllowPaging="True" AllowSorting="True">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="SurveyId" HeaderText="SurveyId" ReadOnly="True" InsertVisible="False" SortExpression="SurveyId"></asp:BoundField>
                            <asp:BoundField DataField="TeacherId" HeaderText="TeacherId" SortExpression="TeacherId"></asp:BoundField>
                            <asp:BoundField DataField="CourseId" HeaderText="CourseId" SortExpression="CourseId"></asp:BoundField>
                            <asp:BoundField DataField="StartTime" HeaderText="StartTime" SortExpression="StartTime"></asp:BoundField>
                            <asp:BoundField DataField="EndTime" HeaderText="EndTime" SortExpression="EndTime"></asp:BoundField>
                            <asp:BoundField DataField="DisplayName" HeaderText="DisplayName" SortExpression="DisplayName"></asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="SurveySource" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' DeleteCommand="DELETE FROM [Survey] WHERE [SurveyId] = @original_SurveyId AND [TeacherId] = @original_TeacherId AND [CourseId] = @original_CourseId AND (([StartTime] = @original_StartTime) OR ([StartTime] IS NULL AND @original_StartTime IS NULL)) AND (([EndTime] = @original_EndTime) OR ([EndTime] IS NULL AND @original_EndTime IS NULL)) AND (([DisplayName] = @original_DisplayName) OR ([DisplayName] IS NULL AND @original_DisplayName IS NULL))" InsertCommand="INSERT INTO [Survey] ([TeacherId], [CourseId], [StartTime], [EndTime], [DisplayName]) VALUES (@TeacherId, @CourseId, @StartTime, @EndTime, @DisplayName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Survey]" UpdateCommand="UPDATE [Survey] SET [TeacherId] = @TeacherId, [CourseId] = @CourseId, [StartTime] = @StartTime, [EndTime] = @EndTime, [DisplayName] = @DisplayName WHERE [SurveyId] = @original_SurveyId AND [TeacherId] = @original_TeacherId AND [CourseId] = @original_CourseId AND (([StartTime] = @original_StartTime) OR ([StartTime] IS NULL AND @original_StartTime IS NULL)) AND (([EndTime] = @original_EndTime) OR ([EndTime] IS NULL AND @original_EndTime IS NULL)) AND (([DisplayName] = @original_DisplayName) OR ([DisplayName] IS NULL AND @original_DisplayName IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_SurveyId" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_TeacherId" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_CourseId" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_StartTime" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="original_EndTime" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="original_DisplayName" Type="String"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="TeacherId" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="CourseId" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="StartTime" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="EndTime" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="DisplayName" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="TeacherId" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="CourseId" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="StartTime" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="EndTime" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="DisplayName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_SurveyId" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_TeacherId" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_CourseId" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_StartTime" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="original_EndTime" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="original_DisplayName" Type="String"></asp:Parameter>
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

                    <asp:FormView ID="SurveyAdminForm" runat="server" DataSourceID="SurveySource" AllowPaging="True"></asp:FormView>
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

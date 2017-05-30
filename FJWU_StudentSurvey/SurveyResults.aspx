<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="SurveyResults.aspx.cs" Inherits="FJWU_StudentSurvey.SurveyResults" %>

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
                    <h3 class="panel-title">Survey Information</h3>
                    <div class="btn-group pull-right">
                        <button class="btn btn-danger dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i>Export Data</button>
                        <%--<ul class="dropdown-menu">
                            <li><a href="#" onclick="$('#<%= DepartmentsGrid.ClientID %>').tableExport({type:'excel',escape:'false'});">
                                <img src="<%= Page.ResolveUrl("~/html/img/icons/xls.png") %>" width="24" />
                                XLS</a></li>
                            <li><a href="#" onclick="$('#<%= DepartmentsGrid.ClientID %>').tableExport({type:'pdf',escape:'false'});">
                                <img src="<%= Page.ResolveUrl("~/html/img/icons/pdf.png") %>" width="24" />
                                PDF</a></li>
                        </ul>--%>
                    </div>

                </div>
                <div class="panel-body panel-body-table dataTables_wrapper no-footer">
                    <div class="col-lg-12">
                        <strong class="error" style="color: red;">
                        <asp:Literal ID="warningtext" runat="server"></asp:Literal></strong><br />
                    </div>
                    <div class="col-lg-8">
                        <asp:DropDownList ID="SurveyDropDownList" runat="server"
                            CssClass="btn dropdown-toggle selectpicker btn-default size14"
                            DataSourceID="AllSurveySource"
                            DataTextField="DisplayName" DataValueField="SurveyId"
                            >
                        </asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="AllSurveySource"
                            ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>'
                            SelectCommand="SELECT SurveyId, DisplayName FROM [Survey]"></asp:SqlDataSource>
                    </div>
                    <div class="col-lg-4">
                        <asp:Button ID="GetSurveyResults" CssClass="btn btn-primary" runat="server" Text="View Answers" OnClick="GetSurveyResults_Click" />
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            Course:
                            <asp:GridView ID="SurveyAnswersGridCourse" runat="server" AutoGenerateColumns = "true"></asp:GridView>
                            Teacher:
                            <asp:GridView ID="SurveyAnswersGridTeacher" runat="server"></asp:GridView>
                        </div>
                    </div>
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

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
                        <button class="btn btn-danger dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i>Export Teacher Data</button>
                        <ul class="dropdown-menu">
                            <li><a href="#" onclick="$('#<%= SurveyAnswersGridTeacher.ClientID %>').tableExport({type:'excel',escape:'false'});">
                                <img src="<%= Page.ResolveUrl("~/html/img/icons/xls.png") %>" width="24" />
                                XLS</a></li>
                            <li><a href="#" onclick="$('#<%= SurveyAnswersGridTeacher.ClientID %>').tableExport({type:'pdf',escape:'false'});">
                                <img src="<%= Page.ResolveUrl("~/html/img/icons/pdf.png") %>" width="24" />
                                PDF</a></li>
                        </ul>
                    </div>
                    <div class="btn-group pull-right">
                        <button class="btn btn-danger dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i>Export Course Data</button>
                        <ul class="dropdown-menu">
                            <li><a href="#" onclick="$('#<%= SurveyAnswersGridCourse.ClientID %>').tableExport({type:'excel',escape:'false'});">
                                <img src="<%= Page.ResolveUrl("~/html/img/icons/xls.png") %>" width="24" />
                                XLS</a></li>
                            <li><a href="#" onclick="$('#<%= SurveyAnswersGridCourse.ClientID %>').tableExport({type:'pdf',escape:'false'});">
                                <img src="<%= Page.ResolveUrl("~/html/img/icons/pdf.png") %>" width="24" />
                                PDF</a></li>
                        </ul>
                    </div>

                </div>
                <div class="panel-body panel-body-table dataTables_wrapper no-footer">
                    <div class="col-lg-12">
                        <strong class="error" style="color: red;">
                        <asp:Literal ID="warningtext" runat="server"></asp:Literal></strong><br />
                    </div>
                    <div class="col-lg-2">
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
                    <div class="col-lg-2">
                        <asp:Button ID="GetSurveyResults" CssClass="btn btn-primary" runat="server" Text="View Answers" OnClick="GetSurveyResults_Click" />
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <h2>Course:</h2>
                            <asp:GridView ID="SurveyAnswersGridCourse" runat="server" AutoGenerateColumns = "true"></asp:GridView>
                            <br />
                            <h2>Teacher:</h2>
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
     <!-- START THIS PAGE PLUGINS-->
    <script type="text/javascript" src="<%= Page.ResolveUrl("~/html/js/plugins/icheck/icheck.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~/html/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js") %> "></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~/html/js/plugins/datatables/jquery.dataTables.min.js") %> "></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~/html/js/plugins/tableexport/tableExport.js") %> "></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~/html/js/plugins/tableexport/jquery.base64.js") %> "></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~/html/js/plugins/tableexport/html2canvas.js") %> "></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~/html/js/plugins/tableexport/jspdf/libs/sprintf.js") %> "></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~/html/js/plugins/tableexport/jspdf/jspdf.js") %> "></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~/html/js/plugins/tableexport/jspdf/libs/base64.js") %> "></script>
    <!-- END THIS PAGE PLUGINS-->
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="JSAppendix2" runat="server">
</asp:Content>

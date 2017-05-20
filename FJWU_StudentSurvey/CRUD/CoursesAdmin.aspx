<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="CoursesAdmin.aspx.cs" Inherits="FJWU_StudentSurvey.CoursesAdmin" %>

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
                            <li><a href="#" onclick="$('#<%= CoursesGrid.ClientID %>').tableExport({type:'excel',escape:'false'});">
                                <img src="<%= Page.ResolveUrl("~/html/img/icons/xls.png") %>" width="24" />
                                XLS</a></li>
                            <li><a href="#" onclick="$('#<%= CoursesGrid.ClientID %>').tableExport({type:'pdf',escape:'false'});">
                                <img src="<%= Page.ResolveUrl("~/html/img/icons/pdf.png") %>" width="24" />
                                PDF</a></li>
                        </ul>
                    </div>

                </div>
                <div class="panel-body panel-body-table dataTables_wrapper no-footer">

                    <asp:GridView CssClass="table datatable table-hover" ID="CoursesGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="CourseID" DataSourceID="CoursesSource" AllowPaging="True" AllowSorting="True">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="CourseID" HeaderText="CourseID" ReadOnly="True" InsertVisible="False" SortExpression="CourseID"></asp:BoundField>
                            <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName"></asp:BoundField>
                            <asp:BoundField DataField="CourseSession" HeaderText="CourseSession" SortExpression="CourseSession"></asp:BoundField>
                            <asp:BoundField DataField="DeptId" HeaderText="DeptId" SortExpression="DeptId"></asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="CoursesSource" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' DeleteCommand="DELETE FROM [Courses] WHERE [CourseID] = @original_CourseID AND [CourseName] = @original_CourseName AND (([CourseSession] = @original_CourseSession) OR ([CourseSession] IS NULL AND @original_CourseSession IS NULL)) AND [DeptId] = @original_DeptId" InsertCommand="INSERT INTO [Courses] ([CourseName], [CourseSession], [DeptId]) VALUES (@CourseName, @CourseSession, @DeptId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Courses]" UpdateCommand="UPDATE [Courses] SET [CourseName] = @CourseName, [CourseSession] = @CourseSession, [DeptId] = @DeptId WHERE [CourseID] = @original_CourseID AND [CourseName] = @original_CourseName AND (([CourseSession] = @original_CourseSession) OR ([CourseSession] IS NULL AND @original_CourseSession IS NULL)) AND [DeptId] = @original_DeptId">
                        <DeleteParameters>
                            <asp:Parameter Name="original_CourseID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_CourseName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_CourseSession" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_DeptId" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="CourseName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="CourseSession" Type="String"></asp:Parameter>
                            <asp:Parameter Name="DeptId" Type="Int32"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="CourseName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="CourseSession" Type="String"></asp:Parameter>
                            <asp:Parameter Name="DeptId" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_CourseID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_CourseName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_CourseSession" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_DeptId" Type="Int32"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
            <!-- END DATATABLE EXPORT -->
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
                
                    <asp:FormView CssClass="form-horizontal" ID="CoursesForm" runat="server" DataKeyNames="CourseID" DataSourceID="CoursesSource">
                    <EditItemTemplate>
                        CourseID:<asp:Label Text='<%# Eval("CourseID") %>' runat="server" ID="CourseIDLabel1" />
                        <br />
                        CourseName:<asp:TextBox Text='<%# Bind("CourseName") %>' runat="server" ID="CourseNameTextBox" />
                        <br />
                        CourseSession:<asp:TextBox Text='<%# Bind("CourseSession") %>' runat="server" ID="CourseSessionTextBox" />
                        <br />
                        DeptId:<asp:TextBox Text='<%# Bind("DeptId") %>' runat="server" ID="DeptIdTextBox" />
                        <br />
                        <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        CourseName:<asp:TextBox Text='<%# Bind("CourseName") %>' runat="server" ID="CourseNameTextBox" />
                        <br />
                        CourseSession:<asp:TextBox Text='<%# Bind("CourseSession") %>' runat="server" ID="CourseSessionTextBox" />
                        <br />
                        DeptId:<asp:TextBox Text='<%# Bind("DeptId") %>' runat="server" ID="DeptIdTextBox" />
                        <br />
                        <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        CourseID:<asp:Label Text='<%# Eval("CourseID") %>' runat="server" ID="CourseIDLabel" />
                        <br />
                        CourseName:<asp:Label Text='<%# Bind("CourseName") %>' runat="server" ID="CourseNameLabel" />
                        <br />
                        CourseSession:<asp:Label Text='<%# Bind("CourseSession") %>' runat="server" ID="CourseSessionLabel" />
                        <br />
                        DeptId:<asp:Label Text='<%# Bind("DeptId") %>' runat="server" ID="DeptIdLabel" />
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

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="SurveyQuestionAdmin.aspx.cs" Inherits="FJWU_StudentSurvey.SurveyQuestionAdmin" %>

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
                            <li><a href="#" onclick="$('#<%= SurveyQuestionGrid.ClientID %>').tableExport({type:'excel',escape:'false'});">
                                <img src="<%= Page.ResolveUrl("~/html/img/icons/xls.png") %>" width="24" />
                                XLS</a></li>
                            <li><a href="#" onclick="$('#<%= SurveyQuestionGrid.ClientID %>').tableExport({type:'pdf',escape:'false'});">
                                <img src="<%= Page.ResolveUrl("~/html/img/icons/pdf.png") %>" width="24" />
                                PDF</a></li>
                        </ul>
                    </div>

                </div>
                <div class="panel-body panel-body-table dataTables_wrapper no-footer">


                    <asp:GridView CssClass="table datatable table-hover" ID="SurveyQuestionGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="SurveyQuestion" DataSourceID="SurveyQuestionSource" AllowPaging="True" AllowSorting="True">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="SurveyQuestion" HeaderText="SurveyQuestion" ReadOnly="True" InsertVisible="False" SortExpression="SurveyQuestion"></asp:BoundField>
                            <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question"></asp:BoundField>
                            <asp:BoundField DataField="Survey" HeaderText="Survey" SortExpression="Survey"></asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="SurveyQuestionSource" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' DeleteCommand="DELETE FROM [SurveyQuestions] WHERE [SurveyQuestion] = @original_SurveyQuestion AND [Question] = @original_Question AND [Survey] = @original_Survey" InsertCommand="INSERT INTO [SurveyQuestions] ([Question], [Survey]) VALUES (@Question, @Survey)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [SurveyQuestions]" UpdateCommand="UPDATE [SurveyQuestions] SET [Question] = @Question, [Survey] = @Survey WHERE [SurveyQuestion] = @original_SurveyQuestion AND [Question] = @original_Question AND [Survey] = @original_Survey">
                        <DeleteParameters>
                            <asp:Parameter Name="original_SurveyQuestion" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_Question" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_Survey" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Question" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Survey" Type="Int32"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Question" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Survey" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_SurveyQuestion" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_Question" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_Survey" Type="Int32"></asp:Parameter>
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
                        <asp:Literal ID="warningtext" runat="server"></asp:Literal></strong><br />
                    <label class="control-label">Survey Questions</label>

                    <asp:DropDownList ID="SurveyList" CssClass="btn dropdown-toggle selectpicker btn-default size14" runat="server" DataSourceID="SurveyListSource" DataTextField="DisplayName" DataValueField="SurveyId"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SurveyListSource" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' SelectCommand="SELECT * FROM [Survey]"></asp:SqlDataSource>

                    <asp:DropDownList ID="QuestionsList" 
                        CssClass="btn dropdown-toggle selectpicker btn-default size14"  runat="server" 
                        DataSourceID="QuestionsSource" DataTextField="QuestionText" DataValueField="QuestionId"></asp:DropDownList>

                    <asp:SqlDataSource runat="server" ID="QuestionsSource"
                        ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>'
                        SelectCommand="SELECT [QuestionId], [QuestionText] + ' - ' + Convert(varchar(10),[QuestionType]) AS QuestionText FROM [Questions]"></asp:SqlDataSource>
                    <br />
                    <asp:Button ID="AddSurveyQuestionButton" runat="server" 
                        Text="Add Question" 
                        OnClick="AddSurveyQuestionButton_Click" CssClass="btn btn-success size14"/>
                
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

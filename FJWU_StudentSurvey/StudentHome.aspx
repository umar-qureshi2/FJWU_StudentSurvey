<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="FJWU_StudentSurvey.StudentHome" %>

<%@ Register Src="~/UserControls/QuestionControl.ascx" TagPrefix="uc1" TagName="QuestionControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <asp:DropDownList CssClass="btn dropdown-toggle selectpicker btn-default size14" AutoPostBack="True" OnSelectedIndexChanged="CoursesList_SelectedIndexChanged" ID="CoursesList" runat="server" DataSourceID="CoursesDataSource" DataTextField="CourseName" DataValueField="CourseID"></asp:DropDownList>
        
        <asp:SqlDataSource runat="server" ID="CoursesDataSource" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' SelectCommand="SELECT [CourseID],[CourseName] + ' - ' +[CourseSession] AS CourseName FROM [Courses]"></asp:SqlDataSource>

        <asp:DropDownList  CssClass="btn dropdown-toggle selectpicker btn-default size14" AutoPostBack="True" OnSelectedIndexChanged="TeachersList_SelectedIndexChanged" ID="TeachersList" runat="server" DataSourceID="TeachersSource" DataTextField="TeacherName" DataValueField="TeacherId"></asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="TeachersSource" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' SelectCommand="SELECT * FROM [Teachers]"></asp:SqlDataSource>
    </div>
    <div class="row">

        <asp:Literal ID="SurveyName" runat="server"></asp:Literal>
        <asp:DropDownList ID="StudentSurveys" runat="server" DataSourceID="ServeySource" DataTextField="DisplayName" DataValueField="SurveyId" Enabled="false"></asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="ServeySource" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' SelectCommand="SELECT * FROM [Survey] WHERE (([CourseId] = @CourseId) AND ([TeacherId] = @TeacherId))">
            <SelectParameters>
                <asp:ControlParameter ControlID="CoursesList" PropertyName="SelectedValue" DefaultValue="1" Name="CourseId" Type="Int32"></asp:ControlParameter>
                <asp:ControlParameter ControlID="TeachersList" PropertyName="SelectedValue" DefaultValue="1" Name="TeacherId" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <asp:Panel ID="QuestionsPanel" runat="server">
    </asp:Panel>
    <%--<div class="row">
        <asp:ListBox ID="QuestionsList" runat="server" DataSourceID="SurveyQuestionsSource" DataTextField="SurveyQuestion" DataValueField="SurveyQuestion"></asp:ListBox>
        <asp:SqlDataSource runat="server" ID="SurveyQuestionsSource" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' SelectCommand="SELECT * FROM [SurveyQuestions] WHERE ([Survey] = @Survey)">
            <SelectParameters>
                <asp:ControlParameter ControlID="StudentSurveys" PropertyName="SelectedValue" DefaultValue="1" Name="Survey" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>--%>
</asp:Content>

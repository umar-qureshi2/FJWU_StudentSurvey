<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuestionControl.ascx.cs" Inherits="FJWU_StudentSurvey.UserControls.QuestionControl" %>

<div class="row">
    <asp:Literal ID="QuestionText" runat="server"></asp:Literal>
</div>
<div class="row">
    <asp:RadioButtonList  RepeatDirection="Horizontal" ID="AnswerOptions" runat="server">
        <asp:ListItem Value="5" style="margin-left:20px;padding-left:20px;" class="SurveyAnswer">Strongly Agree</asp:ListItem>
        <asp:ListItem Value="4" style="margin-left:20px;padding-left:20px;" class="SurveyAnswer">Agree</asp:ListItem>
        <asp:ListItem Value="3" style="margin-left:20px;padding-left:20px;" class="SurveyAnswer">Neutral</asp:ListItem>
        <asp:ListItem Value="2" style="margin-left:20px;padding-left:20px;" class="SurveyAnswer">Disagree</asp:ListItem>
        <asp:ListItem Value="1" style="margin-left:20px;padding-left:20px;" class="SurveyAnswer">Strongly Disagree</asp:ListItem>
    </asp:RadioButtonList>
</div>

<%--<asp:RadioButtonList ID="QuestionAnswer" runat="server" DataSourceID="AnswersSource" DataTextField="Option2" DataValueField="Option2"></asp:RadioButtonList>
<asp:SqlDataSource runat="server" ID="AnswersSource" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' SelectCommand="SELECT * FROM [AnswerOptions]"></asp:SqlDataSource>--%>

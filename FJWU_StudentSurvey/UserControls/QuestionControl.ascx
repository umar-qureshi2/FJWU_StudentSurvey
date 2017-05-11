<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuestionControl.ascx.cs" Inherits="FJWU_StudentSurvey.UserControls.QuestionControl" %>

<div class="row">
    <asp:Literal ID="QuestionText" runat="server"></asp:Literal>
</div>
<div class="row">
    <asp:RadioButtonList ID="AnswerOptions" runat="server">
        <asp:ListItem Value="5">Strongly Agree</asp:ListItem>
        <asp:ListItem Value="4">Agree</asp:ListItem>
        <asp:ListItem Value="3">Neutral</asp:ListItem>
        <asp:ListItem Value="2">Disagree</asp:ListItem>
        <asp:ListItem Value="1">Strongly Disagree</asp:ListItem>
    </asp:RadioButtonList>
</div>

<%--<asp:RadioButtonList ID="QuestionAnswer" runat="server" DataSourceID="AnswersSource" DataTextField="Option2" DataValueField="Option2"></asp:RadioButtonList>
<asp:SqlDataSource runat="server" ID="AnswersSource" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' SelectCommand="SELECT * FROM [AnswerOptions]"></asp:SqlDataSource>--%>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuestionControl.ascx.cs" Inherits="FJWU_StudentSurvey.UserControls.QuestionControl" %>
<asp:Literal ID="QuestionText" runat="server"></asp:Literal>
<asp:RadioButtonList ID="QuestionAnswer" runat="server" DataSourceID="AnswersSource" DataTextField="Option2" DataValueField="Option2"></asp:RadioButtonList>
<asp:SqlDataSource runat="server" ID="AnswersSource" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' SelectCommand="SELECT * FROM [AnswerOptions]"></asp:SqlDataSource>

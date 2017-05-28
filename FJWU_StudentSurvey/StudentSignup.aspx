<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentSignup.aspx.cs" Inherits="FJWU_StudentSurvey.StudentSignup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="StudentRegistrationForm" runat="server">
    <div>
        StudentName:
        <asp:TextBox  runat="server" ID="StudentNameTextBox" /><br />
        FatherName:
        <asp:TextBox  runat="server" ID="FatherNameTextBox" /><br />
        Email:
        <asp:TextBox  runat="server" ID="EmailTextBox" /><br />
        Address:
        <asp:TextBox  runat="server" ID="AddressTextBox" /><br />
        MobileNumber:
        <asp:TextBox  runat="server" ID="MobileNumberTextBox" /><br />
        Department:
        <asp:DropDownList ID="DepartmentList" runat="server" DataSourceID="DepartmentsSource" DataTextField="Name" DataValueField="DepartmentId"></asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="DepartmentsSource" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>
        <%--<asp:TextBox  runat="server" ID="DepartmentTextBox" />--%><br />
        Program:
        <asp:TextBox  runat="server" ID="ProgramTextBox" /><br />
        Semester:
        <asp:DropDownList ID="SemesterList" runat="server">
            <asp:ListItem Selected="True">First</asp:ListItem>
            <asp:ListItem >Second</asp:ListItem>
            <asp:ListItem >Third</asp:ListItem>
            <asp:ListItem >Fourth</asp:ListItem>
            <asp:ListItem >Fifth</asp:ListItem>
            <asp:ListItem >Sixth</asp:ListItem>
            <asp:ListItem >Seventh</asp:ListItem>
            <asp:ListItem >Eighth</asp:ListItem>
        </asp:DropDownList>
        <%--<asp:TextBox  runat="server" ID="SemesterTextBox" />--%><br />
        SupportingProgram:
        <asp:TextBox  runat="server" ID="SupportingProgramTextBox" /><br />
        BloodGroup:
        <asp:TextBox  runat="server" ID="BloodGroupTextBox" /><br />
        UserName:
        <asp:TextBox  runat="server" ID="UserNameTextBox" /><br />
        Password:
        <asp:TextBox type="password"  runat="server" ID="PasswordTextBox" /><br />
        <asp:Button ID="SignupButton" runat="server" Text="Register" OnClick="SignupButton_Click" />
    </div>
    </form>
</body>
</html>

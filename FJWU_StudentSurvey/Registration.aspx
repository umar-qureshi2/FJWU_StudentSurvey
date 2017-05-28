<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="FJWU_StudentSurvey.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SearchPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        StudentName:
        <asp:TextBox runat="server" ID="StudentNameTextBox" /><br />
        FatherName:
        <asp:TextBox runat="server" ID="FatherNameTextBox" /><br />
        Email:
        <asp:TextBox runat="server" ID="EmailTextBox" /><br />
        Address:
        <asp:TextBox runat="server" ID="AddressTextBox" /><br />
        MobileNumber:
        <asp:TextBox runat="server" ID="MobileNumberTextBox" /><br />
        Department:
        <asp:DropDownList ID="DepartmentList" runat="server" DataSourceID="DepartmentsSource" DataTextField="Name" DataValueField="DepartmentId"></asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="DepartmentsSource" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>
        <%--<asp:TextBox  runat="server" ID="DepartmentTextBox" />--%><br />
        Program:
        <asp:TextBox runat="server" ID="ProgramTextBox" /><br />
        Semester:
        <asp:DropDownList ID="SemesterList" runat="server">
            <asp:ListItem Selected="True">First</asp:ListItem>
            <asp:ListItem>Second</asp:ListItem>
            <asp:ListItem>Third</asp:ListItem>
            <asp:ListItem>Fourth</asp:ListItem>
            <asp:ListItem>Fifth</asp:ListItem>
            <asp:ListItem>Sixth</asp:ListItem>
            <asp:ListItem>Seventh</asp:ListItem>
            <asp:ListItem>Eighth</asp:ListItem>
        </asp:DropDownList>
        <%--<asp:TextBox  runat="server" ID="SemesterTextBox" />--%><br />
        SupportingProgram:
        <asp:TextBox runat="server" ID="SupportingProgramTextBox" /><br />
        BloodGroup:
        <asp:TextBox runat="server" ID="BloodGroupTextBox" /><br />
        UserName:
        <asp:TextBox runat="server" ID="UserNameTextBox" /><br />
        Password:
        <asp:TextBox type="password" runat="server" ID="PasswordTextBox" /><br />
        <asp:Button ID="SignupButton" runat="server" Text="Register" OnClick="SignupButton_Click" />
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JSAppendix1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="JSAppendix2" runat="server">
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="CrudStudents.aspx.cs" Inherits="FJWU_StudentSurvey.CrudStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SearchPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <asp:GridView CssClass="table datatable table-hover" ID="StudentsGrid" runat="server" DataSourceID="StudentDataSource" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="True"></asp:CommandField>
            </Columns>
        </asp:GridView>
    </div>
    <div class="row">
        <asp:FormView ID="StudentForm" runat="server" DataKeyNames="StudentId" DataSourceID="StudentDataSource">
            <EditItemTemplate>
                StudentId:
                <asp:Label Text='<%# Eval("StudentId") %>' runat="server" ID="StudentIdLabel1" /><br />
                StudentName:
                <asp:TextBox Text='<%# Bind("StudentName") %>' runat="server" ID="StudentNameTextBox" /><br />
                FatherName:
                <asp:TextBox Text='<%# Bind("FatherName") %>' runat="server" ID="FatherNameTextBox" /><br />
                Email:
                <asp:TextBox Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBox" /><br />
                Address:
                <asp:TextBox Text='<%# Bind("Address") %>' runat="server" ID="AddressTextBox" /><br />
                MobileNumber:
                <asp:TextBox Text='<%# Bind("MobileNumber") %>' runat="server" ID="MobileNumberTextBox" /><br />
                Department:
                <asp:TextBox Text='<%# Bind("Department") %>' runat="server" ID="DepartmentTextBox" /><br />
                Program:
                <asp:TextBox Text='<%# Bind("Program") %>' runat="server" ID="ProgramTextBox" /><br />
                Semester:
                <asp:TextBox Text='<%# Bind("Semester") %>' runat="server" ID="SemesterTextBox" /><br />
                SupportingProgram:
                <asp:TextBox Text='<%# Bind("SupportingProgram") %>' runat="server" ID="SupportingProgramTextBox" /><br />
                BloodGroup:
                <asp:TextBox Text='<%# Bind("BloodGroup") %>' runat="server" ID="BloodGroupTextBox" /><br />
                UserName:
                <asp:TextBox Text='<%# Bind("UserName") %>' runat="server" ID="UserNameTextBox" /><br />
                Password:
                <asp:TextBox Text='<%# Bind("Password") %>' runat="server" ID="PasswordTextBox" /><br />
                <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
            </EditItemTemplate>
            <InsertItemTemplate>
                StudentName:
                <asp:TextBox Text='<%# Bind("StudentName") %>' runat="server" ID="StudentNameTextBox" /><br />
                FatherName:
                <asp:TextBox Text='<%# Bind("FatherName") %>' runat="server" ID="FatherNameTextBox" /><br />
                Email:
                <asp:TextBox Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBox" /><br />
                Address:
                <asp:TextBox Text='<%# Bind("Address") %>' runat="server" ID="AddressTextBox" /><br />
                MobileNumber:
                <asp:TextBox Text='<%# Bind("MobileNumber") %>' runat="server" ID="MobileNumberTextBox" /><br />
                Department:
                <asp:TextBox Text='<%# Bind("Department") %>' runat="server" ID="DepartmentTextBox" /><br />
                Program:
                <asp:TextBox Text='<%# Bind("Program") %>' runat="server" ID="ProgramTextBox" /><br />
                Semester:
                <asp:TextBox Text='<%# Bind("Semester") %>' runat="server" ID="SemesterTextBox" /><br />
                SupportingProgram:
                <asp:TextBox Text='<%# Bind("SupportingProgram") %>' runat="server" ID="SupportingProgramTextBox" /><br />
                BloodGroup:
                <asp:TextBox Text='<%# Bind("BloodGroup") %>' runat="server" ID="BloodGroupTextBox" /><br />
                UserName:
                <asp:TextBox Text='<%# Bind("UserName") %>' runat="server" ID="UserNameTextBox" /><br />
                Password:
                <asp:TextBox Text='<%# Bind("Password") %>' runat="server" ID="PasswordTextBox" /><br />
                <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
            </InsertItemTemplate>
            <ItemTemplate>
                StudentId:
                <asp:Label Text='<%# Eval("StudentId") %>' runat="server" ID="StudentIdLabel" /><br />
                StudentName:
                <asp:Label Text='<%# Bind("StudentName") %>' runat="server" ID="StudentNameLabel" /><br />
                FatherName:
                <asp:Label Text='<%# Bind("FatherName") %>' runat="server" ID="FatherNameLabel" /><br />
                Email:
                <asp:Label Text='<%# Bind("Email") %>' runat="server" ID="EmailLabel" /><br />
                Address:
                <asp:Label Text='<%# Bind("Address") %>' runat="server" ID="AddressLabel" /><br />
                MobileNumber:
                <asp:Label Text='<%# Bind("MobileNumber") %>' runat="server" ID="MobileNumberLabel" /><br />
                Department:
                <asp:Label Text='<%# Bind("Department") %>' runat="server" ID="DepartmentLabel" /><br />
                Program:
                <asp:Label Text='<%# Bind("Program") %>' runat="server" ID="ProgramLabel" /><br />
                Semester:
                <asp:Label Text='<%# Bind("Semester") %>' runat="server" ID="SemesterLabel" /><br />
                SupportingProgram:
                <asp:Label Text='<%# Bind("SupportingProgram") %>' runat="server" ID="SupportingProgramLabel" /><br />
                BloodGroup:
                <asp:Label Text='<%# Bind("BloodGroup") %>' runat="server" ID="BloodGroupLabel" /><br />
                UserName:
                <asp:Label Text='<%# Bind("UserName") %>' runat="server" ID="UserNameLabel" /><br />
                Password:
                <asp:Label Text='<%# Bind("Password") %>' runat="server" ID="PasswordLabel" /><br />
                <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource runat="server" ID="StudentDataSource" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' DeleteCommand="DELETE FROM [Students] WHERE [StudentId] = @original_StudentId AND [StudentName] = @original_StudentName AND [FatherName] = @original_FatherName AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND (([MobileNumber] = @original_MobileNumber) OR ([MobileNumber] IS NULL AND @original_MobileNumber IS NULL)) AND [Department] = @original_Department AND (([Program] = @original_Program) OR ([Program] IS NULL AND @original_Program IS NULL)) AND (([Semester] = @original_Semester) OR ([Semester] IS NULL AND @original_Semester IS NULL)) AND (([SupportingProgram] = @original_SupportingProgram) OR ([SupportingProgram] IS NULL AND @original_SupportingProgram IS NULL)) AND (([BloodGroup] = @original_BloodGroup) OR ([BloodGroup] IS NULL AND @original_BloodGroup IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL))" InsertCommand="INSERT INTO [Students] ([StudentName], [FatherName], [Email], [Address], [MobileNumber], [Department], [Program], [Semester], [SupportingProgram], [BloodGroup], [UserName], [Password]) VALUES (@StudentName, @FatherName, @Email, @Address, @MobileNumber, @Department, @Program, @Semester, @SupportingProgram, @BloodGroup, @UserName, @Password)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Students]" UpdateCommand="UPDATE [Students] SET [StudentName] = @StudentName, [FatherName] = @FatherName, [Email] = @Email, [Address] = @Address, [MobileNumber] = @MobileNumber, [Department] = @Department, [Program] = @Program, [Semester] = @Semester, [SupportingProgram] = @SupportingProgram, [BloodGroup] = @BloodGroup, [UserName] = @UserName, [Password] = @Password WHERE [StudentId] = @original_StudentId AND [StudentName] = @original_StudentName AND [FatherName] = @original_FatherName AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND (([MobileNumber] = @original_MobileNumber) OR ([MobileNumber] IS NULL AND @original_MobileNumber IS NULL)) AND [Department] = @original_Department AND (([Program] = @original_Program) OR ([Program] IS NULL AND @original_Program IS NULL)) AND (([Semester] = @original_Semester) OR ([Semester] IS NULL AND @original_Semester IS NULL)) AND (([SupportingProgram] = @original_SupportingProgram) OR ([SupportingProgram] IS NULL AND @original_SupportingProgram IS NULL)) AND (([BloodGroup] = @original_BloodGroup) OR ([BloodGroup] IS NULL AND @original_BloodGroup IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_StudentId" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_StudentName" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_FatherName" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Address" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_MobileNumber" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Department" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_Program" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Semester" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_SupportingProgram" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_BloodGroup" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_UserName" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Password" Type="String"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StudentName" Type="String"></asp:Parameter>
                <asp:Parameter Name="FatherName" Type="String"></asp:Parameter>
                <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                <asp:Parameter Name="Address" Type="String"></asp:Parameter>
                <asp:Parameter Name="MobileNumber" Type="String"></asp:Parameter>
                <asp:Parameter Name="Department" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Program" Type="String"></asp:Parameter>
                <asp:Parameter Name="Semester" Type="String"></asp:Parameter>
                <asp:Parameter Name="SupportingProgram" Type="String"></asp:Parameter>
                <asp:Parameter Name="BloodGroup" Type="String"></asp:Parameter>
                <asp:Parameter Name="UserName" Type="String"></asp:Parameter>
                <asp:Parameter Name="Password" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="StudentName" Type="String"></asp:Parameter>
                <asp:Parameter Name="FatherName" Type="String"></asp:Parameter>
                <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                <asp:Parameter Name="Address" Type="String"></asp:Parameter>
                <asp:Parameter Name="MobileNumber" Type="String"></asp:Parameter>
                <asp:Parameter Name="Department" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Program" Type="String"></asp:Parameter>
                <asp:Parameter Name="Semester" Type="String"></asp:Parameter>
                <asp:Parameter Name="SupportingProgram" Type="String"></asp:Parameter>
                <asp:Parameter Name="BloodGroup" Type="String"></asp:Parameter>
                <asp:Parameter Name="UserName" Type="String"></asp:Parameter>
                <asp:Parameter Name="Password" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_StudentId" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_StudentName" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_FatherName" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Address" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_MobileNumber" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Department" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_Program" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Semester" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_SupportingProgram" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_BloodGroup" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_UserName" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Password" Type="String"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="JSAppendix1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="JSAppendix2" runat="server">
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CrudApplicationUser.aspx.cs" Inherits="FJWU_StudentSurvey.CrudApplicationUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="ApplicationUsersGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="ApplicationUsersSource" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="True"></asp:CommandField>
            <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" InsertVisible="False" SortExpression="UserId"></asp:BoundField>
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName"></asp:BoundField>
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>
            <asp:BoundField DataField="UserMapping" HeaderText="UserMapping" SortExpression="UserMapping"></asp:BoundField>
            <asp:BoundField DataField="UserPermission" HeaderText="UserPermission" SortExpression="UserPermission"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="ApplicationUsersSource" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' DeleteCommand="DELETE FROM [ApplicationUsers] WHERE [UserId] = @original_UserId AND [UserName] = @original_UserName AND [Password] = @original_Password AND (([UserMapping] = @original_UserMapping) OR ([UserMapping] IS NULL AND @original_UserMapping IS NULL)) AND [UserPermission] = @original_UserPermission" InsertCommand="INSERT INTO [ApplicationUsers] ([UserName], [Password], [UserMapping], [UserPermission]) VALUES (@UserName, @Password, @UserMapping, @UserPermission)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ApplicationUsers]" UpdateCommand="UPDATE [ApplicationUsers] SET [UserName] = @UserName, [Password] = @Password, [UserMapping] = @UserMapping, [UserPermission] = @UserPermission WHERE [UserId] = @original_UserId AND [UserName] = @original_UserName AND [Password] = @original_Password AND (([UserMapping] = @original_UserMapping) OR ([UserMapping] IS NULL AND @original_UserMapping IS NULL)) AND [UserPermission] = @original_UserPermission">
        <DeleteParameters>
            <asp:Parameter Name="original_UserId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_UserName" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Password" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_UserMapping" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_UserPermission" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserName" Type="String"></asp:Parameter>
            <asp:Parameter Name="Password" Type="String"></asp:Parameter>
            <asp:Parameter Name="UserMapping" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="UserPermission" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserName" Type="String"></asp:Parameter>
            <asp:Parameter Name="Password" Type="String"></asp:Parameter>
            <asp:Parameter Name="UserMapping" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="UserPermission" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_UserId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_UserName" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Password" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_UserMapping" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_UserPermission" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="row">
        <asp:FormView ID="AddApplicationUserForm" runat="server" DataKeyNames="UserId" DataSourceID="ApplicationUsersSource">
            <EditItemTemplate>
                UserId:
                <asp:Label Text='<%# Eval("UserId") %>' runat="server" ID="UserIdLabel1" /><br />
                UserName:
                <asp:TextBox Text='<%# Bind("UserName") %>' runat="server" ID="UserNameTextBox" /><br />
                Password:
                <asp:TextBox Text='<%# Bind("Password") %>' runat="server" ID="PasswordTextBox" /><br />
                UserMapping:
                <asp:TextBox Text='<%# Bind("UserMapping") %>' runat="server" ID="UserMappingTextBox" /><br />
                UserPermission:
                <asp:TextBox Text='<%# Bind("UserPermission") %>' runat="server" ID="UserPermissionTextBox" /><br />
                <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
            </EditItemTemplate>
            <InsertItemTemplate>
                UserName:
                <asp:TextBox Text='<%# Bind("UserName") %>' runat="server" ID="UserNameTextBox" /><br />
                Password:
                <asp:TextBox Text='<%# Bind("Password") %>' runat="server" ID="PasswordTextBox" /><br />
                UserMapping:
                <asp:TextBox Text='<%# Bind("UserMapping") %>' runat="server" ID="UserMappingTextBox" /><br />
                UserPermission:
                <asp:TextBox Text='<%# Bind("UserPermission") %>' runat="server" ID="UserPermissionTextBox" /><br />
                <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
            </InsertItemTemplate>
            <ItemTemplate>
                UserId:
                <asp:Label Text='<%# Eval("UserId") %>' runat="server" ID="UserIdLabel" /><br />
                UserName:
                <asp:Label Text='<%# Bind("UserName") %>' runat="server" ID="UserNameLabel" /><br />
                Password:
                <asp:Label Text='<%# Bind("Password") %>' runat="server" ID="PasswordLabel" /><br />
                UserMapping:
                <asp:Label Text='<%# Bind("UserMapping") %>' runat="server" ID="UserMappingLabel" /><br />
                UserPermission:
                <asp:Label Text='<%# Bind("UserPermission") %>' runat="server" ID="UserPermissionLabel" /><br />
                <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
            </ItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>

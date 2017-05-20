<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="DepartmentAdmin.aspx.cs" Inherits="FJWU_StudentSurvey.DepartmentAdmin" %>

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
                            <li><a href="#" onclick="$('#<%= DepartmentsGrid.ClientID %>').tableExport({type:'excel',escape:'false'});">
                                <img src="<%= Page.ResolveUrl("~/html/img/icons/xls.png") %>" width="24" />
                                XLS</a></li>
                            <li><a href="#" onclick="$('#<%= DepartmentsGrid.ClientID %>').tableExport({type:'pdf',escape:'false'});">
                                <img src="<%= Page.ResolveUrl("~/html/img/icons/pdf.png") %>" width="24" />
                                PDF</a></li>
                        </ul>
                    </div>

                </div>
                <div class="panel-body panel-body-table dataTables_wrapper no-footer">


                    <asp:GridView ID="DepartmentsGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="DepartmentId" DataSourceID="DepartmentsDataSource" AllowPaging="True" AllowSorting="True">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="DepartmentId" HeaderText="DepartmentId" ReadOnly="True" InsertVisible="False" SortExpression="DepartmentId"></asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="DepartmentsDataSource" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' DeleteCommand="DELETE FROM [Department] WHERE [DepartmentId] = @original_DepartmentId AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL))" InsertCommand="INSERT INTO [Department] ([Name]) VALUES (@Name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Department]" UpdateCommand="UPDATE [Department] SET [Name] = @Name WHERE [DepartmentId] = @original_DepartmentId AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_DepartmentId" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_DepartmentId" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
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
                    <h3 class="panel-title"><strong>Add/Edit Course</strong> </h3>
                    <ul class="panel-controls">
                        <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                    </ul>
                </div>
                <div class="panel-body">
                    <strong class="error" style="color: red;">
                        <asp:Literal ID="warningtext" runat="server"></asp:Literal></strong>

                    <asp:FormView ID="DepartmentsForm" runat="server" DataKeyNames="DepartmentId" DataSourceID="DepartmentsDataSource" AllowPaging="True">
                        <EditItemTemplate>
                            DepartmentId:<asp:Label Text='<%# Eval("DepartmentId") %>' runat="server" ID="DepartmentIdLabel1" />
                            <br />
                            Name:<asp:TextBox Text='<%# Bind("Name") %>' runat="server" ID="NameTextBox" />
                            <br />
                            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            Name:<asp:TextBox Text='<%# Bind("Name") %>' runat="server" ID="NameTextBox" />
                            <br />
                            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            DepartmentId:<asp:Label Text='<%# Eval("DepartmentId") %>' runat="server" ID="DepartmentIdLabel" />
                            <br />
                            Name:<asp:Label Text='<%# Bind("Name") %>' runat="server" ID="NameLabel" />
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
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="JSAppendix2" runat="server">
</asp:Content>

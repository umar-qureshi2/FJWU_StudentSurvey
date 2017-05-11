<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FJWU_StudentSurvey.LoginForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8">
                    <div class="card">
                        <div class="header">
                            <h4 class="title">User Login</h4>
                        </div>
                        <div class="content">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label>Login Portal</label>
                                        <input type="text" class="form-control" disabled="" placeholder="Company" value="FJWU Survey Application">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Username</label>
                                        <input type="text" runat="server" id="username" class="form-control" placeholder="Username" value="michael23">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Password</label>
                                        <input type="password" runat="server" id="password" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-info btn-fill pull-right" Text="Login" OnClick="Button1_Click" />

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="card">
                        <div class="content">
                            <div class="row">
                                <p class="text-danger">
                                    <asp:Literal ID="ErrorLiteral" runat="server"></asp:Literal>
                                </p>
                                <p class="text-success">
                                    <asp:Literal ID="SuccessLiteral" runat="server"></asp:Literal>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginSignup.aspx.cs" Inherits="FJWU_StudentSurvey.LoginSignup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Login & Sign Up Form Concept</title>


    <link rel='stylesheet prefetch' href='css/opensans.css' />
    <link rel='stylesheet prefetch' href='css/material-icon.css' />
    <style>
        select {
            background: rgba(255,255,255,0.1);
            border: none;
            font-size: 14px;
            height: auto;
            margin: 5px;
            outline: 0;
            padding: 5px;
            width: 100%;
            background-color: #e8eeef;
            color: #8a97a0;
            box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
            margin-bottom: 0px;
        }
    </style>
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
    <div class="cotn_principal">
        <asp:Literal ID="error" runat="server"></asp:Literal>
        <div class="cont_centrar">

            <div class="cont_login">
                <div class="cont_info_log_sign_up">
                    <div class="col_md_login">
                        <div class="cont_ba_opcitiy">

                            <h2>LOGIN</h2>
                            <p>Login to FJWU Survey portal</p>
                            <button class="btn_login" onclick="cambiar_login()">LOGIN</button>
                        </div>
                    </div>
                    <div class="col_md_sign_up">
                        <div class="cont_ba_opcitiy">
                            <h2>SIGN UP</h2>


                            <p>Student Signup for Survey portal</p>

                            <button class="btn_sign_up" onclick="cambiar_sign_up()">SIGN UP</button>
                        </div>
                    </div>
                </div>


                <div class="cont_back_info">
                    <div class="cont_img_back_grey">
                        <img src="css/home.jpg" alt="" />
                    </div>

                </div>
                <form id="dummyid" runat="server">

                    <div class="cont_forms">
                        <div class="cont_img_back_">
                            <img src="css/home.jpg" alt="" />
                        </div>
                        <div class="cont_form_login">
                            <a href="#" onclick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
                            <h2>LOGIN</h2>
                            <asp:TextBox runat="server" ID="loginUsername" placeholder="Username" />
                            <asp:TextBox runat="server" ID="loginPassword" type="password" placeholder="Password" />
                            <asp:Button ID="LoginButton" CssClass="btn_login" runat="server" Text="LOGIN" OnClick="LoginButton_Click" style="text-align: center; color:white;   " />
                            <%--<input type="text" placeholder="Username" />
                            <input type="password" placeholder="Password" />
                            <button class="btn_login" onclick="cambiar_login()">LOGIN</button>--%>
                        </div>

                        <div class="cont_form_sign_up">
                            <a href="#" onclick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
                            <h2>SIGN UP</h2>

                            <asp:TextBox runat="server" ID="StudentNameTextBox" placeholder="StudentName" />

                            <asp:TextBox runat="server" ID="FatherNameTextBox" placeholder="FatherName" />

                            <asp:TextBox runat="server" ID="EmailTextBox" placeholder="Email" />

                            <asp:TextBox runat="server" ID="AddressTextBox" placeholder="Address" />

                            <asp:TextBox runat="server" ID="MobileNumberTextBox" placeholder="MobileNumber" />
        <asp:DropDownList ID="DepartmentList" runat="server" DataSourceID="DepartmentsSource" DataTextField="Name" DataValueField="DepartmentId"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="DepartmentsSource" ConnectionString='<%$ ConnectionStrings:FJWU_StudentSurveyConnectionString %>' SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>
                            <%--<asp:TextBox  runat="server" ID="DepartmentTextBox" />--%>

                            <asp:TextBox runat="server" ID="ProgramTextBox" placeholder="Program" />

                            <asp:DropDownList ID="SemesterList" runat="server">
                                <asp:ListItem Selected="True">First Semester</asp:ListItem>
                                <asp:ListItem>Second Semester</asp:ListItem>
                                <asp:ListItem>Third Semester</asp:ListItem>
                                <asp:ListItem>Fourth Semester</asp:ListItem>
                                <asp:ListItem>Fifth Semester</asp:ListItem>
                                <asp:ListItem>Sixth Semester</asp:ListItem>
                                <asp:ListItem>Seventh Semester</asp:ListItem>
                                <asp:ListItem>Eighth Semester</asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:TextBox  runat="server" ID="SemesterTextBox" />--%>

                            <asp:TextBox runat="server" ID="SupportingProgramTextBox" placeholder="SupportingProgram" />

                            <asp:TextBox runat="server" ID="BloodGroupTextBox" placeholder="BloodGroup" />

                            <asp:TextBox runat="server" ID="UserNameTextBox" placeholder="UserName" />

                            <asp:TextBox type="password" runat="server" ID="PasswordTextBox" placeholder="Password" />
                            <asp:Button ID="SignupButton" CssClass="btn_sign_up" runat="server" Text="SIGN UP" OnClick="SignupButton_Click" style="text-align: center; color:white;" />
                            <%--<input type="text" placeholder="Email" />
                        <input type="text" placeholder="User" />
                        <input type="password" placeholder="Password" />
                        <input type="password" placeholder="Confirm Password" />
                        <button class="btn_sign_up" onclick="cambiar_sign_up()">SIGN UP</button>--%>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="js/index.js"></script>
</body>
</html>

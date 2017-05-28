using FJWU_StudentSurvey.AppCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FJWU_StudentSurvey
{
    public partial class LoginSignup : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
                error.Text = "";
            if (!IsPostBack)
            {

                Session.Abandon(); 
            }

        }
        FJWUSurveyDBDataContext db = new FJWUSurveyDBDataContext();
        SessionGlobals sg = new SessionGlobals();
        protected void SignupButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (
                    String.IsNullOrWhiteSpace(StudentNameTextBox.Text) ||
                    String.IsNullOrWhiteSpace(FatherNameTextBox.Text) ||
                    String.IsNullOrWhiteSpace(EmailTextBox.Text) ||
                    String.IsNullOrWhiteSpace(AddressTextBox.Text) ||
                    String.IsNullOrWhiteSpace(MobileNumberTextBox.Text) ||
                    String.IsNullOrWhiteSpace(ProgramTextBox.Text) ||
                    String.IsNullOrWhiteSpace(SemesterList.SelectedValue) ||
                    String.IsNullOrWhiteSpace(SupportingProgramTextBox.Text) ||
                    String.IsNullOrWhiteSpace(BloodGroupTextBox.Text) ||
                    String.IsNullOrWhiteSpace(UserNameTextBox.Text) ||
                    String.IsNullOrWhiteSpace(PasswordTextBox.Text)
                    )
                {
                    error.Text = "Signup fields cannot be empty";
                    return;
                }
                Student temp = new Student()
                {
                    StudentName = StudentNameTextBox.Text,
                    FatherName = FatherNameTextBox.Text,
                    Email = EmailTextBox.Text,
                    Address = AddressTextBox.Text,
                    MobileNumber = MobileNumberTextBox.Text,
                    Department = int.Parse(DepartmentList.SelectedValue),
                    Program = ProgramTextBox.Text,
                    Semester = SemesterList.SelectedValue,
                    SupportingProgram = SupportingProgramTextBox.Text,
                    BloodGroup = BloodGroupTextBox.Text,
                    UserName = UserNameTextBox.Text,
                    Password = PasswordTextBox.Text
                };
                db.Students.InsertOnSubmit(temp);
                db.SubmitChanges();
                ApplicationUser newUser = new ApplicationUser()
                {
                    Password = temp.Password,
                    UserName = temp.UserName,
                    UserMapping = temp.StudentId,
                    UserPermission = 1
                };
                db.ApplicationUsers.InsertOnSubmit(newUser);
                db.SubmitChanges();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (String.IsNullOrWhiteSpace(loginUsername.Text) ||
                    String.IsNullOrWhiteSpace(loginPassword.Text))
                {
                    error.Text = "Login fields cannot be empty";
                    return;
                }
                var login = db.ApplicationUsers.Where(x => x.UserName == loginUsername.Text && x.Password == loginPassword.Text).FirstOrDefault();
                if (login == null)
                {
                    error.Text = "Wrong username or password entered";
                    return;
                }
                sg.LoggedIn = login;
                sg.IsAdmin = login.UserPermission == 0 ? "display:block" : "display:none";
                Response.Redirect("~/StudentHome.aspx");
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
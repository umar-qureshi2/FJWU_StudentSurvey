using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FJWU_StudentSurvey
{
    public partial class StudentSignup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        FJWUSurveyDBDataContext db = new FJWUSurveyDBDataContext();
        protected void SignupButton_Click(object sender, EventArgs e)
        {
            try
            {
                Student temp = new Student()
                {
                    StudentName = StudentNameTextBox.Text,
                    FatherName = FatherNameTextBox.Text,
                    Email = EmailTextBox.Text,
                    Address = AddressTextBox.Text,
                    MobileNumber = MobileNumberTextBox.Text,
                    Department = int.Parse( DepartmentList.SelectedValue),
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
    }
}
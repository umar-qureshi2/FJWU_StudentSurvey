using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FJWU_StudentSurvey
{
    public partial class SurveyAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        FJWUSurveyDBDataContext db = new FJWUSurveyDBDataContext();
        protected void CreateSurveyButton_Click(object sender, EventArgs e)
        {
            try
            {
                var course = int.Parse(CoursesList.SelectedValue);
                var teacher = int.Parse(TeachersList.SelectedValue);
                var name = SurveyName.Text;
                Survey temp = new FJWU_StudentSurvey.Survey()
                {
                    CourseId = course,
                    DisplayName = name,
                    TeacherId = teacher
                };
                db.Surveys.InsertOnSubmit(temp);
                db.SubmitChanges();
                warningtext.Text = "Survey Added";
                //Response.Redirect("~/SurveyAdmin.aspx");                  
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
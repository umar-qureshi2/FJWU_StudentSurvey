using FJWU_StudentSurvey.UserControls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FJWU_StudentSurvey
{
    public partial class StudentHome : System.Web.UI.Page
    {
        FJWUSurveyDBDataContext db = new FJWUSurveyDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            SurveyName.Text = "";
            //if (!string.IsNullOrWhiteSpace(StudentSurveys.SelectedValue))
            {
                //QuestionsPanel.Controls.Add(new TextBox());
                var question = LoadControl("~/UserControls/QuestionControl.ascx") as QuestionControl;
                //var question = LoadControl(typeof(QuestionControl),new string[] {"id1","question 1" }) as QuestionControl;
                question.UpdateQuestion("question from db", "idfromdb");
                var question2 = LoadControl("~/UserControls/QuestionControl.ascx") as QuestionControl;
                question2.UpdateQuestion("question2 from db", "idfromdb2");
                //var question = new QuestionControl().SetId("id from db");
                //question.Load += Question_Load;
                //question.LoadCompleted += () =>
                //{
                //    var allControls = QuestionsPanel.Controls;

                //};
                QuestionsPanel.Controls.Add(question);
                QuestionsPanel.Controls.Add(question2);
            }
            if (IsPostBack)
            {
            }
        }

        protected override void OnSaveStateComplete(EventArgs e)
        {
            var allControls = QuestionsPanel.Controls;
        }


        protected void CoursesList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //QuestionsPanel.Controls.Add(new TextBox());
            SurveyName.Text = db.Surveys.Where(x => x.CourseId == int.Parse(CoursesList.SelectedValue) && x.TeacherId == int.Parse(TeachersList.SelectedValue)).FirstOrDefault()?.DisplayName;
        }

        protected void TeachersList_SelectedIndexChanged(object sender, EventArgs e)
        {
            SurveyName.Text = db.Surveys.Where(x => x.CourseId == int.Parse(CoursesList.SelectedValue) && x.TeacherId == int.Parse(TeachersList.SelectedValue)).FirstOrDefault()?.DisplayName;
        }
    }
}
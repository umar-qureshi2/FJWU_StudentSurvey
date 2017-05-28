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
            //SurveyName.Text = "";
            if (IsPostBack)
            {
                ShowSurvey();
            }
            else 
            {
                CoursesList.SelectedIndex = 0;
                TeachersList.SelectedIndex = 0;
            }

            if (false && !string.IsNullOrWhiteSpace(""))
            {
                //QuestionsPanel.Controls.Add(new TextBox());
                var question = LoadControl("~/UserControls/QuestionControl.ascx") as QuestionControl;
                //var question = LoadControl(typeof(QuestionControl),new string[] {"id1","question 1" }) as QuestionControl;
                question.UpdateQuestion("question from db", "0", "idfromdb");
                var question2 = LoadControl("~/UserControls/QuestionControl.ascx") as QuestionControl;
                question2.UpdateQuestion("question2 from db", "0", "idfromdb2");
                //var question = new QuestionControl().SetId("id from db");
                //question.Load += Question_Load;
                //question.LoadCompleted += () =>
                //{
                //    var allControls = QuestionsPanel.Controls;

                //};
                QuestionsPanel.Controls.Add(question);
                QuestionsPanel.Controls.Add(question2);
            }
        }

        protected override void OnSaveStateComplete(EventArgs e)
        {
            var allControls = QuestionsPanel.Controls;
            foreach (var usercontrol in allControls)
            {
                if (usercontrol is QuestionControl)
                {
                    var questionControl = (usercontrol as QuestionControl);
                    if (!string.IsNullOrWhiteSpace(questionControl.SurveyQuestionId.Text)
                        && !string.IsNullOrWhiteSpace(questionControl.AnswerOptions.SelectedValue))
                    {
                        var id = questionControl.ID;
                        var surveyQuestionId = int.Parse(questionControl.SurveyQuestionId.Text);
                        SurveyAnswer answerResponse = new SurveyAnswer()
                        {
                            SurveyQuestion = surveyQuestionId,
                            Student = 1,
                            Answer = questionControl.AnswerOptions.SelectedValue
                        };
                        db.SurveyAnswers.InsertOnSubmit(answerResponse);
                        db.SubmitChanges();
                    }
                }
            }

        }


        protected void CoursesList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //QuestionsPanel.Controls.Add(new TextBox());
            //SurveyName.Text = db.Surveys.Where(x => x.CourseId == int.Parse(CoursesList.SelectedValue) && x.TeacherId == int.Parse(TeachersList.SelectedValue)).FirstOrDefault()?.DisplayName;
        }

        protected void TeachersList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //SurveyName.Text = db.Surveys.Where(x => x.CourseId == int.Parse(CoursesList.SelectedValue) && x.TeacherId == int.Parse(TeachersList.SelectedValue)).FirstOrDefault()?.DisplayName;
        }

        protected void GetSurveyBtn_Click(object sender, EventArgs e)
        {
            //ShowSurvey();
        }

        private void ShowSurvey()
        {
            int? selectedSurvey = int.Parse(SurveyDropDown.SelectedValue);;
            //if (!string.IsNullOrWhiteSpace(CoursesList.SelectedValue) && !string.IsNullOrWhiteSpace(TeachersList.SelectedValue))
            //{
            //    selectedSurvey = db.Surveys.Where(x => x.CourseId == int.Parse(CoursesList.SelectedValue)
            //                                             && x.TeacherId == int.Parse(TeachersList.SelectedValue)).FirstOrDefault()?.SurveyId;
            //}
            if (selectedSurvey != null)
            {
                var surveyId = selectedSurvey.Value;
                var allQuestions = db.SurveyQuestions.Where(x => x.Survey == surveyId);
                foreach (var surveyQuestion in allQuestions)
                {
                    if (db.SurveyAnswers.Count(x => x.Student == 1 && x.SurveyQuestion == surveyQuestion.SurveyQuestion1) > 0)
                    {
                        continue;
                    }
                    var question = LoadControl("~/UserControls/QuestionControl.ascx") as QuestionControl;
                    question.UpdateQuestion((surveyQuestion.Question1.QuestionType == 0 ? 
                        "Course: " : "Teacher: " )+surveyQuestion.Question1.QuestionText,
                        $"{surveyQuestion.SurveyQuestion1}",
                        $"{surveyQuestion.SurveyQuestion1}{surveyQuestion.Question}{surveyQuestion.Survey}");
                    QuestionsPanel.Controls.Add(question);
                }
            }
        }

        bool saveSignaled = false;
        protected void SubmitSurveyBtn_Click(object sender, EventArgs e)
        {
            saveSignaled = true;
        }

        protected void SurveyDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            var surveyid = int.Parse(SurveyDropDown.SelectedValue);
            var survey = db.Surveys.Where(x => x.SurveyId == surveyid).First();
            CoursesList.SelectedValue = survey.CourseId.ToString();
            TeachersList.SelectedValue = survey.TeacherId.ToString();
        }
    }
}
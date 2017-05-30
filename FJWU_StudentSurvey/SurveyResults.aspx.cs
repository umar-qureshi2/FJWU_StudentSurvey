using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FJWU_StudentSurvey
{
    public partial class SurveyResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        FJWUSurveyDBDataContext db = new FJWUSurveyDBDataContext();
        protected void GetSurveyResults_Click(object sender, EventArgs e)
        {
            try
            {
                var surveyId = int.Parse(SurveyDropDownList.SelectedValue);
                var survey = db.Surveys.Where(x => x.SurveyId == surveyId).FirstOrDefault();
                if (survey == null)
                {
                    warningtext.Text = "Invalid survey selected";
                    return;
                }
                var questions = db.SurveyQuestions.Where(x => x.Survey == surveyId).Select(x => x.SurveyQuestion1).ToList();
                var answersCourse = db.SurveyAnswers.Where(x => x.SurveyQuestion1.Question1.QuestionType == 0
                && questions.Contains(x.SurveyQuestion)).GroupBy(x => x.SurveyQuestion)
                .Select(x => new { values = x.ToList(), key = x.Key })
                ;//.Select(x=>x.Answer);

                DataTable dt = new DataTable();
                dt.Columns.AddRange(answersCourse.Select(x => new DataColumn($"{x.key}")).ToArray());
                int rowCount = 0;
                var isadded = true;
                while (isadded)
                {
                    DataRow dr = dt.NewRow();
                    isadded = false;
                    foreach (var answer in answersCourse)
                    {
                        var element = answer.values.ElementAtOrDefault(rowCount)?.Answer;
                        dr[$"{answer.key}"] = element;
                        if (element != null)
                        {
                            isadded = true;
                        }
                    }
                    if (isadded)
                        dt.Rows.Add(dr);
                    rowCount++;
                }
                dt.AcceptChanges();

                SurveyAnswersGridCourse.DataSource = dt;
                //SurveyAnswersGridCourse.DataSource = answersCourse.ToList();
                SurveyAnswersGridCourse.DataBind();

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
using FJWU_StudentSurvey.AppCode;
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
                OutputCourseAnswers(surveyId);
                OutputTeacherAnswers(surveyId);

            }
            catch (Exception)
            {

                throw;
            }
        }

        private void OutputCourseAnswers(int surveyId)
        {
            var questions = db.SurveyQuestions.Where(x => x.Survey == surveyId).Select(x => x.SurveyQuestion1).ToList();
            var answersCourse = db.SurveyAnswers
                .Where(x => x.SurveyQuestion1.Question1.QuestionType == 0 && questions.Contains(x.SurveyQuestion))
                .OrderBy(x => x.SurveyQuestion)
            .GroupBy(x => x.SurveyQuestion)
            .Select(x => new { values = x.ToList(), key = x.Key })
            ;//.Select(x=>x.Answer);

            DataTable dt = new DataTable();
            Dictionary<string, List<int>> allValues = new Dictionary<string, List<int>>();
            dt.Columns.Add("Info");
            dt.Columns.AddRange(Enumerable.Range(1, answersCourse.Count()).Select(x => new DataColumn($"Q{x}")).ToArray());
            int rowCount = 0;
            var isadded = true;
            while (isadded)
            {
                DataRow dr = dt.NewRow();
                isadded = false;
                int columnIndex = 1;
                foreach (var answer in answersCourse)
                {
                    dr["Info"] = $"Student {rowCount + 1} ";
                    var rowcolIndex = $"Q{columnIndex++}";
                    var element = answer.values.ElementAtOrDefault(rowCount)?.Answer;
                    dr[rowcolIndex] = element ?? "";
                    if (element != null)
                    {
                        isadded = true;
                        if (!allValues.ContainsKey(rowcolIndex))
                        {
                            allValues[rowcolIndex] = new List<int>();
                        }
                        (allValues[rowcolIndex]).Add(int.Parse(element));
                    }
                }
                if (isadded)
                    dt.Rows.Add(dr);
                rowCount++;
            }
            for (int i = 0; i < 2; i++)
            {
                DataRow dr = dt.NewRow();
                int columnIndex = 1;
                foreach (var answer in answersCourse)
                {
                    dr["Info"] = i == 0 ? $"Average" : "Std-Dev";
                    var rowcolIndex = $"Q{columnIndex++}";
                    var element = i == 0 ? allValues[rowcolIndex].Average() : allValues[rowcolIndex].StdDev();
                    dr[rowcolIndex] = element;
                }
                dt.Rows.Add(dr);
            }
            dt.AcceptChanges();

            SurveyAnswersGridCourse.DataSource = dt;
            //SurveyAnswersGridCourse.DataSource = answersCourse.ToList();
            SurveyAnswersGridCourse.DataBind();
        }
        private void OutputTeacherAnswers(int surveyId)
        {
            var questions = db.SurveyQuestions.Where(x => x.Survey == surveyId).Select(x => x.SurveyQuestion1).ToList();
            var answersCourse = db.SurveyAnswers
                .Where(x => x.SurveyQuestion1.Question1.QuestionType == 1 && questions.Contains(x.SurveyQuestion))
                .OrderBy(x => x.SurveyQuestion)
            .GroupBy(x => x.SurveyQuestion)
            .Select(x => new { values = x.ToList(), key = x.Key })
            ;//.Select(x=>x.Answer);

            DataTable dt = new DataTable();
            Dictionary<string, List<int>> allValues = new Dictionary<string, List<int>>();
            dt.Columns.Add("Info");
            dt.Columns.AddRange(Enumerable.Range(1, answersCourse.Count()).Select(x => new DataColumn($"Q{x}")).ToArray());
            int rowCount = 0;
            var isadded = true;
            while (isadded)
            {
                DataRow dr = dt.NewRow();
                isadded = false;
                int columnIndex = 1;
                foreach (var answer in answersCourse)
                {
                    dr["Info"] = $"Student {rowCount + 1} ";
                    var rowcolIndex = $"Q{columnIndex++}";
                    var element = answer.values.ElementAtOrDefault(rowCount)?.Answer;
                    dr[rowcolIndex] = element ?? "";
                    if (element != null)
                    {
                        isadded = true;
                        if (!allValues.ContainsKey(rowcolIndex))
                        {
                            allValues[rowcolIndex] = new List<int>();
                        }
                        (allValues[rowcolIndex]).Add(int.Parse(element));
                    }
                }
                if (isadded)
                    dt.Rows.Add(dr);
                rowCount++;
            }
            for (int i = 0; i < 2; i++)
            {
                DataRow dr = dt.NewRow();
                int columnIndex = 1;
                foreach (var answer in answersCourse)
                {
                    dr["Info"] = i == 0 ? $"Average" : "Std-Dev";
                    var rowcolIndex = $"Q{columnIndex++}";
                    var element = i == 0 ? allValues[rowcolIndex].Average() : allValues[rowcolIndex].StdDev();
                    dr[rowcolIndex] = element;
                }
                dt.Rows.Add(dr);
            }
            dt.AcceptChanges();

            SurveyAnswersGridTeacher.DataSource = dt;
            //SurveyAnswersGridCourse.DataSource = answersCourse.ToList();
            SurveyAnswersGridTeacher.DataBind();
        }
    }
}
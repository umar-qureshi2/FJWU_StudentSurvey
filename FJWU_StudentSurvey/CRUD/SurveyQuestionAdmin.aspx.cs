using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FJWU_StudentSurvey
{
    public partial class SurveyQuestionAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        FJWUSurveyDBDataContext db = new FJWUSurveyDBDataContext();
        protected void AddSurveyQuestionButton_Click(object sender, EventArgs e)
        {
            try
            {
                var survey = int.Parse(SurveyList.SelectedValue);
                var question = int.Parse(QuestionsList.SelectedValue);
                SurveyQuestion temp = new FJWU_StudentSurvey.SurveyQuestion()
                {
                    Question = question,
                    Survey = survey
                };
                db.SurveyQuestions.InsertOnSubmit(temp);
                db.SubmitChanges();

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FJWU_StudentSurvey.UserControls
{
    public partial class QuestionControl : System.Web.UI.UserControl
    {
        public global::System.Web.UI.WebControls.Literal SurveyQuestionId;
        public global::System.Web.UI.WebControls.Literal QuestionText;
        public global::System.Web.UI.WebControls.RadioButtonList AnswerOptions;
        //public event Action LoadCompleted = delegate { };
        protected void Page_Load(object sender, EventArgs e)
        {
            //QuestionText.Text = "default text";
            //this.LoadCompleted();
        }

        public QuestionControl UpdateQuestion(string text,string surveyQuestionId,string id = null)
        {
           QuestionText.Text = text;
            SurveyQuestionId.Text = surveyQuestionId;
            ID = id ?? ID;
            return this;
        }
    }
}
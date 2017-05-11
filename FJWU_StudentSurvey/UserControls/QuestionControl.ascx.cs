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
        protected void Page_Load(object sender, EventArgs e)
        {
            //QuestionText.Text = "default text";
        }

        public QuestionControl UpdateQuestion(string text,string id = null)
        {
            QuestionText.Text = text;
            ID = id ?? ID;
            return this;
        }
    }
}
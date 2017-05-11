using FJWU_StudentSurvey.AppCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FJWU_StudentSurvey
{
    public partial class LoginForm : System.Web.UI.Page
    {
        FJWUSurveyDBDataContext db = new FJWUSurveyDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            ErrorLiteral.Text = SuccessLiteral.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var LoggedIn = db.ApplicationUsers.Where(x => x.UserName == username.Value && x.Password == password.Value);
            if (LoggedIn == null || LoggedIn.Count() == 0)
            {
                ErrorLiteral.Text = "Error in login, wrong username or password";
            }
            else
            {
                (new SessionGlobals()).LoggedIn = LoggedIn.First();
                SuccessLiteral.Text = $"Successfully Logged in {LoggedIn.First().UserName}";
                Response.Redirect("~/StudentHome.aspx");
            }
        }
    }
}
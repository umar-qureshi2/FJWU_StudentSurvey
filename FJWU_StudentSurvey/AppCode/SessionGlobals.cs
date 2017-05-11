using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FJWU_StudentSurvey.AppCode
{
    public class SessionGlobals : System.Web.UI.Page
    {
        public ApplicationUser LoggedIn
        {
            get
            {
                return Session["loggedIn"] as ApplicationUser;
            }
            set
            {
                Session["loggedIn"] = value;
            }
        }
    }
}
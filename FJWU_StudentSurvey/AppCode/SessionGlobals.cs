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

        public string IsAdmin
        {
            get
            {
                return Session["isadmin"] as string;
            }
            set
            {
                Session["isadmin"] = value;

            }
        }
    }

    public static class Extensions
    {
        public static double StdDev(this IEnumerable<int> values)
        {
            double ret = 0;
            int count = values.Count();
            if (count > 1)
            {
                //Compute the Average
                double avg = values.Average();

                //Perform the Sum of (value-avg)^2
                double sum = values.Sum(d => (d - avg) * (d - avg));

                //Put it all together
                ret = Math.Sqrt(sum / count);
            }
            return ret;
        }
    }

}
using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using FJWU_StudentSurvey.AppCode;

public partial class MasterPage : System.Web.UI.MasterPage
{
    private const string AntiXsrfTokenKey = "__AntiXsrfToken";
    private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
    private string _antiXsrfTokenValue;
    SessionGlobals sg = new SessionGlobals();

    protected void Page_Init(object sender, EventArgs e)
    {
        #region test code
        //sg.LoggedIn = new FJWU_StudentSurvey.ApplicationUser()
        //{UserId = 1,UserMapping = 0 };
        //sg.IsAdmin = "display:block";
        #endregion

        if (sg.LoggedIn == null)
        {
            Response.Redirect("~/LoginSignup.aspx");
        }
        
        if (Session["Globals"] == null)
        {
            //Session["Globals"] = new Globals();
            //Response.Redirect(Page.ResolveUrl("~/Login.aspx"));
        }
        // The code below helps to protect against XSRF attacks
        var requestCookie = Request.Cookies[AntiXsrfTokenKey];
        Guid requestCookieGuidValue;
        if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
        {
            // Use the Anti-XSRF token from the cookie
            _antiXsrfTokenValue = requestCookie.Value;
            Page.ViewStateUserKey = _antiXsrfTokenValue;
        }
        else
        {
            // Generate a new Anti-XSRF token and save to the cookie
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
            Page.ViewStateUserKey = _antiXsrfTokenValue;

            var responseCookie = new HttpCookie(AntiXsrfTokenKey)
            {
                HttpOnly = true,
                Value = _antiXsrfTokenValue
            };
            if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
            {
                responseCookie.Secure = true;
            }
            Response.Cookies.Set(responseCookie);
        }

        Page.PreLoad += master_Page_PreLoad;
    }

    protected void master_Page_PreLoad(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Set Anti-XSRF token
            ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
            ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
        }
        else
        {
            // Validate the Anti-XSRF token
            if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
            {
                throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["Globals"] == null)
        //{
        //    //Session["Globals"] = new Globals();
        //    Session.Abandon();
        //    //Response.Redirect(Page.ResolveUrl("~/Login.aspx"));
        //}
        
        //IDPDataClassesDataContext dbcontext = new IDPDataClassesDataContext();
        //Globals globals = new Globals();
        //var users = dbcontext.IDPUsersTables.Where(x => x.UserID == globals.Loggedin_ID);
        //foreach (IDPUsersTable item in users)
        //{
        //    loggedinname.Text = item.LoginName;
        //    break;
        //}

    }

}

﻿using System;
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
            SurveyName.Text = ""; 
            if (!string.IsNullOrWhiteSpace(StudentSurveys.SelectedValue))
            {
                QurestionsPanel.Controls.Add(new TextBox());   
            }
        }

        protected void CoursesList_SelectedIndexChanged(object sender, EventArgs e)
        {
            QurestionsPanel.Controls.Add(new TextBox());
            SurveyName.Text = db.Surveys.Where(x => x.CourseId == int.Parse(CoursesList.SelectedValue) && x.TeacherId == int.Parse(TeachersList.SelectedValue)).FirstOrDefault()?.DisplayName;
        }

        protected void TeachersList_SelectedIndexChanged(object sender, EventArgs e)
        {
            SurveyName.Text = db.Surveys.Where(x => x.CourseId == int.Parse(CoursesList.SelectedValue) && x.TeacherId == int.Parse(TeachersList.SelectedValue)).FirstOrDefault()?.DisplayName;
        }
    }
}
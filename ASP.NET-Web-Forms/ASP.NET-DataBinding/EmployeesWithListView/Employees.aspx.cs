﻿using Northwind.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeesWithListView
{
    public partial class Employees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NorthwindEntities context = new NorthwindEntities();

            this.ListViewEmployees.DataSource = context.Employees.ToList();
            this.ListViewEmployees.DataBind();
        }
    }
}
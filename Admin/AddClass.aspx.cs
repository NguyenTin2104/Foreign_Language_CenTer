﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static QuanLyTTNN.Models.CommonFn;

namespace QuanLyTTNN.Admin
{
    public partial class AddClass : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                    GetClass();
            }
        }

        private void GetClass()
        {
            try
            {
                DataTable dt = fn.Fetch("Select Row_NUMBER() over(Order by (Select 1)) as [Sr.No], ClassId, ClassName from Class");
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Lỗi khi lấy dữ liệu: " + ex.Message + "');</script>");
            }
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = fn.Fetch("Select * from Class where ClassName = '" + txtClass.Text.Trim() + "' ");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Class values ('" + txtClass.Text.Trim() + "')";
                    fn.Query(query);
                    lblMsg.Text = "Inserted Succesffully";
                    lblMsg.CssClass = "alert alert-success";
                    txtClass.Text = string.Empty;
                    GetClass();
                }
                else
                {
                    lblMsg.Text = "Entered class already exists!";
                    lblMsg.CssClass = "alert alert-danger";
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetClass();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetClass();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int cId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string ClassName = (row.FindControl("txtClassEdit") as TextBox).Text;
                fn.Query("Update Class set ClassName = '" + ClassName + "' where ClassId = '" + cId + "' ");
                lblMsg.Text = "Class Updated Succesffully";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetClass();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

    }
}
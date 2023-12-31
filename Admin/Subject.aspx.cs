﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static QuanLyTTNN.Models.CommonFn;

namespace QuanLyTTNN.Admin
{
    public partial class Subject : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetSubject();
            }
        }

        private void GetSubject()
        {
                DataTable dt = fn.Fetch("SELECT Row_NUMBER() over(Order by (Select 1)) as [Sr.No], TenMonHoc, CapDo FROM MonHoc");
                GridView1.DataSource = dt;
                GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = fn.Fetch("SELECT * FROM MonHoc WHERE TenMonHoc = '" + txtSubjectName.Text.Trim() + "' AND CapDo = '" + ddlLevel.SelectedValue + "' " );
                if (dt.Rows.Count == 0)
                {
                    string query = "INSERT INTO MonHoc (TenMonHoc, CapDo) VALUES ('" + txtSubjectName.Text.Trim() + "', '" + ddlLevel.SelectedValue + "') " ;
                    fn.Query(query);
                    lblMsg.Text = "Inserted Successfully";
                    lblMsg.CssClass = "alert alert-success";
                    txtSubjectName.Text = string.Empty;
                    GetSubject();
                }
                else
                {
                    lblMsg.Text = "Entered Subject already exists!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Xử lý logic khi một dòng trong GridView1 được chọn
            // Ví dụ: Lấy giá trị của dòng được chọn
            GridViewRow selectedRow = GridView1.SelectedRow;
            string subjectName = selectedRow.Cells[1].Text; // Giả sử cột thứ nhất là "SubjectName"
            string level = selectedRow.Cells[2].Text; // Giả sử cột thứ hai là "Level"
            // Thực hiện các hành động khác cần thiết với các giá trị này
            GetSubject();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetSubject();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetSubject();
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
                int sId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string SubtName = (row.FindControl("txtSubjectEdit") as TextBox).Text;

                // Thay thế dòng này để lấy giá trị từ DropDownList thay vì TextBox
                string SubLevel = (row.FindControl("ddlLevelEdit") as DropDownList).SelectedValue;
                fn.Query("UPDATE MonHoc SET TenMonHoc = '" + SubtName + "', CapDo = '" + SubLevel + "' WHERE MaMonHoc = '" + sId + "'");
                lblMsg.Text = "Subject Updated Successfully";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetSubject();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
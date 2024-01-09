using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static QuanLyTTNN.Models.CommonFn;

namespace QuanLyTTNN.Admin
{
    public partial class Schedule : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetSubject();
                GetCourse();
            }
        }
        private void GetSubject()
        {
            DataTable dt = fn.Fetch("SELECT * FROM MonHoc");

            // DropDownList for Subjects
            ddlSub.DataSource = dt;
            ddlSub.DataTextField = "TenMonHoc";
            ddlSub.DataValueField = "TenMonHoc";
            ddlSub.DataBind();
            ddlSub.Items.Insert(0, "Chon Mon Hoc");

            // DropDownList for Levels
            ddlLevel.DataSource = dt;
            ddlLevel.DataTextField = "CapDo";
            ddlLevel.DataValueField = "CapDo";
            ddlLevel.DataBind();
            ddlLevel.Items.Insert(0, "Chon Cap Do");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string subVal = ddlSub.SelectedItem.Text;
                string levVal = ddlLevel.SelectedItem.Text;
                DataTable dt = fn.Fetch("SELECT * FROM KhoaHoc WHERE TenKhoaHoc = '" + ddlLevel.SelectedItem.Value + "' AND CapDo = '" + ddlLevel.SelectedItem.Text + "' ");
                if (dt.Rows.Count == 0)
                {
                    //INSERT INTO KhoaHoc VALUES('AI/ML/DL',17,'2024-01-02', '2024-04-02', 'Tri Tue Nhan Tao', 'Co Ban')

                    string query = "INSERT INTO KhoaHoc VALUES ('" + txtCourseName.Text.Trim() + "', " + txtNOSession.Text.Trim() + ", '" + txtStart.Text.Trim() + "', '" + txtEnd.Text.Trim() + "', '" + ddlSub.SelectedItem.Value + "', '" + ddlLevel.SelectedItem.Value + "' ";
                    fn.Query(query);
                    lblMsg.Text = "Insert Successfully";
                    lblMsg.CssClass = "alert alert-success";
                }
                else
                {
                    lblMsg.Text = "Entered Fees already exists for <b>'" + subVal + "'</b>!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private void GetCourse()
        {
            DataTable dt = fn.Fetch(@"SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS [Sr.No], MaKhoaHoc, TenKhoaHoc, kh.SoBuoi, kh.TenMonHoc, kh.CapDo FROM KhoaHoc kh JOIN MonHoc mh ON kh.TenMonHoc = mh.TenMonHoc AND kh.CapDo = mh.CapDo ");
            GridView1.DataSource = dt;
            GridView1.DataBind();
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

                string NOSession = (row.FindControl("txtNOSessionEdit") as TextBox).Text;
                fn.Query("UPDATE MonHoc SET TenMonHoc = '" + SubtName + "', CapDo = '" + SubLevel + "', SoBuoi = '" + NOSession + "' WHERE MaMonHoc = '" + sId + "'");
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
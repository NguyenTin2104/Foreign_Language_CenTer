using System;
using System.Data;
using System.Web.UI.WebControls;
using static QuanLyTTNN.Models.CommonFn;

namespace QuanLyTTNN.Admin
{
    public partial class Student : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetTeachers();
            }
        }

        private void GetTeachers()
        {
            DataTable dt = fn.Fetch(@"SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS [Sr.No], MaGiaoVien, 
                                    TenGiaoVien, NgaySinh, GioiTinh, SDT, Email, DiaChi FROM GiaoVien");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlGender.SelectedValue != "0")
                {
                    string email = txtEmail.Text.Trim();
                    DataTable dt = fn.Fetch("SELECT * FROM GiaoVien WHERE Email = '" + email + "'");
                    if (dt.Rows.Count == 0)
                    {
                        //INSERT INTO GiaoVien VALUES('Nguyen Hong Tin', '2003-04-21', 'Nam', '0363117685', 'hongtin2104@gmail.com', 'hongtin2104', 'Hung Loi, Ninh Kieu')

                        string query = "INSERT INTO GiaoVien VALUES ('" + txtTeacherName.Text.Trim() + "', '" +
                            txtDoB.Text.Trim() + "', '" + ddlGender.SelectedValue + "', '" + txtMobile.Text.Trim() + "', '" +
                            txtEmail.Text.Trim() + "', '" + txtAddress.Text.Trim() + "' )";
                        fn.Query(query);
                        lblMsg.Text = "Inserted Successfully";
                        lblMsg.CssClass = "alert alert-success";
                        txtTeacherName.Text = string.Empty;
                        txtDoB.Text = string.Empty;
                        ddlGender.SelectedIndex = 0;
                        txtMobile.Text = string.Empty;
                        txtEmail.Text = string.Empty;
                        txtAddress.Text = string.Empty;
                        GetTeachers();
                    }
                    else
                    {
                        lblMsg.Text = "Entered Subject already exists!";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }
                else
                {
                    lblMsg.Text = "Gender is required";
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
            GetTeachers();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetTeachers();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int MaGiaoVien = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("DELETE FROM GiaoVien WHERE MaGiaoVien = '" + MaGiaoVien + "' ");
                lblMsg.Text = "Teacher Deleted Successfully!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetTeachers();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetTeachers();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int tId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string name = (row.FindControl("txtTeacherName") as TextBox).Text;
                string mobile = (row.FindControl("txtMobile") as TextBox).Text;
                string address = (row.FindControl("txtAddress") as TextBox).Text;
                fn.Query("UPDATE GiaoVien SET TenGiaoVien = '" + name.Trim() + "', SDT = '" + mobile.Trim() + "', DiaChi = '" + address.Trim() + "' WHERE MaGiaoVien = '" + tId + "'");
                lblMsg.Text = "Teacher Updated Successfully";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetTeachers();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
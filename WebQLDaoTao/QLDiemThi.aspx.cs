using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QLDiemThi : System.Web.UI.Page
    {
        KetQuaDAO kqDAO = new KetQuaDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            //SetPermissions();
            if (Session["VaiTro"] == null)
            {
                Response.Redirect("Login.aspx"); // Nếu chưa đăng nhập thì về trang Login
            }
        }

        private void SetPermissions()
        {
            //if (!IsPostBack)
            //{
            //    // Giả sử VaiTro của user được lưu trong Session
            //    string vaiTro = Session["VaiTro"] as string;

            //    if (vaiTro == "QTV")
            //    {   
            //      // Ẩn nút Lưu và Xóa đã chọn
            //        gvKetQua.FooterRow.FindControl("btnLuu").Visible = true;
            //        gvKetQua.FooterRow.FindControl("btnDelete").Visible = false;
                    
            //    }
            //}
        }

        protected void btLuu_Click(object sender, EventArgs e)
        {
            //int rows = gvKetQua.Rows.Count;
            //for (int i = 0; i < rows; i++)
            //{
            //    int id = int.Parse(gvKetQua.DataKeys[i].Value.ToString());
            //    double diem= double.Parse(((TextBox)gvKetQua.Rows[i].FindControl("txtDiem")).Text);
            //    kqDAO.Update(id,diem);
            //}
            //Response.Write("<script> alert'(Thay đổi thành côngg)' </script>");
        }

        protected void gvKetQua_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string role = Session["VaiTro"] != null ? Session["VaiTro"].ToString() : "Khach";

                TextBox txtDiem = (TextBox)e.Row.FindControl("txtDiem");
                if (txtDiem != null)
                {
                    if (role == "Khach")
                    {
                        //gvKetQua.FooterRow.FindControl("btnLuu").Visible = false;
                        //gvKetQua.FooterRow.FindControl("btnDelete").Visible = false;
                        txtDiem.ReadOnly = true; // Không cho khách chỉnh sửa
                        txtDiem.CssClass = "form-control bg-light"; // Làm nhạt màu
                        btnLuu.Visible = false;
                        btnDelete.Visible = false;

                        // Ẩn tất cả các checkbox
                        foreach (GridViewRow row in gvKetQua.Rows)
                        {
                            CheckBox chkAll = (CheckBox)row.FindControl("chkAll");
                            CheckBox chkRow = (CheckBox)row.FindControl("chkRow");
                            if (chkAll != null)
                            {
                                chkAll.Visible = false;
                            }
                            else if (chkRow != null)
                            {
                                chkRow.Visible = false;
                            }
                        }
                        }
                }
            }
        }

        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkAll = (CheckBox)sender;
            foreach (GridViewRow row in gvKetQua.Rows)
            {
                CheckBox chkRow = (CheckBox)row.FindControl("chkRow");
                if (chkRow != null)
                {
                    chkRow.Checked = chkAll.Checked;
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
           // foreach (GridViewRow row in gvKetQua.Rows)
           // {
           //     CheckBox chkRow = (CheckBox)row.FindControl("chkRow");
           //     if (chkRow != null && chkRow.Checked)
           //     {
           //         int id = Convert.ToInt32(gvKetQua.DataKeys[row.RowIndex].Value);
           //         kqDAO.Delete(id); // Gọi phương thức xóa trong DAO
           //         Response.Write("<script>alert('Thao tác Xóa Thành Công.')</script>");
           //     }
           //     else
           //     {
           //         Response.Write("<script>alert('Chưa chọn sinh viên để xóa điểm.')</script>");
           //     }
           // }
           //gvKetQua.DataBind();
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            int rows = gvKetQua.Rows.Count;
            for (int i = 0; i < rows; i++)
            {
                int id = int.Parse(gvKetQua.DataKeys[i].Value.ToString());
                double diem = double.Parse(((TextBox)gvKetQua.Rows[i].FindControl("txtDiem")).Text);
                kqDAO.Update(id, diem);
            }
            Response.Write("<script>alert('Thao tác Lưu Thành Công.')</script>");
        }

        protected void btnDelete_Click1(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvKetQua.Rows)
            {
                CheckBox chkRow = (CheckBox)row.FindControl("chkRow");
                if (chkRow != null && chkRow.Checked)
                {
                    int id = Convert.ToInt32(gvKetQua.DataKeys[row.RowIndex].Value);
                    kqDAO.Delete(id); // Gọi phương thức xóa trong DAO
                    Response.Write("<script>alert('Thao tác Xóa Thành Công.')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Chưa chọn sinh viên để xóa điểm.')</script>");
                }
            }
            gvKetQua.DataBind();
        }
    }
}
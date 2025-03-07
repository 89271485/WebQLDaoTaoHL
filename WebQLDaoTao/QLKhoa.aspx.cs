using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QLKhoa : System.Web.UI.Page
    {
        KhoaDAO khDAO=  new KhoaDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["VaiTro"] == null)
            {
                Response.Redirect("Login.aspx"); // Nếu chưa đăng nhập thì về trang Login
            }
            SetPermissions();
        }

        private void SetPermissions()
        {
            string role = Session["VaiTro"] != null ? Session["VaiTro"].ToString() : "Khach";

            if (role == "Khach")
            {
                btnThem.Visible = false;

                // Ẩn cột Sửa/Xóa trong GridView
                if (gvKhoa.Columns.Count > 2)
                {
                    gvKhoa.Columns[2].Visible = false; // Cột tác vụ
                }
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                string makh = txtMaKH.Text;
                string tenkh = txtTenKH.Text;
                if (khDAO.findById(makh) != null)
                {
                    Response.Write("<script>alert('Mã khoa đã tồn tại. Chọn mã khác nhé.')</script>");
                    return;
                }
                Khoa khInsert = new Khoa { MaKH = makh, TenKH = tenkh };
                khDAO.Insert(makh,tenkh);
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Thao tác thêm khoa không thành công.')</script>");
            }
            gvKhoa.DataBind();
        }
    }
}
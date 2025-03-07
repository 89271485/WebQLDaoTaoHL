using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QLSinhVien : System.Web.UI.Page
    {
        SinhVienDAO svDAO=new SinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Page.IsPostBack)
            //{
            //    //Liên kết dữ liệu cho gvSinhVien
            //    LienKetDuLieu();
            //}
            if (!IsPostBack)
            {
                if (Session["VaiTro"] == null)
                {
                    Response.Redirect("Login.aspx"); // Nếu chưa đăng nhập thì về trang Login
                }
                SetPermissions();
            }
        }

        private void SetPermissions()
        {
            string role = Session["VaiTro"] != null ? Session["VaiTro"].ToString() : "Khach";

            if (role == "Khach")
            {
                Response.Write("<script>alert('Bạn cần được cấp quyền vào trang này!'); window.location='Default.aspx';</script>");

            }
        }

        private void LienKetDuLieu()
        {
            //gvSinhVien.DataSource = svDAO.getAll();
            //gvSinhVien.DataBind();
        }

        protected void btXuLy_Click(object sender, EventArgs e)
        {
            string masv = txtMaSV.Text;
            string hosv = txtHoSV.Text;
            string tensv = txtTenSV.Text;
            Boolean gioitinh = rdNam.Checked ? true : false;
            DateTime ngaysinh = DateTime.Parse(txtNgaySinh.Text);
            string noisinh = txtNoiSinh.Text;
            string diachi = txtDiaChi.Text;

            string makh = ddlKhoa.SelectedValue;
            //thêm sinh vien vào csdl
            SinhVien sv = new SinhVien { MaSV = masv, HoSV = hosv, TenSV = tensv, GioiTinh = gioitinh, NgaySinh = ngaysinh, NoiSinh = noisinh, DiaChi = diachi, MaKH = makh };
            svDAO.Insert(sv);
            gvSinhVien.DataBind();
        }

       
    }
}
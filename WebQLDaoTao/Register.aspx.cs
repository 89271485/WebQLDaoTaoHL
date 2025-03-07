using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;
            string vaitro = "Khach"; // ✅ Gán vai trò mặc định là Khach

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Vui lòng nhập đầy đủ thông tin.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            TaiKhoan newUser = new TaiKhoan(username, password, vaitro);
            TaiKhoanDAO dao = new TaiKhoanDAO();

            if (dao.DangKyTaiKhoan(newUser))
            {
                lblMessage.Text = "Đăng ký thành công!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                lblMessage.Text = "Đăng ký thất bại. Vui lòng thử lại.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}

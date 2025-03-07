using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebQLDaoTao
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // ✅ Hiển thị tên người dùng nếu đã đăng nhập
            if (Session["Username"] != null)
            {
                lblUser.Text = "Xin chào, " + Session["Username"].ToString();
            }
            else
            {
                lblUser.Text = "Chưa đăng nhập";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // ✅ Xóa dữ liệu Session khi đăng xuất
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx"); // Chuyển về trang đăng nhập
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebQLDaoTao.Models
{
    public class TaiKhoan
    {
        public string Tendangnhap { get; set; }
        public string Matkhau { get; set; }
        public string VaiTro { get; set; }

        public TaiKhoan() { }

        public TaiKhoan(string tendangnhap, string matkhau, string vaitro)
        {
            Tendangnhap = tendangnhap;
            Matkhau = matkhau;
            VaiTro = vaitro;
        }
    }
}
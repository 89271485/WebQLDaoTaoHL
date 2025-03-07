<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebQLDaoTao.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng Nhập</title>
    <style>
        body {
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
       
            font-family: Arial, sans-serif;
            overflow: hidden;
            position: relative;
        }

        .login-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            text-align: center;
            z-index: 10;
        }

        .login-container h2 {
            color: #000000;
            margin-bottom: 20px;
        }

        input[type="text"], input[type="password"], .aspNetTextBox {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .aspNetButton {
            width: 100%;
            padding: 12px;
            border: none;
            background-color: yellow;
            color: black;
            border-radius: 5px;
            cursor: pointer;
        }

        .aspNetButton:hover {
            background-color: red;
        }

        .error {
            color: red;
            margin-top: 10px;
        }

        a {
            color: #e91e63;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

     
        .leaf {
            position: absolute;
            top: -50px;
            color: white;
            font-size: 1.5em;
            pointer-events: none;
            animation: fall linear infinite;
        }

        @keyframes fall {
            0% {
                transform: translateY(0) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(100vh) rotate(360deg);
                opacity: 0;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Đăng Nhập</h2>

            <asp:TextBox ID="txtUsername" runat="server" CssClass="aspNetTextBox" placeholder="Tên đăng nhập"></asp:TextBox><br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="aspNetTextBox" placeholder="Mật khẩu"></asp:TextBox><br />

            <asp:Button ID="btnLogin" runat="server" Text="Đăng Nhập" CssClass="aspNetButton" OnClick="btnLogin_Click" /><br />

            <asp:Label ID="lblMessage" runat="server" CssClass="error"></asp:Label>

            <p><a href="ForgotPassword.aspx">Quên mật khẩu?</a></p>
            <p>Bạn chưa có tài khoản? <a href="Register.aspx">Đăng ký</a></p>
        </div>
    </form>

    <script>
        const leafCount = 50; // Số lượng hoa rơi
        const container = document.body;

        for (let i = 0; i < leafCount; i++) {
            const leaf = document.createElement("div");
            leaf.classList.add("leaf");
            leaf.style.left = Math.random() * 100 + "vw";
            leaf.style.animationDuration = Math.random() * 5 + 5 + "s";
            leaf.style.fontSize = Math.random() * 1.5 + 1 + "em";
            leaf.style.opacity = Math.random();
            container.appendChild(leaf);
        }
    </script>
</body>
</html>

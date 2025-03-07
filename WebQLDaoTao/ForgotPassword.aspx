<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="WebQLDaoTao.ForgotPassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quên Mật Khẩu</title>
    <style>
        body {
           font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
        }

        .container {
            width: 400px;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            text-align: left;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #007BFF;
            outline: none;
        }

        .btn {
            width: 100%;
            background-color: #007BFF;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .message {
            margin-top: 10px;
            font-size: 14px;
        }

        .message.success {
            color: green;
        }

        .message.error {
            color: red;
        }

        .back-link {
            display: block;
            margin-top: 15px;
            color: #007BFF;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
       
 .leaf {
     position: absolute;
     top: -50px;
     color: #e91e63;
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
        <div class="container">
            <h2>Quên Mật Khẩu</h2>

            <asp:Label ID="lblUsername" runat="server" Text="Tên đăng nhập:"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>

            <asp:Label ID="lblNewPassword" runat="server" Text="Mật khẩu mới:"></asp:Label>
            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>

            <asp:Label ID="lblConfirmPassword" runat="server" Text="Xác nhận mật khẩu:"></asp:Label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>

            <asp:Button ID="btnResetPassword" runat="server" Text="Đặt lại mật khẩu" CssClass="btn" OnClick="btnResetPassword_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

            <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="Login.aspx" CssClass="back-link">Quay lại đăng nhập</asp:HyperLink>
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

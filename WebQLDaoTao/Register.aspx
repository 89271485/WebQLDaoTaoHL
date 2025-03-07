<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebQLDaoTao.Register" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký</title>
    <style>
        body {
            height: 100vh;
            margin: 0;
            overflow: hidden;
           
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            position: relative;
        }

        .register-container {
            background-color: #000000;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            width: 300px;
            text-align: center;
            z-index: 10;
        }

            .register-container h2 {
                color: red;
                margin-bottom: 20px;
            }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button, .btn {
            width: 100%;
            padding: 12px;
            border: none;
     
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

            button:hover, .btn:hover {
                background-color: #000000;
            }

        .error-message {
            color: red;
            margin-top: 10px;
        }

        .success-message {
            color: green;
            margin-top: 10px;
        }

        .leaf {
            position: absolute;
            top: 0;
            color: #66BB6A;
            font-size: 1.5em;
            pointer-events: none;
            animation: fall linear infinite;
            z-index: 1;
        }

        @keyframes fall {
            0% {
                transform: translateY(-100px) rotate(0deg);
                opacity: 1;
            }

            100% {
                transform: translateY(100vh) rotate(360deg);
                opacity: 0.5;
            }
        }
    </style>
    <script src="https://accounts.google.com/gsi/client" async defer></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-container">
            <h2>Đăng Ký</h2>

            <asp:TextBox ID="txtUsername" runat="server" Placeholder="Tên đăng nhập" CssClass="input-field"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" Placeholder="Mật khẩu" TextMode="Password" CssClass="input-field"></asp:TextBox>
            <asp:TextBox ID="txtConfirmPassword" runat="server" Placeholder="Xác nhận mật khẩu" TextMode="Password" CssClass="input-field"></asp:TextBox>

            <asp:Button ID="btnRegister" runat="server" Text="Đăng Ký" CssClass="btn" OnClick="btnRegister_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label>
            <p>Đã có tài khoản? <a href="Login.aspx">Đăng nhập</a></p>
        </div>
        <div id="g_id_onload"
             data-client_id="756118103480-tbe66g8qhpgd72msoeo09s2h3arou5um.apps.googleusercontent.com"
             data-callback="handleCredentialResponse">
        </div>
        <div class="g_id_signin" data-type="standard"></div>
    </form>

    <script>
        const leafCount = 50;
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
        function handleCredentialResponse(response) {
            let userData = parseJwt(response.credential);
            localStorage.setItem("loggedInUser", userData.email);
            alert(`Chào mừng, ${userData.name}!`);
            window.location.href = "Default.aspx";
        }
        function parseJwt(token) {
            let base64Url = token.split('.')[1];
            let base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
            let jsonPayload = decodeURIComponent(atob(base64).split('').map(function (c) {
                return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
            }).join(''));
            return JSON.parse(jsonPayload);
        }
    </script>
</body>
</html>

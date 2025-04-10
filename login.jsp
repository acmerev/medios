<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
        }

        .login-container {
            width: 300px;
            margin: 120px auto;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0px 0px 10px #ccc;
            border-radius: 8px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 90%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .login-container button {
            width: 95%;
            padding: 10px;
            background-color: #4CAF50;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 15px;
            cursor: pointer;
        }

        .login-container button:hover {
            background-color: #45a049;
        }

        .register-btn {
            margin-top: 10px;
            background-color: #2196F3;
        }

        .register-btn:hover {
            background-color: #1976D2;
        }

        .error {
            color: red;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Iniciar Sesión</h2>

    <% 
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="error"><%= error %></div>
    <% } %>

    <form action="LoginServlet" method="post">
        <input type="text" name="username" placeholder="Usuario" required="required" />
        <input type="password" name="password" placeholder="Contraseña" required="required" />
        <button type="submit">Ingresar</button>
    </form>

    <form action="RegistroServlet" method="get">
        <button type="submit" class="register-btn">Registrarse</button>
    </form>
</div>

</body>
</html>

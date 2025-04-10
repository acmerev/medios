<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #2c3e50, #3498db);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column; /* Para apilar el disquete y el contenedor de login */
            height: 100vh;
            justify-content: center;
            align-items: center;
        }

        .disquete-container {
            position: relative;
            width: 80px; /* Ajusta el tamaño según necesites */
            height: 85px; /* Ajusta el tamaño según necesites */
            margin-bottom: 20px; /* Espacio entre el disquete y el formulario */
        }

        .disquete-cuerpo {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #ddd; /* Color base del disquete */
            border-radius: 5px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
        }

        .disquete-etiqueta {
            position: absolute;
            top: 10px;
            left: 10px;
            width: calc(100% - 20px);
            height: 30px;
            background-color: #eee; /* Color de la etiqueta */
            border-radius: 3px;
            border: 1px solid #ccc;
        }

        .disquete-linea-superior {
            position: absolute;
            top: 15px;
            left: 15px;
            width: calc(100% - 30px);
            height: 5px;
            background-color: #ccc;
        }

        .disquete-linea-inferior {
            position: absolute;
            top: 25px;
            left: 15px;
            width: calc(50% - 20px);
            height: 5px;
            background-color: #ccc;
        }

        .disquete-agujero-metal {
            position: absolute;
            top: 50%;
            left: 15px;
            width: 12px;
            height: 12px;
            background-color: #bbb;
            border-radius: 50%;
            transform: translateY(-50%);
            border: 1px solid #999;
        }

        .disquete-agujero-escritura {
            position: absolute;
            top: 50%;
            right: 15px;
            width: 18px;
            height: 8px;
            background-color: #ccc;
            border-radius: 2px;
            transform: translateY(-50%);
            border: 1px solid #aaa;
        }

        .disquete-flecha-proteccion {
            position: absolute;
            top: 50%;
            right: 15px;
            width: 8px;
            height: 8px;
            background-color: #888;
            border-radius: 2px;
            transform: translate(6px, -50%);
            clip-path: polygon(0% 0%, 100% 0%, 50% 100%);
        }

        .login-container {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            color: #2c3e50;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: calc(100% - 20px); /* Reducimos el ancho para el margen */
            padding: 0.9rem 10px; /* Añadimos padding horizontal */
            margin: 0.7rem 10px; /* Añadimos margen horizontal */
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
            box-sizing: border-box; /* Importante para que el padding y el borde no aumenten el ancho total */
        }

        .login-container input[type="text"]:focus,
        .login-container input[type="password"]:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 8px rgba(52, 152, 219, 0.3);
        }

        .login-container button {
            width: 100%;
            padding: 0.9rem;
            margin-top: 1rem;
            border: none;
            border-radius: 10px;
            background-color: #3498db;
            color: white;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .login-container button:hover {
            background-color: #2980b9;
        }

        .login-container .register-btn {
            background-color: #2ecc71;
        }

        .login-container .register-btn:hover {
            background-color: #27ae60;
        }

        .error {
            color: red;
            text-align: center;
            margin-bottom: 1rem;
            font-weight: bold;
        }
    </style>
      
</head>
<body>

<div class="login-container">

    <div class="login-container">
        <div class="disquete-container">
           <div class="disquete-cuerpo"></div>
           <div class="disquete-etiqueta">
               <div class="disquete-linea-superior"></div>
               <div class="disquete-linea-inferior"></div>
           </div>
           <div class="disquete-agujero-metal"></div>
           <div class="disquete-agujero-escritura">
               <div class="disquete-flecha-proteccion"></div>
           </div>
       </div>

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

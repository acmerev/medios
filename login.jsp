<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://java.sun.com/jsf/html">
<h:head>
    <title>Login</title>
</h:head>
<h:body>
    <h:form>
        <h:outputLabel value="Usuario:" />
        <h:inputText value="#{loginBean.username}" /><br/>

        <h:outputLabel value="Contraseña:" />
        <h:inputSecret value="#{loginBean.password}" /><br/>

        <h:commandButton value="Ingresar" action="#{loginBean.login}" />
    </h:form>
</h:body>
</html>

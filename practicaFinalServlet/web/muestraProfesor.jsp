<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="profesor" scope="request" class="hiber.Profesor"/>
<jsp:setProperty name="profesor" property="*"/>

<%
    hiber.Profesor profesorBean = (hiber.Profesor) request.getAttribute("profesor");
    if (profesorBean == null) {
%>
ERROR: no se especific&oacute; sede a mostrar.
<%
} else {
    Session s = hiber.NewHibernateUtil.getInstance().getSessionFactory().openSession();
    try  {
        s.refresh(profesorBean);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>muestraProfesor</title>
    </head>
    <body>
        <form name="muestraProfesor" method="post" action="controlador">
           <input type="hidden" name="op" value="muestraProfesor">
           <input type="hidden" name="codProfe" value="<%=profesorBean.getCodProfe()%>">
        
                <p>Informacion de Profesor:</p> 
                <p>ID: <%=profesorBean.getCodProfe()%></p>
                <p>NOMBRE: <%=profesorBean.getNombre()%></p> 
                <p>APELLIDO: <%=profesorBean.getApellido1()%> </p>
                <p>DNI: <%=profesorBean.getDni()%></p>
               
        </form>
    </body>
</html>
<%
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
%>

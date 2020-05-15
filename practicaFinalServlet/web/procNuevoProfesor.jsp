<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<jsp:useBean id="profesor" scope="request" class="hiber.Profesor"/>
<jsp:setProperty name="profesor" property="*"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>procNuevoProfesor</title>
    </head>
    <body>
        <%
            hiber.Profesor profesorBean = (hiber.Profesor) request.getAttribute("profesor");
            if (profesorBean == null) {
        %>
        ERROR: no se proporcionaron datos del profesor a crear.
        <%
        } else {
            Session s = hiber.NewHibernateUtil.getInstance().getSessionFactory().openSession();
            Transaction t = null;
            //aqui llega
            try {
                t = s.beginTransaction();
                s.save(profesorBean);
                t.commit();
                //aqui no llega
        %>
        Creado nuevo Profesor: [<%=profesorBean.getCodProfe() %>] <%=profesorBean.getNombre()%><br/>
        <a href="controlador">Volver</a>
        <%
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                    if (t != null) {
                        t.rollback();
                    }
                }
            }
        %>
    </body>
</html>


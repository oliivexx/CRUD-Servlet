<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Query"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="profesor" scope="request" class="hiber.Profesor"/>
<jsp:setProperty name="profesor" property="*"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>procEditarProfesor</title>
    </head>
    <body>
        <%
            hiber.Profesor profesorBean = (hiber.Profesor) request.getAttribute("profesor");
            if (profesorBean == null) {
        %>
        ERROR: no se proporcionaron datos de sede para crear.
        <%
        } else {
            Transaction t = null;
            Session s = hiber.NewHibernateUtil.getInstance().getSessionFactory().openSession();
            
            try {
                t = s.beginTransaction();%>
                 
                <%=profesorBean.getCodProfe()%>
                <%
                s.update(profesorBean);
                t.commit();
        %>
        Profesor editado correctamente: [<%=profesorBean.getCodProfe()%>] <%=profesorBean.getNombre()%><br/>
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

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
        <title>frmEditarProfesor</title>
    </head>
    <body>
        <form method="post" action="controlador">
            <table>
                <tr>
                    <td>
                        <input type="hidden" name="op" value="procEditarProfesor"/>
                        <input type="hidden" name="codProfe"  value="<%=profesorBean.getCodProfe()%>"/>
                        <p>Nombre:</p>
                        <input name="nomProfesor" value="<%=profesorBean.getNombre()%>"  required type="text" size="20" maxlength="20"/>   
                        <p>Apellido:</p>
                        <input name="apeProfesor" value="<%=profesorBean.getApellido1()%>"  required type="text" size="20" maxlength="20"/>   
                        <p>DNI:</p>
                        <input name="dniProfesor" value="<%=profesorBean.getDni()%>"  required type="text" size="20" maxlength="20"/>   
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Editar"/>
                        <input type="reset" name="cancelar" value="Borrar"/>
                    </td>
                </tr>
            </table>
        </form>
        <a href="controlador">Inicio</a>
    </body>
</html>
<%
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
%>
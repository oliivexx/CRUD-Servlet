<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <form name="frmMuestraProfesor" method="post" action="controlador">
            <input type="hidden" name="op" value="muestraProfesor">
            <input type="hidden" name="codProfe">
            <table border="1">
                <!--Enlace para crear nuevo profesor -->
                <tr><td colspan="6" align="center">Profesores:[<a href="javascript:void(0)" onclick="javascript:document.frmMuestraProfesor.op.value = 'altaProfesor';document.frmMuestraProfesor.submit();">Crear nuevo Profesor</a>]</td></tr>
                <%
                    Session s = hiber.NewHibernateUtil.getInstance().getSessionFactory().openSession();
                    try {
                        Query q = s.createQuery("FROM profesor ORDER BY codProfe").setReadOnly(true);
                        List<hiber.Profesor> listaProfesores = (List<hiber.Profesor>) q.list();
                if (listaProfesores.isEmpty()) {%>
                <tr><td colspan="2">No existen Profesores</td></tr>
                <%
        } else {
            for (hiber.Profesor unProfe : listaProfesores) {%>
                <tr>
                    <td><%=unProfe.getCodProfe()%></td>
                    
                    <td><a href="javascript:void(0)" onclick="javascript:document.frmMuestraProfesor.codProfe.value = '<%=unProfe.getCodProfe()%>';
                            document.frmMuestraProfesor.submit();"><%=unProfe.getNombre()%></a></td>
                    
                    <td><a href="javascript:void(0)" onclick="javascript:document.frmMuestraProfesor.codProfe.value = '<%=unProfe.getCodProfe()%>';
                            document.frmMuestraProfesor.submit();"><%=unProfe.getApellido1()%></a></td>
                    
                    <td><a href="javascript:void(0)" onclick="javascript:document.frmMuestraProfesor.codProfe.value = '<%=unProfe.getCodProfe()%>';
                            document.frmMuestraProfesor.submit();"><%=unProfe.getDni()%></a></td>
                    
                    <td><a href="javascript:void(0)" onclick="javascript:document.frmMuestraProfesor.op.value = 'editarProfesor'; document.frmMuestraProfesor.codProfe.value = '<%=unProfe.getCodProfe()%>';
                            document.frmMuestraProfesor.submit();" > editar </a></td>
                    
                     <td><a href="javascript:void(0)" onclick="javascript:document.frmMuestraProfesor.op.value = 'borrarProfesor'; document.frmMuestraProfesor.codProfe.value = '<%=unProfe.getCodProfe()%>';
                            document.frmMuestraProfesor.submit();"> borrar </a></td>
                </tr>
                <%
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace(System.err);
                    }
                %>
            </table>
        </form>
    </body>
</html>

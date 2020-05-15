<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="profesor" scope="request" class="hiber.Profesor"/> 
<jsp:setProperty name="profesor" property="*"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>frmNuevoProfesor</title>
    </head>
    <body>
        <form method="post" action="controlador">
            <table>
                <tr>
                    <td>
                        <input type= "hidden" name="op" value="insertProfesor"/>
                        <p>Nombre:</p>
                        <input name="nomProfesor" required type="text" size="20" maxlength="20"/>
                        <p>Apellido:</p>
                        <input name="apeProfesor" required type="text" size="20" maxlength="20"/>
                        <p>DNI:</p>
                        <input name="dniProfesor" required type="text" size="20" maxlength="20"/>
                        <p></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Crear"/>
                        <input type="reset" name="cancelar" value="Borrar"/>
                    </td>
                </tr>
            </table>
        </form>
        <a href="controlador">Inicio</a>
    </body>
</html>

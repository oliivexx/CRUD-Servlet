/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import org.hibernate.Session;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "controlador", urlPatterns = {"/controlador"}, initParams = {
@WebInitParam(name = "op", value = "")})

public class controlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String oper = request.getParameter("op");
        if (oper == null) {
            oper = "";
        }

        RequestDispatcher rd;

        switch (oper) {
            case "altaProfesor":
                response.sendRedirect("frmNuevoProfesor.jsp");
                break;
            case "insertProfesor":
                rd = request.getRequestDispatcher("procNuevoProfesor.jsp");
                rd.forward(request, response);
                break;
            case "editarProfesor":
                rd = request.getRequestDispatcher("frmEditarProfesor.jsp");
                rd.forward(request, response);
                break;
            case "procEditarProfesor":
                rd = request.getRequestDispatcher("procEditarProfesor.jsp");
                rd.forward(request, response);
                break;
            case "muestraProfesor":
                rd = request.getRequestDispatcher("muestraProfesor.jsp");
                rd.forward(request, response);
                break;
            case "borrarProfesor":
                int codProfe = Integer.parseInt(request.getParameter("codProfe"));
                hiber.Profesor paux = new hiber.Profesor();
                paux.setCodProfe(codProfe);
                paux.setNombre("luis");
                
                Session s = hiber.NewHibernateUtil.getInstance().getSessionFactory().openSession();
                s.beginTransaction();
                s.delete(paux);
                s.getTransaction().commit();
                s.close();
                response.sendRedirect("home.jsp");
                break;
            
            default:
                response.sendRedirect("home.jsp");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

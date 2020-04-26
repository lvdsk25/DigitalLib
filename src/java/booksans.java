/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Koushik
 */
public class booksans extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
           if(request.getParameter("btnb")!=null)
           {
               Integer id=Integer.parseInt(request.getParameter("id"));
               String b1=request.getParameter("b1");
               String b2=request.getParameter("b2");
               String b3=request.getParameter("b3");
               SessionFactory sf;
              Transaction t;
              Session s;
              sf=HibernateUtil.getSessionFactory();
              s=sf.openSession();
              t=s.getTransaction();
              t.begin();
              com.Book rb;
               rb = new com.Book(id,b1,b2,b3);
         //  s.delete(mobj);
            //s.persist(mobj);
            //s.update(mobj);
            s.save(rb);
            t.commit();
            s.close();
            response.sendRedirect("a6.jsp");
           }
        }
    }
}
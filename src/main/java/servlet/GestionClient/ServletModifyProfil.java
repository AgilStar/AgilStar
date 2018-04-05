/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.GestionClient;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author auden
 * 
 */
@WebServlet(
        name = "ServletModifyProfil",
        urlPatterns = {"/ServletModifyProfil"}
)
public class ServletModifyProfil  extends HttpServlet {
    
     protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
     
       resp.setContentType("application/xml;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String idS;
       HttpSession session=req.getSession();
       idS= (String)session.getAttribute("id");
       int id=Integer.parseInt(idS);
                                           
        String nom = req.getParameter("nom");
        String adresse = req.getParameter("adress");
        String prenom = req.getParameter("prenom");
       new db.dbClient().modifyProfil(id, nom, adresse, prenom);
     resp.sendRedirect("content/modifyPerso.jsp");
     }
    
}

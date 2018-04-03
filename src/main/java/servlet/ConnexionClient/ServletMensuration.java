/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.ConnexionClient;

import java.io.PrintWriter;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import servlet.Exercice.ServletModifyExercice;

/**
 * On modifie l'exercice selectionn?
 *
 * @author aude, jin
 */
@WebServlet(
        name = "ServletMensuration",
        urlPatterns = {"/ServletMensuration"}
)
public class ServletMensuration extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            String id=(String)session.getAttribute("id");
            Double bras=0.0;
            if(req.getParameter("bras")!=""){
                bras =new Double(req.getParameter("bras"));
            }

             Double poitrine=0.0;
             if(req.getParameter("poitrine")!=""){
                 poitrine =new Double(req.getParameter("poitrine"));
             }
              Double taille =0.0;
             if(req.getParameter("taille")!=""){
                 taille =new Double(req.getParameter("taille"));
             }
             Double hanche =0.0;
             if(req.getParameter("hanche")!=""){
                 hanche =new Double(req.getParameter("hanche"));
             }
              Double cuisse=0.0;
              if(req.getParameter("cuisse")==""){
                  cuisse =new Double(req.getParameter("cuisse"));
              }
         
          new db.dbClient().insertMeasure(Integer.parseInt(id), taille, hanche, cuisse, poitrine, bras);
           resp.sendRedirect("content/profilClient.jsp");
       
        }

    }
}

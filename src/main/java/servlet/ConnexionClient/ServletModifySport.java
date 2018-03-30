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
 * On modifie l'exercice selectionné
 *
 * @author aude, jin
 */
@WebServlet(
        name = "ServletModifySport",
        urlPatterns = {"/ServletModifySport"}
)
public class ServletModifySport extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            String id=(String)session.getAttribute("id");
            Double poids = new Double(req.getParameter("poids"));
            Integer fcr = new Integer(req.getParameter("fcr"));
            Integer fcf = new Integer(req.getParameter("fcf"));
            Integer fca = new Integer(req.getParameter("fca"));
            Integer evalg = new Integer(req.getParameter("evalg"));
            Integer evalfg = new Integer(req.getParameter("evalfg"));
            Integer evalfd = new Integer(req.getParameter("evalfd"));
            Integer crunch = new Integer(req.getParameter("crunch"));
            Integer pompe = new Integer(req.getParameter("pompe"));
            Integer squat = new Integer(req.getParameter("squat"));
            Integer dips = new Integer(req.getParameter("dips"));
            
            Integer age=new Integer(req.getParameter("age"));
            Integer fcmax=220-age;
            
            
            new db.dbClient().modifySport(Integer.parseInt(id), fcr, fcmax,  fcf, fca,poids, evalg, evalfg, evalfd, crunch, pompe, squat, dips);
            resp.sendRedirect("content/profilClient.jsp");
       
        }

    }
}

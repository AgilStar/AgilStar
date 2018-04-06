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
        name = "ServletModifySport",
        urlPatterns = {"/ServletModifySport"}
)
public class ServletModifySport extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        String idSb = req.getParameter("idSb");
        System.out.println("--idSB : "+idSb);
        String id = (String) session.getAttribute("id");

        Double poids = 0.0;
        if (req.getParameter("poids")!=null&&!req.getParameter("poids").equals("")) {
            poids = new Double(req.getParameter("poids"));
        }

        String fcr = "0";
         if(req.getParameter("fcr")!=null&&!req.getParameter("fcr").equals("")) {
             System.out.println("==================="+req.getParameter("fcr"));
            fcr = req.getParameter("fcr");
        }
        

        String fcf = "0";
        if(req.getParameter("fcf")!=null&&!req.getParameter("fcf").equals("")) {
            fcf = req.getParameter("fcf");
        }
            
        String fca = "0";
        if(req.getParameter("fca")!=null&&!req.getParameter("fca").equals("")) {
            fca=req.getParameter("fca");
        }
        


        String evalg = "0";
         if(req.getParameter("evalg") !=null&&!req.getParameter("evalg").equals("")) {
            evalg=req.getParameter("evalg");
        }

        String evalfg = "0";
         if(req.getParameter("evalfg") != null&&!req.getParameter("evalfg").equals("")) {
            evalfg=req.getParameter("evalfg");
        }

        String evalfd = "0";
         if(req.getParameter("evalfd") != null&&!req.getParameter("evalfd").equals("")) {
            evalfd=req.getParameter("evalfd");
        }

        String crunch = "0";
         if(req.getParameter("crunch") != null&&!req.getParameter("crunch").equals("")) {
            crunch=req.getParameter("crunch");
        }

        String pompe = "0";
         if(req.getParameter("pompe") != null&&!req.getParameter("pompe").equals("")) {
            pompe=req.getParameter("pompe");
        }

        String squat = "0";
         if(req.getParameter("squat") != null&&!req.getParameter("squat").equals("")) {
            squat=req.getParameter("squat");
        }

        String dips = "0";
         if(req.getParameter("dips") != null&&!req.getParameter("dips").equals("")) {
            dips=req.getParameter("dips");
        }

        Integer age = 0;
        Integer fcmax = 0;
       
        
        if (req.getParameter("age") != null&&!req.getParameter("age").equals("")) {
            age = new Integer(req.getParameter("age"));
            fcmax = 220 - age;
        }
        new db.dbBilan().modifyPoidsInit(id, String.valueOf(poids));
        new db.dbBilan().updateBilanInit(idSb, fcr, String.valueOf(fcmax), fcf, fca);
        new db.dbClient().modifySport(idSb, "100", evalg);
        new db.dbClient().modifySport(idSb, "101", evalfg);
        new db.dbClient().modifySport(idSb, "102", evalfd);
        new db.dbClient().modifySport(idSb, "103", crunch);
        new db.dbClient().modifySport(idSb, "104", pompe);
        new db.dbClient().modifySport(idSb, "105", squat);
        new db.dbClient().modifySport(idSb, "106", dips);
              
        resp.sendRedirect("content/modifySport.jsp");

    }

}

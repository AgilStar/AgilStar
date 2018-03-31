/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.TypeSession;

import servlet.Exercice.*;
import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * On verifie que l exercice n existe pas avant de l inserer
 *
 * @author tianyuanliu,Nicolas
 */
@WebServlet(
        name = "/InsertTypeSession",
        urlPatterns = {"/insertTypeSession"}
)
public class ServletInsertTypeSession extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
             
        PrintWriter out = resp.getWriter();

        String nameSession = req.getParameter("nameSession");    
        String catSession = req.getParameter("catSession");
        int parseCatSession = Integer.parseInt(catSession);
        String descrSession = req.getParameter("descrSession");
        String descrWarmUp = req.getParameter("descrWarmUp");       
        new db.dbTypeSession().insertTypeSession(nameSession, parseCatSession,descrSession,descrWarmUp);
        int codeSt = new db.dbTypeSession().codeSeance(nameSession);
        String cptString = req.getParameter("cpt"); 
        int cpt = Integer.parseInt(cptString);
        String nameExercice;
        String serieExercice;
        String durationExercice;
        String quantityExercice;
        int codeE;
        for (int i = 1; i <= cpt; i++) {
            nameExercice = req.getParameter("nameExercice"+i);
            serieExercice = req.getParameter("serieExercice"+i);
            durationExercice = req.getParameter("durationExercice"+i);
            quantityExercice = req.getParameter("quantityExercice"+i);
            codeE = new db.dbTypeSession().getCodeExercice(nameExercice);
            new db.dbTypeSession().createOrganiserType(String.valueOf(codeE), String.valueOf(codeSt), i, serieExercice, durationExercice, quantityExercice);
        }

       out.print("youhou");
        
    }
}

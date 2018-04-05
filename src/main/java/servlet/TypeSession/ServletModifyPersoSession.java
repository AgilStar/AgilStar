/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.TypeSession;

import db.dbPersoSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * On verifie que l exercice n existe pas avant de l inserer
 *
 * @author tianyuanliu,Nicolas
 */ 
@WebServlet(
        name = "/ServletModifyPersoSession",
        urlPatterns = {"/ServletModifyPersoSession"}
)
public class ServletModifyPersoSession extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
             
        PrintWriter out = resp.getWriter();

        String nameSession = req.getParameter("nameSession");    
        String catSession = req.getParameter("catSession");
        int parseCatSession = Integer.parseInt(catSession);
        String descrSession = req.getParameter("descrSession");
        String descrWarmUp = req.getParameter("descrWarmUp");       
        String codeSp =  req.getParameter("codeSP");
        String cptString = req.getParameter("cpt"); 
        int cpt = Integer.parseInt(cptString);
        String idExercice;
        String serieExercice;
        String durationExercice;
        String quantityExercice;
        String restExercice;
        int codeE;

        dbPersoSession db=new dbPersoSession();
        db.modifyPersoSession(codeSp,nameSession,descrSession,descrWarmUp,catSession);
        db.deletePlanifier(codeSp);

        for (int i = 1; i <= cpt; i++) {
            idExercice = req.getParameter("idExercice"+i);
            serieExercice = req.getParameter("serieExercice"+i);
            if(serieExercice.equals("")){
                serieExercice="null";
            }
            durationExercice = req.getParameter("durationExercice"+i);
            if(durationExercice.equals("")){
                durationExercice="null";
            }
            quantityExercice = req.getParameter("quantityExercice"+i);
            if(quantityExercice.equals("")){
                quantityExercice="null";
            }
            restExercice = req.getParameter("restExercice"+i);
           db.createPlanifier(idExercice,codeSp,durationExercice,quantityExercice,i,serieExercice,restExercice);
          }


        try {
            db.getCx().close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        out.print("youhou");
    }
}

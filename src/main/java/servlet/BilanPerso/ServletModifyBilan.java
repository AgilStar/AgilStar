/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.BilanPerso;

import db.dbBilan;
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
        name = "/ServletModifyPersoBilan",
        urlPatterns = {"/ServletModifyPersoBilan"}
)
public class ServletModifyBilan extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
             
        PrintWriter out = resp.getWriter();

        String nameBilan = req.getParameter("nameBilan");    
        String com = req.getParameter("com");       
        String codesb =  req.getParameter("codesb");
        String cptString = req.getParameter("cpt"); 
        int cpt = Integer.parseInt(cptString);
        dbBilan db = new dbBilan();
        String idExercice,nameExercice;
        db.modifyBilan(codesb,nameBilan,com);
        db.deletePlanifierBilan(codesb);

        for (int i = 1; i <= cpt; i++) {
            
            nameExercice = req.getParameter("idExercice"+i);
            idExercice = db.getExercice(nameExercice);
            db.createPlanifierBilan(codesb, idExercice, i);
          }
        
        out.print("youhou");
    }
}

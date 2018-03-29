/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.Exercice;

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
        name = "MyServletInsertExercice",
        urlPatterns = {"/insertExercice"}
)
public class ServletInsertExercice extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String nameExercice = req.getParameter("nameExercice");
        String videoExercice = req.getParameter("videoExercice");
        String objectiveExercice = req.getParameter("objectiveExercice");
        if(!new db.dbExercice().insertExercice(nameExercice, objectiveExercice, videoExercice)){
            String s="L'exercice existe d&eacute;j&agrave;";
            
            out.println(new String(s.getBytes("ISO-8859-1")));
        }
        
    }
}

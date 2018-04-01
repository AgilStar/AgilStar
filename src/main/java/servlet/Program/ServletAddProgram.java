package servlet.Program;

import db.dbClient;
import db.dbProgram;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(
        name = "ServletAddProgram",
        urlPatterns = {"/ServletAddProgram"}
)
public class ServletAddProgram extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String name = req.getParameter("name");
        String des = req.getParameter("desc");
        String[] checkedProfil = req.getParameter("checkedProfil").split(",");
        String[] listS = req.getParameter("listS").split(",");

        //insertion dans la table programme type
        if (new dbProgram().insertProgramType(name, des).equals("true")) {
            
              //insertion dans la table correspondre profil

                new dbProgram().insertCorrespondre(checkedProfil);

              //insertion dans la table comprendre type et la table comprendre sbt

                new dbProgram().insertComprendreType(listS);

            resp.sendRedirect("content/listProgramm.jsp"); 
        }else{
            System.out.println("echouer a inserer dans la table programme type");
            resp.sendRedirect("content/createProgram.jsp"); 
        }

    }
}

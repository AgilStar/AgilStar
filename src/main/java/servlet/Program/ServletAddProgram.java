package servlet.Program;

import db.dbProgram;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

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
        String type = req.getParameter("type");
        String codeP = req.getParameter("codeP");
        String[] checkedProfil = req.getParameter("checkedProfil").split(",");
        String[] listS = req.getParameter("listS").split(",");

        dbProgram db = new dbProgram();
        if (type.equals("modify")) {
            db.deleteProgram(codeP);
            db.modifyProgram(codeP,name,des);
        } else {
            if (!db.checkNameProgram(name)) {
                out.print("false");
                return;
            }else{
                //insertion dans la table programme type
                db.insertProgramType(name, des);
            }
        }
                //insertion dans la table correspondre profil
                db.insertCorrespondre(checkedProfil);
                //insertion dans la table comprendre type et la table comprendre sbt
                db.insertComprendreType(listS);
                out.print("true");
        }


}


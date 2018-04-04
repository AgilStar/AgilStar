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
        String type = req.getParameter("type");//createType/modifyType/createPerso/modifyPerso
        String codeP = req.getParameter("codeP");
        String[] checkedProfil = req.getParameter("checkedProfil").split(",");
        String[] listS = req.getParameter("listS").split(",");
        String codeUser=req.getParameter("codeUser");
        dbProgram db = new dbProgram();
        //pour modifier un programme type
        if (type.equals("modifyType")) {
            db.deleteProgram(codeP);
            db.modifyProgram(codeP,name,des);
            //insertion dans la table correspondre profil
            db.insertCorrespondre(checkedProfil);
            //insertion dans la table comprendre type et la table comprendre sbt
            db.insertComprendreType(listS);
            out.print("true");
            //pour creer un programme type 
        } else if(type.equals("createType")){
            if (!db.checkNameProgram(name)) {
                out.print("false");
                return;
            }else{
                //insertion dans la table programme type
                db.insertProgramType(name, des);
                //insertion dans la table correspondre profil
                db.insertCorrespondre(checkedProfil);
                //insertion dans la table comprendre type et la table comprendre sbt
                db.insertComprendreType(listS);
                out.print("true");
            }
            
            //pour la creation d'un programme personnalise 
        }else if(type.equals("createPerso")){

                //insertion dans la table programme perso
                db.insertProgrammePerso(name,des,Integer.parseInt(codeUser),Integer.parseInt(codeP));
                //insertion dans la table seanceperso , la table seancebilan , la table planifiersp
                db.insertSessionBilanPerso(listS,Integer.parseInt(codeUser));
                out.print("true");


        }


}
}

package servlet.TypeSession;

import db.dbProgramPerso;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(
        name = "/ServeletDeleteSessionPerso",
        urlPatterns = {"/ServeletDeleteSessionPerso"}
)
public class ServeletDeleteSessionPerso extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String des = req.getParameter("desc");
        String[] type = req.getParameter("listType").split(",");//perso/type
        String codeP = req.getParameter("codeP");
        String[] checkedProfil = req.getParameter("checkedProfil").split(",");
        String[] listS = req.getParameter("listS").split(",");
        String[] listB = req.getParameter("listB").split(",");
        String codeUser=req.getParameter("codeUser");
        String[] listDeleteBilan=req.getParameter("listDeleteBilan").split(",");
        String[] listDeleteSession=req.getParameter("listDeleteSession").split(",");



//        new dbProgramPerso().deletePlanifierBilan(listDeleteBilan);
//       new dbProgramPerso().deleteSeanceBilanPerso(listDeleteBilan);
//        new dbProgramPerso().deletePlanifierSP(listDeleteSession);
//        new dbProgramPerso().deleteSeancePerso(listDeleteSession);

        //Update
        for(int i=0;i<type.length;i++){
           if(type[i].equals("perso")){
               if(listB[i].equals("seance")){
                   new dbProgramPerso().updateSeancePerso((i+1),listS[i]);
               }else{
                   new dbProgramPerso().updateSeanceBilanPerso((i+1),listS[i]);
               }

           }
        }
//        String codesp=req.getParameter("codesp");
//        String type=req.getParameter("type");
//        if(type.equals("seance")){

//        }else{
//
//        }







    }
}

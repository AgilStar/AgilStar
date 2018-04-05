package servlet.TypeSession;

import db.dbProgram;
import db.dbProgramPerso;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

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



if(!listDeleteBilan[0].equals("")){
    new dbProgramPerso().deletePlanifierBilan(listDeleteBilan);
    new dbProgramPerso().deleteSeanceBilanPerso(listDeleteBilan);
}

       if(!listDeleteSession[0].equals("")){
           new dbProgramPerso().deletePlanifierSP(listDeleteSession);
           new dbProgramPerso().deleteSeancePerso(listDeleteSession);
       }


        //Update
        ArrayList<String> listSS=new ArrayList<String>();
ArrayList<String> listOrder=new ArrayList<String>();
        System.out.println("Liste de seance");
       for(int i=0;i<listS.length;i++){
           System.out.println(listS[i]);
       }
        System.out.println("Liste de type");
        for(int i=0;i<type.length;i++){
            System.out.println(type[i]);
        }


        for(int i=0;i<type.length;i++){
           if(type[i].equals("perso")){
               if(listB[i].equals("seance")){
                   new dbProgramPerso().updateSeancePerso((i+1),listS[i]);
               }else{
                   new dbProgramPerso().updateSeanceBilanPerso((i+1),listS[i]);
               }

           }else{
               listOrder.add(i+"");
               listSS.add(listS[i]);

           }
        }
        dbProgram db = new dbProgram();
        String[] lsitsss=listSS.toArray(new String[0]);
        db.insertSessionBilanPerso2(lsitsss,Integer.parseInt(codeUser),Integer.parseInt(codeP),listOrder);






    }
}

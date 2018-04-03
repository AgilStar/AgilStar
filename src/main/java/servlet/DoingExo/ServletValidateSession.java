/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.DoingExo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mayayePJC
 */
@WebServlet(
        name = "MyServletValidateSession",
        urlPatterns = {"/ServletValidateSession"}
)
public class ServletValidateSession {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        
        String email = req.getParameter("email");
        String mdp = req.getParameter("mdp");
        //out.print(email);
        //out.print(mdp);
        String url = "";
        url = new db.dbClient().verifyConnect(email, mdp);
         out.print(url);
         if(url!="errorMot"&&url!="null"){
            ArrayList<String> list=new db.dbAdmin().recupIdUtilisateur(email);
            HttpSession session=req.getSession();
            session.setAttribute("id", list.get(0));
            session.setAttribute("statut", list.get(1));
           
         }
   
    }
}

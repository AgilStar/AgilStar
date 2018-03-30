/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.ConnexionClient;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jin
 */
@WebServlet(
        name = "MyServletModifyPwdClient",
        urlPatterns = {"/ServletModifyPwdClient"}
)
public class ServletModifyPwdClient extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String pwd0=req.getParameter("pwd0");
        String pwd1 = req.getParameter("pwd1");
        String pwd2 = req.getParameter("pwd2");
        
         HttpSession session=req.getSession(false);
         String id=(String)session.getAttribute("id");
         
        Boolean ok=new db.dbClient().verifyPwd(Integer.parseInt(id), pwd0);
        System.out.println(ok);
       if(!ok){
           out.print("Votre mot de passe n'est pas correct");
       }else if(!pwd1.equals(pwd2)){
           out.print("Vous n'avez pas saisi le m¨ºme mot de passe");
       }else{
           new db.dbClient().changePwd(Integer.parseInt(id), pwd2);
       }
   
    }
}


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.Admin;

import db.dbAdmin;
import java.io.PrintWriter;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tianyuanliu,Nicolas
 */
@WebServlet(
        name = "ServletInsertUserFromAdmin",
        urlPatterns = {"/ServletInsertUserFromAdmin"}
)
public class ServletInsertUserFromAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("application/xml;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        /*----- Ecriture de la page XML -----*/
        PrintWriter out = resp.getWriter();
        String nameUser = req.getParameter("nameUser");
        String lastNameUser = req.getParameter("lastNameUser");
        String mailUser = req.getParameter("mailUser");
        String sexUser = req.getParameter("sexUser");
        String objUser = req.getParameter("objUser");

        String dateBornUserString = req.getParameter("dateBornUser");
        System.out.println("date:" + dateBornUserString);

        String passwordUser = req.getParameter("val-password");
        String statementUser =req.getParameter("statut");
        String adressUser = req.getParameter("adressUser");
        String telUser = req.getParameter("telUser");
        String infoUser = req.getParameter("infoUser");

        new db.dbAdmin().insertUser(nameUser, lastNameUser, mailUser, sexUser, dateBornUserString, passwordUser,
                statementUser, adressUser, telUser, infoUser);
        String idU = new db.dbAdmin().recupIdUtilisateur(mailUser);
        String idP = new db.dbAdmin().recupProfilUtilisateur(objUser);
        new db.dbAdmin().insertProfilToUser(idP, idU);
        
        String user=req.getParameter("user");
        if(user.equals("client")){
            String id=new db.dbAdmin().recupIdUtilisateur(mailUser);
            HttpSession session=req.getSession();
            session.setAttribute("id", id);
            resp.sendRedirect("content/indexClient.jsp");
        }else{
             resp.sendRedirect("content/indexCoach.jsp");
        }
       
    }
}

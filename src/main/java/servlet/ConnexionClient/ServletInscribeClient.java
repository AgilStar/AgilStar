/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.Admin;

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

/**
 *
 * @author tianyuanliu,Nicolas
 */
@WebServlet(
        name = "ServletInsertUserFromAdmin",
        urlPatterns = {"/ServletInsertUserFromAdmin"}
)
public class ServletInscribeClient extends HttpServlet {

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
        
        String dateBornUser = dateBornUserString.substring(6, 10)+"-"
                +dateBornUserString.substring(3, 5)+"-"+
                dateBornUserString.substring(0, 2); 

        String passwordUser = req.getParameter("val-password");       
        String statementUser = "en attente";
        String adressUser = req.getParameter("adressUser");
        String telUser = req.getParameter("telUser");
        String infoUser = req.getParameter("infoUser");

        try {
            new db.dbAdmin().insertUser(nameUser,lastNameUser,mailUser,sexUser,dateBornUser,passwordUser,
                    statementUser,adressUser,telUser,infoUser);
            String idU = new db.dbAdmin().recupIdUtilisateur(mailUser);
            String idP = new db.dbAdmin().recupProfilUtilisateur(objUser);
            new db.dbAdmin().insertProfilToUser(idP, idU);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletInsertUserFromAdmin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletInsertUserFromAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        resp.sendRedirect("content/indexClient.jsp");
    }
}

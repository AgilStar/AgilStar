/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import db.ConnInsc;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author auden
 */
@WebServlet(
        name = "MyServlet", 
        urlPatterns = {"/ConnexionServlet"}
    )
public class ConnexionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        ServletOutputStream out = resp.getOutputStream();
         String email=req.getParameter("Email");
         String mdp=req.getParameter("pwd");
         ConnInsc conn=new ConnInsc();
        //out.print(email+" "+mdp);
         String url="";
         url=conn.verifyConnexion(email,mdp);
         RequestDispatcher rd = req.getRequestDispatcher("../page-perso.jsp");
         rd.forward(req,resp);
    }
    
}


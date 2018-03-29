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

/**
 *
 * @author auden
 */
@WebServlet(
        name = "MyServlet",
        urlPatterns = {"/ServletConnexion"}
)
public class ServletConnexion extends HttpServlet {

    @Override
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
      
    }}


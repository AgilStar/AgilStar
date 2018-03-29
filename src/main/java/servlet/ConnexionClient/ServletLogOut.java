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
 * @author auden
 */
@WebServlet(
        name = "MyServletLogOut",
        urlPatterns = {"/ServletLogOut"}
)
public class ServletLogOut extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        HttpSession session=req.getSession(false);
        if(session!=null){
            if(session.getAttribute("id")!=null){
                session.removeAttribute("id");
            }
            session.invalidate();
        }
        
        resp.sendRedirect("content/page-login.html");
       
   
    }
}


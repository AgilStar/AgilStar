package servlet.GestionClient;

import db.dbClient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(
        name = "ServletMProfil",
        urlPatterns = {"/ServletMProfil"}
)
public class ServletMProfil  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String type = req.getParameter("type");
        HttpSession session=req.getSession();
        String idP=req.getParameter("id");
        String idU= (String)session.getAttribute("id");

        if(type.equals("add")){
            new db.dbClient().CreateDetenir(idU,idP);
        }else{
            new db.dbClient().deleteDetenir(idU,idP);
        }



    }

}

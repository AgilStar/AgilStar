package servlet.TypeSession;


import db.dbPersoSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(
        name = "/ServletOpenSession",
        urlPatterns = {"/ServletOpenSession"}
)
public class ServletOpenSession extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        PrintWriter out = resp.getWriter();
        String codesp=req.getParameter("codesp");
        String type=req.getParameter("type");

        dbPersoSession db=new dbPersoSession();
        db.open(codesp,type);


        try {
            db.getCx().close();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }


}

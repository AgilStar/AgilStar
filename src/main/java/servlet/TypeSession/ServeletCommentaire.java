package servlet.TypeSession;

import db.dbPersoSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(
        name = "/ServeletCommentaire",
        urlPatterns = {"/ServeletCommentaire"}
)
public class ServeletCommentaire extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

String codesp=req.getParameter("codesp");
String type=req.getParameter("type");
String content=req.getParameter("content");
 dbPersoSession db=new dbPersoSession();
db.ecrireCommentaire(content,codesp,type);
        try {
            db.getCx().close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    }

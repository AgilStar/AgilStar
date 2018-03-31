package servlet.Program;

import db.dbClient;
import db.dbProgram;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(
        name = "ServletAddProgram",
        urlPatterns = {"/ServletAddProgram"}
)
public class ServletAddProgram extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String name=req.getParameter("name");
        String des=req.getParameter("desc");
        String[] checkedProfil=req.getParameter("checkedProfil").split(",");
        String[] listS=req.getParameter("listS").split(",");


        new dbProgram().insertProgram(name,des);


    }
}

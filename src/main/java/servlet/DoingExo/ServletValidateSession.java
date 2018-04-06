/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.DoingExo;

import db.dbClient;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Exercice;

/**
 *
 * @author Jin
 */
@WebServlet(
        name = "MyServletValidateSession",
        urlPatterns = {"/ServletValidateSession"}
)
public class ServletValidateSession extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        int codeS = (Integer) session.getAttribute("codeS");
        String type = (String) session.getAttribute("type");
        String[] listBilan = (String[]) session.getAttribute("listBilan");
        ArrayList<Exercice> listE = (ArrayList<Exercice>) session.getAttribute("listE");
       

        System.out.println(type);
        if (type.equals("seance")) {
            String list = req.getParameter("list");
            String[] listResult = list.split(",");
            for (int i = 0; i < listResult.length; i++) {
                new db.dbClient().validateSession(codeS, listE.get(i).getCodee(), Integer.parseInt(listResult[i]));
            }
        } else {
            
            String fcrepos = req.getParameter("fcrepos");
            String fcflexion = req.getParameter("fcflexion");
            String fcallonge = req.getParameter("fcallonge");
            //System.out.println(fcrepos+"--"+fcflexion+"--"+fcallonge);
            for (int i = 0; i < listBilan.length; i++) {
               
                new db.dbClient().validerBilanExo(codeS, listE.get(i).getCodee(), listBilan[i]);
            }
            new db.dbClient().validerBilan(codeS, fcrepos, fcflexion, fcallonge);
           
        }

        session.removeAttribute(type);
        session.removeAttribute("codeS");
        session.removeAttribute("listE");
        

    }
}

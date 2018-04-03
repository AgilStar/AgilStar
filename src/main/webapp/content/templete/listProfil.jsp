<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="model.Profil" %>
<%@ page import="servlet.Program.ctrlProgram" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.dbProfil" %>
<%
    String codep=request.getParameter("codeP");
    String type=request.getParameter("type");
    ArrayList<Profil> listProfilPrograme=new dbProfil().findProfilProgramm(codep);

%>


<div class="table-responsive">
    <table class="table" id="tableProfil">
        <thead>
        <tr>
            <th>Code de profil</th>
            <th>Profil</th>
        </tr>
        </thead>
        <tbody>
        <%
            ArrayList<Profil> listProfil=new ctrlProgram().getProfil();
            for(Profil p:listProfil){
                if (listProfilPrograme.contains(p)){
                    if(type.equals("voirType")){
                        out.print("<tr style=\"background-color:#d1ecf1\">");
                    }else{
                        out.print("<tr onclick=\"changeDelete(this)\" style=\"background-color:#d1ecf1\">");
                    }
                    out.print("<th scope=\"row\">");
                    out.print("<input type=\"checkbox\" name=\"profil\" value=\""+p.getCodeprofil()+"\" hidden checked>");
                }else{
                    if(type.equals("voirType")){
                        out.print("<tr style=\"background-color:#fedee5\" hidden>");
                    }else{
                        out.print("<tr onclick=\"changeDelete(this)\" style=\"background-color:#fedee5\">");
                    }
                    out.print("<th scope=\"row\">");
                    out.print("<input type=\"checkbox\" name=\"profil\" value=\""+p.getCodeprofil()+"\" hidden>");
                }

                out.print(p.getCodeprofil());
                out.print("</th>");
                out.print("<td style=\"color:black\" >"+p.getLibelleprofil()+"</td>");
                out.print("</tr>");
            }
        %>

        </tbody>
    </table>
</div>

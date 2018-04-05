<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="model.Seancetype" %>
<%@ page import="db.dbProgram" %>
<%@ page import="model.Categorieseance" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Exercice" %>
<%@ page import="db.dbExercice" %>
<div class="col-lg-12">
    <div class="card">
        <div class="card-title">
            <h4>Modification d'une Séance Type</h4>

        </div>
        <div class="card-body">
            <div class="basic-form">

                <%
                    String codes = request.getParameter("codes");
                    Seancetype st = new dbProgram().getOneSeanceType(codes);

                %>

                <div class="form-group">
                    <label>Nom de la séance type</label>
                    <input type="string" class="form-control" id="libelleSt"
                           value="<%=st.getLibellest()%>">
                </div>
                <div class="form-group">
                    <label>Description de la séance type</label>
                    <input type="string" class="form-control" id="descrSt"
                           value="<%=st.getDescriptionst()%>">
                </div>
                <div class="form-group">
                    <label>Catégorie</label>
                    <select id="codeCateg" name="codeCat">
                        <%
                            ArrayList<Categorieseance> listCat = new dbProgram().getCategories();
                            for (Categorieseance cat : listCat) {
                                if (cat.getCodecat() == st.getCodecat()) {
                                    out.print("<option value=\"" + cat.getCodecat() + "\"selected>" + cat.getLibellecat() + "</option>");
                                } else {
                                    out.print("<option value=\"" + cat.getCodecat() + "\">" + cat.getLibellecat() + "</option>");
                                }
                            }

                        %>
                    </select>
                </div>
                <div class="form-group">
                    <label>Echauffement de la séance type</label>
                    <input type="string" class="form-control" id="descrWarmUp"
                           value="<%=st.getEchauffementst()%>">
                </div>
                <h4><b><u>Exercices</u></b></h4>
                </br>
                <%
                    ArrayList<String[]> descriptSt = new dbProgram().getDescriptionSeance(codes);
                    Integer cpt = 0;
                    out.print("<tbody><table id=\"example24\" class=\"display nowrap table table-hover table-striped table-bordered\" cellspacing=\"0\" width=\"100%\">");
                    out.print("<thead><tr><th>Nom Exercice</th><th>Séries à faire</th><th>Durée attendue</th><th>Quantité Attendue</th><th>Repos</th><th></th></tr></thead>");
                    out.print("<tbody>");
                    for (String[] desc : descriptSt) {
                        cpt++;
                        Exercice e = new dbProgram().getOneExercice(desc[0]);
                        out.print("<tr><td><a href=\"modifierExo.jsp?codee=" + e.getCodee() + "\">" + e.getLibellee() + "</a>"+"<input type=\"text\" id=\"nameExercice" + cpt + "\" value=\"" + e.getLibellee() + "\" hidden>"+"</td>");
                        out.print("<td><input type=\"number\" "
                                + "class=\"form-control\" id=\"nbserieExercice" + cpt + "\" value=\"" + desc[1] + "\"></td>");
                        out.print(" <td>  <input type=\"number\" "
                                + "class=\"form-control\"  onKeyUp=\"checkInputExercice(this)\"   id=\"dureeExercice" + cpt + "\" value=\"" + desc[2] + "\"></td>");
                        out.print("<td><input type=\"number\" "
                                + "class=\"form-control\"  onKeyUp=\"checkInputExercice(this)\"  id=\"nbExercice" + cpt + "\" value=\"" + desc[3] + "\"></td>");
                        out.print("<td><input type=\"number\" "
                                + "class=\"form-control\" id=\"restExercice" + cpt + "\" value=\"" + desc[4] + "\"></td>");
                        out.print("<td><button onClick=\"deleteLine(" + cpt + ")\" value=\"-\">" + cpt + "</button></td></tr>");
                    }
                    out.print("</tbody></table></br>");
                    out.print("</br>");
                %>
                <input type="hidden" class="form-control" id="codeS" name="codeS" value="<%=codes%>">
            </div>
        </div>
        <h4><b><u>Ajouter des exercices</u></b></h4>
        </br>
        <table id="example23" class="display nowrap table table-hover table-striped table-bordered"
               cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>Exercice</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <%
                        ArrayList<Exercice> listEx = new dbExercice().getExercices();
                        out.print("<select id=\"exercices\" name=\"exercices\">");
                        for (Exercice e : listEx) {
                            out.print("<option libelle='"+e.getLibellee()+"' value='" + e.getCodee() + "' >" + e.getLibellee() + "</option>");
                        }
                        out.print("</select>");
                    %>
                </td>
                <td>
                    <button onClick="addLineT()" value="+">+</button>
                </td>
            </tbody>
        </table>
        </br>
        <div id="errorMessage"></div>
        <button type="button" onclick="modifySession()">Sauvegarder Modification</button>
        </br>
        <a href="listSession.jsp"> Retour à la liste des séances</a>
    </div>


</div>

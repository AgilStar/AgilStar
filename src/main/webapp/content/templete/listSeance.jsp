<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="db.dbProgram" %>
<%@ page import="model.Programmetype" %>
<%@ page import="model.Seancebilantype" %>
<%@ page import="model.Seancetype" %>
<%@ page import="servlet.Program.ctrlProgram" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.HashMap" %>
<%
    String codep = request.getParameter("codeP");
    String type=request.getParameter("type"); //create ou modify

    boolean programflag = true;
    HashMap<Integer, Seancebilantype> listBilan = null;
    HashMap<Integer, Seancetype> listSeance = null;
    HashMap<Integer, Integer> listNbSeanceType = null;
    int nbMax = 0;
    if (Integer.parseInt(codep) == -1) {
        programflag = false;
    }
    if (programflag) {

        dbProgram db=new dbProgram();
        Programmetype programmetype = db.getSceanceTypeProgramm(codep);
        nbMax = Collections.max(programmetype.getListSeanceBilanType().keySet());

        db.getCx().close();

        listBilan = programmetype.getListSeanceBilanType();
        listSeance = programmetype.getListSeanceType();

        listNbSeanceType = new HashMap<Integer, Integer>();
        for (Seancetype s : listSeance.values()) {
            if (listNbSeanceType.get(s.getCodest()) == null) {
                listNbSeanceType.put(s.getCodest(), 1);
            } else {
                listNbSeanceType.put(s.getCodest(), listNbSeanceType.get(s.getCodest()) + 1);
            }
        }

    }

%>

<div class="table-responsive m-t-40" id="listSeance" <% if(type!=null&&(type.equals("modifyType"))||type.equals("modifyPerso")||type.equals("voirType")||type.equals("voirPerso")){{out.print("hidden");}}%>>
    <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0"
           width="100%">
        <thead>
        <tr>
        <tr>
            <th>Séance</th>
            <th>Opération</th>
            <th>Catégorie</th>
            <th>Description</th>
        </tr>
        </tr>
        </thead>
        <tbody id="listSessionTotal">
        <%
            ArrayList<Seancetype> listUu = new ctrlProgram().getAllSeanceType();
            for (Seancetype u : listUu) {
                                                        /*
                                                        Pour valider ou passer en attente
                                                         */

                if (programflag && listNbSeanceType.containsKey(u.getCodest())) {
                    out.print("<tr style=\"background-color:rgb(209, 236, 241)\" nameSession='" + u.getLibellest() + " (" + u.getDescriptionst() + ")' idSession='" + u.getCodest() + "' nbSession=" + listNbSeanceType.get(u.getCodest()) + ">");
                } else {
                    out.print("<tr style=\"background-color:#fedee5\" nameSession='" + u.getLibellest() + " (" + u.getDescriptionst() + ")' idSession='" + u.getCodest() + "' nbSession=0>");
                }

                out.print("<th scope=\"row\">");
                out.print(u.getLibellest());
                out.print("</th>");
                out.print("<td>");
                if (programflag && listNbSeanceType.containsKey(u.getCodest())) {
                    out.print("<button id='btnAddChoixSession' class='btn btn-success btn-outline' onclick=\"addChoixSession(this)\" >+" + listNbSeanceType.get(u.getCodest()) + "</button>");
                } else {
                    out.print("<button id='btnAddChoixSession' class='btn btn-success btn-outline' onclick=\"addChoixSession(this)\" >+</button>");
                }

                out.print("  <button id='btnDeleteChoixSession' class='btn btn-warning btn-outline' onclick=\"deleteChoixSession(this)\" >-</button>");
                out.print("</td>");
                out.print("<td>" + u.getCategorieCat() + "</td>");
                out.print("<td>" + u.getDescriptionst() + "</td>");
                out.print("</tr>");
            }
        %>
        </tbody>
    </table>

</div>

<div class="row" style="margin-top: 10px;margin-bottom: 30px;margin-left: 5px" <%=type.equals("voirType")||type.equals("voirPerso")?"hidden":""%>>
    <button class="btn btn-success" onclick="addBilan()">+</button>
    <h3 class="center">Bilan</h3>
    <button class="btn btn-warning" onclick="deleteBilan()">-</button>
</div>


<div class="nestable">
    <div class="dd" id="nestable">
        <ol class="dd-list" id="listSession">
            <%
                if (programflag) {
                    for (int i = 1; i <= nbMax; i++) {

                        if (listSeance.get(i) != null) {
                            Seancetype s = listSeance.get(i);
                            out.print(" <li class=\"dd-item dd-item\" idsession=\"" + s.getCodest() + "\">");
                        } else {
                            Seancebilantype st = listBilan.get(i);
                            out.print(" <li class=\"dd-item dd-item\" idsession='-1'>");
                        }
                        if (i == 1 || i == (nbMax)||type.equals("voirType")||type.equals("voirPerso")) {
                            out.print("  <div class=\"dd3-handle\" style=\"background-color:#d6d8d9\"></div>");
                        } else {
                            out.print("<div class=\"dd-handle dd3-handle\" style=\"background-color:#ffeacd\"></div>");
                        }
                        if (listSeance.get(i) != null) {
                            Seancetype s = listSeance.get(i);
                            out.print(" <div class=\"dd3-content\">" + s.getLibellest() + "(" + s.getDescriptionst() + ")");
                            if(!type.equals("voirType")&&!type.equals("voirPerso")){
                                out.print("<button class=\"btn-danger\" style=\"float: right\" onclick=\"deleteSeance(this)\">X</button>" + "</div></li>");
                            }else{
                                out.print("</div></li>");
                            }
                        } else if (i == 1 || i == (nbMax)) {
                            Seancebilantype st = listBilan.get(i);
                            out.print(" <div class=\"dd3-content\" style=\"background-color:#d1ecf1\"> Bilan" + "</div></li>");
                        } else {
                            out.print(" <div class=\"dd3-content\" style=\"background-color:#d1ecf1\"> Bilan");
                            if(!type.equals("voirType")&&!type.equals("voirPerso")){
                                out.print("<button class=\"btn-danger\" style=\"float: right\" onclick=\"deleteSeance(this)\">X</button>" + "</div></li>");
                            }else{
                                out.print("</div></li>");
                            }

                        }
                    }

                }

            %>
        </ol>
    </div>
</div>

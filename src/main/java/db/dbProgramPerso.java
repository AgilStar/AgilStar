/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Exercice;
import model.Programmeperso;
import model.Programmetype;
import model.Seanceperso;

/**
 *
 * @author Jin
 */
public class dbProgramPerso {

    Connection cx;//La connection utilisé par toutes les méthodes dans cette classe

    public dbProgramPerso() {
        cx = new dbAdmin().getConnection();
    }

    /**
     *
     * @param codeu
     * @return liste programme perso
     * @author Jin
     */
    public ArrayList<Programmeperso> getAllProgramsForUser(int codeu) {
        cx = new dbAdmin().getConnection();
        ArrayList<Programmeperso> listPP = new ArrayList();
        try {
            String sql = "select *  from PROGRAMMEPERSO WHERE CODEU=" + codeu;
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                Integer idProgramm = rs.getInt("CODEPP");
                Integer codeU = rs.getInt("CODEU");
                Integer codePT = rs.getInt("CODEPT");
                String libellePP = rs.getString("LIBELLEPP");
                String descriptionPP = rs.getString("DESCRIPTIONPP");
                //ajouter les autres attributs
                listPP.add(new Programmeperso(idProgramm, codeu, codePT, libellePP, descriptionPP));
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }

        return listPP;
    }

    /**
     * retourner le nombre de seance perso et le seance bilan pour un programme
     * perso
     *
     * @param codePP
     * @return nombre de seance pour un programme
     * @author Jin
     */
    public int getNbSessionForProgram(int codePP) {
        int nb = 0;
        cx = new dbAdmin().getConnection();
        try {
            String sql = "select (count(sp.codesp)+ count(sb.codesb)) as nb from seanceperso sp,seancebilan sb where sp.codepp=sb.codepp and sp.codepp=" + codePP;
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                nb = rs.getInt("nb");
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
        return nb;
    }

    /**
     *
     * @param codePP
     * @return une liste des informations concernant les seances d'un programme
     * @author Jin
     */
    public ArrayList<String[]> getAllSeances(int codePP) {
        ArrayList<String[]> listS = new ArrayList();
        cx = new dbAdmin().getConnection();
        try {
            String sql = "select sp.codesp as codeseance,sp.libellesp as libelleseance,sp.descriptionsp as descseance,sp.commentairecoach as commentaire,sp.ouvert as ouvert, sp.validersp as valider ,sp.ordresp as ordre,\"seance\" as type\n"
                    + "from seanceperso sp\n"
                    + "where sp.codepp=" + codePP + "\n"
                    + "UNION\n"
                    + "SELECT sb.codesb as codeseance,sb.libellesb as libelleseance,\"seance bilan\" as descseance,sb.commentairecoach as commentaire,sb.ouvert as ouvert,sb.validersb as valider,sb.ordresb as ordre,\"bilan\" as type\n"
                    + "from seancebilan sb\n"
                    + "where sb.codepp=" + codePP + " order by ordre asc";

            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                String[] ligne = new String[8];
                ligne[0] = String.valueOf(rs.getInt("ordre"));

                ligne[1] = String.valueOf(rs.getInt("codeseance"));

                ligne[2] = rs.getString("libelleseance");

                ligne[3] = rs.getString("descseance");

                ligne[4] = rs.getString("commentaire");

                ligne[5] = rs.getString("ouvert");

                ligne[6] = rs.getString("valider");

                ligne[7] = rs.getString("type");

                listS.add(ligne);

            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }

        return listS;
    }

    /**
     *
     * @param codeS
     * @param type
     * @return liste des exercices d'une seance
     * @author Jin
     */
    public ArrayList<Exercice> getAllExercices(int codeS, String type) {
        ArrayList<Exercice> listE = new ArrayList();
        cx = new dbAdmin().getConnection();
        String sql = "";
        try {
            if (type.equals("seance")) {
                sql = "select * from EXERCICE E, PLANIFIERSP P where E.CODEE=P.CODEE and P.CODESP=" + codeS+" order by P.ORDREP";
            } else {
                sql = "select * from EXERCICE E, PLANIFIERBILAN P where E.CODEE=P.CODEE and P.CODESB=" + codeS+" order by P.ORDREB";
            }

            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int codee = rs.getInt("CODEE");
                String libellee = rs.getString("LIBELLEE");
                String desc = rs.getString("DESCRE");
                int duree = rs.getInt("DUREEATTENTUE");
                String lien = rs.getString("LIENVIDEO");
                int nb = rs.getInt("NBATTENTU");
                String obj = rs.getString("OBJECTIFE");
                int serie = rs.getInt("SERIE");
                int temps = rs.getInt("TEMPSREPOSE");
             
                listE.add(new Exercice(codee, libellee, obj, lien,desc, duree, nb, serie, temps));

            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }

        return listE;
    }

    public ArrayList<String> getOrderResultForExo(int codeS, int codeE, String type) {
        ArrayList<String> list = new ArrayList();
        String order = "";
        String result = "";
        cx = new dbAdmin().getConnection();
        if (type.equals("bilan")) {
            try {
                String sql = "select p.ORDREB,p.NBMAXU,p.TEMPSMAXU from planifierbilan p where p.CODESB=" + codeS + " and p.CODEE=" + codeE;
                Statement st = cx.createStatement();
                ResultSet rs = st.executeQuery(sql);

                while (rs.next()) {
                    order = rs.getString("ORDREB");
                    if (rs.getString("NBMAXU") != null) {
                        result = rs.getString("NBMAXU");
                    } else {
                        result = rs.getString("TEMPSMAXU");
                    }
                    list.add(order);
                    list.add(result);
                }
                st.close();
                cx.close();

            } catch (SQLException ex) {
                System.out.println("Il y a un problème sur statement getOrderResultForExo bilan " + ex.getMessage());
            }
        } else {
            try {
                String sql = "select p.ordrep,p.resultatu from planifiersp p where p.CODESP=" + codeS + " and p.CODEE=" + codeE;
                Statement st = cx.createStatement();
                ResultSet rs = st.executeQuery(sql);
                
                while (rs.next()) {
                    
                    order = rs.getString("ordrep");
                    result=rs.getString("resultatu");
                    list.add(order);
                    list.add(result);
                  
                }
                st.close();
                cx.close();

            } catch (SQLException ex) {
                System.out.println("Il y a un problème sur statement getOrderResultForExo seance" + ex.getMessage());
            }
        }

        return list;
    }

}

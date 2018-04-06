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
import model.Seancebilan;

/**
 *
 * @author 21201321
 */
public class dbBilan {

    Connection cx;//La connection utilisé par toutes les méthodes dans cette classe

    /**
     * Obtenir la liste de bilan par code de program personalisé
     * @param codepp code de programùe personalisé
     * @return la liste de bilan
     */
    public ArrayList<Seancebilan> getBilans(String codepp) {
        cx = new dbAdmin().getConnection();
        ArrayList<Seancebilan> bilans = new ArrayList();
        try {
            String sql = "select *  from SEANCEBILAN WHERE CODEPP=" + codepp + " ORDER BY ordreSB ASC";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("CODESB");
                String nom = rs.getString("LIBELLESB");
                String semaine = rs.getString("NUMSEMAINE");
                String com = rs.getString("COMMENTAIRECOACH");
                String lu = rs.getString("ETATLUCOACH");
                String ouvert = rs.getString("OUVERT");
                String validerSb = rs.getString("VALIDERSB");
                String fcRepos = rs.getString("FCREPOS");
                String fcMax = rs.getString("FCMAX");
                String fcFlexion = rs.getString("FCRECUPERATION");
                String fcRecup = rs.getString("FCRECUPERATION");
                String dateM = rs.getString("DATEM");

                //ajouter les autres attributs 
                bilans.add(new Seancebilan(id, nom, semaine, com, lu, ouvert, validerSb, fcRepos, fcMax, fcFlexion, fcRecup, dateM));
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement getBilans " + ex.getMessage());
        }
        return bilans;
    }

    /**
     * Obtenir bilan inital
     * @param idU
     * @return
     */bilan inital
    public String getBilanInit(String idU) {
        String id = "";
        try {
            String sql = "select *  from SEANCEBILAN WHERE CODEU='" + idU + "' AND ordreSB=0";
            cx = new dbAdmin().getConnection();
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                id = rs.getString("CODESB");
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement getBilanInit " + ex.getMessage());
        }
        return id;
    }

    public ArrayList<String> getDescriptionBilan(String codeb) {
        ArrayList<String> descriptionB = new ArrayList();
        try {

            String sql = "select *  from PLANIFIERBILAN WHERE CODESB='" + codeb + "' ORDER BY ORDREB ASC";
            cx = new dbAdmin().getConnection();
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                //ajouter les autres attributs
                descriptionB.add(rs.getString("CODEE"));
            }
            st.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement de getDescriptionSeance " + ex.getMessage());
            ex.printStackTrace();
        }
        return descriptionB;
    }

    public void modifyBilan(String codesb, String nameBilan, String com) {
        cx = new dbAdmin().getConnection();
        try {

            String sql = "update SEANCEBILAN set LIBELLESB='" + nameBilan + "',COMMENTAIRECOACH='" + com + "', DATEM=STR_TO_DATE('1-01-2069', '%d-%m-%Y') where codesb=" + codesb;
            Statement st = cx.createStatement();
            System.out.println(sql);
            st.executeUpdate(sql);
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement modifyBilan" + ex.getMessage());
        }
    }

    public void deletePlanifierBilan(String codesb) {
        try {
            cx = new dbAdmin().getConnection();
            String sql;
            sql = "DELETE FROM PLANIFIERBILAN WHERE CODESB='" + codesb + "'";
            Statement st = cx.createStatement();
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement de deletePlanifierBilan" + ex.getMessage());
        }
    }

    public void createPlanifierBilan(String codeSb, String codeE, Integer ordre) {
        try {
            cx = new dbAdmin().getConnection();
            String sql = "insert into PLANIFIERBILAN(CODESB,CODEE,ORDREB,DATER,NBMAXU) VALUES('" + codeSb + "','" + codeE + "','" + ordre + "',STR_TO_DATE('1-01-2069', '%d-%m-%Y'),'0')";
            Statement st = cx.createStatement();
            System.out.println(sql);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement de createPlanifierBilan" + ex.getMessage());
        }
    }

    public String getExercice(String nameExercice) {
        cx = new dbAdmin().getConnection();
        String id = "";
        try {

            String sql = "select *  from EXERCICE where LIBELLEE='" + nameExercice + "'";
            System.out.println(sql);
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {;
                id = rs.getString("CODEE");
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement getExercice" + ex.getMessage());
        }
        return id;
    }

    public void createBilanInit(String codeId) {
        try {
            cx = new dbAdmin().getConnection();
            String sql = "insert into SEANCEBILAN(LIBELLESB,CODEU,DATEM,ordreSB,FcMAX,FCFLEXION,FCRECUPERATION,FCREPOS) VALUES('Evaluation','" + codeId + "',STR_TO_DATE('1-01-2069', '%d-%m-%Y'),0,0,0,0,0)";
            Statement st = cx.createStatement();
            System.out.println(sql);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement de createBilanInit" + ex.getMessage());
        }
    }

    public void updateBilanInit(String codeSb, String fcrepos, String fcmax, String fcflex, String frec) {
        cx = new dbAdmin().getConnection();
        try {

            String sql = "update SEANCEBILAN set FCREPOS='" + fcrepos + "',FCMAX='" + fcmax + "', FCFLEXION='" + fcflex + "',FCRECUPERATION='" + frec + "' where codesb=" + codeSb;
            Statement st = cx.createStatement();
            System.out.println(sql);
            st.executeUpdate(sql);
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement updateBilanInit" + ex.getMessage());
        }
    }

    public String[] recupDataBilan(String codeSb) {
        cx = new dbAdmin().getConnection();
        String[] fcs = new String[4];
        try {

            String sql = "select *  from SEANCEBILAN where CODESB='" + codeSb + "'";
            System.out.println(sql);
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {;
                fcs[0] = rs.getString("FCREPOS");
                fcs[1] = rs.getString("FCMAX");
                fcs[2] = rs.getString("FCFLEXION");
                fcs[3] = rs.getString("FCRECUPERATION");
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement recupDataBilan" + ex.getMessage());
        }
        return fcs;
    }

    public void insertPoidsInit(String codeU, String poids) {
        try {
            cx = new dbAdmin().getConnection();
            String sql = "insert into MENSURATION(CODEU,POIDS,DATEM) VALUES('" + codeU + "','" + poids + "',sysdate())";
            System.out.println(sql);
            Statement st = cx.createStatement();
            System.out.println(sql);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement de insertPoidsInit" + ex.getMessage());
        }
    }

    public String getPoidsInit(String codeU) {
        cx = new dbAdmin().getConnection();
        String poids = new String();
        try {
            String sql = "select POIDS,MIN(DATEM)  from MENSURATION where CODEU='" + codeU + "'";
            System.out.println(sql);
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {;
                poids = rs.getString("POIDS");
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement getPoidsInit" + ex.getMessage());
        }
        return poids;
    }

    public void modifyPoidsInit(String id, String poids) {
        cx = new dbAdmin().getConnection();
        
        try {
            /*
            String date = "";
            String sql="SELECT MIN(DATEM) as dateM FROM MENSURATION WHERE CODEU='"+id+"'";
            System.out.println(sql);
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {;
                date = rs.getString("dateM");
            }
            st.close();
        */
            String sql = "update MENSURATION set POIDS='" + poids + "' where CODEU=" + id;
            System.out.println(sql);
            Statement st = cx.createStatement();
            st.executeUpdate(sql);
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement modifyBilan" + ex.getMessage());
        }
    }

    public static void main(String[] args) {
        dbBilan db = new dbBilan();
        System.out.println(db.getExercice("Mont�e de genoux"));
    }
}

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

    public ArrayList<String> getDescriptionBilan(String codeb) {
        ArrayList<String> descriptionB = new ArrayList();
        try {

            String sql = "select *  from PLANIFIERBILAN WHERE CODESB='" + codeb + "'ORDER BY ORDREB ASC";
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
            String sql = "insert into PLANIFIERBILAN(CODESB,CODEE,ORDREB,DATER) VALUES('" + codeSb + "','" + codeE + "','" + ordre + "',STR_TO_DATE('1-01-2069', '%d-%m-%Y'))";
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
        String id ="";
        try {

            String sql = "select *  from EXERCICE where LIBELLEE='" + nameExercice+"'";
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
    
public static void main(String[] args){
    dbBilan db = new dbBilan();
    System.out.println(db.getExercice("Mont�e de genoux"));
}
}

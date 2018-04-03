/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Exercice;
import model.Seancetype;

/**
 *
 * @author tianyuanliu,Nicolas
 */
public class dbTypeSession {

    Connection cx;//La connection utilisé par toutes les méthodes dans cette classe

    /**
     * Constucteur
     */
    /**
     * Ajouter un nouvel exercice
     *
     * @param name nom d'un exercice
     * @param objective objectif d'un exercice
     * @param lien lien de vidéo d'un exercice
     * @author Tianyuan,Nicolas
     */
    public boolean insertTypeSession(String name, int codeCat, String descrS, String descrWU) {
        try {
            cx = new dbAdmin().getConnection();
            if (!checkExistSession(name)) {
                return false;
            }
            
            String sql = "insert into SEANCETYPE(LIBELLEST,CODECAT,DESCRIPTIONST,ECHAUFFEMENTST) VALUES('" + name + "','" + codeCat + "','" + descrS + "','" + descrWU + "')";
            Statement st = cx.createStatement();
            st.executeUpdate(sql);
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
        return true;

    }

    public boolean checkExistSession(String name) {
        try {
            cx = new dbAdmin().getConnection();
            String sql = "select count(*) as Nb from SEANCETYPE where CODEST='" + name + "'";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            int nb = 0;
            while (rs.next()) {
                nb = rs.getInt("Nb");
            }
            st.close();
            if (nb == 1) {
                return false;
            } else {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement checkExistSession" + ex.getMessage());
        }
        return true;
    }

    public Integer getCodeExercice(String nameEx) {
        cx = new dbAdmin().getConnection();
        Integer idE = 0;
        try {

            String sql = "select *  from EXERCICE where LIBELLEE='" + nameEx + "'";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                idE = rs.getInt("CODEE");

            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement getOneExercice" + ex.getMessage());
        }
        return idE;
    }

    public Integer codeSeance(String nameSeance) {
        cx = new dbAdmin().getConnection();
        Integer idS = 0;
        try {

            String sql = "select *  from SEANCETYPE where LIBELLEST='" + nameSeance + "'";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                idS = rs.getInt("CODEST");;
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement getOneExercice" + ex.getMessage());
        }
        return idS;
    }

    public void createOrganiserType(String codeE, String codeSt, Integer ordreSt,
            String serieSt, String dureeAttendue, String nbAttendu,String repos) {
        try {
            cx = new dbAdmin().getConnection();
            String sql;
            if(nbAttendu.equals("")){
            sql = "insert into ORGANISERTYPE VALUES(" + codeE + "," + codeSt + "," + ordreSt + ",'" + serieSt + "','" + dureeAttendue + "',NULL,'"+repos+"')";
            }else{
            sql = "insert into ORGANISERTYPE VALUES(" + codeE + "," + codeSt + "," + ordreSt + ",'" + serieSt + "',NULL,'"+nbAttendu+"','"+repos+"')";  
            }
            System.out.println(sql);
            Statement st = cx.createStatement();
            st.executeUpdate(sql);
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement de createOrganiserType" + ex.getMessage());
        }
    }
    
    public void deleteOrganiserType(String codeSt){
         try {
            cx = new dbAdmin().getConnection();
            String sql;
            sql = "DELETE FROM ORGANISERTYPE WHERE CODEST='"+codeSt+"'";
             System.out.println("delete: "+sql);
            Statement st = cx.createStatement();
            st.executeUpdate(sql);
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement de deleteOrganiserType" + ex.getMessage());
        }
    }

    public static void main(String[] args) {
        dbTypeSession d = new dbTypeSession();

        System.out.println(d.codeSeance("Etirements"));
    }

}

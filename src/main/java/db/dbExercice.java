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
import model.Utilisateur;

/**
 *
 * @author tianyuanliu,Nicolas
 */
public class dbExercice {

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
    public boolean insertExercice(String name, String objective, String lien,String desc) {
        try {
                cx = new dbAdmin().getConnection();
                if (!checkExistExercice(name,cx)) {

                    return false;
                }

                String sql = "insert into EXERCICE(LIBELLEE,OBJECTIFE,LIENVIDEO,DESCRE) VALUES('" + name + "','" + objective + "','" + lien + "','"+desc+"')";
                Statement st = cx.createStatement();
                st.executeUpdate(sql);
                st.close();
                cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur Pour inserExercice statement " + ex.getMessage());

        }
        return true;

    }

    public boolean checkExistExercice(String name,Connection cx) {
        try {

            cx = new dbAdmin().getConnection();
            String sql = "select count(*) as Nb from EXERCICE where LIBELLEE='" +name+"'";

            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            int nb = 0;
            while (rs.next()) {
                nb = rs.getInt("Nb");
            }
            st.close();
            if (nb==1){

                return false;
            } else {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
        return true;
    }

    /**
     *
     * @return liste des exercices
     * @author Aude, Jin
     */
    public ArrayList<Exercice> getExercices() {
        cx = new dbAdmin().getConnection();
        ArrayList<Exercice> exos = new ArrayList();
        Exercice e;
        try {
            String sql = "select *  from EXERCICE ";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("CODEE");
                String nome = rs.getString("LIBELLEE");
                String objectif = rs.getString("OBJECTIFE");
                String lien = rs.getString("LIENVIDEO");
                String desce = rs.getString("DESCRE");

                //ajouter les autres attributs 
                exos.add(new Exercice(id, nome, objectif, lien,desce));
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
        return exos;
    }

    /**
     *
     * @return liste des exercices
     * @author Aude, Jin
     */
    public Exercice getExercice(Integer codee) {
        cx = new dbAdmin().getConnection();
        Exercice exo = new Exercice();
        try {

            String sql = "select *  from EXERCICE where codee=" + codee;
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("CODEE");
                String nome = rs.getString("LIBELLEE");
                String objectif = rs.getString("OBJECTIFE");
                String lien = rs.getString("LIENVIDEO");
                String desce = rs.getString("DESCRE");
                
                exo.setCodee(id);
                exo.setLibellee(nome);
                exo.setObjectife(objectif);
                exo.setLienvideo(lien);
                exo.setDesc(desce);

            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
        return exo;
    }
     public void modifyExercice(int codee,String nom, String obj, String lien,String desc) throws SQLException {
         cx = new dbAdmin().getConnection();
        try {

            String sql = "update EXERCICE set LIBELLEE='"+nom+"',OBJECTIFE='"+obj+"', LIENVIDEO='"+lien+"',DESCRE='"+desc+"' where codee="+codee;
            Statement st = cx.createStatement();
            System.out.println(sql);
            st.executeUpdate(sql);
            st.close();
            cx.close();
            }

         catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }

    }
}

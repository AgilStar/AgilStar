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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Exercice;

/**
 *
 * @author tianyuanliu,Nicolas
 */
public class dbExercice {

    Connection cx;//La connection utilisé par toutes les méthodes dans cette classe

    /**
     * Constucteur
     */
    public dbExercice() {
        try {
            cx = new dbAdmin().getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(dbExercice.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(dbExercice.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Ajouter un nouvel exercice
     *
     * @param name nom d'un exercice
     * @param objective objectif d'un exercice
     * @param lien lien de vidéo d'un exercice
     * @author Tianyuan,Nicolas
     */
    public boolean insertExercice(String name, String objective, String lien) {
        try {
            if(!checkExistExercice(name)){
                return false;
            }
            
            String sql = "insert into EXERCICE(LIBELLEE,OBJECTIFE,LIENVIDEO) VALUES('" + name + "','" + objective + "','" + lien + "')";
            Statement st = cx.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
        return true;

    }

    public boolean checkExistExercice(String name) {
        try {
            String sql = "select count(*) as Nb from EXERCICE where LIBELLEE='" +name+"'";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            int nb = 0;
            while (rs.next()) {
                nb = rs.getInt("Nb");
            }
            System.out.println("ssss"+nb);
            if (nb==1)
                return false;
            else
                return true;
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
        return true;
    }

}

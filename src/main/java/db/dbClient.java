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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author auden
 */
public class dbClient {

    Connection cx;//La connection utilisé par toutes les méthodes dans cette classe

    public dbClient() {
        try {
            cx = new dbAdmin().getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(dbExercice.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(dbExercice.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String verifyConnect(String email, String mdp) {

        String url="";
        try {
           
            Statement st = cx.createStatement();
            String sql = "select MAILU,STATUTU,MDPU from UTILISATEUR where MAILU='" + email+"'";

            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
               
                String mailu = rs.getString("MAILU");
                String mdpu = rs.getString("MDPU");
                String statutu = rs.getString("STATUTU");
                if ((mdpu.equals(mdp))) {
                   if(statutu.equals("admin")||statutu.equals("coach")){
                       url="/content/indexCoach.html";
                   }else{
                        url="/content/indexClient.html";
                   }
                }else{
                     url="/content/page-login.html";
                }
            }

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
        return url;
    }
}

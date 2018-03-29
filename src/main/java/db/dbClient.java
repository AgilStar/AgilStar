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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Utilisateur;

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
/**
 * 
 * @param email
 * @param mdp
 * @return 
 * @author aude,jin
 */
    public String verifyConnect(String email, String mdp) {

        String url = "";
        try {

            Statement st = cx.createStatement();
            String sql = "select MAILU,STATUTU,MDPU from UTILISATEUR where MAILU='" + email + "'";

            ResultSet rs = st.executeQuery(sql);
            if (rs.next() == false) {
                url = "null";
            } else {
                

                    String mailu = rs.getString("MAILU");
                    String mdpu = rs.getString("MDPU");
                    String statutu = rs.getString("STATUTU");
                    if ((mdpu.equals(mdp))) {
                        if (statutu.equals("admin") || statutu.equals("coach")) {
                            url = "/content/indexCoach.jsp";
                        } else {
                            url = "/content/indexClient.jsp";
                        }
                    } else {
                        url = "errorMot";
                    }
                
            }

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
        return url;
    }
    
    /**
     * @author Alice,tianyuan
     */
     public ArrayList<Utilisateur> getClients() {
        ArrayList<Utilisateur> users = new ArrayList();
        Utilisateur e;
        try {
            String sql = "select *  from UTILISATEUR where STATUTU<>'admin'";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while (rs.next()) {
                int id = rs.getInt("CODEU");
                String nomu = rs.getString("NOMU");
                String prenomu = rs.getString("PRENOMU");
                String mailu = rs.getString("MAILU");
                String genreu = rs.getString("GENREU");
                String birthday = rs.getDate("DATENAISSANCE").toString();
                String statuu = rs.getString("STATUTU");
                String adressu = rs.getString("ADRESSEU");
                String telu = rs.getString("TELU");
                String infooptu = rs.getString("INFOOPTU");
                
                //ajouter les autres attributs 
                users.add(new Utilisateur(id,nomu,prenomu,mailu,genreu,birthday,statuu,adressu,telu,infooptu));
            }
            
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
        return users;
    }
}

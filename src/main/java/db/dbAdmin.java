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
import model.Utilisateur;

/**
 *
 * @author tianyuanliu
 */
public class dbAdmin {
    public Connection cx;

    /*données de connexion*/
    private  String url = "jdbc:mysql://localhost:3306/db_21201692";
    private String login = "21201692";
    private String password = "04964N";
    
     /*Constructeurs*/
    public dbAdmin() throws ClassNotFoundException, SQLException {
        /*chargement du pilote pour la base de données*/
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            System.out.println("Erreur chargement driver " + ex.getMessage());
        }
        /*ouverture de la connexion*/
        try {
            cx = DriverManager.getConnection(url, login, password);
        } catch (SQLException ex) {
            System.out.println("Erreur ouverture connexion " + ex.getMessage());
        }

    }
    
    public Connection getConnection(){
        return cx;
    }
    public void getClients() {
        ArrayList<Utilisateur> users = new ArrayList();
        Utilisateur e;
        try {
            String sql = "select *  from UTILISATEUR";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while (rs.next()) {
                String s = rs.getString("NOMU");
                //ajouter les autres attributs 
                
            }
            
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
        
    }
    
    
    
}

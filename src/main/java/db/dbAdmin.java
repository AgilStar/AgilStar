/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author tianyuanliu
 */
public class dbAdmin {
    private Connection cx;

    /*données de connexion*/
    private String url = "jdbc:mysql://etu-web:3306/db_21201692";
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
            this.cx = DriverManager.getConnection(url, login, password);
        } catch (SQLException ex) {
            System.out.println("Erreur ouverture connexion " + ex.getMessage());
        }

    }
    
    /*Programme principal du test*/
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
         dbAdmin unebd = new dbAdmin();


    }
    
    
}

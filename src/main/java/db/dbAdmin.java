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

    Connection cx;
    /*données de connexion*/
    private  String url = "jdbc:mysql://localhost:3306/db_21201692";
    private String login = "21201692";
    private String password = "04964N";

    
    public Connection getConnection(){
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
        return cx;
    }
   
    public void insertUser(String nomu, String prenomu, String mailu, String genreu,         
            String datenaissance, String mdpu, String statutu, String adresseu, String telu, String infooptu) {
       cx=getConnection();
        System.out.println("**************SEX USER   "+genreu+"  //////////");
        try {
            String sql = "insert into UTILISATEUR(NOMU,PRENOMU,MAILU,GENREU,DATENAISSANCE,MDPU,STATUTU,ADRESSEU,TELU,INFOOPTU) "
                    + "VALUES('" + nomu + "','" + prenomu + "','" + mailu + "','" + genreu + "'"
                    + ",'" + datenaissance + "','" + mdpu + "','" + statutu + "','" + adresseu + "','" + telu + "'"
                    + ",'" + infooptu + "')";
            System.out.println(sql);
            Statement st = cx.createStatement();
            st.executeUpdate(sql);
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement insertUser" + ex.getMessage());
        }

    }

    public void insertProfilToUser(String profil, String codeu){
        cx=getConnection();   
        try {
            String sql = "insert into DETENIR(CODEPROFIL,CODEU) VALUES('"+profil+"','"+codeu+"')";
                    ;
            System.out.println("****************************************");
            System.out.println(sql);
            Statement st = cx.createStatement();
            st.executeUpdate(sql);
              st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement insertProfilToUser " + ex.getMessage());
        }
        }

    public String recupIdUtilisateur(String mail){
        cx=getConnection();
        
        String idU="";
        try {
            String sql = "select * from UTILISATEUR where MAILU='"+mail+"'";
            System.out.println(sql);
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
               idU = rs.getString("CODEU");    
            }
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problÃ¨me sur statement recupEmailUtilisateur" + ex.getMessage());
        }
        return idU;
    }
    
      public String recupProfilUtilisateur(String profil){
          cx=getConnection();
        String idP="";
        try {
            String sql = "select *  from PROFIL where LIBELLEPROFIL='"+profil+"'";
            System.out.println(sql);
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
               idP = rs.getString("CODEPROFIL");    
            }
             st.close();
            cx.close();
            
        } catch (SQLException ex) {
            System.out.println("Il y a un problÃ¨me sur statement recupEmailUtilisateur" + ex.getMessage());
        }
        return idP;
    }
    
    
}

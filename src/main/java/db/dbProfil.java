/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Profil;
import model.Utilisateur;

/**
 *
 * @author 21201321
 */
public class dbProfil {
     Connection cx;//La connection utilisé par toutes les méthodes dans cette classe

    /**
     * Constucteur
     */
    
         public ArrayList<Profil> getProfils() {
             cx = new dbAdmin().getConnection();
        ArrayList<Profil> profils = new ArrayList();
        Utilisateur e;
        try {
            String sql = "select *  from PROFIL";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while (rs.next()) {
                //int id = rs.getInt("CODEPROFIL");
                String libelleProfil = rs.getString("LIBELLEPROFIL");
                
                //ajouter les autres attributs 
                profils.add(new Profil(libelleProfil));
            }
            st.close();
            cx.close();


        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
        return profils;
    }
   public ArrayList<String> getProfilUser(int id){
         cx = new dbAdmin().getConnection();
        ArrayList<String> profilsU = new ArrayList();
      
        try {
            String sql = "select *  from PROFIL as p, DETENIR as d where p.CODEPROFIL=d.CODEPROFIL and d.CODEU="+id;
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while (rs.next()) {
                //int id = rs.getInt("CODEPROFIL");
                String libelleProfil = rs.getString("LIBELLEPROFIL");
                
                //ajouter les autres attributs 
                profilsU.add(libelleProfil);
            }
            st.close();
            cx.close();


        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
        return profilsU;
   } 
   
   public int countBilanInit(int id){
        cx = new dbAdmin().getConnection();
       int nb=0;
        try {
            String sql = "select count(*) as NB from SEANCEBILAN  where NUMSEMAINE =-1 and codeu="+id;
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            if(rs.next()) {  
                 nb = rs.getInt("NB");
            }else{
             nb=0;
            }
            st.close();
            cx.close();


        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
       
       return nb;
   }
   
   public String findDateBilan(int id){
       cx = new dbAdmin().getConnection();
       String date="";
        try {
            String sql = "select DATE_FORMAT(max(DATEM), '%d-%m-%Y') as date from SEANCEBILAN  where codeu="+id;
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            if(rs.next()) {  
                 date = rs.getString("date");
            }else{
             date="";
            }
            st.close();
            cx.close();


        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
       
       return date;
    }
    
}

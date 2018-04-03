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



         public ArrayList<Profil> getProfils() {
             cx = new dbAdmin().getConnection();
        ArrayList<Profil> profils = new ArrayList();
        Utilisateur e;
        try {
            String sql = "select *  from PROFIL";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while (rs.next()) {
                int id = rs.getInt("CODEPROFIL");
                String libelleProfil = rs.getString("LIBELLEPROFIL");
                //ajouter les autres attributs 
                profils.add(new Profil(id,libelleProfil));
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

    /**
     * Trouver les profil pour un programme
     * @param codeProgram code de program
     * @return la liste de profil
     * @Author: Tianyuan
     */
    public ArrayList<Profil> findProfilProgramm(String codeProgram){
        cx = new dbAdmin().getConnection();
        ArrayList<Profil> list=new ArrayList<Profil>();
        try {
            String sql = "select C.CODEPROFIL,LIBELLEPROFIL FROM correspondre C,PROFIL P where P.CODEPROFIL=C.CODEPROFIL AND CODEPT="+codeProgram;
            sql=sql.toUpperCase();
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                list.add(new Profil(rs.getInt("CODEPROFIL"),rs.getString("LIBELLEPROFIL")));
            }
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }

        return list;
    }
}

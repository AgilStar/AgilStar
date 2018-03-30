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
   
    
}

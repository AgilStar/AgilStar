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
import model.Categorieseance;
import model.Exercice;

/**
 *
 * @author tianyuanliu,Nicolas
 */
public class dbCategorie {

    Connection cx;//La connection utilisÃ© par toutes les mÃ©thodes dans cette classe

    /**
     * Constucteur
     */
    

    /**
     * Cette fonction permet de récupérer l'ensemble des catégroies présentes dans
     * la BD
     * @author Alice
     * @return 
     */
    public ArrayList<Categorieseance> getCategories() {
        ArrayList<Categorieseance> categories = new ArrayList();
        try {
            cx = new dbAdmin().getConnection();
            String sql = "select * from CATEGORIESEANCE";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            String libCat;
            int codeCat;
            
            while (rs.next()) {
                libCat = rs.getString("LIBELLECAT");
                codeCat = rs.getInt("CODECAT");                
                Categorieseance cs = new Categorieseance(codeCat,libCat);
                categories.add(cs);
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problÃ¨me sur statement " + ex.getMessage());
        }
        return categories;

    }

}

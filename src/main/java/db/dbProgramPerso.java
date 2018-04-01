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
import model.Programmeperso;
import model.Programmetype;

/**
 *
 * @author Jin
 */
public class dbProgramPerso {
     Connection cx;//La connection utilisé par toutes les méthodes dans cette classe
     public dbProgramPerso() {
        cx = new dbAdmin().getConnection();
    }
     /**
      * 
      * @param codeu
      * @return liste programme perso
      * @author Jin
      */
     public ArrayList<Programmeperso> getAllProgramsForUser(int codeu){
         cx = new dbAdmin().getConnection();
         ArrayList<Programmeperso> listPP=new ArrayList();
         try {
            String sql = "select *  from PROGRAMMEPERSO WHERE CODEU="+codeu;
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                Integer idProgramm = rs.getInt("CODEPP");
                Integer codeU = rs.getInt("CODEU");
                Integer codePT = rs.getInt("CODEPT");
                String libellePP = rs.getString("LIBELLEPP");
                String descriptionPP = rs.getString("DESCRIPTIONPP");
                //ajouter les autres attributs
                listPP.add(new Programmeperso(idProgramm, codeu,codePT,libellePP, descriptionPP));
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
      
         return listPP;
     }
     /**
      * retourner le nombre de seance perso et le seance bilan pour un programme perso
      * @param codePP
      * @return nombre de seance pour un programme
      * @author Jin
      */
     public int getNbSessionForProgram(int codePP){
         int nb=0;
         cx = new dbAdmin().getConnection();
         try {
            String sql = "select (count(sp.codesp)+ count(sb.codesb)) as nb from seanceperso sp,seancebilan sb where sp.codepp=sb.codepp and sp.codepp="+codePP;
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                nb = rs.getInt("nb");
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
         return nb;
     }
     
}

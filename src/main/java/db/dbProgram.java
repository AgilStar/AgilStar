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
import model.Programmetype;
import model.Seancetype;
import model.Utilisateur;

/**
 *
 * @author auden
 */
public class dbProgram {

    Connection cx;//La connection utilisé par toutes les méthodes dans cette classe

    public dbProgram() {
        cx = new dbAdmin().getConnection();
    }

    /**
     *
     * @param email
     * @param mdp
     * @return
     * @author aude,jin
     */
    /**
     * @author Alice,tianyuan
     */
    public ArrayList<Programmetype> getProgramms() {
        ArrayList<Programmetype> programms = new ArrayList();
        Utilisateur e;
        try {
            String sql = "select *  from PROGRAMMETYPE";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                Integer idProgramm = rs.getInt("CODEPT");
                String nameProgramm = rs.getString("LIBELLEPT");
                String descrProgramm = rs.getString("DESCRIPTIONPT");
                //ajouter les autres attributs 
                programms.add(new Programmetype(idProgramm, nameProgramm, descrProgramm));
            }

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
        return programms;

    }

    public Programmetype getOneProgramm(Integer codept) {
        cx = new dbAdmin().getConnection();
        Programmetype prog = new Programmetype();
        try {

            String sql = "select *  from PROGRAMMETYPE where CODEPT=" + codept;
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("CODEPT");
                String nomp = rs.getString("LIBELLEPT");
                String descP = rs.getString("DESCRIPTIONPT");
                prog.setCodept(id);
                prog.setDescriptionpt(descP);
                prog.setLibellept(nomp);
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problÃ¨me sur statement getOneProgramm" + ex.getMessage());
        }
        return prog;
    }

    public ArrayList<Seancetype> getSceanceTypeProgramm(String codept) throws SQLException {
        ArrayList<Seancetype> sceances = new ArrayList();
        ArrayList<String> codes = new ArrayList<String>();
        try {
            codes=getCodeSceanceType(codept);
            for (String code : codes) {               
                String sql = "select *  from SEANCETYPE WHERE CODEST='" + code + "'";
                Statement st = cx.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Integer idSceance = rs.getInt("CODEST");
                    Integer nameCat = rs.getInt("CODECAT");
                    String libelleSceance = rs.getString("LIBELLEST");
                    String descSceance = rs.getString("DESCRIPTIONST");
                    String echauffementSt = rs.getString("ECHAUFFEMENTST");
                    //ajouter les autres attributs 
                    sceances.add(new Seancetype(idSceance, nameCat,libelleSceance, descSceance,echauffementSt));
                }

            }
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statementde getSceanceTypeProgramm " + ex.getMessage());
        }

        return sceances;
    }

    public ArrayList<String> getCodeSceanceType(String codept) {
        ArrayList<String> codes = new ArrayList();
        try {
            String sql = "select *  from COMPRENDRETYPE WHERE CODEPT='"+codept+"'";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                Integer codeProgram = rs.getInt("CODEPT");
                Integer codeSt = rs.getInt("CODEST");
                System.out.println(codeSt);
                //ajouter les autres attributs 
                codes.add(codeSt.toString());
            }

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement de getCodeSceancetype " + ex.getMessage());
        }
        return codes;
    }
    public static void main(String[] args) throws SQLException{
        
        dbProgram d = new dbProgram();
        ArrayList<Seancetype> listst = d.getSceanceTypeProgramm("1");
        System.out.println("********************");
        for(Seancetype a : listst){
         
            System.out.println(a.getDescriptionst());
        }
    }
}

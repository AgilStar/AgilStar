package db;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Categorieseance;
import model.Exercice;
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
            codes = getCodeSceanceType(codept);
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
                    sceances.add(new Seancetype(idSceance, nameCat, libelleSceance, descSceance, echauffementSt));
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
            String sql = "select *  from COMPRENDRETYPE WHERE CODEPT='" + codept + "'";
            System.out.println(sql);
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

    public ArrayList<String[]> getDescriptionSeance(String codest) {
        ArrayList<String[]> descriptionEx = new ArrayList();
        String[] organisertype = null;
        try {
            String sql = "select *  from ORGANISERTYPE WHERE CODEST='" + codest + "'ORDER BY ORDREST ASC";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                organisertype = new String[4];
                organisertype[0] = rs.getString("CODEE");
                organisertype[1] = rs.getString("SERIEST");
                organisertype[2] = rs.getString("DUREEATTENDUE");
                organisertype[3] = rs.getString("NBATTENDU");

                //ajouter les autres attributs
                descriptionEx.add(organisertype);
            }

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement de getCodeSceancetype " + ex.getMessage());
        }
        return descriptionEx;
    }

    /*
     public ArrayList<Seancetype> getExerciceSceanceType(String codest) throws SQLException {
        ArrayList<Exercice> sceances = new ArrayList();
        ArrayList<String> codeex = new ArrayList<String>();
        try {
            codeex=getCodeSceanceType(codept);
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
     */
    public Seancetype getOneSeanceType(String codeSt) {
        cx = new dbAdmin().getConnection();
        Seancetype s = new Seancetype();
        try {

            String sql = "select *  from SEANCETYPE where CODEST=" + codeSt;
            System.out.println(sql);
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("CODEST");
                int idcat = rs.getInt("CODECAT");
                String nomS = rs.getString("LIBELLEST");
                String descS = rs.getString("DESCRIPTIONST");
                String echauffS = rs.getString("ECHAUFFEMENTST");

                s.setCodest(id);
                s.setCodecat(idcat);
                s.setDescriptionst(nomS);
                s.setEchauffementst(descS);
                s.setEchauffementst(echauffS);
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problÃ¨me sur statement getOneExercice" + ex.getMessage());
        }
        return s;
    }

    public Exercice getOneCat(String codeCat) {
        cx = new dbAdmin().getConnection();
        Exercice e = new Exercice();
        try {

            String sql = "select *  from CATEGORIESEANCE where CODECAT=" + codeCat;
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("CODEE");
                String nomE = rs.getString("LIBELLEE");
                String objE = rs.getString("OBJECTIFE");
                String lienE = rs.getString("LIENVIDEO");

                e.setCodee(id);
                e.setLibellee(nomE);
                e.setObjectife(objE);
                e.setLienvideo(lienE);
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problÃ¨me sur statement getOneExercice" + ex.getMessage());
        }
        return e;
    }

    public Exercice getOneExercice(String codeEx) {
        cx = new dbAdmin().getConnection();
        Exercice e = new Exercice();
        try {

            String sql = "select *  from EXERCICE where CODEE=" + codeEx;
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("CODEE");
                String nomE = rs.getString("LIBELLEE");
                String objE = rs.getString("OBJECTIFE");
                String lienE = rs.getString("LIENVIDEO");

                e.setCodee(id);
                e.setLibellee(nomE);
                e.setObjectife(objE);
                e.setLienvideo(lienE);
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problÃ¨me sur statement getOneExercice" + ex.getMessage());
        }
        return e;
    }

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
                Categorieseance cs = new Categorieseance(codeCat, libCat);
                categories.add(cs);
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problÃ¨me sur statement " + ex.getMessage());
        }
        return categories;

    }

    public static void main(String[] args) throws SQLException {

        dbProgram d = new dbProgram();
        Exercice e = d.getOneExercice("1");
        String t = "   <div class=\"form-group\">  <label>Nom de l'exercice</label><input type=\"string\" "
                + "class=\"form-control\" id=\"nameExercice" + e.getCodee() + "\" value=\"" + e.getLibellee() + "\"></div>";
        System.out.println(t);
        //System.out.println(s.getCodecat()+s.getCodest()+s.getDescriptionst()+s.getLibellest()+s.getEchauffementst());

    }
}

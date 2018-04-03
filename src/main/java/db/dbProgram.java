package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.*;
import org.eclipse.jdt.internal.compiler.lookup.SourceTypeBinding;

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
        cx = new dbAdmin().getConnection();
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
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
            ex.printStackTrace();
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
            ex.printStackTrace();
        }
        return prog;
    }

    public Programmetype getSceanceTypeProgramm(String codep) {
        cx = new dbAdmin().getConnection();
        Programmetype p=new Programmetype();
        try {
                Statement st = cx.createStatement();
                String sql = "select ST.CODEST AS CODE,LIBELLEST AS LIBELLE,DESCRIPTIONST AS DESCRIPTION, ECHAUFFEMENTST AS ECHAUFFEMENT, OrdrePT AS NB,\"SEANCE\" as TYPE\n" +
                        "FROM COMPRENDRETYPE CT,SEANCETYPE ST\n" +
                        "WHERE CT.CODEST=ST.CODEST\n" +
                        "and CT.CODEPT="+codep+"\n" +
                        "UNION\n" +
                        "select CSBT.CODESBT AS CODE,LIBELLESBT AS LIBELLE,DESCRIPTIONSBT AS DESCRIPTION, \"\" AS ECHAUFFEMENT, (ordreSBT) AS NB,\"BILAN\" as TYPE\n" +
                        "FROM COMPRENDRESBT CSBT,SEANCEBILANTYPE SBT\n" +
                        "WHERE CSBT.CODESBT=SBT.CODESBT\n" +
                        "and CSBT.CODEPT="+codep+"\n" +
                        "ORDER BY NB;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    Integer code = rs.getInt("CODE");
                    String libelle = rs.getString("LIBELLE");
                    String description = rs.getString("DESCRIPTION");
                    String echauffement = rs.getString("ECHAUFFEMENT");
                    String type=rs.getString("TYPE");
                    Integer nb=rs.getInt("NB");
                    //ajouter les autres attributs

                    if (type.equals("BILAN")){

                        p.addSeanceBilanType(nb,new Seancebilantype(code,libelle,description));
                    }else{
                        p.addSeanceType(nb,new Seancetype(code,libelle,description,echauffement));
                    }

                }
                st.close();
                cx.close();


        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statementde getSceanceTypeProgramm " + ex.getMessage());
            ex.printStackTrace();
        }

        return p;
    }

//    public ArrayList<String> getCodeSceanceType(String codept) {
//        cx = new dbAdmin().getConnection();
//        ArrayList<String> codes = new ArrayList();
//        try {
//            String sql = "select *  from COMPRENDRETYPE WHERE CODEPT='" + codept + "'";
//            Statement st = cx.createStatement();
//            ResultSet rs = st.executeQuery(sql);
//
//            while (rs.next()) {
//                Integer codeProgram = rs.getInt("CODEPT");
//                Integer codeSt = rs.getInt("CODEST");
//                //ajouter les autres attributs
//                codes.add(codeSt.toString());
//            }
//            st.close();
//            cx.close();
//        } catch (SQLException ex) {
//            System.out.println("Il y a un problème sur statement de getCodeSceancetype " + ex.getMessage());
//        }
//        return codes;
//    }

    public ArrayList<String[]> getDescriptionSeance(String codest) {
        cx = new dbAdmin().getConnection();
        ArrayList<String[]> descriptionEx = new ArrayList();
        String[] organisertype = null;
        try {
            String sql = "select *  from ORGANISERTYPE WHERE CODEST='" + codest + "'ORDER BY ORDREST ASC";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                organisertype = new String[5];
                organisertype[0] = rs.getString("CODEE");
                organisertype[1] = rs.getString("SERIEST");
                organisertype[2] = rs.getString("DUREEATTENDUE");
                organisertype[3] = rs.getString("NBATTENDU");
                organisertype[4] = rs.getString("TEMPSREPOSE");
                //ajouter les autres attributs
                descriptionEx.add(organisertype);
            }
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement de getDescriptionSeance " + ex.getMessage());
            ex.printStackTrace();
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
            ex.printStackTrace();
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
            ex.printStackTrace();
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
            ex.printStackTrace();
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
            ex.printStackTrace();
        }
        return categories;

    }

    /**
     * Obtenir tous les séance dans le table SeanceType
     *
     * @return
     */
    public ArrayList<Seancetype> getAllSeanceType() {
        cx = new dbAdmin().getConnection();
        ArrayList<Seancetype> list = new ArrayList<Seancetype>();
        try {

            String sql = "select CODEST,LIBELLECAT,LIBELLEST,DESCRIPTIONST from SEANCETYPE,CATEGORIESEANCE where SEANCETYPE.CODECAT=CATEGORIESEANCE.CODECAT";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                String LIBELLECAT = rs.getString("LIBELLECAT");
                String LIBELLEST = rs.getString("LIBELLEST");
                String DESCRIPTIONST = rs.getString("DESCRIPTIONST");
                int CODEST = rs.getInt("CODEST");
                Seancetype s = new Seancetype();

                s.setCodest(CODEST);
                s.setCategorieCat(LIBELLECAT);
                s.setLibellest(LIBELLEST);
                s.setDescriptionst(DESCRIPTIONST);
                list.add(s);
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un problÃ¨me sur statement getOneExercice" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    /**
     * Inserer un program
     *
     * @param name
     * @param desc
     * @return
     * @Author Jin,Tianyuan
     */
    public void insertProgramType(String name, String desc) {
        cx = new dbAdmin().getConnection();
        try {
            String sql = "insert into PROGRAMMETYPE(LIBELLEPT,DESCRIPTIONPT) VALUES('" + name + "','" + desc + "')";
            Statement st = cx.createStatement();
            st.executeUpdate(sql);
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problÃ¨me sur statement insertProgram" + ex.getMessage());
            ex.printStackTrace();
        }

    }

    /**
     * inserer dans la table correspondre pour lier un programme a des profils
     *
     * @param listProfil
     * @Author Jin,Tianyuan
     */
    public void insertCorrespondre(String[] listProfil){
       
        int codePTMax = findMaxCodePT();
        for (int i = 0; i < listProfil.length; i++) {
              cx = new dbAdmin().getConnection();
              int codeProfil = Integer.parseInt(listProfil[i]);
            try {
                String sql = "insert into CORRESPONDRE(CODEPT,CODEPROFIL) VALUES("+codePTMax + "," + codeProfil + ")";
                Statement st = cx.createStatement();
                st.executeUpdate(sql);
                st.close();
                cx.close();
            } catch (SQLException ex) {
                System.out.println("Il y a un problÃ¨me sur statement insertCorrespondre  " + ex.getMessage());
                ex.printStackTrace();
            }
        }
       
        

    }

    /**
     * inserer dans les 2 tables association comprendre seance pour creer un
     * nouveau programme
     *
     * @param listSession
     * @return
     * @throws SQLException
     * @Author Jin,Tianyuan
     */
    public void insertComprendreType(String[] listSession) {
        int codePTMax = findMaxCodePT();
        cx = new dbAdmin().getConnection();

            try {

                for (int i = 0; i < listSession.length; i++) {
                    int codeSession = Integer.parseInt(listSession[i]);
                    int ordre = i + 1;
                    if (codeSession == -1) {
                        //inserer dans la table comprendreSBT
                        String sql = "insert into COMPRENDRESBT(CODESBT,CODEPT,ORDRESBT) VALUES(1," + codePTMax + "," + ordre + ")";

                        Statement st = cx.createStatement();
                        st.executeUpdate(sql);
                        st.close();
                    } else {
                        //inserer dans la table comprendreType

                        String sql = "insert into COMPRENDRETYPE(CODEPT,CODEST,ORDREPT) VALUES(" + codePTMax + "," + codeSession + "," + ordre + ")";
                        Statement st = cx.createStatement();
                        st.executeUpdate(sql);
                        st.close();
                    }
                }
                cx.close();
            }catch (SQLException ex) {
                    System.out.println("Il y a un problÃ¨me sur statement insertComprendreType COMPRENDRESBT " + ex.getMessage());
                ex.printStackTrace();
            }




    }

    public int findMaxCodePT() {
        cx = new dbAdmin().getConnection();
        int code = 0;
        try {
            String sql = "select max(CODEPT) as codePT from PROGRAMMETYPE";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                code = rs.getInt("codePT");

            }
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problÃ¨me sur statement findMaxCodePT" + ex.getMessage());
            ex.printStackTrace();
        }
        return code;
    }

    /**
     * Vérifier si le nom de programme existe
     *
     * @param name Nom de programme
     * @return
     * @author Jin,Tianyuan
     */
    public boolean checkNameProgram(String name) {
        cx = new dbAdmin().getConnection();
        boolean flag = true;
        try {
            String sql = "select count(*) as Nb from PROGRAMMETYPE where LIBELLEPT='" + name + "'";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                if (rs.getInt("Nb") == 1) {
                    flag = false;
                }
            }
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problÃ¨me sur statement checkNameProgram" + ex.getMessage());
            ex.printStackTrace();
        }
        return flag;
    }

    /**
     * Supprimer un programme par codeP
     * @param codeP code de programme
     * @Author Tianyuan
     */
    public void deleteProgram(String codeP){
        cx = new dbAdmin().getConnection();
        try {
            //Le supprimer dans le table  COMPRENDRESBT sur séance
            String sqlDeleteSeance="delete from COMPRENDRESBT where codept="+codeP;
            Statement st1 = cx.createStatement();
            st1.executeUpdate(sqlDeleteSeance);
            st1.close();
            //Le supprimer dans le table  COMPRENDRETYPE sur bilan
            String sqDeleteBilanl="delete from COMPRENDRETYPE where codept="+codeP;
            Statement st2 = cx.createStatement();
            st2.executeUpdate(sqDeleteBilanl);
            st2.close();
            //Le supprimer dans le table  CORRESPONDRE sur profil
            String sqDeleteProfil="delete from CORRESPONDRE where codept="+codeP;
            Statement st3 = cx.createStatement();
            st3.executeUpdate(sqDeleteProfil);
            st3.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un probleme sur delete programme" + ex.getMessage());
            ex.printStackTrace();
        }

    }

    /**
     * Changer le nom et description
     * @param codeP code de programme
     * @param name nom de programme
     * @param desc description de programme
     * @Author Tianyuan
     */
    public void modifyProgram(String codeP,String name,String desc){
        cx = new dbAdmin().getConnection();
        try {
            String sql="update programmetype SET LIBELLEPT='"+name+"',DESCRIPTIONPT='"+desc+"' where codept="+codeP;
            sql=sql.toUpperCase();
            Statement st = cx.createStatement();
            st.executeUpdate(sql);
            st.close();

            cx.close();
        } catch (SQLException e) {
            System.out.println("Il y a un proble,e sur change programme" + e.getMessage());
            e.printStackTrace();
        }

    }


    /**
     * Obtenir les programmes personalisés
     * @return La liste de programme personalisé
     * @Author Tianyuan
     */
    public ArrayList<Programmeperso> getProgrammsPerson(String codeUser) {
        cx = new dbAdmin().getConnection();
        ArrayList<Programmeperso> programms = new ArrayList();
        Utilisateur e;
        try {
            String sql = "select *  from PROGRAMMEPERSO where CODEU="+codeUser;
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Integer CODEPP = rs.getInt("CODEPP");
                Integer CODEU = rs.getInt("CODEU");
                Integer CODEPT = rs.getInt("CODEPT");
                String LIBELLEPP = rs.getString("LIBELLEPP");
                String DESCRIPTIONPP=rs.getString("DESCRIPTIONPP");
                programms.add(new Programmeperso(CODEPP, CODEU,CODEPT, LIBELLEPP,DESCRIPTIONPP));
            }
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
            ex.printStackTrace();
        }
        return programms;

    }

}

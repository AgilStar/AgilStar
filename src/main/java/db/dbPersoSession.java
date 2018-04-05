package db;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class dbPersoSession {
    Connection cx;
    public dbPersoSession(){
        cx=new dbAdmin().getConnection();
    }

    public Connection getCx() {
        return cx;
    }


    public void modifyPersoSession(String codesp,String noms, String desc, String warmup,String codecat){
        try {
            String sql = "update SEANCEPERSO set LIBELLESP='"+noms+"',DESCRIPTIONSP='"+desc+"', ECHAUFFFEMENTSP='"+warmup+"', CODECAT='"+codecat+"' where CODESP="+codesp;
            System.out.println(sql);
            Statement st = cx.createStatement();
            st.executeUpdate(sql);
            st.close();
        }
        catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement modifySession" + ex.getMessage());
        }
    }

    public void deletePlanifier(String spt){
        try {
            cx = new dbAdmin().getConnection();
            String sql;
            sql = "DELETE FROM PLANIFIERSP WHERE CODESP='"+spt+"'";
            Statement st = cx.createStatement();
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement de deleteOrganiserType" + ex.getMessage());
        }
    }

    public void createPlanifier(String codeE,String codeSP,String DUREEATTENDUEE,String NBATTENDUE,int ORDREP,String SERIEP,String TEMPSREPOSE){

        try {
            String sql = "insert into PLANIFIERSP(CODEE,CODESP,DUREEATTENDUEE,NBATTENDUE,ORDREP,SERIEP,TEMPSREPOSE,DATER) VALUES(" + codeE + "," + codeSP + "," + DUREEATTENDUEE + "," + NBATTENDUE + "," + ORDREP + "," + SERIEP + ","+TEMPSREPOSE+",STR_TO_DATE('1-01-2069', '%d-%m-%Y'))";
            Statement st = cx.createStatement();
            System.out.println(sql);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement de deleteOrganiserType" + ex.getMessage());
        }


    }

    public void open(String codesp,String type){
        try {
            String sql="";
            if (type.equals("seance")){
                sql = "update SEANCEPERSO set OUVERT='oui' where CODESP="+codesp;
            }else{
                sql = "update SEANCEBILAN set OUVERT='oui' where CODESB="+codesp;
            }

            System.out.println(sql);
            Statement st = cx.createStatement();
            st.executeUpdate(sql);
            st.close();
        }
        catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement modifySession" + ex.getMessage());
        }
    }

    public void ecrireCommentaire(String content,String codesp,String type){
        try {
            String sql="";
            if (type.equals("seance")){
                sql = "update SEANCEPERSO set COMMENTAIRECOACH='"+content+"' where CODESP="+codesp;
            }else{
                sql = "update SEANCEBILAN set COMMENTAIRECOACH='"+content+"' where CODESB="+codesp;
            }

            System.out.println(sql);
            Statement st = cx.createStatement();
            st.executeUpdate(sql);
            st.close();
        }
        catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement modifySession" + ex.getMessage());
        }
    }

}

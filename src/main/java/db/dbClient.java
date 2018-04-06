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
import model.Exercice;
import model.Mensuration;
import model.Planifierbilan;
import model.Profil;
import model.Seancebilan;
import model.Utilisateur;

/**
 *
 * @author auden
 */
public class dbClient {

    Connection cx;//La connection utilisé par toutes les méthodes dans cette classe

    /**
     *
     * @param email
     * @param mdp
     * @return
     * @author aude,jin
     */
    public String verifyConnect(String email, String mdp) {

        String url = "";
        try {
            cx = new dbAdmin().getConnection();
            Statement st = cx.createStatement();
            String sql = "select MAILU,STATUTU,MDPU from UTILISATEUR where MAILU='" + email + "'";

            ResultSet rs = st.executeQuery(sql);
            if (rs.next() == false) {
                url = "null";
            } else {

                String mailu = rs.getString("MAILU");
                String mdpu = rs.getString("MDPU");
                String statutu = rs.getString("STATUTU");
                if ((mdpu.equals(mdp))) {
                    if (statutu.equals("admin") || statutu.equals("coach")) {
                        url = "/content/indexCoach.jsp";
                    } else {
                        url = "/content/indexClient.jsp";
                    }
                } else {
                    url = "errorMot";
                }

            }
            rs.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
        return url;
    }

    public Utilisateur getOneClient(Integer codeu) {
        cx = new dbAdmin().getConnection();

        Utilisateur u = new Utilisateur();
        try {

            String sql = "select *  from UTILISATEUR where CODEU=" + codeu;
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("CODEU");
                String nomu = rs.getString("NOMU");
                String prenomu = rs.getString("PRENOMU");
                String mailu = rs.getString("MAILU");
                String genreu = rs.getString("GENREU");
                String birthday = rs.getDate("DATENAISSANCE").toString();
                String statuu = rs.getString("STATUTU");
                String adressu = rs.getString("ADRESSEU");
                String telu = rs.getString("TELU");
                String infooptu = rs.getString("INFOOPTU");
                String pwdu = rs.getString("MDPU");

                u.setCodeu(id);
                u.setNomu(nomu);
                u.setPrenomu(prenomu);
                u.setMailu(mailu);
                u.setGenreu(genreu);
                u.setDatenaissance(birthday);
                u.setStatutu(statuu);
                u.setAdresseu(adressu);
                u.setTelu(telu);
                u.setInfooptu(infooptu);
                u.setPwd(pwdu);

            }
            st.close();
            cx.close();

        } catch (SQLException ex) {

            System.out.println("Il y a un problÃ¨me sur statement getOneProgramm" + ex.getMessage());
            ex.printStackTrace();
        }
        return u;
    }

    /**
     * @author Alice,tianyuan
     */
    public ArrayList<Utilisateur> getClients(String condition) {
        ArrayList<Utilisateur> users = new ArrayList();
        Utilisateur e;

        try {
            cx = new dbAdmin().getConnection();

            String sql = "select *  from UTILISATEUR where " + condition;
            System.out.println(sql);

            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("CODEU");
                String nomu = rs.getString("NOMU");
                String prenomu = rs.getString("PRENOMU");
                String mailu = rs.getString("MAILU");
                String genreu = rs.getString("GENREU");
                String birthday = rs.getDate("DATENAISSANCE").toString();
                String statuu = rs.getString("STATUTU");
                String adressu = rs.getString("ADRESSEU");
                String telu = rs.getString("TELU");
                String infooptu = rs.getString("INFOOPTU");

                //ajouter les autres attributs 
                users.add(new Utilisateur(id, nomu, prenomu, mailu, genreu, birthday, statuu, adressu, telu, infooptu));
            }
            rs.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }
        return users;
    }

    public void changeStatue(String codeu, String cible) {
        cx = new dbAdmin().getConnection();
        String sql = "update UTILISATEUR SET STATUTU ='" + cible + "' where CODEU=" + codeu + "";
        Statement st = null;
        try {
            st = cx.createStatement();
            st.executeUpdate(sql);
            st.close();
            cx.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    /**
     *
     * @param id
     * @param fcr
     * @param fcmax
     * @param frf
     * @param fcrecup
     * @param poids
     * @param tmaxgainage
     * @param nbmaxFenteGauche
     * @param nbmaxFenteDroite
     * @param nbCrunch
     * @param nbPompe
     * @param nbSquat
     * @param nbDips
     */
    public void modifySport(int id, int fcr, int fcmax, int frf, int fcrecup, double poids, int tmaxgainage, int nbmaxFenteGauche, int nbmaxFenteDroite, int nbCrunch, int nbPompe, int nbSquat, int nbDips) {
        cx = new dbAdmin().getConnection();
        //insertion dans la table s�ance bilan
        try {

            String sql = "insert into SEANCEBILAN(CODESBT,FCREPOS, FCMAX, FCFLEXION,FCRECUPERATION,CODEU,DATEM,NUMSEMAINE,ORDRESB) VALUES (2," + fcr + "," + fcmax + "," + frf + "," + fcrecup + "," + id + ",sysdate(),-1,0)";
            Statement st = cx.createStatement();
            int nb = st.executeUpdate(sql);
            st.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un pro pour ins�rer la 1ere s�ance" + ex.getMessage());
        }

        //insertion dans la table planifierbilan pour gainage
        try {

            String sql1 = "Insert into PLANIFIERBILAN(CODESB,CODEE, DATER,TEMPSMAXU, ORDREB) VALUES ((SELECT CODESB from SEANCEBILAN ORDER BY CODESB DESC LIMIT 1),(SELECT CODEE FROM EXERCICE WHERE LIBELLEE='Gainage'),sysdate()," + tmaxgainage + ",1)";
            Statement st = cx.createStatement();
            int nb = st.executeUpdate(sql1);
            st.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un pro pour le gainage " + ex.getMessage());
        }

        //insertion dans la table planifierbian pour fente
        try {

            String sql2 = "Insert into PLANIFIERBILAN(CODESB,CODEE, "
                    + "DATER,NBMAXU, ORDREB) VALUES ((SELECT CODESB from SEANCEBILAN ORDER BY CODESB DESC LIMIT 1),"
                    + "(SELECT CODEE FROM EXERCICE WHERE LIBELLEE='Fentes jambe gauche devant'),sysdate()," + nbmaxFenteGauche + ",2)";
            Statement st = cx.createStatement();
            int nb = st.executeUpdate(sql2);
            st.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un pro pour la fente gauche " + ex.getMessage());
        }

        //insertion dans la table planifierbian pour fente droite
        try {

            String sql3 = "Insert into PLANIFIERBILAN(CODESB,CODEE, "
                    + "DATER,NBMAXU, ORDREB) VALUES ((SELECT CODESB from SEANCEBILAN ORDER BY CODESB DESC LIMIT 1),"
                    + "(SELECT CODEE FROM EXERCICE WHERE LIBELLEE='Fentes jambe droite devant'),sysdate()," + nbmaxFenteDroite + ",3)";
            Statement st = cx.createStatement();
            int nb = st.executeUpdate(sql3);
            st.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un pro pour la fente droite"+ ex.getMessage());}

        //insertion dans la table planifierbian pour crunch
        try {

            String sql4 = "Insert into PLANIFIERBILAN(CODESB,CODEE, "
                    + "DATER,NBMAXU, ORDREB) VALUES ((SELECT CODESB from SEANCEBILAN ORDER BY CODESB DESC LIMIT 1),"
                    + "(SELECT CODEE FROM EXERCICE WHERE LIBELLEE='Crunch'),sysdate()," + nbCrunch + ",4)";
            Statement st = cx.createStatement();
            int nb = st.executeUpdate(sql4);
            st.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un pour crunch " + ex.getMessage());
        }

        //insertion dans la table planifierbian pour pompe
        try {

            String sql5 = "Insert into PLANIFIERBILAN(CODESB,CODEE, "
                    + "DATER,NBMAXU, ORDREB) VALUES ((SELECT CODESB from SEANCEBILAN ORDER BY CODESB DESC LIMIT 1),"
                    + "(SELECT CODEE FROM EXERCICE WHERE LIBELLEE='Pompes ? genoux'),sysdate()," + nbPompe + ",5)";
            Statement st = cx.createStatement();
            int nb = st.executeUpdate(sql5);
            st.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un pro pour les pompe" + ex.getMessage());
        }

        //insertion dans la table planifierbian pour squat
        try {

            String sql6 = "Insert into PLANIFIERBILAN(CODESB,CODEE, "
                    + "DATER,NBMAXU, ORDREB) VALUES ((SELECT CODESB from SEANCEBILAN ORDER BY CODESB DESC LIMIT 1),"
                    + "(SELECT CODEE FROM EXERCICE WHERE LIBELLEE='1/2 Squat'),sysdate()," + nbSquat + ",6)";
            Statement st = cx.createStatement();
            int nb = st.executeUpdate(sql6);
            st.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un pro pour le squat " + ex.getMessage());
        }

        //insertion dans la table planifierbian pour dips
        try {

            String sql7 = "Insert into PLANIFIERBILAN(CODESB,CODEE, "
                    + "DATER,NBMAXU, ORDREB) VALUES ((SELECT CODESB from SEANCEBILAN ORDER BY CODESB DESC LIMIT 1),"
                    + "(SELECT CODEE FROM EXERCICE WHERE LIBELLEE='Dips'),sysdate()," + nbDips + ",7)";
            Statement st = cx.createStatement();
            int nb = st.executeUpdate(sql7);
            st.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un pro pour dips " + ex.getMessage());
        }

//insertion dans la table mensuration pour poids
        try {

            String sql7 = "Insert into MENSURATION(CODEU,DATEM, "
                    + "POIDS) VALUES (" + id + ",sysdate()," + poids + ")";
            Statement st = cx.createStatement();
            int nb = st.executeUpdate(sql7);
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un pro pour le poids " + ex.getMessage());
        }

    }

    /**
     *
     * @param codeu
     * @param taille
     * @param hanches
     * @param cuisses
     * @param poitrine
     * @param bras
     * @authors aude, jin
     */
    public void insertMeasure(int codeu, double taille, double hanches, double cuisses, double poitrine, double bras) {

        try {

            cx = new dbAdmin().getConnection();
            String sql = "select count(*) as Nb from MENSURATION where CODEU=" + codeu + " and datem=sysdate()";

            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            int nb = 0;
            while (rs.next()) {
                nb = rs.getInt("Nb");
            }
            st.close();
            if (nb == 1) {
                //on modifie l'enregistrement de ce jour 
                try {

                    String sql1 = "update MENSURATION set TAILLE=" + taille + ",HANCHES=" + hanches + ", CUISSES=" + cuisses + ",POITRINE=" + poitrine + ",BRAS=" + bras + " where CODEU=" + codeu;
                    System.out.println(sql1);
                    Statement st1 = cx.createStatement();
                    int nb1 = st1.executeUpdate(sql1);
                    st1.close();
                    cx.close();
                } catch (SQLException ex) {
                    System.out.println("Il y a un problème sur statement update mensuration " + ex.getMessage());
                }
            } else {
                // on cr�e un nouvel enregistrement 
                try {

                    String sql2 = "Insert into MENSURATION(CODEU,DATEM, TAILLE, HANCHES,CUISSES,POITRINE, BRAS) "
                            + "values(" + codeu + ",sysdate()," + taille + "," + hanches + ", " + cuisses + ", " + poitrine + "," + bras + ")";
                    System.out.println(sql2);
                    Statement st2 = cx.createStatement();
                    int nb2 = st2.executeUpdate(sql2);
                    st2.close();
                    cx.close();
                } catch (SQLException ex) {
                    System.out.println("Il y a un problème sur statement insert mensuration " + ex.getMessage());
                }
            }
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement compter mensuration " + ex.getMessage());
        }
    }

    public boolean verifyPwd(int id, String pwd) {
        boolean ok = false;

        try {
            cx = new dbAdmin().getConnection();
            String sql = "select count(*) as Nb from UTILISATEUR where CODEU=" + id + " and MDPU='" + pwd + "'";
            System.out.println(sql);
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            int nb = 0;
            while (rs.next()) {
                nb = rs.getInt("Nb");
            }
            System.out.println(nb);
            st.close();
            if (nb == 1) {
                ok = true;
            } else {
                ok = false;
            }
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement compter mensuration " + ex.getMessage());
        }

        return ok;
    }

    public void changePwd(int id, String pwd) {
        cx = new dbAdmin().getConnection();
        String sql = "update UTILISATEUR SET MDPU ='" + pwd + "' where CODEU=" + id + "";
        Statement st = null;
        try {
            st = cx.createStatement();
            st.executeUpdate(sql);
            st.close();
            cx.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Mensuration getLastMensuration(int codeU) {
        Mensuration m = new Mensuration();
        try {
            cx = new dbAdmin().getConnection();

            String sql = "select * from MENSURATION where CODEU=" + codeU + " and DATEM=(SELECT MAX(DATEM) FROM MENSURATION WHERE CODEU=" + codeU + ")"
                    + " and CODEM=(SELECT MAX(CODEM) FROM MENSURATION WHERE CODEU=" + codeU + ")";

            System.out.println(sql);
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            int nb = 0;
            if (rs.next()) {
                Double taille = rs.getDouble("TAILLE");
                Double poids = rs.getDouble("POIDS");
                Double hanches = rs.getDouble("HANCHES");
                Double cuisses = rs.getDouble("CUISSES");
                Double poitrine = rs.getDouble("POITRINE");
                Double bras = rs.getDouble("BRAS");
                m.setBras(bras);
                m.setCuisses(cuisses);
                m.setHanches(hanches);
                m.setPoids(poids);
                m.setTaille(taille);
                m.setPoitrine(poitrine);

            }
            System.out.println(nb);
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement compter mensuration " + ex.getMessage());
        }
        return m;

    }


    public void validateSession(int codeS, int codeE, int result) {
        String r = "";
        if (result == 0) {
            r = "--";
        } else if (result == 1) {
            r = "Facile";
        } else if (result == 2) {
            r = "Bien";
        } else {
            r = "Difficile";
        }

        try {
            cx = new dbAdmin().getConnection();
            String sql = "update PLANIFIERSP set RESULTATU='" + r + "' , DATER=sysdate() where CODEE=" + codeE + " and CODESP=" + codeS;
            System.out.println(sql);
            Statement st = cx.createStatement();
            st.executeUpdate(sql);

           

            st.close();
            
            
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement validateSession " + ex.getMessage());
        }
        
         
          
        try {
            String sql2 = "update SEANCEPERSO set VALIDERSP='oui' where CODESP=" + codeS;
            System.out.println(sql2);
              Statement st2 = cx.createStatement();
            st2.executeUpdate(sql2);
            st2.close();
        } catch (SQLException ex) {
            Logger.getLogger(dbClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            cx.close();
        } catch (SQLException ex) {
            Logger.getLogger(dbClient.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }

    public Utilisateur getUser(int codeu) {
        cx = new dbAdmin().getConnection();
        Utilisateur user = new Utilisateur();

        try {

            String sql = "select *  from UTILISATEUR  where codeu='" + codeu + "'";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("CODEU");
                String nom = rs.getString("NOMU");
                String prenom = rs.getString("PRENOMU");
                String dn = rs.getString("DATENAISSANCE");
                String genre = rs.getString("GENREU");
                String adresse = rs.getString("ADRESSEU");

                String tel = rs.getString("TELU");

                user.setNomu(nom);
                user.setPrenomu(prenom);
                user.setDatenaissance(dn);
                user.setGenreu(genre);
                user.setTelu(tel);
                user.setAdresseu(adresse);

            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un probl�me sur la requ�te pour obtenir les infos d'un utilisateur " + ex.getMessage());
        }
        return user;
    }

    public ArrayList<Profil> getProfilUser(int codeu) {
        cx = new dbAdmin().getConnection();
        ArrayList<Profil> profils = new ArrayList();
        Profil p;

        try {

            String sql = "select *  from  DETENIR d, PROFIL p where  p.CODEPROFIL=d.CODEPROFIL and d.codeu='" + codeu + "'";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {

                String profil = rs.getString("LIBELLEPROFIL");
                profils.add(new Profil(profil));
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un probl�me sur la requ�te pour obtenir les infos du profil d'un utilisateur " + ex.getMessage());
        }
        return profils;
    }

    public void modifyProfil(int codeu, String nom, String adresse, String prenom) {
        cx = new dbAdmin().getConnection();
        try {

            String sql = "update UTILISATEUR set NOMU='" + nom + "',ADRESSEU='" + adresse + "',PRENOMU='" + prenom + "' where codeu=" + codeu;
            Statement st = cx.createStatement();
            int nb = st.executeUpdate(sql);
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement " + ex.getMessage());
        }

    }

    public int getSeancebilan(int codeu) {
        Seancebilan s = new Seancebilan();
        int sea=0;
        try {
            
            cx = new dbAdmin().getConnection();
            String sql = "select codesb from SEANCEBILAN where codeu='" + codeu + "'and numsemaine='-1' and DATEM=(SELECT MAX(DATEM) FROM SEANCEBILAN WHERE CODEU=" + codeu + ")";
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                int seance = rs.getInt("CODESB");
                s.setCodesb(seance);
                sea=seance;
            }
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur la recup�ration dE LA valeur dE LA SEANCE BIL" + ex.getMessage());

        }
        System.out.println(sea);
        return sea;
    }
    public int getExercice(String libelle) {
        cx = new dbAdmin().getConnection();
        Exercice exo = new Exercice();
        int code=0;
        try {

            String sql = "select codee  from EXERCICE where libellee=" + libelle;
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("CODEE");
                exo.setCodee(id);
              code=id;
            }
            st.close();
            cx.close();

        } catch (SQLException ex) {
            System.out.println("Il y a un probl�me pour retrouver l'exo " + ex.getMessage());
        }
        System.out.println(code+"��������������");
        return code;
    }

    public Planifierbilan getLastSport(int codeU, int codesb, int exo) {
        Planifierbilan pb = new Planifierbilan();
        
        try {
            cx = new dbAdmin().getConnection();
           
            String sql="select p.TEMPSMAXU, p.NBMAXU from PLANIFIERBILAN as p, SEANCEBILAN as sb where sb.CODESB=p.CODESB "
                    + "and sb.CODEU='"+codeU+"' and sb.CODESB='"+codesb+"'and sb.numsemaine='-1' and p.CODEE='"+exo+"'";
            System.out.println(sql);
            Statement st = cx.createStatement();
            ResultSet rs = st.executeQuery(sql);
       
            while(rs.next()) {
                int nbmax=rs.getInt("NBMAXU");
                int temps = rs.getInt("TEMPSMAXU");
                pb.setNbmaxu(nbmax);
                pb.setTempsmaxu(temps);
                  System.out.println(temps);

            }
           
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur la recup�ration des anciennes valeurs du profil sportif " + ex.getMessage());
        }
        System.out.println(pb.getTempsmaxu());
        return pb;
    }

    public void validerBilanExo(int codeS, int codeE, String resultat) {
        try {
            cx = new dbAdmin().getConnection();
            String sql = "update PLANIFIERBILAN set NBMAXU=" + resultat + " where CODESB=" + codeS + " and CODEE=" + codeE;
            Statement st = cx.createStatement();
            st.executeUpdate(sql);
            st.close();
            cx.close();
        } catch (SQLException ex) {
            System.out.println("Il y a un problème sur statement validerBilanExo " + ex.getMessage());
        }
    }


    
    public void validerBilan(int codeS, String fcrepos, String fcflexion, String fcallonge) {
        cx = new dbAdmin().getConnection();
         try{
                String sql2 = "update SEANCEBILAN set VALIDERSB='oui' where CODESB=" + codeS;
                System.out.println(sql2);
                Statement st2 = cx.createStatement();
                st2.executeUpdate(sql2);

                st2.close();}
         catch(SQLException ex) {
            System.out.println("Il y a un problème sur statement validerBilan valider " + ex.getMessage());
        }
          try{
                String sql3 = "update SEANCEBILAN set FCREPOS=" + fcrepos + " where CODESB=" + codeS;
                  System.out.println(sql3);
                Statement st3 = cx.createStatement();
                st3.executeUpdate(sql3);

                st3.close();}
         catch(SQLException ex) {
            System.out.println("Il y a un problème sur statement validerBilan FCREPOS " + ex.getMessage());
        }
          try{
                String sql4 = "update SEANCEBILAN set FCFLEXION=" + fcflexion + " where CODESB=" + codeS;
                System.out.println(sql4);
                Statement st4 = cx.createStatement();
                st4.executeUpdate(sql4);

                st4.close();}
         catch(SQLException ex) {
            System.out.println("Il y a un problème sur statement validerBilan FCFLEXION " + ex.getMessage());
        }
           try{
                String sql5 = "update SEANCEBILAN set FCRECUPERATION=" + fcallonge + " where CODESB=" + codeS;
                System.out.println(sql5);
                Statement st5 = cx.createStatement();
                st5.executeUpdate(sql5);

                st5.close();}
         catch(SQLException ex) {
            System.out.println("Il y a un problème sur statement validerBilan FCRECUPERATION " + ex.getMessage());
        }
  

        try {
            cx.close();
        } catch (SQLException ex) {
            Logger.getLogger(dbClient.class.getName()).log(Level.SEVERE, null, ex);
        }

       
    }


    public static void main(String[] args) {
        dbClient d = new dbClient();
        Utilisateur u = d.getOneClient(24);
        System.out.println(u.getNomu());


        System.out.println(d.getProfilUser(62));
        Seancebilan s=new Seancebilan();
        s.setCodesb(1000);
        d.getSeancebilan(21);
        d.getLastSport(23,100,22);
        d.getExercice("'dips'");

    }

}

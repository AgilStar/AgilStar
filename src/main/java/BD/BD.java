/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author 21205980
 */
public class BD {
    private Connection cx;

    /*données de connexion*/
    private String url = "jdbc:mysql://etu-web:3306/db_21201692";
    private String login = "21201692";
    private String password = "04964N";
    
     /*Constructeurs*/
    public BD() throws ClassNotFoundException, SQLException {
        /*chargement du pilote pour la base de données*/
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            System.out.println("Erreur chargement driver " + ex.getMessage());
        }
        /*ouverture de la connexion*/
        try {
            this.cx = DriverManager.getConnection(url, login, password);
        } catch (SQLException ex) {
            System.out.println("Erreur ouverture connexion " + ex.getMessage());
        }

    }
    //v¨¦rifier le mot de pass  et l'adresse mail 
    public boolean verifyPwd(String email, String mdp) throws SQLException{
        boolean ok=false;
        Statement st;
        String request="select MdpU from Utilisateur where MailU="+email;
        st=cx.createStatement();
        ResultSet rs=null;
        try{
            rs=st.executeQuery(request);
           }catch(SQLException ex){
               System.out.println("il y a un probl¨¨me li¨¦ ¨¤ la requ¨ºte"+ex.getMessage());
        }
        String mdpbd=null;
        while(rs.next()){
            mdpbd=rs.getString("MdpU");
        }
        if (mdpbd==mdp){
            ok=true;
        }else{
            ok=false;
        }
        return ok;
    }
    /*Programme principal du test*/
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        BD unebd = new BD();


    }
    
    
}

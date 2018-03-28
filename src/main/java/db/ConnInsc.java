/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.util.List;
import model.Utilisateur;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author auden
 */
public class ConnInsc {
    Transaction t=Mytransaction.t;
    Session s=Mytransaction.session;
    
    public String verifyConnexion(String email,String mdp){
       String url="";
        Query q=s.createQuery("from Utilisateur where mailu="+email);
        List<Utilisateur> lu=(List<Utilisateur>)q.list();
        Utilisateur u=null;
        for(Utilisateur uu:lu){
            u=uu;
        }
        if(u.getMdpu().equals(mdp)){
            if(u.getStatutu().equals("coach")){
                url="page-perso.jsp?email=email&&statut='coach'";
            }else if(u.getStatutu().equals("admin")){
                url="page-perso.jsp?email=email&&statut='admin'";
            }else{
                url="page-perso.jsp";
            }
            
        }else{
        
            url="page-login.html";
        }
        return url;
         
    }        
   
}

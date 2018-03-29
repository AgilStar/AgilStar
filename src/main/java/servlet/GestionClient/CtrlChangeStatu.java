package servlet.GestionClient;

import db.dbClient;
import model.Utilisateur;

import java.util.ArrayList;

public class CtrlChangeStatu {
    ArrayList<Utilisateur> list;


    public CtrlChangeStatu(String condition){
        if (condition==null){
            list=getUsers("STATUTU<>'admin'");
        }else if(condition.equals("validé")){
            list=getUsers("STATUTU='validé'");
        }else if (condition.equals("en attente")||condition.equals("valider")){
            list=getUsers("STATUTU='en attente'");
        }else if (condition.equals("prospect")||condition.equals("passerAttente")){
            list=getUsers("STATUTU='prospect'");
        }
    }


    private ArrayList<Utilisateur> getUsers(String condition){
        return  new dbClient().getClients(condition);
    }

    public  ArrayList<Utilisateur> getList(){
        return list;
    }
}

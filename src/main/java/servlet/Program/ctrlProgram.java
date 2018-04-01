package servlet.Program;

import db.dbProfil;
import db.dbProgram;
import model.Profil;
import model.Seancetype;

import java.util.ArrayList;

public class ctrlProgram {


public ArrayList<Profil> getProfil(){
    return new dbProfil().getProfils();
}
public ArrayList<Seancetype> getAllSeanceType(){
    return new dbProgram().getAllSeanceType();
}


}

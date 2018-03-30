package servlet.Program;

import db.dbProfil;
import model.Profil;

import java.util.ArrayList;

public class ctrlCreateProgram {


public ArrayList<Profil> getProfil(){
    return new dbProfil().getProfils();
}



}

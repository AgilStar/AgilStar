package model;
// Generated 28 mars 2018 10:29:50 by Hibernate Tools 4.3.1



/**
 * Profil generated by hbm2java
 */
public class Profil  implements java.io.Serializable {


     private Integer codeprofil;
     private String libelleprofil;

    public Profil() {
    }

    public Profil(String libelleprofil) {
       this.libelleprofil = libelleprofil;
    }
   
    public Integer getCodeprofil() {
        return this.codeprofil;
    }
    
    public void setCodeprofil(Integer codeprofil) {
        this.codeprofil = codeprofil;
    }
    public String getLibelleprofil() {
        return this.libelleprofil;
    }
    
    public void setLibelleprofil(String libelleprofil) {
        this.libelleprofil = libelleprofil;
    }




}


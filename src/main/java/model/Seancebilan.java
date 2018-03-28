package model;
// Generated 28 mars 2018 10:29:50 by Hibernate Tools 4.3.1



/**
 * Seancebilan generated by hbm2java
 */
public class Seancebilan  implements java.io.Serializable {


     private Integer codesb;
     private int codesbt;
     private int codepp;
     private String libellesb;
     private String numsemaine;
     private String commentairecoach;
     private String etatlucoach;
     private String ouvert;
     private String validersb;

    public Seancebilan() {
    }

	
    public Seancebilan(int codesbt, int codepp) {
        this.codesbt = codesbt;
        this.codepp = codepp;
    }
    public Seancebilan(int codesbt, int codepp, String libellesb, String numsemaine, String commentairecoach, String etatlucoach, String ouvert, String validersb) {
       this.codesbt = codesbt;
       this.codepp = codepp;
       this.libellesb = libellesb;
       this.numsemaine = numsemaine;
       this.commentairecoach = commentairecoach;
       this.etatlucoach = etatlucoach;
       this.ouvert = ouvert;
       this.validersb = validersb;
    }
   
    public Integer getCodesb() {
        return this.codesb;
    }
    
    public void setCodesb(Integer codesb) {
        this.codesb = codesb;
    }
    public int getCodesbt() {
        return this.codesbt;
    }
    
    public void setCodesbt(int codesbt) {
        this.codesbt = codesbt;
    }
    public int getCodepp() {
        return this.codepp;
    }
    
    public void setCodepp(int codepp) {
        this.codepp = codepp;
    }
    public String getLibellesb() {
        return this.libellesb;
    }
    
    public void setLibellesb(String libellesb) {
        this.libellesb = libellesb;
    }
    public String getNumsemaine() {
        return this.numsemaine;
    }
    
    public void setNumsemaine(String numsemaine) {
        this.numsemaine = numsemaine;
    }
    public String getCommentairecoach() {
        return this.commentairecoach;
    }
    
    public void setCommentairecoach(String commentairecoach) {
        this.commentairecoach = commentairecoach;
    }
    public String getEtatlucoach() {
        return this.etatlucoach;
    }
    
    public void setEtatlucoach(String etatlucoach) {
        this.etatlucoach = etatlucoach;
    }
    public String getOuvert() {
        return this.ouvert;
    }
    
    public void setOuvert(String ouvert) {
        this.ouvert = ouvert;
    }
    public String getValidersb() {
        return this.validersb;
    }
    
    public void setValidersb(String validersb) {
        this.validersb = validersb;
    }




}



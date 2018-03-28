package model;
// Generated 28 mars 2018 10:29:50 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Utilisateur generated by hbm2java
 */
public class Utilisateur  implements java.io.Serializable {


     private Integer codeu;
     private String nomu;
     private String prenomu;
     private String mailu;
     private String genreu;
     private Date datenaissance;
     private String mdpu;
     private String statutu;
     private String adresseu;
     private String telu;
     private String infooptu;

    public Utilisateur() {
    }

    public Utilisateur(String nomu, String prenomu, String mailu, String genreu, Date datenaissance, String mdpu, String statutu, String adresseu, String telu, String infooptu) {
       this.nomu = nomu;
       this.prenomu = prenomu;
       this.mailu = mailu;
       this.genreu = genreu;
       this.datenaissance = datenaissance;
       this.mdpu = mdpu;
       this.statutu = statutu;
       this.adresseu = adresseu;
       this.telu = telu;
       this.infooptu = infooptu;
    }
   
    public Integer getCodeu() {
        return this.codeu;
    }
    
    public void setCodeu(Integer codeu) {
        this.codeu = codeu;
    }
    public String getNomu() {
        return this.nomu;
    }
    
    public void setNomu(String nomu) {
        this.nomu = nomu;
    }
    public String getPrenomu() {
        return this.prenomu;
    }
    
    public void setPrenomu(String prenomu) {
        this.prenomu = prenomu;
    }
    public String getMailu() {
        return this.mailu;
    }
    
    public void setMailu(String mailu) {
        this.mailu = mailu;
    }
    public String getGenreu() {
        return this.genreu;
    }
    
    public void setGenreu(String genreu) {
        this.genreu = genreu;
    }
    public Date getDatenaissance() {
        return this.datenaissance;
    }
    
    public void setDatenaissance(Date datenaissance) {
        this.datenaissance = datenaissance;
    }
    public String getMdpu() {
        return this.mdpu;
    }
    
    public void setMdpu(String mdpu) {
        this.mdpu = mdpu;
    }
    public String getStatutu() {
        return this.statutu;
    }
    
    public void setStatutu(String statutu) {
        this.statutu = statutu;
    }
    public String getAdresseu() {
        return this.adresseu;
    }
    
    public void setAdresseu(String adresseu) {
        this.adresseu = adresseu;
    }
    public String getTelu() {
        return this.telu;
    }
    
    public void setTelu(String telu) {
        this.telu = telu;
    }
    public String getInfooptu() {
        return this.infooptu;
    }
    
    public void setInfooptu(String infooptu) {
        this.infooptu = infooptu;
    }




}



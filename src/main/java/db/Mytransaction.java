/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;

/**
 *
 * @author tianyuanliu
 */
public class Mytransaction {
    public static Transaction t;
    public static Session session=Mytransaction.session;
    public Mytransaction(){
        Session session = (Session) NewHibernateUtil.getSessionFactory().getCurrentSession();
     t= session.beginTransaction();
    }
}

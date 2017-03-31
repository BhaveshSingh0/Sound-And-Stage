
package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


public class book extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws  ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session =  request.getSession(true);
        int num = Integer.parseInt(request.getParameter("num"));
        String name= (String)session.getAttribute("name");
        String email= (String)session.getAttribute("email");
        
        if(num == 0){
            
           int id = Integer.parseInt(request.getParameter("Id"));
         
           try{
               
        Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session1=factory.openSession();  
     Transaction t = session1.beginTransaction();  
     
   SQLQuery query =  session1.createSQLQuery("Select * from APP.SOUND where SEAT="+id+" and STATUS=1");
   List r = query.list();

   if(r.size() == 0){
   
       session1.createSQLQuery("UPDATE APP.SOUND set NAME='"+name+"' ,PERSONBOOKED = '"+email+"', STATUS=1  WHERE SEAT="+id).executeUpdate();
         out.print("done");
   }
   else{
       out.println("Already Booked");
   }
   t.commit();//transaction is commited  
    session1.close();
       
           }
           
           catch(Exception e ) {
               out.print("error");
               e.printStackTrace();
           }
           
           
           
           
        }
        
        else if(num == 1){
        int id = Integer.parseInt(request.getParameter("Id"));
        
             try{
               
      Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session1=factory.openSession();  
     Transaction t = session1.beginTransaction();  
     
     
      session1.createSQLQuery("UPDATE APP.SOUND set NAME='null' ,PERSONBOOKED = 'null', STATUS=0  WHERE SEAT="+id).executeUpdate();
      out.println("done");
     t.commit();//transaction is commited  
    session1.close();
         
           }
           
           catch(Exception e ) {
               e.printStackTrace();
               System.out.println("error");
               
           }
             
        
     
        }
          
     
            
            
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

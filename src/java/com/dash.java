
package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class dash extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
          
        PrintWriter  out =  response.getWriter();
                
       
        int  i ;
        
        String[] a = new String[100];
     
        for( i =0 ; i< 100 ; i++ ) {
            
            a[i] = request.getParameter(""+(i+1));
            
            
            
        }
        
        
        
         List<Sound>  data = new ArrayList<>() ;
        
        
        
        for(  i = 0 ; i<200 ; i++ ) {
           
            
            Sound s  = new Sound();
            s.setSeat(i+1);
            data.add(s);
            
          
            
        }
        
        
  try{
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session1=factory.openSession();  
     Transaction t = session1.beginTransaction();  
     
     
     
     
     for( Sound t1 : data){
         
         session1.save(t1);
     }
     
        
      out.println("done");
    t.commit();//transaction is commited  
    session1.close();
    
        
        
             }
             
             catch (Exception e )
             {
                 
                 
             }
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

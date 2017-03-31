
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

public class refresh extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            
            String[] name = new String[100] ;
            String[] person = new String[100];
            int[]  status =  new int[100];
            int[]  id =  new int[100];
            int[]  seat =  new int[100];
            
            for(int i = 0  ;i <100 ; i ++ ) {
                
                name[i]= null ;
                person[i]= null ;
                status[i] = 0 ;
                id[i]= i+1;
                seat[i]= i+1 ;
            }
            
            
            
            
            
            List<Sound>  obj =  new  ArrayList<>();
            
            for(int i =0 ; i<100 ; i++) {
                Sound o = new Sound();
                o.setId(i+1);
                o.setName(name[i]);
                o.setPersonBooked(person[i]);
                o.setSeat(i+1);
                o.setStatus(status[i]);
                 obj.add(o);
            }
            
            Configuration  cfg =  new Configuration();
            cfg.configure("hibernate.cfg.xml");
            SessionFactory  sf =  cfg.buildSessionFactory();
            Session sessions = sf.openSession();
            Transaction t =  sessions.beginTransaction();
            for(Sound s : obj ) {
                
                sessions.update(s);
            }
            
            t.commit();
            sessions.close();
            out.print("Done");
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

<%-- 
    Document   : admin
    Created on : Mar 26, 2017, 10:54:35 AM
    Author     : Bhavesh Singh
--%>
<%@page import="com.Sound"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        
        <% 

        String name = (String)session.getAttribute("name") ;
        if(!name.equals("admin")) {
            
            RequestDispatcher rd =  request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        
        
        %>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
    <link href="//cdn.dataTables.net/tabletools/2.2.4/css/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>
 
    <link href="css/pnotify.custom.min.css" media="all" rel="stylesheet" type="text/css" />
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.bundle.js" type="text/javascript" ></script>
    
          <script>
$(document).ready(function(){
   $('#btnp').click(function() {
  
    
          
            $.ajax({
                type: "POST",
                url: 'refresh',
                success: function(data) {
                   
                    alert(data);
                 
                },
                 error: function() {
                    alert('it broke');
                }
                
            });

         
    });
});
     
     
     
     
           
        </script>
    </head>
    <body>
        <br>
        <div class="row" >
            
            <div class="col-md-offset-1 col-md-10" >
                <input  type="button"  style="padding: 5px;" value="Refresh"   class="btn-primary"  id="btnp" />
      
         
                <a href="index.jsp" style="text-decoration: none ; margin-left: 100px;  font-size: 20px;">Logout </a>
            </div>
        </div>
        
        
    
        
                <% 
          try{
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session1=factory.openSession();  
     Transaction t = session1.beginTransaction();  
     
     Date d = new Date() ;
     %>
     
     
     
                
           
                  <div class="form_div" >
                      <form action="auto"  id="form1" >
                      
                          <div class="row">
                              <div class="col-md-12" style="background-color: white; padding: 40px; border:1px #080808; outline: none;">
                                  <table border="1" id="example" class="stripe" cellspacing="0" width="100%">
                                    
                              
                                      <thead>
                                        <tr>
                                            <th>Seat</th>
                                            <th>Name Of Person Booked</th>
                                            <th>Mail Id  of Person Booked</th>
                                            <th>Status (<%= d %>)</th>
                                           
                                         
                                            
                                        <!--    <th>Ordered Time</th> -->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                         <%
         
         
     List list= session1.createQuery("from com.Sound").list();
       
      Iterator iterator = list.iterator(); 
      
      %>
                                
  
           
      
      <%
      
      
      for (int i = 0; i < list.size(); i++)
{
             Sound user =  (Sound)iterator.next();
   String st = "" ;
     if(user.getStatus() == 0) {
           st = "Available";
           
       }
       else{
              st = "Booked";
       }
     
     if((user.getName()== null)|| user.getPersonBooked().equals("null") ) {
       
       
  
             %>
                                        
                                        
             <tr><td><%= user.getSeat() %></td><td></td><td></td><td><%= st %></td></tr>                                  
                                        
                                          
             <%
              }
     
 else{

 %>
                                        
                                        
             <tr><td><%= user.getSeat() %></td><td><%= user.getName() %></td><td><%= user.getPersonBooked() %></td><td><%= st %></td></tr>                                  
                                        
                                          
             <%
                         
                         }
    
}
t.commit();
session1.close();
      %>
      
                                    </tbody>
                                </table>
                              </div>
                          </div>
                         
          </form>            
                                        
           
      <%
      
      
   }
        
        
        catch(Exception e){
            
            out.println(e);
            
        }
   
        %>                             
           
        
        
    
    
    
    
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
         </script>


                     <script src="js/jquery.min.js"></script>
                     <script src="js/bootstrap.min.js"></script>
                     <script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
                     <script src="//cdn.dataTables.net/tabletools/2.2.4/js/dataTables.tableTools.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function() {
    var table = $('#example').dataTable();
    var tool = new $.fn.dataTable.TableTools(table,{
        
        
        'sSwfPath':'//cdn.dataTables.net/tabletools/2.2.4/swf/copy_csv_xls_pdf.swf'
    });
    $(tool.fnContainer()).insertBefore('#example_wrapper');
    
    
} );
</script>

<script>
        $(function(){
            $('[data-toggle="tooltip"]').tooltip();
          });
</script>
         
    </body>
</html>


<%@page import="com.Sound"%>
<%@page import="com.Sound"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%
    
    
    String name = (String)session.getAttribute("name");
    if(name == null){
        
        RequestDispatcher   rd= request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }
    %>
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="js/jquery.min.js" type="text/javascript"></script>
        <title>Dashboard</title><style>
            
            input[type="checkbox"]{
  width: 30px; /*Desired width*/
  height: 30px; /*Desired height*/
  
}
body{
    font-size: 20px;
}

          .but {
                
                padding: 10px;
                background-color: #ddd;
                
                
            }
        </style>
        
              <script>
                  
                  
                  function  reff() {
                      
                      
                      document.getElementById("valueA").value= 0 ;
                      
                      location.reload(); 
                      
                  }
                  
                  
                  
$(document).ready(function(){
   $('.searchType').click(function() {
    var id = $(this).attr('id');
    if(this.checked){
          var num = parseInt(document.getElementById("valueA").value);
          document.getElementById("valueA").value = 300 + num ;
            $.ajax({
                type: "POST",
                url: 'book',
                data: 'Id='+id+'&num=0',
                success: function(data) {
              
                 
                },
                 error: function() {
                    alert('it broke');
                }
                
            });

            }
            
            
            else{
                var num = 1 ;
                 var num = parseInt(document.getElementById("valueA").value);
          document.getElementById("valueA").value =  num - 300 ;
         
                 $.ajax({
                type: "POST",
                url: 'book',
                data: 'Id='+id+'&num=1',
                success: function(data) {
                   
          
                 
                },
                 error: function() {
                    alert('it broke');
                }
                
            });
               
            }
    });
});
     
     
       
       </script>
        
        
       <style>
           
           
                    h1 {
  font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
  font-size: 32px;
  padding: 20px 10px;
  text-align: center;
  text-transform: uppercase;
  text-rendering: optimizeLegibility;
}



.deepshd {
    
  color: #e0dfdc;
  margin-top: -10px;
  background-color: #333;
  letter-spacing: .1em;
  text-shadow: 0 -1px 0 #fff, 0 1px 0 #2e2e2e, 0 2px 0 #2c2c2c, 0 3px 0 #2a2a2a, 0 4px 0 #282828, 0 5px 0 #262626, 0 6px 0 #242424, 0 7px 0 #222, 0 8px 0 #202020, 0 9px 0 #1e1e1e, 0 10px 0 #1c1c1c, 0 11px 0 #1a1a1a, 0 12px 0 #181818, 0 13px 0 #161616, 0 14px 0 #141414, 0 15px 0 #121212, 0 22px 30px rgba(0, 0, 0, 0.9);
}
       </style>
    </head>
    <body> 
        
        
           <h1 class="deepshd"> Sound And Stage Entertainment </h1>
       
           <br>
           
           
    <marquee>  Current Booking is Of Movie #3Idiots @ 4  -  7 pm  </marquee>
           
           
                <% 
          try{
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session1=factory.openSession();  
     Transaction t = session1.beginTransaction();  
     
     
     %>
     
      
     
     
     
    <br>
     <br>
     
     
     
     
     <div class="row" >
         <div class="col-md-8"    >
         <div class="tic" style="position: absolute;">
         
                                         <%
         
    
     List list= session1.createQuery("from com.Sound").list();
       
      Iterator iterator = list.iterator(); 
      
      %>
        
            <table cellspacing="4"  cellpadding="7">
        
            
            
        <%!  int  num = 1 ;%>
     <% 
     

for(int i = 1 ; i <= 10 ; i++) {
    

 %>
 
 <tr>
    
 <%
     
     
if(i==3) {
    
    
    %>
    
 <tr></tr> <tr></tr> <tr></tr> <tr></tr> <tr></tr> <tr></tr>
    <%
}


if(i==9) {
    
    
    %>
    
 <tr></tr> <tr></tr> <tr></tr> <tr></tr> <tr></tr> <tr></tr>
    <%
}
     
    for(int j =1 ;j<=10  ; j++ ){
     Sound user =  (Sound)iterator.next();

        if(num==100){
            
            break ;
            
        }
       else{
            

            if(j==8){
    %>
     <td></td><td></td><td></td>
            
   <%       
    
       
}


   if((user.getPersonBooked() == null ) || ( user.getPersonBooked().equals("null")) ){
            %>
            <td>  <input  class="searchType"  id="<%= user.getSeat()  %>" name="<%= user.getSeat()  %>"  type="checkbox" onclick="check(this.id)"  value="<%= user.getSeat() %>" /><%= user.getSeat()  %></td>
          
          <%  
              }
              else
          {
            
            %>
            
         <td>  <input  class= "but"  id="<%= user.getSeat()  %>" name="<%= user.getSeat()  %>"  type="checkbox" checked="true"   disabled="true" value="<%= user.getSeat() %>" /><%= user.getSeat()  %></td>
            
            
            
            <%
        }
            num++;
       }
     }

 num = 1;
%>
</tr>

<%
}

t.commit();
session1.close();
      %>
      
      <%
      }
       catch(Exception e){
            
           %>
           <h1><%= e.getMessage() %></h1>
           <%
            
        }
   
        %> 
        </table>
     
         </div>
         </div></div>
        
        
        
        <br><br><br>
        <div style="margin-left: 1000px; background-color: #2aabd2; padding: 10px;" >
            
            
            <input type="checkbox" checked="true" disabled="true" > Ticket Booked 
            <input type="checkbox" disabled="true" > Ticket Available 
            <br><br>

         Total Amount : 
         <input type="number" id="valueA" value="0" disabled="true" />
         <br>  <br> 
         <input type="button" value="Refesh" style="padding: 5px; margin-left: 10px;" onclick="reff()" />   <br> <h6>Please Mention Your Mail-Id While you Collect The Ticket At counter!</h6><h6>Pay the Amount At the counter</h6>
          <br> 
          <a href="index.jsp" style="text-decoration: none ; font-size: 28px;"> Go To Homepage </a>
    
        </div>
     </div>
    </body>
</html>

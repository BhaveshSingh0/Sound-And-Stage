
<%

session.invalidate();

if (null == request.getAttribute("dbError")) {
   request.setAttribute("dbError", "none");
    }
if (null == request.getAttribute("sendSuccess")) {
   request.setAttribute("sendSuccess", "none");
    }


%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home</title>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
   <link href="css/style.css" rel="stylesheet" type="text/css"/>
  
   
   <style>
        
        #sendSuccess{
            display: <%= request.getAttribute("sendSuccess") %>;
        }
        #dbError {
            display: <%= request.getAttribute("dbError") %>;
        }
    </style>
 
 
     
   <script type="text/javascript">
      
            $(document).ready(function(){
                $('#count-box').CountUpCircle({
                    duration: 4000,
                    opacity_anim: true,
                    step_divider: 2
                });
                 $('#count-box2').CountUpCircle({
                    duration: 4000,
                    opacity_anim: true,
                    step_divider: 2
                });
                 $('#count-box3').CountUpCircle({
                    duration: 4000,
                    opacity_anim: true,
                    step_divider: 2
                });
            });
     </script>   
  <style>
      .mytab {
          margin: auto;
          padding-left: 4%;
          padding-right: 5%;
          background-color: white;
      }
       .carousel-inner img {
      width: 100%; 
      margin: auto;
      min-height:200px;
       }
  li {
     font-family:  Georgia, serif;
      font-size: 17px;
      
  }
  .info {
    background-color: #e7f3fe;
    border-left: 6px solid #2196F3;
}

  
  li:hover{
      
     font-family:  Comic Sans MS, cursive, sans-serif ;
     font-size: 20px;
     color: #000;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
      
      
    .nav-tabs { border-bottom: 2px solid #DDD; }
    .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover { border-width: 0; }
    .nav-tabs > li > a { border: none; color: #666; }
    .nav-tabs > li.active > a, .nav-tabs > li > a:hover { border: none; color: #4285F4 !important; background: transparent; }
    .nav-tabs > li > a::after { content: ""; background: #4285F4; height: 4px; position: absolute; width: 100%; left: 0px; bottom: -1px; transition: all 250ms ease 0s; transform: scale(0); }
    .nav-tabs > li.active > a::after, .nav-tabs > li:hover > a::after { transform: scale(1); }
    .tab-nav > li > a::after { background: #21527d none repeat scroll 0% 0%; color: #fff; }
    .tab-pane { padding: 15px 0; }
    .tab-content{padding:20px}

.card {background: #FFF none repeat scroll 0% 0%; box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.3); margin-bottom: 30px; }
body{ background: #EDECEC; padding:50px}






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
<body style="background-color:white; font-family: OpenSans;">
    <div class="row">
     <div class="col-md-12">
       
        <h1 class="deepshd"> Sound And Stage Entertainment <span class="glyphicon glyphicon-headphones"></span> </h1>
        
        
        
        </div>
        
        
</div>
    
     <br>
      <div class="alert alert-danger" id="dbError" role="alert">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <center>Something went seriously wrong!Please contact the developer.</center>
                    </div>
                    
     
     
                    <div class="alert alert-success" id="sendSuccess" role="alert">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <center>Success</center>
                    </div>
                    <br>
    <br>
    
    <div class="row">
		                    <div class="col-md-12">
                                        <div class="card" style="background-color: whitesmoke;">
                                    <ul class="nav nav-tabs" role="tablist" >
                                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home&nbsp;<span class="glyphicon glyphicon-home"></span></a></li>
                                        <li role="presentation"><a href="#contact" aria-controls="messages" role="tab" data-toggle="tab">Contact Us&nbsp;<span class="glyphicon glyphicon-phone"></span></a></li>
                                        <li role="presentation"><a href="#registerme" aria-controls="settings" role="tab" data-toggle="tab">Get Movie&nbsp;<span class="glyphicon glyphicon-cd"></span></a></li>
                                    </ul>

                                  
                                        <div class="tab-content" style="background-color: whitesmoke;">
                                        <div role="tabpanel" class="tab-pane active" id="home">
                                            
                                            

                                                            <div class="row">
                                                          <div class="col-md-12">
                                                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                                      <!-- Indicators -->
                                                      <ol class="carousel-indicators">
                                                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                                        <li data-target="#myCarousel" data-slide-to="1"></li>
                                                      </ol>

                                                      <!-- Wrapper for slides -->
                                                      <div class="carousel-inner" role="listbox">
                                                        <div class="item active">
                                                            <img src="img/a.jpg" alt=""/>

                                                        </div>

                                                        <div class="item"><img src="img/b.jpg" alt=""/>

                                                        </div>

                                                      </div>

                                                      <!-- Left and right controls -->
                                                      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                                        <span class="sr-only">Previous</span>
                                                      </a>
                                                      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                                        <span class="sr-only">Next</span>
                                                      </a>
                                                  </div>
                                                          </div>
                                                      </div>
                                            <br>
                                                                    <br>
                                                                     <div class="row">
                                <div class=" col-md-offset-2 col-md-3 ">
                                 <div class="wrapper">
                                   <div id="count-box">120</div> 
                                </div>
                                     <h3>People Liked&nbsp;<span class="glyphicon glyphicon-ok"></span></h3>
                                </div>


                                <div class=" col-md-offset-4 col-md-3 ">

                                 <div class="wrapper">

                                   <div id="count-box2">1200</div> 
                                </div>
                                         <h3>People Visited &nbsp;<span class="glyphicon glyphicon-registration-mark"></span></h3>
                                </div>


                                

                            </div>




                                                                  </div>

                                        
                                        
                                        
                                        <div role="tabpanel" class="tab-pane" id="contact">
                                            <div class="row">
                                        <div class="col-md-4">
            <form>
            <legend><span class="glyphicon glyphicon-globe"></span> Our office</legend>
            <address>
                <strong>Twitter, Inc.</strong><br>
               https://twitter.com/BhaveshSingh0
                <br>
                Panvel,410208<br>
             
                    PHONE:
               +918419930936
            </address>
            <address>
                <strong>Full Name</strong><br>
                Bhavesh Singh / Sneha Sawant<br>
                <a href="mailto:#">bhaveshsingh322@gmail.com</a><br>
                  <a href="mailto:#">snehasr25@gmail.com</a>
            </address>
            </form>
        </div>
                                            </div>
                                        </div>
                                       
                                        
                                        
                                        <div role="tabpanel" class="tab-pane" id="registerme">
                                        
      
                                         <div class="row">
                                            <div class="col-md-offset-7 col-md-4">
                                                
                                                
                                                <form action="auth">
                                                    
                                    <div class="form-group">
                                        <label for="Name">Name:</label>
                                      <input type="text" class="form-control" id="name"  name="name" required>
                                    </div>
                                    <div class="form-group">
                                      <label for="email">Email address:</label>
                                      <input type="email" class="form-control" name="email" id="email">
                                    </div>    

                                            <button type="submit" class="btn btn-default">Submit</button>  
                           
                               </div>
                           </div>



                                </div>
                              </div>
                            </div>
                          </div>    




                         </div>

    
    
    
    
    
    
    
    <hr>
    <footer style="width: 100%; background-color: black; font-size: 12px; color: white; padding: 10px;">
        <center>
            While using this site, you agree to have read and accepted our terms of use, cookie and privacy policy.
	    <br/>
            &copy; Copyright 2016-2017 by <a href="index.html">SoundStage.Ltd.</a> &reg; All Rights Reserved.
        </center>
    </footer>
    
    
    <script src="js/jquery.countupcircle.js" type="text/javascript"></script>
    
     
      
    <script>
        $('#contact').popover();
        $('#name').popover();
    </script>
    
    <!-- Script for validation of form goes right below, hoss!-->
   

</body>
</html>

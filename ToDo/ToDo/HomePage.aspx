<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ToDo.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>ToDO</title>
    <%--jquery--%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <%--<link href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css"/>--%>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="fontawesome/css/all.css" />
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
    <!-- MDB -->
    <link rel="stylesheet" href="mdb/css/mdb.min.css" />
    <!-- Custom styles -->
    <link rel="stylesheet" href="mastercss/style.css" />
    <%--Jquery Data tables--%>
    <link href="Datatables/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="Datatables/jquery.dataTables.min.js" rel="javascript"></script>
   <style>
       body{
           
           background:url('mastercss/female-hands-writing-plan-notepad-holding-coffee-tablet-money-wooden-background.jpg') ;
           background-size: cover;
           
              
       }
       text-container{
           display:flex;
           align-content:center;
           justify-content:center;
       }
   

   </style>
   
 </head>
    <body>
        <nav id="main-navbar" class="navbar navbar-expand-lg navbar-light bg-white fixed-top" style="opacity:0.8">
            <!-- Container wrapper -->
        
            <div class="container-fluid">
                <!-- Toggle button -->
                <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>

                <!-- Brand -->
                <a class="navbar-brand" style="padding-left:125px" href="#">To-Do
                </a>
                <!-- Right links -->

                <ul class="navbar-nav ms-auto d-flex flex-row" style="padding-right:155px;">
                    <!-- here we will provide over github repoIcon -->
                    <li class="nav-item me-3 me-lg-0">
                        <a class="nav-link" href="#">
                            <i class="fab fa-github"></i>
                        </a>
                    </li>
                    <!-- Avatar -->
                    <li class="nav-item me-3 me-lg-0">
                        <a class="nav-link" href="login.aspx">
                           Login
                        </a>
                    </li>
                    <li class="nav-item me-3 me-lg-0">
                        <a class="nav-link" href="signup.aspx">
                           Signup
                        </a>
                    </li>
                </ul>
                     
                     
            </div>
           
            <!-- Container wrapper -->
        </nav>
        
        <br /><br /><br /><br /><br /><br />

   <div >
       <h2 style="display:flex;justify-content:center;text-align:center">&nbsp &nbsp Free Up Your Mind Space <br />With ToDO</h2>  
   </div ><br />
        
        <div style="display:flex;justify-content:center">
            <a href="login.aspx">
                <input class="btn btn-primary" type="submit" value="Get Started"  />
            </a>
           </div>
        
    </body>
    </html>
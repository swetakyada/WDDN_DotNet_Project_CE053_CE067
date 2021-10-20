<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ToDo.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Fontawesome/css/all.css" rel="stylesheet" />
    <style>
         body{
           background:url('mastercss/female-hands-writing-plan-notepad-holding-coffee-tablet-money-wooden-background.jpg') ;
           background-size: cover;
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
                <a class="navbar-brand" style="padding-left:125px" href="HomePage.aspx">To-Do
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
    <form id="form1" runat="server" style="padding-top:90px;">
        <div class="container pt-lg-5" >
            <div class="row">
                <div class="col-4 mx-auto">
                    <div class="card mx-auto">
                        <div class="card-body" style="background-color:#eeeff0">
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <i class="fa fa-user-circle fa-7x" aria-hidden="true"></i>
                                    </center>
                                </div>
                            </div>
                             <div class="row">
                                <div class="col">
                                   <center>
                                        <h4>User Login</h4>
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                   <hr />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                   <div class="form-group">
                                       <label>Email Address</label>
                                       <asp:TextBox name="Email" CssClass="form-control" runat="server" ID="Textbox1" placeholder="Email Address"></asp:TextBox>
                                   </div>
                                   <div class="form-group">
                                       <label>Password</label>
                                       <asp:TextBox name="Password" CssClass="form-control" runat="server" ID="Textbox2" placeholder="Password" TextMode="Password"></asp:TextBox>
                                        <br />
                                   </div>
                                    <div class="form-group">
                                        <asp:Button ID="Button1" CssClass="form-control btn btn-primary btn-block btn-lg" runat="server" Text="Login" OnClick="Button1_Click" />
                                    </div>
                                    <div class="form-group">
                                        <center>
                                            <h6 class="pt-2">New User? Signup <a href="signup.aspx">here</a></h6>
                                        </center>

                                    </div>
                                 </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="Bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

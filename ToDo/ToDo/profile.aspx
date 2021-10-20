<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="ToDo.profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Profile</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="fontawesome/css/all.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
    <link rel="stylesheet" href="mdb/css/mdb.min.css" />
    <link rel="stylesheet" href="mastercss/style.css" />
    <link href="Datatables/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="Datatables/jquery.dataTables.min.js" rel="javascript"></script>
   
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table1").prepend($("<thead></thead>").append($(this).find("tr:first")))
                .DataTable({
                    paging: true,
                    info: false,
                    
                    fixedHeader: {
                        header: true,
                        footer: true
                    }
                });
        });
    </script>

    <style>
        .checklist input[type="checkbox"]
        {
               margin-right:14px;
               width: 16px;
               height: 16px;
               cursor:pointer;
        }
        .checklist input[type="text"]{
            cursor:pointer;
        }
        .drop_lable{
            padding-right:12px;
            padding-left:10px;
            font-size:14px;
        }
        .tblfooter{
    
            padding-right:20px;
        }
        table.datatable.search{
            background-color:white;
        }
      .dataTables_wrapper .dataTables_filter input{
          background-color:white;
      }
    </style>
</head>
<body>
    <!--Main Navigation-->
    <header>
        <!-- Sidebar -->
        <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white">
            <div class="position-sticky">
                <div class="list-group list-group-flush mx-3 mt-4">
                    <a href="Todo_Dashboard.aspx" class="list-group-item list-group-item-action py-2 ripple" aria-current="true">
                        <i class="fas fa-tasks fa-fw me-3"></i><span>Your To-Do</span>
                    </a>
                   
                    <a href="profile.aspx" class="list-group-item list-group-item-action py-2 ripple"><i
                        class="fas fa-user-circle fa-fw me-3"></i><span>Profile</span></a>
                    <a href="login.aspx" class="list-group-item list-group-item-action py-2 ripple"><i
                        class="fas fa-sign-out-alt fa-fw me-3"></i><span>Logout</span></a>
                </div>
            </div>
        </nav>
        <!-- Sidebar -->

        <!-- Navbar -->
        <nav id="main-navbar" class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <!-- Toggle button -->
                <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>

                <!-- Brand -->
                <a class="navbar-brand" href="#">To-Do
                </a>
                <!-- Right links -->
                <ul class="navbar-nav ms-auto d-flex flex-row">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle hidden-arrow d-flex align-items-center" href="#" id="navbarDropdownMenuLink" role="button" data-mdb-toggle="dropdown" aria-expanded="false">
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuLink">
                            <li><a class="dropdown-item" href="profile.aspx">My profile</a></li>
                            <li><a class="dropdown-item" href="login.aspx">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- Container wrapper -->
        </nav>
        <!-- Navbar -->
    </header>
    <!--Main Navigation-->
    
    <!--Main layout-->
    <main style="margin-top: 50px">
        <h2>Profile</h2>
        <form id="form2" runat="server">
        <div class="container pt-lg-5 m-5 mx-auto h-100">
            <div class="row h-100 m-auto">
                <div class="col-8 colborder">
                     <div class="card mx-auto" style="background-color: #eff1f2">
                       <div class="card-body p-lg-5">
                           <div class="row" >
                               <div class="col">
                                   <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label>
&nbsp;:
                                   <asp:Label ID="Label3" runat="server" Text="username"></asp:Label>
                                   <br />
                                   <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
&nbsp;:
                                   <asp:Label ID="Label4" runat="server" Text="email"></asp:Label>
                                   <br />
                                   <br />
                                   <asp:Button ID="Button1" runat="server" Text="Edit Profile" OnClick="Button1_Click" />
                                   <br />
                                   <br />
                                   <asp:Button ID="Button2" runat="server" Text="Change Password" OnClick="Button2_Click" />
                                </div>
                             </div>
                         </div>
                     </div>
                  </div>
               </div>
            </div>
        </form>
    </main>
    <!--Main layout-->
    <script type="text/javascript" src="mdb/js/mdb.min.js"></script>
    <!-- Custom scripts -->
    <script type="text/javascript" src="masterjs/script.js"></script>
</body>
</html>

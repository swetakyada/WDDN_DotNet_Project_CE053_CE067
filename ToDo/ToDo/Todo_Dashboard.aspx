<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Todo_Dashboard.aspx.cs" Inherits="ToDo.Todo_Dashboard" %>
    <%@ Register
        Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
        Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>ToDO</title>
            <%--jquery--%><a href="Todo_Dashboard.aspx">Todo_Dashboard.aspx</a>
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
                <%--<link href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" />--%>
                <!-- Font Awesome -->
                <link rel="stylesheet" href="fontawesome/css/all.css" />
                <!-- Google Fonts Roboto -->
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
                <!-- MDB -->
                <link rel="stylesheet" href="mdb/css/mdb.min.css" />
                <!-- Custom styles -->
                <link rel="stylesheet" href="mastercss/style.css" />
                <%--Jquery Data tables--%>
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
                        .checklist input[type="checkbox"] {
                            margin-right: 14px;
                            width: 16px;
                            height: 16px;
                            cursor: pointer;
                        }

                        .checklist input[type="text"] {
                            cursor: pointer;
                        }

                        .drop_lable {
                            padding-right: 12px;
                            padding-left: 10px;
                            font-size: 14px;
                        }

                        .tblfooter {

                            padding-right: 20px;
                        }

                        table.datatable.search {
                            background-color: white;
                        }

                        .dataTables_wrapper .dataTables_filter input {
                            background-color: white;
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
                            <a href="#" class="list-group-item list-group-item-action py-2 ripple" aria-current="true">
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
                        <!-- Brand -->
                        <center>
                            <a class="navbar-brand" href="#">
                                <h2>To-Do</h2>
                            </a>
                        </center>
                    </div>
                    <!-- Container wrapper -->
                </nav>
                <!-- Navbar -->
            </header>
            <!--Main Navigation-->

            <!--Main layout-->
            <main style="margin-top: 50px">
                <form id="form2" runat="server">
                    <div class="container pt-lg-5 m-5 mx-auto h-100">
                        <div class="row h-100 m-auto">
                            <div class="col-8 colborder">
                                <div class="card mx-auto" style="background-color: #eff1f2">
                                    <div class="card-body p-lg-5">

                                        <div class="row">
                                            <div class="col p-3" style="display:flex;justify-content:flex-end">

                                            </div>
                                        </div>
                                        <br /><br /><br />
                                        <div class="row">
                                            <div class="col">
                                                <center>
                                                    <asp:GridView ID="GridView1" OnRowDataBound="GridView1_RowDataBound"
                                                        CssClass="table1" runat="server" CellPadding="10"
                                                        AutoGenerateColumns="False" DataKeyNames="todo_id"
                                                        DataSourceID="SqlDataSource1" ShowFooter="True"
                                                        BackColor="#DEBA84" BorderColor="#660033" BorderStyle="None"
                                                        BorderWidth="0px" CellSpacing="7" UseAccessibleHeader="False"
                                                        Font-Names="Helvetica" Height="30px" GridLines="None"
                                                        ShowHeaderWhenEmpty="True">
                                                        <Columns>
                                                            <asp:TemplateField ShowHeader="False">
                                                                <ItemTemplate>

                                                                    <asp:LinkButton ID="LinkButton3" runat="server"
                                                                        ForeColor="green" OnClick="LinkButton3_Click"
                                                                        CausesValidation="False" Text="Done"><i
                                                                            style="color:white" class="fa fa-square"
                                                                            aria-hidden="true"></i> </asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="todo_id"
                                                                InsertVisible="False" SortExpression="todo_id"
                                                                Visible="False">

                                                                <EditItemTemplate>
                                                                    <asp:Label ID="Label1" runat="server"
                                                                        Text='<%# Eval("todo_id") %>'></asp:Label>
                                                                </EditItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label1" runat="server"
                                                                        Text='<%# Bind("todo_id") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="task"
                                                                SortExpression="task_name">
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="TextBox1" runat="server"
                                                                        Text='<%# Bind("task_name") %>'></asp:TextBox>
                                                                </EditItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label2" runat="server"
                                                                        Text='<%# Bind("task_name") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="TaskName"
                                                                        CssClass="tblfooter p-2 m-auto form-control"
                                                                        placeholder="Add Task" runat="server">
                                                                    </asp:TextBox>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="date_added"
                                                                SortExpression="date_added" Visible="False">
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="TextBox2" runat="server"
                                                                        Text='<%# Bind("date_added") %>'></asp:TextBox>
                                                                </EditItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label3" runat="server"
                                                                        Text='<%# Bind("date_added", "{0:s}") %>'>
                                                                    </asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="due"
                                                                SortExpression="due_date">
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="TextBox3"
                                                                        style="font-size:12px;opacity:0.7"
                                                                        TextMode="Date" runat="server"
                                                                        Text='<%# Bind("due_date") %>'></asp:TextBox>
                                                                </EditItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label4"
                                                                        style="font-size:12px;opacity:0.7"
                                                                        runat="server"
                                                                        Text='<%# Bind("due_date", "{0:M}") %>'>
                                                                    </asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="DueDate"
                                                                        style="font-size:14px;opacity:0.7"
                                                                        Text="<i class='icon-camera-retro'></i>"
                                                                        CssClass="tblfooter p-0 m-0" TextMode="Date"
                                                                        runat="server"></asp:TextBox>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server"
                                                                        CausesValidation="False" CommandName="Edit"> <i
                                                                            style="color:green" class="fa fa-pen"
                                                                            aria-hidden="true"></i></asp:LinkButton>
                                                                    &nbsp;<asp:LinkButton ID="LinkButton2" type="button"
                                                                        runat="server" CausesValidation="False"
                                                                        CommandName="Delete" Text="Delete"><i
                                                                            style="color:red" class="fa fa-trash"
                                                                            aria-hidden="true"></i></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>

                                                                    <asp:LinkButton ID="LinkButton1"
                                                                        CssClass="btn btn-outline-info" runat="server"
                                                                        CausesValidation="True" CommandName="Update"
                                                                        Text="Update"></asp:LinkButton>
                                                                    &nbsp;<asp:LinkButton ID="LinkButton2"
                                                                        runat="server" CausesValidation="False"
                                                                        CommandName="Cancel" Text="Cancel"><i
                                                                            style="color:dimgray;font-size:large"
                                                                            class="fa fa-times" aria-hidden="true"></i>
                                                                    </asp:LinkButton>
                                                                </EditItemTemplate>

                                                                <FooterTemplate>
                                                                    <asp:Button ID="Add"
                                                                        CssClass="tblfooter btn btn-primary"
                                                                        OnClick="Add_Click" runat="server"
                                                                        Text="Add Task" />
                                                                </FooterTemplate>
                                                            </asp:TemplateField>



                                                        </Columns>
                                                        <FooterStyle BackColor="#eff1f2" ForeColor="#8C4510" />
                                                        <HeaderStyle BackColor="#eff1f2" ForeColor="black"
                                                            BorderStyle="None" />
                                                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center"
                                                            Font-Names="Roboto" />
                                                        <RowStyle BackColor="#eff1f2" ForeColor="#003300"
                                                            BorderColor="#eff1f2" Wrap="True" />
                                                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True"
                                                            ForeColor="#eff1f2" />
                                                    </asp:GridView>
                                                </center>

                                                <asp:SqlDataSource ID="SqlDataSource1" EnableCaching="True"
                                                    runat="server"
                                                    ConnectionString="<%$ ConnectionStrings:ToDoDbConnectionString %>"
                                                    DeleteCommand="DELETE FROM [toDoItems] WHERE [todo_id] = @todo_id"
                                                    InsertCommand="INSERT INTO [toDoItems] ([task_name], [date_added], [due_date], [user_id]) VALUES (@task_name, @date_added, @due_date, @user_id)"
                                                    SelectCommand="SELECT * FROM [toDoItems] WHERE ([user_id] = @user_id) ORDER BY [date_added], [due_date]"
                                                    UpdateCommand="UPDATE [toDoItems] SET [task_name] = @task_name, [date_added] = @date_added, [due_date] = @due_date, [user_id] = @user_id WHERE [todo_id] = @todo_id">
                                                    <%--<FilterParameters>
                                                        <asp:ControlParameter ControlID="DropDownList1"
                                                            PropertyName="SelectedValue" />
                                                        </FilterParameters>--%>
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="todo_id" Type="Int32" />
                                                        </DeleteParameters>
                                                        <InsertParameters>
                                                            <asp:Parameter Name="task_name" Type="String" />
                                                            <asp:Parameter DbType="Date" Name="date_added" />
                                                            <asp:Parameter Name="due_date" DbType="Date" />
                                                            <asp:Parameter Name="user_id" Type="Int32" />
                                                        </InsertParameters>
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="user_id" SessionField="user_id"
                                                                Type="Int32" />
                                                        </SelectParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="task_name" Type="String" />
                                                            <asp:Parameter DbType="Date" Name="date_added" />
                                                            <asp:Parameter Name="due_date" DbType="Date" />
                                                            <asp:Parameter Name="user_id" Type="Int32"></asp:Parameter>
                                                            <asp:Parameter Name="todo_id" Type="Int32" />
                                                        </UpdateParameters>
                                                </asp:SqlDataSource>
                                                <%-- <asp:Button ID="Button1" OnClick="Button1_Click" runat="server"
                                                    Text="Download Pdf" />--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-4 colborder">
                                <h6>Bargraph based on task completed</h6>
                                <asp:Chart ID="Chart1" runat="server" DataSourceID="LinqDataSource1">
                                    <Series>
                                        <asp:Series Name="Series1" ChartType="Bar" XValueMember="date"
                                            YValueMembers="completed_task"></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>

                                <asp:LinqDataSource ID="LinqDataSource1" runat="server"
                                    ContextTypeName="ToDo.ToDoSqlDataContext" EntityTypeName="" TableName="Bargraphs"
                                    Where="user_id == @user_id">
                                    <WhereParameters>
                                        <asp:SessionParameter Name="user_id" SessionField="user_id" Type="Int32" />
                                    </WhereParameters>
                                </asp:LinqDataSource>

                            </div>
                        </div>
                    </div>
                </form>
                <!-- todolist -->
                <!-- todolistend -->
            </main>
            <!--Main layout-->
            <!-- MDB -->
            <script type="text/javascript" src="mdb/js/mdb.min.js"></script>
            <!-- Custom scripts -->
            <script type="text/javascript" src="masterjs/script.js"></script>
        </body>

        </html>
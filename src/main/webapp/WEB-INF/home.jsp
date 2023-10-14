<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<%--include header--%>
<c:import url="/WEB-INF/includes/header.jsp" />

<body class="sidebar-mini layout-fixed layout-navbar-fixed">
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>

<div class="wrapper">
<%--    include nav and sidebar  --%>
    <c:import url="/WEB-INF/includes/menu.jsp" />
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Dashboard</h1>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <!-- Small boxes (Stat box) -->
                <div class="row px-5 mx-2 my-2">
                    <!-- ./col -->
                    <div class="col-lg-3 col-6 mx-5">
                        <!-- small box -->
                        <div class="small-box bg-warning">
                            <div class="inner">
                                <h3>53<sup style="font-size: 20px"></sup></h3>
                                <p>Upcomming Exams</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="viewExams" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-6 mx-5">
                        <!-- small box -->
                        <div class="small-box bg-success">
                            <div class="inner">
                                <h3>44</h3>
                                <p>Registered Students</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-add"></i>
                            </div>
                            <a href="viewStudents" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-6 mx-5">
                        <!-- small box -->
                        <div class="small-box bg-primary">
                            <div class="inner">
                                <h3>65</h3>
                                <p>Teachers</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-stalker"></i>
                            </div>
                            <a href="viewStaff" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                </div>
                <!-- /.row -->
                <!-- Main row -->
                <div class="row">
                    <!-- Left col -->
                    <section class="col-lg-6 connectedSortable">
                        <!-- Custom tabs (Charts with tabs)-->
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">
                                    <i class="fas fa-chart-pie mr-1"></i>
                                    Sales
                                </h3>
                                <div class="card-tools">
                                    <ul class="nav nav-pills ml-auto">
                                        <li class="nav-item">
                                            <a class="nav-link active" href="#revenue-chart" data-toggle="tab">Area</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#sales-chart" data-toggle="tab">Donut</a>
                                        </li>
                                    </ul>
                                </div>
                            </div><!-- /.card-header -->
                            <div class="card-body">
                                <div class="tab-content p-0">
                                    <!-- Morris chart - Sales -->
                                    <div class="chart tab-pane active" id="revenue-chart"
                                         style="position: relative; height: 300px;">
                                        <canvas id="revenue-chart-canvas" height="300" style="height: 300px;"></canvas>
                                    </div>
                                    <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;">
                                        <canvas id="sales-chart-canvas" height="300" style="height: 300px;"></canvas>
                                    </div>
                                </div>
                            </div><!-- /.card-body -->
                        </div>
                        <!-- /.card -->

                    </section>
                    <!-- /.Left col -->
                    <!-- right col (We are only adding the ID to make the widgets sortable)-->
                    <section class="col-lg-6 connectedSortable">



                        <!-- solid sales graph -->
                        <div class="card bg-gradient-info">
                            <div class="card-header border-0">
                                <h3 class="card-title">
                                    <i class="fas fa-th mr-1"></i>
                                    Sales Graph
                                </h3>

                                <div class="card-tools">
                                    <button type="button" class="btn bg-info btn-sm" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                    <button type="button" class="btn bg-info btn-sm" data-card-widget="remove">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                <canvas class="chart" id="line-chart" style="min-height: 250px; height: 300px; max-height: 300px; max-width: 100%;"></canvas>
                            </div>
                            <!-- /.card-body -->
<%--                            <div class="card-footer bg-transparent">--%>
<%--                                <div class="row">--%>
<%--                                    <div class="col-4 text-center">--%>
<%--                                        <input type="text" class="knob" data-readonly="true" value="20" data-width="60" data-height="60"--%>
<%--                                               data-fgColor="#39CCCC">--%>

<%--                                        <div class="text-white">Mail-Orders</div>--%>
<%--                                    </div>--%>
<%--                                    <!-- ./col -->--%>
<%--                                    <div class="col-4 text-center">--%>
<%--                                        <input type="text" class="knob" data-readonly="true" value="50" data-width="60" data-height="60"--%>
<%--                                               data-fgColor="#39CCCC">--%>

<%--                                        <div class="text-white">Online</div>--%>
<%--                                    </div>--%>
<%--                                    <!-- ./col -->--%>
<%--                                    <div class="col-4 text-center">--%>
<%--                                        <input type="text" class="knob" data-readonly="true" value="30" data-width="60" data-height="60"--%>
<%--                                               data-fgColor="#39CCCC">--%>

<%--                                        <div class="text-white">In-Store</div>--%>
<%--                                    </div>--%>
<%--                                    <!-- ./col -->--%>
<%--                                </div>--%>
<%--                                <!-- /.row -->--%>
<%--                            </div>--%>
                            <!-- /.card-footer -->
                        </div>
                        <!-- /.card -->


                        <!-- /.card -->
                        <!-- Map card -->
                        <div class="card bg-gradient-primary" style="display: none">
                            <div class="card-header border-0">
                                <h3 class="card-title">
                                    <i class="fas fa-map-marker-alt mr-1"></i>
                                    Visitors
                                </h3>
                                <!-- card tools -->
                                <div class="card-tools">
                                    <button type="button" class="btn btn-primary btn-sm daterange" title="Date range">
                                        <i class="far fa-calendar-alt"></i>
                                    </button>
                                    <button type="button" class="btn btn-primary btn-sm" data-card-widget="collapse" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                                <!-- /.card-tools -->
                            </div>
                            <!-- /.card-body-->
                            <div class="card-footer bg-transparent">
                                <div class="row">
                                    <div class="col-4 text-center">
                                        <div id="sparkline-1"></div>
                                        <div class="text-white">Visitors</div>
                                    </div>
                                    <!-- ./col -->
                                    <div class="col-4 text-center">
                                        <div id="sparkline-2"></div>
                                        <div class="text-white">Online</div>
                                    </div>
                                    <!-- ./col -->
                                    <div class="col-4 text-center">
                                        <div id="sparkline-3"></div>
                                        <div class="text-white">Sales</div>
                                    </div>
                                    <!-- ./col -->
                                </div>
                                <!-- /.row -->
                            </div>
                        </div>
                        <!-- /.card -->
                    </section>
                    <!-- right col -->
                </div>
                <!-- /.row (main row) -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

<%--    include footer--%>
    <c:import url="/WEB-INF/includes/footer.jsp" />
</div>
<script>
    document.getElementById("dash").classList.add("active");
</script>

<%--include js stuff--%>
<c:import url="/WEB-INF/includes/jsContent.jsp" />

</body>
</html>
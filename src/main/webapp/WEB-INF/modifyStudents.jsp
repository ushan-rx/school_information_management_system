<%--
  Created by IntelliJ IDEA.
  User: ushan
  Date: 10/8/2023
  Time: 6:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<%--include header--%>
<c:import url="/WEB-INF/includes/header.jsp"/>

<body class="sidebar-mini layout-fixed layout-navbar-fixed">

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>

<div class="wrapper">
    <%--    include nav and sidebar  --%>
    <c:import url="/WEB-INF/includes/menu.jsp"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" style="min-height: 106.4px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Manage Students</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="viewStudents">View students</a></li>
                            <li class="breadcrumb-item active">Manage Students</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->


        <div class="container-fluid py-1">

            <!-- /.row -->
            <div class="col-md-9 mx-auto">
                <!-- general form elements -->
                <div class="card card-success">
                    <div class="card-header">
                        <h3 class="card-title">Student Details</h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form>
                        <div class="card-body">
                            <div class="form-group">
                                <label>First Name</label>
                                <input class="form-control" type="text" placeholder="">
                            </div>

                            <div class="form-group">
                                <label>Last Name</label>
                                <input class="form-control" type="text" placeholder="">
                            </div>

                            <div class="form-group">
                                <label>Date of Birth:</label>
                                <div class="input-group date" id="reservationdate" data-target-input="nearest">
                                    <input type="text" class="form-control datetimepicker-input"
                                           data-target="#reservationdate"/>
                                    <div class="input-group-append" data-target="#reservationdate"
                                         data-toggle="datetimepicker">
                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Gender</label>
                                <select class="form-control">
                                    <option disabled="disabled" selected>Select</option>
                                    <option>Male</option>
                                    <option>Female</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>City</label>
                                <input class="form-control" type="text" placeholder="">
                            </div>

                            <div class="form-group">
                                <label>Grade</label>
                                <select class="form-control">
                                    <option disabled="disabled" selected>Select</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Class</label>
                                <select class="form-control">
                                    <option disabled="disabled" selected>Select</option>
                                    <option>A</option>
                                    <option>B</option>
                                    <option>C</option>
                                    <option>D</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Guardian Name</label>
                                <input class="form-control" type="text" placeholder="">
                            </div>

                            <div class="form-group">
                                <label>Guardian Phone Number:</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                    </div>
                                    <input type="text" class="form-control">
                                </div>
                                <!-- /.input group -->

                            </div>

                        </div>
                        <!-- /.card-body -->

                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="form-group">
                                        <label>Student ID</label>
                                        <input class="form-control" type="text" placeholder="Enter Id here to search">
                                    </div>
                                </div>
                                <div class="col-lg-4 py-4">
                                    <button type="submit" class="btn btn-secondary my-2 w-50">Search</button>
                                </div>
                            </div>

                        </div>

                        <div class="card-footer">
                            <button type="submit" class="btn bg-gradient-success mx-3 float-right btn-lg">Insert
                            </button>
                            <button type="submit" class="btn btn-primary mx-3 float-right btn-lg">Update</button>
                            <button type="submit" class="btn bg-gradient-danger mx-3 float-right btn-lg">Delete</button>
                        </div>
                    </form>
                </div>
                <!-- /.card -->


                <!-- /.card -->
            </div>
        </div>
    </div>
    <%--    include footer--%>
    <c:import url="/WEB-INF/includes/footer.jsp"/>
    <script>
        document.getElementById("amst").classList.add("active");
        document.getElementById("mstud").classList.add("active");
        document.getElementById("mstud").parentElement.classList.add("menu-open");
    </script>
    <%--include js stuff--%>
    <c:import url="/WEB-INF/includes/jsContent.jsp"/>
    <script>
        $(function () {
            //Date picker
            $('#reservationdate').datetimepicker({
                format: 'Y-M-D'
            });
        })
    </script>

</body>


</html>

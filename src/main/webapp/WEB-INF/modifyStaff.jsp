<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.school.classes.Staff" %><%--
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
    HashMap<String,String> subjectlist = (HashMap<String, String>) request.getAttribute("subjectlist");

    Staff st = (Staff) request.getAttribute("staff");

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
                        <h1>Manage Staff</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="viewStaff">View staff</a></li>
                            <li class="breadcrumb-item active">Manage Staff</li>
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
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Staff Details</h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form action="manageStaff" method="post" name="staff">
                        <div class="card-body">

                            <div class="form-group">
                                <label>First Name</label>
                                <input class="form-control" type="text" placeholder="" id="fname" name="fname" value="<% out.print(st == null ? "" : st.getFname()); %>">
                            </div>

                            <div class="form-group">
                                <label>Last Name</label>
                                <input class="form-control" type="text" placeholder="" id="lname" name="lname" value="<% out.print(st == null ? "" : st.getLname()); %>">
                            </div>

                            <div class="form-group">
                                <label>Date of Birth:</label>
                                <div class="input-group date" id="reservationdate" data-target-input="nearest" >
                                    <input type="text" class="form-control datetimepicker-input"
                                           data-target="#reservationdate"  name = "dob" value="<% out.print(st == null ? "" : st.getDob()); %>"/>
                                    <div class="input-group-append" data-target="#reservationdate"
                                         data-toggle="datetimepicker">
                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Gender</label>
                                <select class="form-control" id="gender" name="gender">
                                    <option disabled="disabled" selected>Select</option>
                                    <option value="M">Male</option>
                                    <option value="F">Female</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Phone Number:</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                    </div>
                                    <input type="text" class="form-control" id="num" name="telno" value="<% out.print(st == null ? "" : st.getTelno()); %>">
                                </div>
                                <!-- /.input group -->
                            </div>

                            <div class="form-group">
                                <label>Role</label>
                                <select class="form-control" id="role" name="role">
                                    <option disabled="disabled" selected>Select</option>
                                    <option value="adm">Admin</option>
                                    <option value="sh">Sectional Head</option>
                                    <option value="tch">Teacher</option>
                                </select>
                            </div>
                            <%--optional--%>
                            <div class="form-group">
                                <label>Subject</label>
                                <select class="form-control" id="sub" name="sub">
                                    <option disabled="disabled" selected>Select</option>
                                    <%
                                        for (Map.Entry sub : subjectlist.entrySet()){
                                            out.print(" <option value=\""+sub.getKey()+"\">"+sub.getValue()+"</option>");


                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" name="email" class="form-control" id="exampleInputEmail1"
                                       placeholder="Enter email" value="<% out.print(st == null ? "" : st.getEmail()); %>">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" name="pwd"
                                       placeholder="Password" value="<% out.print(st == null ? "" : st.getPwd()); %>">
                            </div>

                        </div>
                        <!-- /.card-body -->

                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="form-group">
                                        <label>Staff ID</label>
                                        <input class="form-control" type="text" placeholder="Enter Id here to search" name="sid" value="<% out.print(st == null ? "" : st.getSid()); %>"<% out.print(st == null ? "" : "readonly"); %>>
                                    </div>
                                </div>
                                <div class="col-lg-4 py-4">
                                    <button type="submit" class="btn btn-secondary my-2 w-50" name="submit-btn" value="search">Search</button>
                                </div>
                            </div>

                        </div>

                        <div class="card-footer">
                            <button type="submit" class="btn bg-gradient-success mx-3 float-right btn-lg" name="submit-btn" value ="insert" onclick="return validation()">Insert
                            </button>
                            <button type="submit" class="btn btn-primary mx-3 float-right btn-lg" name="submit-btn" value="update" onclick="return validation()">Update</button>
                            <button type="submit" class="btn bg-gradient-danger mx-3 float-right btn-lg" name="submit-btn" value="delete" onclick=" return search_delete()" >Delete</button>
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
        document.getElementById("ams").classList.add("active");
        document.getElementById("mstaff").classList.add("active");
        document.getElementById("mstaff").parentElement.classList.add("menu-open");
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
        <script src="<c:url value='/js/StaffValidation.js'/>"> </script>
</body>


</html>

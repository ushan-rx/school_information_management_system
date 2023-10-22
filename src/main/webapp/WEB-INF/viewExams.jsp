<%@ page import="java.util.List" %>
<%@ page import="com.school.classes.Exam" %>
<%@ page import="java.util.ArrayList" %><%--
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

    // retrieve exams arraylist from req object
    List<Exam> exams = (ArrayList<Exam>) request.getAttribute("examList");
    pageContext.setAttribute("exams", exams);
%>



<div class="wrapper">
    <%--    include nav and sidebar  --%>
    <c:import url="/WEB-INF/includes/menu.jsp"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Examination Details</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="manageExams">Manage Exams</a></li>
                            <li class="breadcrumb-item active">View Exams</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <form action="viewExams" method="post">
                    <div class="form-row">
                        <div class="col-md-5 mb-3">
                            <label for="role">Select </label>
                            <select class="form-control" id="role" name="grade" required>
                                <option value="" disabled="disabled" selected>Select Grade</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                        <div class="col-md-2 mb-3 py-4">
                            <button class="btn btn-info w-50 my-2 mx-5" type="submit">Search</button>
                        </div>
                    </div>

                </form>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title"></h3>

                                <div class="card-tools">
                                    <div class="input-group input-group-sm" style="width: 150px;">
                                        <input type="text" name="table_search" class="form-control float-right"
                                               placeholder="Search">

                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-default">
                                                <i class="fas fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body table-responsive p-0" style="height: 400px;">
                                <table class="table table-head-fixed text-nowrap table-bordered">
                                    <thead>
                                    <tr>
                                        <th>Exam ID</th>
                                        <th>Exam Name</th>
                                        <th>Method</th>
                                        <th>Subject ID</th>
                                        <th>Grade</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                        <th>Duration (min)</th>
                                        <th>Total Marks</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="exam" items='${exams}'>
                                    <tr>
                                        <td>${exam.id}</td>
                                        <td>${exam.name}</td>
                                        <td><c:choose><c:when test="${exam.method.equals(\"O\")}">Online</c:when>
                                            <c:when test="${exam.method.equals(\"P\")}">Physical</c:when></c:choose>
                                        </td>
                                        <td>${exam.sub_id}</td>
                                        <td>${exam.grade}</td>
                                        <td>${exam.date}</td>
                                        <td>${exam.time}</td>
                                        <td>${exam.duration}</td>
                                        <td>${exam.total_marks}</td>
                                        <td></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>

    <%--    include footer--%>
    <c:import url="/WEB-INF/includes/footer.jsp"/>
</div>
<script>
    document.getElementById("vex").classList.add("active");
    document.getElementById("mex").classList.add("active");
    document.getElementById("mex").parentElement.classList.add("menu-open");
</script>
<%--include js stuff--%>
<c:import url="/WEB-INF/includes/jsContent.jsp"/>

</body>


</html>

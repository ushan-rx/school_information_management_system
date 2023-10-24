<%--
  Created by IntelliJ IDEA.
  User: ushan
  Date: 10/23/2023
  Time: 8:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.school.classes.Exam" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.school.classes.Result" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %><%--
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
  List<Result> results = (ArrayList<Result>) request.getAttribute("resultList");
  pageContext.setAttribute("results", results);

  // retrieve classes Hashmap from req object
  HashMap<String, String> classes = (HashMap<String, String>) request.getAttribute("classList");

  // retrieve exams Hashmap from req object
  HashMap<String, String> exams = (HashMap<String, String>) request.getAttribute("examList");
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
              <li class="breadcrumb-item"><a href="home">Dashboard</a></li>
              <li class="breadcrumb-item active">View Results</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <form action="viewResults" method="post">
          <div class="form-row">
            <div class="col-md-5 mb-3">
              <label for="class">Select </label>
              <select class="form-control" id="class" name="class" required>
                <option value="" disabled="disabled" selected>Select Class</option>
                <%
                  for(Map.Entry cls : classes.entrySet()){
                    out.print("<option value=\""+cls.getKey()+"\">"+cls.getValue()+"</option>");
                  }
                %>
              </select>
            </div>
            <div class="col-md-5 mb-3">
              <label for="exam">Select </label>
              <select class="form-control" id="exam" name="exam" required>
                <option value="" disabled="disabled" selected>Select Exam</option>
                <%
                  for(Map.Entry exam : exams.entrySet()){
                    out.print("<option value=\""+exam.getKey()+"\">"+exam.getValue()+"</option>");
                  }
                %>
              </select>
            </div>
            <div class="col-md-2 mb-3 py-4">
              <button class="btn btn-info w-50 my-2 mx-5" type="submit">Search</button>
            </div>
            <div class="col-md-2 mb-3 py-1">
              <a class="btn btn-danger w-50 my-1 mx-1" href="viewResults">Reset</a>
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
                    <th>Student ID</th>
                    <th>Subject ID</th>
                    <th>Exam ID</th>
                    <th>Class ID</th>
                    <th>Mark</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="result" items='${results}'>
                    <tr>
                      <td>${result.sid}</td>
                      <td>${result.subId}</td>
                      <td>${result.exId}</td>
                      <td>${result.classId}</td>
                      <td>${result.mark}</td>
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
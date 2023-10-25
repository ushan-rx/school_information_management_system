<%@ page import="java.util.List" %>
<%@ page import="com.school.classes.Staff" %>
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

    List<Staff> staffs = (ArrayList<Staff>) request.getAttribute("staffList");
    pageContext.setAttribute("staffs", staffs);
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
                        <h1>Staff Details</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="manageStaff">Manage Staff</a></li>
                            <li class="breadcrumb-item active">View Staff</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <form action="viewStaff" method="post">
                    <div class="form-row">
                        <div class="col-md-5 mb-3">
                            <label for="role">Select 1</label>
                            <select class="form-control" id="role" name="role" required>
                                <option value="" disabled="disabled" selected>Select Role</option>
                                <option value="adm">Admin</option>
                                <option value="sh">Sectional Head</option>
                                <option value="tch">Teacher</option>
                            </select>
                        </div>
                        <div class="col-md-2 mb-3 py-4">
                            <button class="btn btn-primary w-50 my-2 mx-5" type="submit">Search</button>
                        </div>
                        <div class="col-md-2 mb-3 py-4">
                            <a class="btn btn-danger w-50 my-2 mx-1" href="viewStaff">Reset</a>
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
                                        <th>ID</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th> Date of Birth</th>
                                        <th>Gender</th>
                                        <th>Telephone</th>
                                        <th>Role</th>
                                        <th>Email</th>
                                        <th>Subject</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                 <c:forEach var="staff" items='${staffs}'>
                                     <tr>
                                         <td>${staff.sid}</td>
                                         <td>${staff.fname}</td>
                                         <td>${staff.lname}</td>
                                         <td>${staff.dob}</td>
                                         <td><c:choose><c:when test="${staff.gender.equals(\"M\")}">MALE</c:when>
                                             <c:when test="${staff.gender.equals(\"F\")}">FEMALE</c:when></c:choose>
                                         </td>
                                         <td>${staff.telno}</td>
                                         <td><c:choose><c:when test="${staff.role.equals(\"adm\")}">ADMIN</c:when>
                                             <c:when test="${staff.role.equals(\"sh\")}">SECTIONAL HEAD</c:when>
                                             <c:when test="${staff.role.equals(\"tch\")}">TEACHER</c:when>
                                         </c:choose>
                                         </td>
                                         <td>${staff.email}</td>
                                         <td>${staff.sub_id}</td>

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
    document.getElementById("vs").classList.add("active");
    document.getElementById("mstaff").classList.add("active");
    document.getElementById("mstaff").parentElement.classList.add("menu-open");
</script>
<%--include js stuff--%>
<c:import url="/WEB-INF/includes/jsContent.jsp"/>

</body>


</html>

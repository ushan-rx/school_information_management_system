<%@ page import="com.school.classes.Subject" %><%--
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


    Subject subject = (Subject) request.getAttribute("subject");

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
                        <h1>Manage Subjects</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="viewSubjects">View subjects</a></li>
                            <li class="breadcrumb-item active">Manage Subjects</li>
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
                <div class="card card-info">
                    <div class="card-header">
                        <h3 class="card-title">Subject Details</h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form action="" method="post" name="subject">
                        <div class="card-body">
                            <div class="form-group">
                                <label>Subject Name</label>
                                <label>
                                    <input type="text" name="sub_name" class="form-control" value="<% out.print(subject == null ? "" : subject.getSub_name()); %>">
                                </label>
                            </div>


                            <div class="form-group">
                                <label>Grade</label>
                                <label>
                                    <select name="sub_grade" class="form-control" id="sub_grade">
                                        <option disabled="disabled" selected>Select</option>
                                        <option value="1" <% if(subject != null)
                                            out.print(subject.getSub_grade().equals("1") ? "selected" : "");%>>1</option>
                                        <option value="2" <% if(subject != null)
                                            out.print(subject.getSub_grade().equals("2") ? "selected" : "");%>>2</option>
                                        <option value="3" <% if(subject != null)
                                            out.print(subject.getSub_grade().equals("3") ? "selected" : "");%>>3</option>
                                        <option value="4" <% if(subject != null)
                                            out.print(subject.getSub_grade().equals("4") ? "selected" : "");%>>4</option>
                                        <option value="5" <% if(subject != null)
                                            out.print(subject.getSub_grade().equals("5") ? "selected" : "");%>>5</option>
                                    </select>
                                </label>
                            </div>

                            <div class="form-group">
                                <label>Teacher Hours</label>
                                <label>
                                    <input name="sub_hrs" type="text" class="form-control" value="<% out.print(subject == null ? "" : subject.getTeaching_hrs()); %>">
                                </label>
                            </div>

                            <div class="form-group">
                                <label>Types of Tests</label>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" name="sub_test" type="checkbox"
                                           id="customCheckbox2" value="1" <% if(subject != null){
                                               if(subject.getExam_types().contains("1")){
                                                   out.print("checked");
                                                   }

                                           }%>>
                                    <label for="customCheckbox2" class="custom-control-label">Assignments</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" name="sub_test" type="checkbox"
                                           id="customCheckbox1" value="2" <% if(subject != null){
                                               if(subject.getExam_types().contains("2")){
                                                   out.print("checked");
                                                   }

                                           }%>>
                                    <label for="customCheckbox1" class="custom-control-label">Practicals</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" name="sub_test" type="checkbox"
                                           id="customCheckbox3" checked="" value="3" <% if(subject != null){
                                               if(subject.getExam_types().contains("3")){
                                                   out.print("checked");
                                                   }

                                           }%>>
                                    <label for="customCheckbox3" class="custom-control-label">Term Test</label>
                                </div>
                            </div>

                        </div>

                        <!-- /.card-body -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="form-group">
                                        <label>Subject ID</label>
                                        <input name="sub_id" class="form-control" type="text"
                                               placeholder="Enter Id here to search" value="<% out.print(subject == null ? "" : subject.getSub_id()); %>" >
                                    </div>
                                </div>
                                <div class="col-lg-4 py-4">
                                    <button type="submit" class="btn btn-secondary my-2 w-50" name="iuds" value="search"
                                            onclick="scrh_del()" >Search
                                    </button>
                                </div>
                            </div>

                        </div>

                        <div class="card-footer">
                            <button type="submit" class="btn bg-gradient-success mx-3 float-right btn-lg" name="iuds"
                                    value="insert" onclick="validateform()">Insert
                            </button>
                            <button type="submit" class="btn btn-primary mx-3 float-right btn-lg" name="iuds"
                                    value="update" onclick="validateform()">Update
                            </button>
                            <button type="submit" class="btn bg-gradient-danger mx-3 float-right btn-lg" name="iuds"
                                    value="delete" onclick="scrh_del()">Delete
                            </button>
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
        document.getElementById("amsb").classList.add("active");
        document.getElementById("msub").classList.add("active");
        document.getElementById("msub").parentElement.classList.add("menu-open");
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
    <script src="<c:url value='/js/subject_upendra.js'/>"></script>


</body>


</html>

<%@ page import="com.school.classes.Exam" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %><%--
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

    HashMap<String, String> subs = (HashMap<String, String>) request.getAttribute("subList");

    Exam exam = (Exam) request.getAttribute("exam");

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
                        <h1>Manage Examinations</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="viewExams">View Exams</a></li>
                            <li class="breadcrumb-item active">Manage Exams</li>
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
                        <h3 class="card-title">Exam Details</h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form action="manageExams" method="post">
                        <div class="card-body">
                            <div class="form-group">
                                <label>Exam Name</label>
                                <input class="form-control" type="text" placeholder="" name="exName" value="<% out.print(exam == null ? "" : exam.getName()); %>">
                            </div>

                            <div class="form-group">
                                <label>Grade</label>
                                <select class="form-control" name="grade" data-placeholder="">
                                    <option disabled="disabled" value="0" selected>Select</option>
                                    <option value="1" <% if(exam != null)
                                        out.print(exam.getGrade().equals("1") ? "selected" : "");%>>1</option>
                                    <option value="2" <% if(exam != null)
                                        out.print(exam.getGrade().equals("2") ? "selected" : "");%>>2</option>
                                    <option value="3" <% if(exam != null)
                                        out.print(exam.getGrade().equals("3") ? "selected" : "");%>>3</option>
                                    <option value="4" <% if(exam != null)
                                        out.print(exam.getGrade().equals("4") ? "selected" : "");%>>4</option>
                                    <option value="5" <% if(exam != null)
                                        out.print(exam.getGrade().equals("5") ? "selected" : "");%>>5</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Subject</label>
                                <select class="form-control" name="subject">
                                    <option disabled="disabled" value="0" selected>Select Subject</option>
                                    <%
                                        for(Map.Entry sub : subs.entrySet()){
                                            // check if exam object is null (check weather coming from search) and if its the selected option
                                            if(exam != null && sub.getKey().equals(exam.getSub_id())){
                                                out.print("<option value=\""+sub.getKey()+"\" selected>"+sub.getValue()+"</option>");
                                            }else{
                                                out.print("<option value=\""+sub.getKey()+"\">"+sub.getValue()+"</option>");
                                            }
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Date of Exam:</label>
                                <div class="input-group date" id="reservationdate" data-target-input="nearest">
                                    <input type="text" class="form-control datetimepicker-input"
                                           data-target="#reservationdate" name="date" value="<% out.print(exam == null ? "" : exam.getDate()); %>"/>
                                    <div class="input-group-append" data-target="#reservationdate"
                                         data-toggle="datetimepicker">
                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Time of exam:</label>
                                <div class="input-group date" id="timepicker" data-target-input="nearest">
                                    <input type="text" class="form-control datetimepicker-input" data-target="#timepicker" name="time" value="<% out.print(exam == null ? "" : exam.getTime()); %>">
                                    <div class="input-group-append" data-target="#timepicker" data-toggle="datetimepicker">
                                        <div class="input-group-text"><i class="far fa-clock"></i></div>
                                    </div>
                                </div>
                                <!-- /.input group -->
                            </div>

                            <div class="form-group">
                                <label>Time Duration</label>
                                <input class="form-control" type="text" placeholder="" name="duration" value="<% out.print(exam == null ? "" : exam.getDuration()); %>">
                            </div>

                            <div class="form-group">
                                <label>Total Marks</label>
                                <input class="form-control" type="text" placeholder="" name="marks" value="<% out.print(exam == null ? "" : exam.getTotal_marks()); %>">
                            </div>

                            <div class="form-group">
                                <label>Exam Method</label>
                                <select class="form-control" name="method">
                                    <option disabled="disabled" value="0" selected>Select Method</option>
                                    <option value="O">Online</option>
                                    <option value="P">Physical</option>
                                </select>
                            </div>


                        </div>

                        <!-- /.card-body -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="form-group">
                                        <label>Exam ID</label>
                                        <input class="form-control" type="text" placeholder="Enter Id here to search" name="exId" value="<% out.print(exam == null ? "" : exam.getId()); %>" <% out.print(exam == null ? "" : "readonly"); %>>
                                    </div>
                                </div>
                                <div class="col-lg-4 py-4">
                                    <button type="submit" class="btn btn-secondary my-2 w-50" name="submit-btn" value="srch">Search</button>
                                </div>
                            </div>

                        </div>

                        <div class="card-footer">
                            <button type="submit" class="btn bg-gradient-success mx-3 float-right btn-lg" name="submit-btn" value="ins">Insert
                            </button>
                            <button type="submit" class="btn btn-primary mx-3 float-right btn-lg" name="submit-btn" value="update">Update</button>
                            <button type="submit" class="btn bg-gradient-danger mx-3 float-right btn-lg " name="submit-btn" value="del">Delete</button>
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
        document.getElementById("ame").classList.add("active");
        document.getElementById("mex").classList.add("active");
        document.getElementById("mex").parentElement.classList.add("menu-open");
    </script>
    <%--include js stuff--%>
    <c:import url="/WEB-INF/includes/jsContent.jsp"/>
    <script>
        $(function () {
            //Date picker
            $('#reservationdate').datetimepicker({
                daysOfWeekDisabled: [0, 6],
                format: 'Y-M-D'
            });

            //Timepicker
            $('#timepicker').datetimepicker({
                format: 'H:m'
            })
        })
    </script>

</body>


</html>

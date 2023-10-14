<%--
  Created by IntelliJ IDEA.
  User: ushan
  Date: 10/3/2023
  Time: 9:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>School</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<c:url value='/plugins/fontawesome-free/css/all.min.css'/>">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="<c:url value='/plugins/icheck-bootstrap/icheck-bootstrap.min.css'/>">
  <!-- Theme style -->
  <link rel="stylesheet" href="<c:url value='/css/adminlte.min.css'/>">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a href="#" class="h1"><b>Academix</b>school</a>
    </div>
    <div class="card-body">
      <p class="login-box-msg">Sign in to start your session</p>

      <form action="login" method="POST">
        <div class="input-group mb-3">
          <input type="email" class="form-control" placeholder="Email" name="mail">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="Password" name="pw">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div>
          <button type="submit" class="btn btn-primary btn-block mb-1" value="submit">Sign In</button>
        </div>
      </form>
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="<c:url value='/plugins/jquery/jquery.min.js'/>"></script>
<!-- Bootstrap 4 -->
<script src="<c:url value='/plugins/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<!-- AdminLTE App -->
<script src="<c:url value='/js/adminlte.min.js'/>"></script>
</body>
</html>


<%--
  Created by IntelliJ IDEA.
  User: ushan
  Date: 10/3/2023
  Time: 8:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Preloader -->
<div class="preloader flex-column justify-content-center align-items-center">
  <img class="animation__shake" src="<c:url value='//img/AdminLTELogo.png'/>" alt="AdminLTELogo" height="60" width="60">
</div>

<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
  <!-- Left navbar links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
    </li>
    <li class="nav-item d-none d-sm-inline-block">
      <a href="#" class="nav-link">Profile</a>
    </li>

  </ul>

  <!-- Right navbar links -->
  <ul class="navbar-nav ml-auto">
    <!-- Navbar Search -->
<%--    <li class="nav-item">--%>

<%--      <div class="navbar-search-block" style="display: none;">--%>
<%--        <form class="form-inline">--%>
<%--          <div class="input-group input-group-sm">--%>
<%--            <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">--%>
<%--            <div class="input-group-append">--%>
<%--              <button class="btn btn-navbar" type="submit">--%>
<%--                <i class="fas fa-search"></i>--%>
<%--              </button>--%>
<%--              <button class="btn btn-navbar" type="button" data-widget="navbar-search">--%>
<%--                <i class="fas fa-times"></i>--%>
<%--              </button>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </form>--%>
<%--      </div>--%>
<%--    </li>--%>

    <!-- Messages Dropdown Menu -->
<%--    <li class="nav-item dropdown">--%>

<%--      <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">--%>
<%--        <a href="#" class="dropdown-item">--%>
<%--          <!-- Message Start -->--%>
<%--          <div class="media">--%>
<%--            <img src="/tomcat10/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">--%>
<%--            <div class="media-body">--%>
<%--              <h3 class="dropdown-item-title">--%>
<%--                Brad Diesel--%>
<%--                <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>--%>
<%--              </h3>--%>
<%--              <p class="text-sm">Call me whenever you can...</p>--%>
<%--              <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--          <!-- Message End -->--%>
<%--        </a>--%>
<%--        <div class="dropdown-divider"></div>--%>
<%--        <a href="#" class="dropdown-item">--%>
<%--          <!-- Message Start -->--%>
<%--          <div class="media">--%>
<%--            <img src="/tomcat10t/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">--%>
<%--            <div class="media-body">--%>
<%--              <h3 class="dropdown-item-title">--%>
<%--                John Pierce--%>
<%--                <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>--%>
<%--              </h3>--%>
<%--              <p class="text-sm">I got your message bro</p>--%>
<%--              <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--          <!-- Message End -->--%>
<%--        </a>--%>
<%--        <div class="dropdown-divider"></div>--%>
<%--        <a href="#" class="dropdown-item">--%>
<%--          <!-- Message Start -->--%>
<%--          <div class="media">--%>
<%--            <img src="/tomcat10t/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">--%>
<%--            <div class="media-body">--%>
<%--              <h3 class="dropdown-item-title">--%>
<%--                Nora Silvester--%>
<%--                <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>--%>
<%--              </h3>--%>
<%--              <p class="text-sm">The subject goes here</p>--%>
<%--              <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--          <!-- Message End -->--%>
<%--        </a>--%>
<%--        <div class="dropdown-divider"></div>--%>
<%--        <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>--%>
<%--      </div>--%>
<%--    </li>--%>
    <!-- Notifications Dropdown Menu -->
<%--    <li class="nav-item dropdown">--%>

<%--      <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">--%>
<%--        <span class="dropdown-item dropdown-header">15 Notifications</span>--%>
<%--        <div class="dropdown-divider"></div>--%>
<%--        <a href="#" class="dropdown-item">--%>
<%--          <i class="fas fa-envelope mr-2"></i> 4 new messages--%>
<%--          <span class="float-right text-muted text-sm">3 mins</span>--%>
<%--        </a>--%>
<%--        <div class="dropdown-divider"></div>--%>
<%--        <a href="#" class="dropdown-item">--%>
<%--          <i class="fas fa-users mr-2"></i> 8 friend requests--%>
<%--          <span class="float-right text-muted text-sm">12 hours</span>--%>
<%--        </a>--%>
<%--        <div class="dropdown-divider"></div>--%>
<%--        <a href="#" class="dropdown-item">--%>
<%--          <i class="fas fa-file mr-2"></i> 3 new reports--%>
<%--          <span class="float-right text-muted text-sm">2 days</span>--%>
<%--        </a>--%>
<%--        <div class="dropdown-divider"></div>--%>
<%--        <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>--%>
<%--      </div>--%>
<%--    </li>--%>
    <li class="nav-item">
      <a class="nav-link" data-widget="fullscreen" href="#" role="button">
        <i class="fas fa-expand-arrows-alt"></i>
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#" role="button" title="logout">
        <i class="fas fa-sign-out-alt"></i>
      </a>
    </li>
<%--    <li class="nav-item">--%>
<%--      <a class="nav-link" data-widget="control-sidebar" data-controlsidebar-slide="true" href="#" role="button">--%>
<%--        <i class="fas fa-th-large"></i>--%>
<%--      </a>--%>
<%--    </li>--%>
  </ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
  <!-- Brand Logo -->
  <a href="#" class="brand-link">
    <img src="<c:url value="/img/AdminLTELogo.png"/>" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
    <span class="brand-text font-weight-light">Academix</span>
  </a>

  <!-- Sidebar -->
  <div class="sidebar os-host os-theme-light os-host-resize-disabled os-host-scrollbar-horizontal-hidden os-host-transition os-host-overflow os-host-overflow-y" style=""><div class="os-resize-observer-host observed"><div class="os-resize-observer" style="left: 0px; right: auto;"></div></div><div class="os-size-auto-observer observed" style="height: calc(100% + 1px); float: left;"><div class="os-resize-observer"></div></div><div class="os-content-glue" style="margin: 0px -8px; width: 249px; height: 186px;"></div><div class="os-padding"><div class="os-viewport os-viewport-native-scrollbars-invisible" style="overflow-y: scroll;"><div class="os-content" style="padding: 0px 8px; height: 100%; width: 100%;">
    <!-- Sidebar user panel (optional) -->
    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      <div class="image">
        <img src="<c:url value="/img/user2-160x160.jpg"/>" class="img-circle elevation-2" alt="User Image">
      </div>
      <div class="info">
        <a href="#" class="d-block">Alexander Pierce</a>
      </div>
    </div>

    <!-- SidebarSearch Form -->


    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <li class="nav-item ">
          <a href="home" class="nav-link" id="dash">
            <i class="nav-icon fas fa-tachometer-alt"></i>
            <p>
              Dashboard
            </p>
          </a>
        </li><!-- Add icons to the links using the .nav-icon class
             with font-awesome or any other icon font library -->
        <li class="nav-item">
          <a href="#" class="nav-link" id="mstaff">
            <i class="nav-icon fas fa-users-cog"></i>
            <p>
              Manage Staff
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="manageStaff" class="nav-link" id="ams">
                <i class="far fa-circle nav-icon"></i>
                <p>Add or Modify</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="viewStaff" class="nav-link" id="vs">
                <i class="far fa-circle nav-icon"></i>
                <p>View Staff</p>
              </a>
            </li>
          </ul>
        </li>


        <li class="nav-item">
          <a href="#" class="nav-link" id="mstud">
            <i class="nav-icon fa fa-graduation-cap"></i>
            <p>
              Manage Students
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="modifyStudents" class="nav-link" id="amst">
                <i class="far fa-circle nav-icon"></i>
                <p>Add or modify</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="viewStudents" class="nav-link" id="vst">
                <i class="far fa-circle nav-icon"></i>
                <p>View Students</p>
              </a>
            </li>
          </ul>
        </li>

        <li class="nav-item">
          <a href="#" class="nav-link" id="msub">
            <i class="nav-icon fa fa-book"></i>
            <p>
              Manage subjects
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="manageSubjects" class="nav-link" id="amsb">
                <i class="far fa-circle nav-icon"></i>
                <p>Add or Modify</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="viewSubjects" class="nav-link" id="vsb">
                <i class="far fa-circle nav-icon"></i>
                <p>View Subjects</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="/tomcat10t/pages/forms/editors.html" class="nav-link" id="ars">
                <i class="far fa-circle nav-icon"></i>
                <p>Add Results</p>
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link" id="mex">
            <i class="nav-icon fas fa-scroll"></i>
            <p>
              Manage Exams
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="manageExams" class="nav-link" id="ame">
                <i class="far fa-circle nav-icon"></i>
                <p>Schedule or Update</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="/tomcat10t/pages/tables/data.html" class="nav-link" id="vex">
                <i class="far fa-circle nav-icon"></i>
                <p>View Exams</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="/tomcat10t/pages/tables/jsgrid.html" class="nav-link" id="vrs">
                <i class="far fa-circle nav-icon"></i>
                <p>View Results</p>
              </a>
            </li>
          </ul>
        </li>

      </ul>
    </nav>
    <!-- /.sidebar-menu -->
  </div></div></div><div class="os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable os-scrollbar-auto-hidden"><div class="os-scrollbar-track"><div class="os-scrollbar-handle" style="width: 100%; transform: translate(0px, 0px);"></div></div></div><div class="os-scrollbar os-scrollbar-vertical os-scrollbar-auto-hidden"><div class="os-scrollbar-track"><div class="os-scrollbar-handle" style="height: 62.5418%; transform: translate(0px, 0px);"></div></div></div><div class="os-scrollbar-corner"></div></div>
  <!-- /.sidebar -->
</aside>

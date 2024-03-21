<%-- 
    Document   : admin
    Created on : Mar 5, 2024, 8:16:40 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="/images/logo-icon.jfif" type="image/jfif" sizes="16x16" />
    <title>Quản trị Trang Chủ</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="/WebApplication1/assets/admin/plugins/fontawesome-free/css/all.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="/WebApplication1/assets/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/WebApplication1/assets/admin/dist/css/adminlte.min.css">
</head>
<body class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
    <div class="wrapper">

        <!-- Preloader -->
        <div class="preloader flex-column justify-content-center align-items-center">
            <img class="animation__wobble" src="/WebApplication1/assets/admin/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
        </div>

        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-dark">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="" role="button"><i class="fas fa-bars"></i></a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a asp-controller="Admin" asp-action="Index" class="nav-link">Trang chủ</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <!-- Navbar Search -->
                <li class="nav-item">
                    <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                        <i class="fas fa-search"></i>
                    </a>
                    <div class="navbar-search-block">
                        <form class="form-inline">
                            <div class="input-group input-group-sm">
                                <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
                                <div class="input-group-append">
                                    <button class="btn btn-navbar" type="submit">
                                        <i class="fas fa-search"></i>
                                    </button>
                                    <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </li>

                <!-- Messages Dropdown Menu -->
                <!-- Notifications Dropdown Menu -->

            </ul>
        </nav>
        <!-- /.navbar -->
        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <a asp-controller="Admin" asp-action="Index" class="brand-link">
                <img src="/WebApplication1/assets/admin/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
                <span class="brand-text font-weight-light">FPT House</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="/WebApplication1/assets/admin/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
                    </div>
                    <div class="info">
                        <a asp-controller="Admin" asp-action="Index" class="d-block">xin chào,<strong>Admin</strong></a>
                    </div>
                </div>

                <!-- SidebarSearch Form -->
                <div class="form-inline">
                    <div class="input-group" data-widget="sidebar-search">
                        <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                        <div class="input-group-append">
                            <button class="btn btn-sidebar">
                                <i class="fas fa-search fa-fw"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <!-- Add icons to the links using the .nav-icon class
                             with font-awesome or any other icon font library -->
                        <li class="nav-header">Chức năng</li>
                        <li class="nav-item">
                            <a href="/WebApplication1/PostServlet" class="nav-link">
                                <i class="nav-icon fas fa-building"></i>
                                <p>
                                    Quản Lý Bài Đăng
                                    <span class="badge badge-info right">new</span>
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/WebApplication1/ReportServlet" class="nav-link">
                                <i class="nav-icon fas fa-users"></i>
                                <p>
                                    Quản Lý Báo Cáo
                                    <span class="badge badge-info right">new</span>
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a asp-controller="Admin" asp-action="getAllJob" class="nav-link" href="ViewPayment">
                                <i class="nav-icon fas fa-briefcase"></i>
                                <p>
                                    Quản lý giao dịch
                                </p>
                            </a>
                        </li><!--
                        <li class="nav-item">
                            <a asp-controller="Admin" asp-action="getAllCV" class="nav-link">
                                <i class="nav-icon fas fa-id-card"></i>
                                <p>
                                    Đơn ứng tuyển(CV)
                                </p>
                            </a>
                        </li>-->
                        <li class="nav-item">
                            <a href="logoutServlet" class="nav-link">
                                <i class="nav-icon fas fa-columns"></i>
                                <p>
                                    Đăng xuất
                                </p>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">FPT House</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="AdminServlet">Home</a></li>
              <li class="breadcrumb-item active">FPT House</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Info boxes -->
        <div class="row">
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-info elevation-1"><i class="fas fa-cog"></i></span>

              <div class="info-box-content">
                  <%int ToTalUsers = (int) request.getAttribute("ToTalUsers");%>
                <span class="info-box-text">Tổng Thành Viên</span>
                <span class="info-box-number">
                  <%= ToTalUsers %> Thành Viên
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-thumbs-up"></i></span>

              <div class="info-box-content"><%int totalListing = (int) request.getAttribute("TotalListing");%>

<!-- Sử dụng giá trị totalListing trong trang admin.jsp -->
                <span class="info-box-text">Tổng Bài Đăng</span>
                <span class="info-box-number"><%= totalListing %> Bài Viết</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->

          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>

          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>

              <div class="info-box-content">
                  <%int ToTalLoard = (int) request.getAttribute("ToTalLoard");%>
                <span class="info-box-text">Người Cho Thuê</span>
                <span class="info-box-number"><%= ToTalLoard%> Thành Viên</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-users"></i></span>

              <div class="info-box-content">
                  <%int ToTalTenant = (int) request.getAttribute("ToTalTenant");%>
                <span class="info-box-text">Người Thuê</span>
                <span class="info-box-number"><%= ToTalTenant%> Thành Viên</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
        <!-- /.row -->

        <!-- Main row -->
        
        <!-- /.row -->
      </div><!--/. container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.0.1-pre
    </div>
  </footer>
</div>
    </div>
    <!-- ./wrapper -->
    <!-- REQUIRED SCRIPTS -->
    <!-- jQuery -->
    <script src="/WebApplication1/assets/admin/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/WebApplication1/assets/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- overlayScrollbars -->
    <script src="/WebApplication1/assets/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <!-- AdminLTE App -->
    <script src="/WebApplication1/assets/admin/dist/js/adminlte.js"></script>

    <!-- PAGE PLUGINS -->
    <!-- jQuery Mapael -->
    <script src="/WebApplication1/assets/admin/plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
    <script src="/WebApplication1/assets/admin/plugins/raphael/raphael.min.js"></script>
    <script src="/WebApplication1/assets/admin/plugins/jquery-mapael/jquery.mapael.min.js"></script>
    <script src="/WebApplication1/assets/admin/plugins/jquery-mapael/maps/usa_states.min.js"></script>
    <!-- ChartJS -->
    <script src="/WebApplication1/assets/admin/plugins/chart.js/Chart.min.js"></script>

    <!-- AdminLTE for demo purposes -->
    <script src="/WebApplication1/assets/admin/dist/js/demo.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="/WebApplication1/assets/admin/dist/js/pages/dashboard2.js"></script>
</body>
</html>

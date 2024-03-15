<%-- 
    Document   : quanlibaidang
    Created on : Mar 5, 2024, 10:01:33 PM
    Author     : Admin
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js" type="text/javascript"></script>

        <link rel="stylesheet" href="/WebApplication1/assets/admin/plugins/fontawesome-free/css/all.min.css">
        <!-- overlayScrollbars -->
        <link rel="stylesheet" href="/WebApplication1/assets/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="/WebApplication1/assets/admin/dist/css/adminlte.min.css">
        <style>
            .table td {
                padding: 0.3rem;
                border-top: 0 !important;
            }
        </style>
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
                            </li>
                            <!--                        <li class="nav-item">
                                                        <a asp-controller="Admin" asp-action="getAllJob" class="nav-link">
                                                            <i class="nav-icon fas fa-briefcase"></i>
                                                            <p>
                                                                Đơn tuyển dụng(JOB)
                                                            </p>
                                                        </a>
                                                    </li>
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
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Danh sách Báo Cáo</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a asp-controller="Admin" asp-action="Index">Trang chủ</a></li>
                                    <li class="breadcrumb-item active">Danh sách Báo Cáo</li>
                                </ol>
                            </div>
                        </div>
                    </div><!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- Default box -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Danh sách Báo Cáo: <strong style="color:red;">${TotalReport} </strong>báo cáo</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body p-0">
                            <table class="table table-striped projects" >
                                <thead>
                                    <tr>
                                        <th style="width: 10%">
                                            Bài viết
                                        </th>
                                        <th style="width: 10%">
                                            ID người báo cáo
                                        </th>
                                        <th style="width: 30%">
                                            Nội dung báo cáo
                                        </th>
                                        <th style="width: 20%">
                                            Trạng Thái
                                        </th>
                                        <th style="width: 8%" class="text-center">
                                            Ngày Báo Cáo
                                        </th>
                                        <th style="width: 20%">
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${empty report}"> empty</c:if>
                                    <c:if test="${not empty report}">
                                    <c:forEach var="i" begin="0" end="${report.size()-1}" varStatus="loop">
                                        <tr>
                                            <td>
                                                <a class="btn btn-primary btn-sm" href="Listingdetail?listingID=${report.get(i).getListingID()}"> ${report.get(i).getListingID()}</a>
                                            </td>
                                            <td>
                                                ${report.get(i).getUserID()}
                                            </td>
                                            <td>
                                                ${report.get(i).getDescription()}
                                            </td>
                                            <td>
                                                ${report.get(i).getStatus()}
                                            </td>
                                            <td class="project-state">
                                                <span class="badge badge-success">${report.get(i).getCreateAt()}</span>
                                            </td>
                                            <td class="project-actions text-right">
                                                <c:choose>
                                                    <c:when test="${report.get(i).getStatus() == 'Approved' || report.get(i).getStatus() == 'Cancel'}">
                                                        <!-- Trạng thái là 'Approved' hoặc 'Cancel' -->
                                                        <i class="">${report.get(i).getStatus()}</i>
                                                        <!-- Không hiển thị nút 'Hủy Báo Cáo' và nút 'Xóa bài đăng' -->
                                                    </c:when>
                                                    <c:otherwise>
                                                        <!-- Trạng thái là 'Pending' hoặc các trạng thái khác -->
                                                        <a class="btn btn-success btn-sm" onclick="cancel('${report.get(i).getListingID()}')">
                                                            <i class="fas fa-folder"></i> Hủy Báo Cáo
                                                        </a>
                                                        <button class="btn btn-danger btn-sm" onclick="remove('${report.get(i).getListingID()}')">
                                                            <i class="fas fa-trash"></i> Xóa bài đăng
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                        </c:if>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->


                    </div>
                    <!-- /.card -->

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
                <strong>Copyright &copy; 2014-2021 <a href="https://localhost:7208/Home/Index">HOUSEHELPERSERVICE</a>.</strong>
                All rights reserved.
            </footer>
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

        <script type="text/javascript">
                                          function remove(id) {
                                              console.log("aaa", id);
                                              swal({
                                                  title: "Bạn có chắc chắn xóa bài đăng?",
                                                  text: "Hãy chắc chắn với quyết định của mình !",
                                                  icon: "warning",
                                                  buttons: true,
                                                  dangerMode: true,
                                              })
                                                      .then((willDelete) => {
                                                          if (willDelete) {
                                                              $.ajax({
                                                                  type: "POST",
                                                                  url: "/WebApplication1/DeleteListingServlet?ListingID=" + id +"&action=delete",
                                                                  success: function (response) {
                                                                      swal("Bạn đã xóa bài đăng thành công", {
                                                                          icon: "success",
                                                                      }).then(function () {
                                                                          window.location.href = "/WebApplication1/ReportServlet"
                                                                      });

                                                                  },
                                                                  failure: function (response) {
                                                                      alert(response.responseText);
                                                                  },
                                                                  error: function (response) {
                                                                      alert(response.responseText);
                                                                  }
                                                              });

                                                          } else {
                                                              swal("Trở về quản lí báo cáo");
                                                          }
                                                      });
                                          }

        </script>
        <script type="text/javascript">
            function cancel(id) {
                swal({
                    title: "Bạn có chắc chắn cancel báo cáo này?",
                    text: "Hãy chắc chắn với quyết định của mình !",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                $.ajax({
                                    type: "POST",
                                    url: "/WebApplication1/CancelReportServlet?ListingID=" + id,
                                    success: function (response) {
                                        swal("Bạn đã cancel báo cáo thành công", {
                                            icon: "success",
                                        }).then(function () {
                                            window.location.href = "/WebApplication1/ReportServlet"
                                        });

                                    },
                                    failure: function (response) {
                                        alert(response.responseText);
                                    },
                                    error: function (response) {
                                        alert(response.responseText);
                                    }
                                });

                            } else {
                                swal("Trở về quản lí báo cáo");
                            }
                        });
            }

        </script>
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

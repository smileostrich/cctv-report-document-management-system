<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="keywords" content="헬프데스크" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	
	<title>헬프데스크 </title>
	
	<!-- nomalize -->
	<link type="text/css" rel="stylesheet" href="/common/css/base.css"/>
	
    <!-- Bootstrap Core CSS -->
    <link href="/plugin/test/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/plugin/test/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/plugin/test/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/plugin/test/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/plugin/test/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/plugin/test/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	
	<!-- jQuery -->
    <script src="/plugin/test/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/plugin/test/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/plugin/test/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/plugin/test/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/plugin/test/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/plugin/test/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/plugin/test/dist/js/sb-admin-2.js"></script>
    
    <script type="text/javascript" src="/common/js/common.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>
	
</head>

<!-- 	<a href="/Login.do">로그인 기능(진행중)</a> -->
<body>
<div id="wrapper">
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
            <a class="navbar-brand" href="/BoardData.do">HelpDesk</a>
        </div>
        <ul class="nav navbar-top-links navbar-right">
<%--         	<c:out value="${sessionVO.name}"/>님께서 로그인중입니다. --%>
<!--             <li class="dropdown"> -->
<!--                 <a class="dropdown-toggle" data-toggle="dropdown" href="#"> -->
<!--                     <i class="fa fa-tasks fa-fw"></i><i class="fa fa-caret-down"></i> -->
<!--                 </a> -->
<!--                 <ul class="dropdown-menu dropdown-tasks"> -->
<!--                     <li> -->
<!--                         <a href="#"> -->
<!--                             <div> -->
<!--                                 <p> -->
<!--                                     <strong>Task 1</strong> -->
<!--                                     <span class="pull-right text-muted">40% Complete</span> -->
<!--                                 </p> -->
<!--                                 <div class="progress progress-striped active"> -->
<!--                                     <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%"> -->
<!--                                         <span class="sr-only">40% Complete (success)</span> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </a> -->
<!--                     </li> -->
<!--                     <li class="divider"></li> -->
<!--                     <li> -->
<!--                         <a href="#"> -->
<!--                             <div> -->
<!--                                 <p> -->
<!--                                     <strong>Task 2</strong> -->
<!--                                     <span class="pull-right text-muted">20% Complete</span> -->
<!--                                 </p> -->
<!--                                 <div class="progress progress-striped active"> -->
<!--                                     <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%"> -->
<!--                                         <span class="sr-only">20% Complete</span> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </a> -->
<!--                     </li> -->
<!--                     <li class="divider"></li> -->
<!--                     <li> -->
<!--                         <a href="#"> -->
<!--                             <div> -->
<!--                                 <p> -->
<!--                                     <strong>Task 3</strong> -->
<!--                                     <span class="pull-right text-muted">60% Complete</span> -->
<!--                                 </p> -->
<!--                                 <div class="progress progress-striped active"> -->
<!--                                     <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%"> -->
<!--                                         <span class="sr-only">60% Complete (warning)</span> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </a> -->
<!--                     </li> -->
<!--                     <li class="divider"></li> -->
<!--                     <li> -->
<!--                         <a href="#"> -->
<!--                             <div> -->
<!--                                 <p> -->
<!--                                     <strong>Task 4</strong> -->
<!--                                     <span class="pull-right text-muted">80% Complete</span> -->
<!--                                 </p> -->
<!--                                 <div class="progress progress-striped active"> -->
<!--                                     <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%"> -->
<!--                                         <span class="sr-only">80% Complete (danger)</span> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </a> -->
<!--                     </li> -->
<!--                     <li class="divider"></li> -->
<!--                     <li> -->
<!--                         <a class="text-center" href="#"> -->
<!--                             <strong>See All Tasks</strong> -->
<!--                             <i class="fa fa-angle-right"></i> -->
<!--                         </a> -->
<!--                     </li> -->
<!--                 </ul> -->
<!--             </li> -->
<!--             <li class="dropdown"> -->
<!--                 <a class="dropdown-toggle" data-toggle="dropdown" href="#"> -->
<!--                     <i class="fa fa-bell fa-fw"></i><i class="fa fa-caret-down"></i> -->
<!--                 </a> -->
<!--                 <ul class="dropdown-menu dropdown-alerts"> -->
<!--                     <li> -->
<!--                         <a href="#"> -->
<!--                             <div> -->
<!--                                 <i class="fa fa-tasks fa-fw"></i> New Task <span class="pull-right text-muted small">4 minutes ago</span> -->
<!--                             </div> -->
<!--                         </a> -->
<!--                     </li> -->
<!--                     <li class="divider"></li> -->
<!--                     <li> -->
<!--                         <a class="text-center" href="#"> -->
<!--                             <strong>See All Alerts</strong> -->
<!--                             <i class="fa fa-angle-right"></i> -->
<!--                         </a> -->
<!--                     </li> -->
<!--                 </ul> -->
<!--             </li> -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i><i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
<!--                     <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a> -->
<!--                     </li> -->
<!--                     <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a> -->
<!--                     </li> -->
                    <li class="divider"></li>
                    <li><a href="/Logout.do"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
            </li>
        </ul>
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
<%-- 					<c:if test="${sessionVO.auth eq 'A'}"> --%>
<!--                     <li class="active"> -->
<!--                         <a class="active" href="#"><i class="fa fa-files-o fa-fw"></i> 관리자<span class="fa arrow"></span></a> -->
<!--                         <ul class="nav nav-second-level"> -->
<!--                             <li> -->
<!--                             	<a href="/ADMIN/Board.do">게시판 관리기능</a> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <a href="/ADMIN/User.do">사용자 관리</a> -->
<!--                             </li> -->
<!--                         </ul> -->
<!--                     </li> -->
<%--                     </c:if> --%>
                    <li>
                        <a href="/BoardData.do"><i class="fa fa-edit fa-fw"></i> A/S 게시판</a>
                    </li>
<!--                     <li> -->
<!--                         <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 통계<span class="fa arrow"></span></a> -->
<!--                         <ul class="nav nav-second-level"> -->
<!--                             <li> -->
<!--                                 <a href="#">통계 페이지</a> -->
<!--                             </li> -->
<!--                         </ul> -->
<!--                     </li> -->
                </ul>
            </div>
        </div>
    </nav>
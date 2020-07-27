<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<link href="/plugin/login/css/style.css" rel="stylesheet" type="text/css">
<link href="/plugin/test/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<style>
.btn-success {
    color: #fff;
    background-color: #337ab7;
    border-color: #337ab7;
}
.btn-success:active {
    color: #fff;
    background-color: #337ab7;
    border-color: #337ab7;
}
.btn-success:hover {
    color: #fff;
    background-color: #337ab7;
    border-color: #337ab7;
}
.btn-success.active.focus, .btn-success.active:focus, .btn-success.active:hover, .btn-success:active.focus, .btn-success:active:focus, .btn-success:active:hover, .open>.dropdown-toggle.btn-success.focus, .open>.dropdown-toggle.btn-success:focus, .open>.dropdown-toggle.btn-success:hover {
    color: #fff;
    background-color: #337ab7;
    border-color: #337ab7;
}
.btn-success.focus, .btn-success:focus {
    color: #fff;
    background-color: #337ab7;
    border-color: #337ab7;
}
</style>
	<div class="login-panel panel panel-default" style="width: 500px; margin: 0 auto; margin-top: 15%;">
	    <div class="panel-heading">
	        <h3 class="panel-title">로그인</h3>
	    </div>
	    <div class="panel-body">
	    	<form:form commandName="loginVO" name="form" method="post" action="/Login.do" onsubmit="javascript:return fn_Login(this);">
	            <fieldset>
	                <div class="form-group">
	                    <form:input path="userid" class="form-control" placeholder="아이디를 입력하세요" name="id" autofocus="" />
	                </div>
	                <div class="form-group">
	                    <form:input path="password" class="form-control" placeholder="비밀번호를 입력하세요" name="password" type="password" value="" />
	                </div>
	                <input class="btn btn-lg btn-success btn-block" type="submit" value="로그인">
	            </fieldset>
	        </form:form>
	    </div>
	</div>
    <!-- Page Content end -->
<!-- 헤더닫기 -->
</div>
</body>

<script type="text/javaScript" defer="defer">
$(document).ready(function($) {
	
	/**로그인*/
	window.fn_Login = function(obj) {
		setValue(obj.password, obj.password.value);
	};
});
</script>
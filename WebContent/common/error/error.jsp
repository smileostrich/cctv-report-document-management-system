<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
	<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>헬프데스크 에러페이지</title>
	</head>
	<body>


<div style="position: relative; width: 500px; margin: 0 auto 350px auto; padding: 240px 0 0 0; background: url('/common/images/cmm/img_error.png') no-repeat 50% 0%;">
	<div style="padding: 25px 20px; background: #F8F8F8; border: 1px solid #c8c8c8; color: #383838; text-align: center; line-height: 1.8em; font-size: 9pt;">
<c:choose>
<c:when test='${!empty errMsg}'>
		<spring:message code='${errMsg}'/>
</c:when>
<c:otherwise>

	사용에 불편을드려 죄송합니다.<br/>
	해당 페이지는 삭제되었거나 작업중으로 이용하실 수 없습니다.<br/>
	빠른 시일내에 복구 될 수 있도록 하겠습니다.<br/>
	감사합니다.<br/>
</c:otherwise>
</c:choose>

		<div style="display: block; position: relative; padding: 0px; margin-top: 10px; border: none; text-align: center;">
		<c:choose>
			<c:when test='${!empty returnUrl}'>
				<a href="${returnUrl}" class="ui-btn blue" target="_top"><img src="/common/images/cmm/btn_prev.png" alt="prev" /></a>
			</c:when>
			<c:otherwise>
				<a href="javascript:history.back(-1);" class="ui-btn blue" target="_top"><img src="/common/images/cmm/btn_prev.png" alt="prev" /></a>
			</c:otherwise>
		</c:choose>
			
			<a href="/" target="_top"><img src="/common/images/cmm/btn_home.png" alt="HOME" /></a>
		</div>
	</div>
</div>

	</body>
</html>
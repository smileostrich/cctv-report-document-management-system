<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="/Administrator/header.jsp" flush="true"/>

<hgroup>
	<h3><c:out value='${adminPageVO.programname}'/></h3>
</hgroup>

<article>
<c:choose>
	<c:when test='${!empty errCode}'>
			<spring:message code='${errCode}'/>
	</c:when>
	<c:otherwise>
		사용에 불편을드려 죄송합니다.<br/>
		해당 페이지는 삭제되었거나 작업중으로 이용하실 수 없습니다.<br/>
		빠른 시일내에 복구 될 수 있도록 하겠습니다.<br/>
		감사합니다.<br/>
	</c:otherwise>
</c:choose>
</article>

<jsp:include page="/Administrator/footer.jsp" flush="true"/>
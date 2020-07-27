<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="/Administrator/header.jsp" flush="true"/>

<hgroup>
	<h3><c:out value='${boardVO.boardname}'/></h3>
	<h4><c:out value='${boardVO.memo}'/></h4>
</hgroup>

<article>
	<jsp:include page="/Combind/board/${skinVO.skincode}/${searchVO.command}.jsp" flush="true"/>
</article>

<jsp:include page="/Administrator/footer.jsp" flush="true"/>
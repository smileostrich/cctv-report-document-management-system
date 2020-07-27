<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="/Administrator/header.jsp" flush="true"/>

<hgroup>
	<h3><c:out value='${adminPageVO.programname}'/></h3>
	<h4>본 사이트의 탈퇴회원을 관리 합니다.</h4>
</hgroup>

<article>
<form:form commandName="searchVO" name="form" method="post" action="/ADMIN/UserSecession.mobiz" onsubmit="javascript:return fn_submitForm(this);">
	<input type="hidden" name="TOKEN_KEY" value="<c:out value='${TOKEN_KEY}'/>" title="실행중복확인키"/>
	<form:hidden path="command" title="실행구분"/>
	
	<hr class="ui-height15"/>
	<p class="ui-fl">총 <c:out value='${pageInfo.totalRecordCount}'/>명의 탈퇴회원이 있습니다.</p>
	<hr class="ui-height15"/>
	
	<table class="ui-list vs-top-visual">
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>성별</th>
				<th>가입일자</th>
				<th>탈퇴일자</th>
				<th>탈퇴구분</th>
			</tr>
		</thead>
		
		<tbody class="ui-center">
<c:forEach var="rs" items="${secessionList}" varStatus="status">
			<tr>
				<td><c:out value='${(pageInfo.totalRecordCount - ((searchVO.pageIndex - 1) * searchVO.pageUnit)) - (status.count - 1)}'/></td>
				<td><c:out value='${rs.userid}'/></td>			
				<td><c:out value='${rs.sex}'/></td>
				<td><c:out value='${rs.regdate}'/></td>
				<td><c:out value='${rs.deldate}'/></td>
				<td><c:out value='${rs.author}'/></td>
			</tr>
</c:forEach>

<c:if test="${pageInfo.totalRecordCount < 1}">
			<tr><td colspan="6" class="ui-center h_f_100"><spring:message code='info.nodata.msg'/></td></tr>
</c:if>
		</tbody>
	</table>
	
	<div class="pageBox">
		<ui:pagination paginationInfo="${pageInfo}" type="image" jsFunction="postPage"/>
		<form:hidden path="pageIndex" title="페이지번호"/>
	</div>
</form:form>
</article>

<jsp:include page="/Administrator/footer.jsp" flush="true"/>
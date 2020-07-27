<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="/Administrator/header.jsp" flush="true"/>

<script type="text/javaScript" charset="UTF-8" defer="defer">
//<![CDATA[
$(document).ready(function($) {
	/**검색*/
	window.fn_submitForm = function(obj) {
		setValue(obj.pageIndex, "1");
		return true;
	};
	
	/**권한설정*/
	window.fn_setAuth = function(boardid) {
		setValue(getForm().searchCode, boardid);
		postExecute("Auth");
	};
	
	/**수정*/
	window.fn_editBoard = function(boardid) {
		setValue(getForm().searchCode, boardid);
		setValue(getForm().command, "Modify");
		POST("/ADMIN/Board.mobiz");
	};
	
	/**삭제*/
	window.fn_delBoard = function(boardid) {
		setValue(getForm().searchCode, boardid);
		setValue(getForm().execute, "Del");
		POST("/ADMIN/BoardProc.mobiz");
	};
});
//]]>
</script>

<hgroup>
	<h3>게시판 관리</h3>
	<h4>본 사이트 게시판을 관리 합니다.</h4>
</hgroup>

<article>
<form:form commandName="searchVO" name="form" method="post" action="/ADMIN/Board.mobiz" onsubmit="javascript:return fn_submitForm(this);">
	<input type="hidden" name="TOKEN_KEY" value="<c:out value='${TOKEN_KEY}'/>" title="실행중복확인키"/>
	<form:hidden path="command" title="실행구분"/>
	<form:hidden path="execute" title="세부실행구분"/>
	<form:hidden path="searchCode" title="검색일련번호"/>
	<hr class="ui-height15"/>
	<div class="ui-fr">
		<label for="searchValue">검색어</label>
		<form:input path="searchValue" title="검색어를 입력하세요."/>
		<input type="submit" value="<spring:message code='button.search'/>"/>
	</div>
	<p class="ui-fl">총 <c:out value='${pageInfo.totalRecordCount}'/>개의 게시판이 있습니다.</p>
	<hr class="ui-height15"/>
	<table class="ui-viewer vs-top-visual">
		<thead>
			<tr>
				<th>번호</th>
				<th>스킨코드</th>
				<th>게시판아이디</th>
				<th>게시판명</th>
				<th>메모</th>
				<th>기능</th>
			</tr>
		</thead>
		<tbody>
<c:forEach var="rs" items="${boardList}" varStatus="status">
			<tr>
				<td><c:out value='${(pageInfo.totalRecordCount - ((searchVO.pageIndex-1) * searchVO.pageUnit))-(status.count-1)}'/></td>
				<td><c:out value='${rs.skincode}'/></td>
				<td><c:out value='${rs.boardid}'/></td>
				<td><c:out value='${rs.boardname}'/></td>
				<td><c:out value='${rs.memo}'/></td>
				<td>
					<input type="button" onclick="javascript:fn_setAuth('<c:out value="${rs.boardid}"/>');" class="ui-btn-auth" value="<spring:message code='button.authset'/>"/>
					<input type="button" onclick="javascript:fn_editBoard('<c:out value="${rs.boardid}"/>')" class="ui-btn-modify" value="<spring:message code='button.modify'/>"/>
					<input type="button" onclick="javascript:fn_delBoard('<c:out value="${rs.boardid}"/>')" class="ui-btn-del" value="<spring:message code='button.delete'/>"/>
				</td>
			</tr>
</c:forEach>
		</tbody>
	</table>
	<div class="pageBox">
		<ui:pagination paginationInfo = "${pageInfo}"
				   type="image"
				   jsFunction="postPage"
				   />
		<form:hidden path="pageIndex" title="페이지번호"/>
	</div>
	<div class="buttonBox">
		<input type="button" onclick="javascript:postExecute('Write')" value="<spring:message code='button.write'/>"/>
	</div>
</form:form>
</article>

<jsp:include page="/Administrator/footer.jsp" flush="true"/>
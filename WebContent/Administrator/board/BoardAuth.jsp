<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<jsp:include page="/Administrator/header.jsp" flush="true"/>

<!--For Commons Validator Client Side-->
<script type="text/javascript" src="<c:url value='/common/validator.mobiz'/>"></script>
<validator:javascript formName="boardAuthVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" charset="UTF-8" defer="defer">
//<![CDATA[
$(document).ready(function($) {
	/**권한등록*/
	window.fn_submitForm = function(obj) {
		if(!validateBoardAuthVO(obj)) return;
		else {
			setValue(getForm().execute,"Write");
			POST("/ADMIN/BoardAuth.mobiz");
		}
	};
	
	/**권한삭제*/
	window.fn_delAuth = function(groupid) {
		setValue(getForm().groupid,groupid);
		setValue(getForm().execute,"Del");
		POST("/ADMIN/BoardAuth.mobiz");
	};
	
	/**권한수정*/
	window.fn_editAuth = function(groupid, groupname, cnt) {
		setValue(getForm().groupid,groupid);
		setValue(getForm().groupname,groupname);		
		setValue(getForm().execute,"Write");
		getForm().read.checked = getByName("auth_read")[cnt].checked;
		getForm().write.checked = getByName("auth_write")[cnt].checked;
		getForm().del.checked = getByName("auth_del")[cnt].checked;
		POST("/ADMIN/BoardAuth.mobiz");
	}
	
	/**부서검색*/
	window.fn_searchDepart = function() {
		window.open("/ADMIN/SearchDepart.mobiz","SearchDepart","width=500, height=600, resizable=no, scrollbars=auto");
	};
});
//]]>
</script>

<hgroup>
	<h3><c:out value='${adminPageVO.programname}'/></h3>
	<h4>본 사이트 게시판을 관리 합니다.</h4>
</hgroup>

<article>
<form:form commandName="boardAuthVO" name="form" method="post" action="/ADMIN/Board.mobiz" onsubmit="javascript:fn_submitForm(this);return false;">
	<input type="hidden" name="TOKEN_KEY" value="<c:out value='${TOKEN_KEY}'/>" title="실행중복확인키"/>
	<input type="hidden" name="command" value="<c:out value='${searchVO.command}'/>" title="실행구분"/>
	<input type="hidden" name="execute" value="<c:out value='${searchVO.execute}'/>" title="세부실행구분"/>
	<input type="hidden" name="searchCode" value="<c:out value='${searchVO.searchCode}'/>" title="검색코드"/>
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" title="현재페이지"/>
	<input type="hidden" name="boardid" value="<c:out value='${boardVO.boardid}'/>" title="게시판아이디"/>
	
	<h4>프로그램 정보</h4>
	<table class="ui-viewer vs-top-visual">
		<tbody>
			<tr>
				<th>게시판아이디</th>
				<td>
					<c:out value='${boardVO.boardid}'/>
				</td>
				<th>게시판명</th>
				<td><c:out value='${boardVO.boardname}'/></td>
			</tr>
		</tbody>
	</table>
	<h4>권한 등록</h4>
	<table class="ui-viewer vs-top-visual">
		<tbody>
			<tr>
				<th>그룹선택</th>
				<td>
					<form:hidden path="groupid" title="그룹아이디"/>
					<form:input path="groupname" title="그룹을 선택하세요." disabled="true"/>
					<input type="button" onclick="javascript:fn_searchDepart();" value="<spring:message code='button.search'/>"/>
				</td>
				<th>권한부여</th>
				<td>
					<form:checkbox path="read" value="Y" label="읽기"/>
					<form:checkbox path="write" value="Y" label="쓰기"/>
					<form:checkbox path="del" value="Y" label="삭제"/>
				</td>
				<td>
					<input type="submit" value="<spring:message code='button.write'/>"/>
					<input type="button" onclick="javascript:postExecute('List')" value="<spring:message code='button.list'/>"/>
				</td>
			</tr>
		</tbody>
	</table>
	<h4>권한 리스트</h4>
	<p class="ui-fl">총 <c:out value='${pageInfo.totalRecordCount}'/>개의 권한부서가 있습니다.</p>
	<table class="ui-viewer vs-top-visual">
		<thead>
			<tr>
				<th>번호</th>
				<th>그룹아이디</th>
				<th>그룹명</th>
				<th>읽기권한</th>
				<th>쓰기권한</th>
				<th>삭제권한</th>
				<th>권한지정일</th>
				<th>기능</th>
			</tr>
		</thead>
		<tbody>
<c:forEach var="rs" items="${authList}" varStatus="status">
			<tr>
				<td><c:out value='${(pageInfo.totalRecordCount - ((searchVO.pageIndex-1) * searchVO.pageUnit))-(status.count-1)}'/></td>
				<td><c:out value='${rs.groupid}'/></td>
				<td><c:out value='${rs.groupname}'/></td>
				<td class="ui-center"><input type="checkbox" name="auth_read" value="Y" <c:if test='${rs.read eq "Y"}'>checked</c:if>></td>
				<td class="ui-center"><input type="checkbox" name="auth_write" value="Y" <c:if test='${rs.write eq "Y"}'>checked</c:if>></td>
				<td class="ui-center"><input type="checkbox" name="auth_del" value="Y" <c:if test='${rs.del eq "Y"}'>checked</c:if>></td>
				<td><c:out value='${rs.regdate}'/></td>
				<td>
					<input type="button" onclick="javascript:fn_editAuth('<c:out value="${rs.groupid}"/>','<c:out value="${rs.groupname}"/>','<c:out value="${status.count - 1}"/>')" value="<spring:message code='button.modify'/>"/>
					<input type="button" onclick="javascript:fn_delAuth('<c:out value="${rs.groupid}"/>')" value="<spring:message code='button.delete'/>"/>
				</td>
			</tr>
</c:forEach>
		</tbody>
	</table>
	<div class="pageBox">
		<ui:pagination paginationInfo = "${pageInfo}"
				   type="image"
				   jsFunction="subPage"
				   />
		<form:hidden path="subIndex" title="페이지번호"/>
	</div>
</form:form>
</article>

<jsp:include page="/Administrator/footer.jsp" flush="true"/>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<jsp:include page="/Administrator/header.jsp" flush="true"/>

<!--For Commons Validator Client Side-->
<script type="text/javascript" src="<c:url value='/common/validator.mobiz'/>"></script>
<validator:javascript formName="boardVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" charset="UTF-8" defer="defer">
//<![CDATA[
$(document).ready(function($) {
	/**스킨등록*/
	window.fn_submitForm = function(obj) {
		if(!validateBoardVO(obj)) return;
		else {
			setValue(obj.execute, "Write");
			POST("/ADMIN/BoardProc.mobiz");
		}
	};
});
//]]>
</script>

<hgroup>
	<h3>게시판 관리</h3>
	<h4>본 사이트 게시판을 관리 합니다.</h4>
</hgroup>

<article>
<form:form commandName="boardVO" name="form" method="post" action="/ADMIN/Board.mobiz" onsubmit="javascript:fn_submitForm(this);return false;">
	<input type="hidden" name="TOKEN_KEY" value="<c:out value='${TOKEN_KEY}'/>" title="실행중복확인키"/>
	<form:hidden path="command" title="실행구분"/>
	<input type="hidden" name="execute" value="<c:out value='${searchVO.execute}'/>" title="세부실행구분"/>
	<input type="hidden" name="searchCode" value="<c:out value='${searchVO.searchCode}'/>" title="검색일련번호"/>
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" title="현재페이지"/>
	<table class="ui-viewer vs-top-visual">
		<tbody>
			<tr>
				<th>게시판명</th>
				<td><form:input path="boardname" title="게시판명을 입력하세요."/></td>
			</tr>
			<tr>
				<th>게시판설명</th>
				<td><form:input path="memo" title="게시판 섦명을 입력하세요."/></td>
			</tr>
			<tr>
				<th>스킨</th>
				<td>
					<form:select path="skincode" title="게시판 스킨을 선택하세요.">
<c:forEach var="rs" items="${skinList}" varStatus="status">
						<form:option value="${rs.skincode}" label="${rs.skinname}"/>
</c:forEach>
					</form:select>
				</td>
			</tr>
			<tr>
				<th>구분</th>
				<td><form:input path="gubun" title="구분을 입력하세요."/></td>
			</tr>
			<tr>
				<th>게시기간사용</th>
				<td>
					<form:radiobutton path="term" value="Y" label="사용"/>
					<form:radiobutton path="term" value="N" label="사용안함"/>
				</td>
			</tr>
			<tr>
				<th>RSS제공</th>
				<td>
					<form:radiobutton path="rss" value="Y" label="제공"/>
					<form:radiobutton path="rss" value="N" label="제공안함"/>
				</td>
			</tr>
			<tr>
				<th>공지사용</th>
				<td>
					<form:radiobutton path="top" value="Y" label="사용"/>
					<form:radiobutton path="top" value="N" label="사용안함"/>
					(<form:radiobutton path="topauth" value="A" label="모두사용"/>
					<form:radiobutton path="topauth" value="B" label="관리자만사용"/>)
				</td>
			</tr>
			<tr>
				<th>리플사용</th>
				<td>
					<form:radiobutton path="reply" value="Y" label="사용"/>
					<form:radiobutton path="reply" value="N" label="사용안함"/>
					(<form:radiobutton path="replyauth" value="A" label="모두사용"/>
					<form:radiobutton path="replyauth" value="B" label="관리자만사용"/>)
				</td>
			</tr>
			<tr>
				<th>코멘트사용</th>
				<td>
					<form:radiobutton path="cmt" value="Y" label="사용"/>
					<form:radiobutton path="cmt" value="N" label="사용안함"/>
					(<form:radiobutton path="cmtauth" value="A" label="모두사용"/>
					<form:radiobutton path="cmtauth" value="B" label="관리자만사용"/>)
				</td>
			</tr>
			<tr>
				<th>자기글만보기</th>
				<td>
					<form:radiobutton path="self" value="Y" label="사용"/>
					<form:radiobutton path="self" value="N" label="사용안함"/>
				</td>
			</tr>
			<tr>
				<th>비밀글사용</th>
				<td>
					<form:radiobutton path="secret" value="Y" label="사용"/>
					<form:radiobutton path="secret" value="N" label="사용안함"/>
				</td>
			</tr>
			<tr>
				<th>첨부사용</th>
				<td>
					<form:checkbox path="upload" value="Y" label="사용"/>
					<form:input path="upcnt" title="업로드 가능 수를 입력하세요."/>개
					<form:input path="upsize" title="업로드 가능 용량을 입력하세요."/>Mb
				</td>
			</tr>
			<tr>
				<th>첨부가능확장자</th>
				<td><form:input path="upext" title="업로드 가능 확장자를 입력하세요."/></td>
			</tr>
			<tr>
				<th>게시물표시갯수</th>
				<td><form:input path="pageunit" title="게시물 표시갯수를 입력하세요."/></td>
			</tr>
			<tr>
				<th>페이지표시갯수</th>
				<td><form:input path="pagesize" title="페이지 표시갯수를 입력하세요."/></td>
			</tr>
		</tbody>
	</table>
	<div class="buttonBox">
		<input type="submit" value="<spring:message code='button.write'/>"/>
		<input type="button" onclick="javascript:postExecute('List')" value="<spring:message code='button.list'/>"/>
	</div>
</form:form>
</article>

<jsp:include page="/Administrator/footer.jsp" flush="true"/>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="custom" uri="http://www.nakdongcamping.com/customs" %>

<jsp:include page="/Administrator/header.jsp" flush="true"/>

<hgroup>
	<h3><c:out value='${adminPageVO.programname}'/></h3>
	<h4>본 사이트 회원을 관리 합니다.</h4>
</hgroup>

<article>
<form:form commandName="searchVO" name="form" method="post" action="/ADMIN/User.mobiz" onsubmit="javascript:return fn_submitForm(this);">
	<input type="hidden" name="TOKEN_KEY" value="<c:out value='${TOKEN_KEY}'/>" title="실행중복확인키"/>
	<form:hidden path="command" title="실행구분"/>
	<form:hidden path="searchKey" title="검색구분"/>
	<form:hidden path="searchValue" title="검색어"/>
	<form:hidden path="pageIndex" title="현제페이지"/>
	
	<table class="ui-viewer vs-top-visual">
		<tbody>
			<tr>
				<th>회원명</th>
				<td><c:out value='${userVO.name}'/></td>
				<th>아이디(비밀번호)</th>
				<td><c:out value='${userVO.userid}'/>&nbsp;(<c:out value='${custom:AESDecode(userVO.passwd, userVO.aeskey)}'/>)</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><c:out value='${userVO.birth}'/></td>
				<th>성별</th>
				<td><c:out value='${userVO.sex}'/></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><c:out value='${userVO.tel}'/></td>
				<th>핸드폰번호</th>
				<td><c:out value='${userVO.mobile}'/></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><c:out value='${userVO.email}'/></td>
				<th>주소</th>
				<td>
					<c:out value='${userVO.post}'/>
					<c:out value='${userVO.addss1}'/>
					<c:out value='${userVO.addss2}'/>
				</td>
			</tr>
			<tr>
				<th>우대여부</th>
				<td><c:out value='${userVO.merit eq "Y" ? "우대자" : "비우대자"}'/></td>
				<th>우대승인일</th>
				<td><c:out value='${userVO.mrtdate}'/></td>
			</tr>
		</tbody>
	</table>
	
	<div class="buttonBox">
		<input type="button" onclick="javascript:postExecute('List')" value="<spring:message code='button.list'/>"/>
	</div>
</form:form>
</article>

<jsp:include page="/Administrator/footer.jsp" flush="true"/>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="custom" uri="http://www.nakdongcamping.com/customs" %>

<jsp:include page="/Administrator/header.jsp" flush="true"/>

<script type="text/javaScript" charset="UTF-8" defer="defer">
//<![CDATA[
$(document).ready(function($) {
	/**검색*/
	window.fn_submitForm = function(obj) {
		setValue(obj.pageIndex, "1");
		return true;
	};
	
	/**뷰어*/
	window.fn_viewUser = function(userid) {
		setValue(getForm().command, "View")
		setValue(getForm().searchCode, userid);
		POST("/ADMIN/User.mobiz");
	};
	
	/**직권탈퇴*/
	window.fn_authorSecession = function(userid, username, dupinfo) {		
		$('<div title="Information"><p>'+username+'('+userid+')님을 직권탈퇴 시키겠습니까?</p></div>').dialog({
			autoOpen: true,
			width: 450,
			resizable: false,
			modal: true,
			closeOnEscape: false,
			buttons: [{text: "예", click: function() {
					$(this).dialog("close");
					setValue(getForm().usrId, userid);
					setValue(getForm().usrDp, dupinfo);
	        		setValue(getForm().execute, "Secession");
	        		POST("/ADMIN/UserProc.mobiz");
				}
			}, {text: "아니오", click: function() {
					$(this).dialog("close");
				}
			}]
		});
	};
});
//]]>
</script>

<hgroup>
	<h3><c:out value='${adminPageVO.programname}'/></h3>
	<h4>본 사이트 회원을 관리 합니다.</h4>
</hgroup>

<article>
<form:form commandName="searchVO" name="form" method="post" action="/ADMIN/User.mobiz" onsubmit="javascript:return fn_submitForm(this);">
	<input type="hidden" name="TOKEN_KEY" value="<c:out value='${TOKEN_KEY}'/>" title="실행중복확인키"/>
	<form:hidden path="command" title="실행구분"/>
	<form:hidden path="execute" title="세부실행구분"/>
	<form:hidden path="searchCode" title="검색아이디"/>
	<form:hidden path="usrId" title="유저아이디"/>
	<form:hidden path="usrDp" title="중복가입확인코드"/>
	
	<hr class="ui-height15"/>
	<div class="ui-fr">
		<form:select path="searchKey" title="검색구분을 선택하세요.">
			<form:option value="userid" label="아이디"/>
			<form:option value="name" label="회원명"/>
		</form:select>
		<label for="searchValue">검색어</label>
		<form:input path="searchValue" title="검색어를 입력하세요."/>
		<input type="submit" value="<spring:message code='button.search'/>"/>
	</div>
	<p class="ui-fl">총 <c:out value='${pageInfo.totalRecordCount}'/>명의 회원이 있습니다.</p>
	<hr class="ui-height15"/>
	
	<table class="ui-list vs-top-visual">
		<thead>
			<tr>
				<th>번호</th>
				<th>회원명</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>핸드폰번호</th>
				<th>우대여부</th>
				<th>가입일</th>
				<th>동의일</th>
				<th>우대승인일</th>
				<th>비밀번호변경일</th>
				<th>회원정보수정일</th>
				<th>직권탈퇴</th>
			</tr>
		</thead>
		
		<tbody class="ui-center">
<c:forEach var="rs" items="${userList}" varStatus="status">
			<tr>
				<td><c:out value='${(pageInfo.totalRecordCount - ((searchVO.pageIndex-1) * searchVO.pageUnit))-(status.count-1)}'/></td>
				<td><c:out value='${rs.name}'/></td>
				<td><a href="javascript:fn_viewUser('<c:out value="${rs.userid}"/>');"><c:out value='${rs.userid}'/></a></td>
				<td><c:out value='${custom:AESDecode(rs.passwd, rs.aeskey)}'/></td>				
				<td><c:out value='${rs.birth}'/></td>
				<td><c:out value='${rs.sex}'/></td>
				<td><c:out value='${rs.mobile}'/></td>
				<td><c:out value='${rs.merit eq "Y" ? "우대자" : "비우대자"}'/></td>
				<td><c:out value='${rs.regdate}'/></td>
				<td><c:out value='${rs.agrdate}'/></td>
				<td><c:out value='${rs.mrtdate}'/></td>
				<td><c:out value='${rs.pasdate}'/></td>
				<td><c:out value='${rs.uptdate}'/></td>
				<td>
					<input type="button" onclick="javascript:fn_authorSecession('<c:out value="${rs.userid}"/>', '<c:out value="${rs.name}"/>', '<c:out value="${rs.dupinfo}"/>');" class="ui-btn-del" value="<spring:message code='button.author.secession'/>"/>
				</td>
			</tr>
</c:forEach>
		</tbody>
	</table>
	
	<div class="pageBox">
		<ui:pagination paginationInfo = "${pageInfo}" type="image" jsFunction="postPage"/>
		<form:hidden path="pageIndex" title="페이지번호"/>
	</div>
</form:form>
</article>

<jsp:include page="/Administrator/footer.jsp" flush="true"/>
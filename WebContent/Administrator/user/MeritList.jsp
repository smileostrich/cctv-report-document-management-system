<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	/**우대자승인처리*/
	window.fn_meritApproval = function(username, userid) {
		$('<div title="Information"><p>'+username+'('+userid+')'+'님을 우대자로 승인처리하시겠습니까?</p></div>').dialog({
			autoOpen: true,
			width: 450,
			resizable: false,
			modal: true,
			closeOnEscape: false,
			buttons: [{text: "예", click: function() {
					$(this).dialog("close");
					setValue(getForm().userid, userid);
					setValue(getForm().command, "MeritList");
					setValue(getForm().execute, "Merit");
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
	<h4>본 사이트 회원의 우대승인을 관리 합니다.</h4>
</hgroup>

<article>
<form:form commandName="searchVO" name="form" method="post" action="/ADMIN/UserMerit.mobiz" onsubmit="javascript:return fn_submitForm(this);">
	<input type="hidden" name="TOKEN_KEY" value="<c:out value='${TOKEN_KEY}'/>" title="실행중복확인키"/>
	<input type="hidden" name="userid" value="" title="회원아이디"/>
	<form:hidden path="command" title="실행구분"/>
	<form:hidden path="execute" title="상세실행구분"/>
	<form:hidden path="searchCode" title="검색아이디"/>
	
	<hr class="ui-height15"/>
	<div class="ui-fr">
		<form:select path="searchKey" title="검색구분을 선택하세요.">
			<form:option value="userid" label="아이디"/>
			<form:option value="name" label="회원명"/>
		</form:select>
		<label for="searchValue">검색어</label>
		<form:input path="searchValue" title="검색어를 입력하세요."/>
		<input type="submit" value="<spring:message code='button.search'/>"/>
		<input type="button" value="<spring:message code='button.excel'/>" onclick="javascript:postExecute('MeritExcel');"/>
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
				<th>휴대전화</th>
				<th>가입일</th>
				<th>기능</th>
			</tr>
		</thead>
		
		<tbody class="ui-center">
<c:forEach var="rs" items="${userMeritList}" varStatus="status">
			<tr>
				<td><c:out value='${(pageInfo.totalRecordCount - ((searchVO.pageIndex - 1) * searchVO.pageUnit)) - (status.count - 1)}'/></td>
				<td><c:out value='${rs.name}'/></td>
				<td><a href="javascript:fn_viewUser('<c:out value="${rs.userid}"/>');"><c:out value='${rs.userid}'/></a></td>
				<td><c:out value='${custom:AESDecode(rs.passwd, rs.aeskey)}'/></td>				
				<td><c:out value='${rs.birth}'/></td>
				<td><c:out value='${rs.sex}'/></td>
				<td><c:out value='${rs.mobile}'/></td>
				<td><c:out value='${rs.regdate}'/></td>
				<td><input type="button" value="승인" onclick="javascript:fn_meritApproval('<c:out value="${rs.name}"/>','<c:out value="${rs.userid}"/>');"/></td>
			</tr>
</c:forEach>

<c:if test="${pageInfo.totalRecordCount < 1}">
			<tr><td colspan="9" class="ui-center h_f_100"><spring:message code='info.nodata.msg'/></td></tr>
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
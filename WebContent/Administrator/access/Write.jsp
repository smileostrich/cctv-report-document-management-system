<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<jsp:include page="/Administrator/header.jsp" flush="true"/>

<!--For Commons Validator Client Side-->
<script type="text/javascript" src="<c:url value='/common/validator.mobiz'/>"></script>
<validator:javascript formName="accessVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" charset="UTF-8" defer="defer">
//<![CDATA[
$(document).ready(function($) {
	/**접근제어등록*/
	window.fn_submitForm = function(obj) {
		if(!validateAccessVO(obj)) return;
		else {
			setValue(obj.execute, "Write");
			POST("/ADMIN/AccessProc.mobiz");
		}
	};
});
//]]>
</script>

<hgroup>
	<h3><c:out value='${adminPageVO.programname}'/></h3>
	<h4>본 사이트의 관리자모드 접근제어를 관리 합니다.</h4>
</hgroup>

<article>
<form:form commandName="accessVO" name="form" method="post" action="/ADMIN/Access.mobiz" onsubmit="javascript:fn_submitForm(this);return false;">
	<input type="hidden" name="TOKEN_KEY" value="<c:out value='${TOKEN_KEY}'/>" title="실행중복확인키"/>
	<form:hidden path="command" title="실행구분"/>
	<form:hidden path="execute" title="실행구분"/>
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" title="현재페이지"/>
	<form:hidden path="searchIdx" title="일련번호"/>
	<table class="ui-viewer vs-top-visual">
		<tbody>
			<tr>
				<th>접근허용 IP</th>
				<td><form:input path="accessip" title="접근허용 IP를 입력하세요."/></td>
			</tr>
			<tr>
				<th>설명</th>
				<td><form:input path="memo" title="설명을 입력하세요."/></td>
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
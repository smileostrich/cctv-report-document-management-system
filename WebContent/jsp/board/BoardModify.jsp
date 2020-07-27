<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<jsp:include page="/jsp/Header.jsp" flush="true"/>
<style>
.col-lg-6 {
    width: 100%;
}
</style>

	<!-- Page Content start -->
    <div id="page-wrapper">
		<div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시판 관리</h1>
                </div>
            </div>
    
			<form:form commandName="boardDataVO" name="form" method="post" action="/BoardData.do" onsubmit="javascript:fn_submitForm(this); return false;">
				<input type="hidden" name="command" value="<c:out value='${searchVO.command}'/>" title="실행구분"/>
				<input type="hidden" name="searchIdx" value="<c:out value='${searchVO.searchIdx}'/>" title="게시물일련번호"/>
				<form:hidden path="execute" title="상세실행구분"/>
				<div class="row">
				    <div class="col-lg-12">
				        <div class="panel panel-default">
				            <div class="panel-heading">
		                		게시물 수정
				            </div>
				            <div class="panel-body">
				                <div class="row">
				                    <div class="col-lg-6">
			                            <div class="form-group">
			                                <label for="title">제목</label>
			                                <form:input path="title" class="form-control" />
			                            </div>
			                            <div class="form-group">
			                                <label>내용</label>
			                                <form:textarea path="contents" style="height:300px;" class="form-control" placeholder="내용을 입력해 주세요" />
			                            </div>
			                            <div class="form-group">
			                                <label>진행상태</label>
			                                <form:select path="state" class="form-control">
			                                	<form:option value="미진행">미진행</form:option>
			                                	<form:option value="진행중">진행중</form:option>
			                                	<form:option value="진행완료">진행완료</form:option>
			                                </form:select>
			                            </div>
			                            <div class="form-group">
			                                <label for="performer">처리자</label>
			                                <form:input path="performer" class="form-control" />
			                            </div>
<!-- 			                            <div class="form-group"> -->
<!-- 			                                <label for="performer">처리자</label> -->
<%-- 			                                <form:select path="performer" class="form-control"> --%>
<%-- 			                                	<c:forEach var="userList" items="${userList}" varStatus="status"> --%>
<%-- 													<form:option value="${userList.name}" label="${userList.name}" /> --%>
<%-- 												</c:forEach> --%>
<%-- 			                                </form:select> --%>
<!-- 			                            </div> -->
			                            <button style="float:right;" style="float:right; margin-right:8px;" type="button" class="btn btn-default" onclick="javascript:postExecute('List');">리스트</button>
			                            <button style="float:right; margin-right:8px;" type="button" class="btn btn-default" onclick="javascript:fn_deleteRecord('<c:out value="${searchVO.searchIdx}"/>');">삭제</button>
			                            <button style="float:right; margin-right:8px;" type="submit" class="btn btn-default">저장</button>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
			</form:form>            
        </div>
    </div>
    <!-- Page Content end -->
<!-- 헤더닫기 -->
</div>
</body>

<script type="text/javaScript" charset="UTF-8" defer="defer">
//<![CDATA[
$(document).ready(function($) {
	/**로드이벤트*/
	window.onload = function() {
		getForm().editor.value = getForm().contents.value;
	};
	
	/**수정*/
	window.fn_submitForm = function(obj) {
// 		obj.contents.value = getContent();
		setValue(obj.command, "List");
		setValue(obj.execute, "Modify");
		POST("/BoardDataProc.do");
	};
	
	window.fn_deleteRecord = function(boardidx) {
		setValue(getForm().searchIdx, boardidx);
		setValue(getForm().command, "List");
		setValue(getForm().execute, "Del");
		POST("/BoardDataProc.do");
	};
});
//]]>
</script>
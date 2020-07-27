<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<jsp:include page="/jsp/Header.jsp" flush="true"/>
<style>
.col-lg-6 {
	width: 100%;
}
.container-fluid {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
    padding-bottom: 25px;
}
</style>
	<!-- Page Content start -->
    <div id="page-wrapper">
		<div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">A/S 게시판</h1>
                </div>
            </div>
			<form:form commandName="searchVO" name="form" method="post" action="/BoardData.do" onsubmit="javascript:fn_submitForm(this); return false;">
				<input type="hidden" name="command" value="<c:out value='${searchVO.command}'/>" title="실행구분"/>
				<input type="hidden" name="searchIdx" value="<c:out value='${searchVO.searchIdx}'/>" title="게시물일련번호"/>
				<form:hidden path="execute" title="상세실행구분"/>
				<div class="row">
				    <div class="col-lg-12">
				        <div class="panel panel-default">
				            <div class="panel-heading">
		                		게시물 상세
				            </div>
				            <div class="panel-body">
					            <div class="row">
					                <div class="col-lg-6">
				                        <div class="form-group">
				                            <label for="state">진행상태</label>
				                            <input class="form-control" value="<c:out value='${boardDataVO.state}'/>" readonly/>
				                        </div>
				                        <div class="form-group">
				                            <label for="regname">담당자</label>
				                            <input class="form-control" value="<c:out value='${boardDataVO.regname}'/>" readonly/>
				                        </div>
				                        <div class="form-group">
				                            <label for="tel">연락처</label>
				                            <input class="form-control" value="<c:out value='${boardDataVO.tel}'/>" readonly/>
				                        </div>
				                        <div class="form-group">
				                            <label>처리자</label>
				                            <input class="form-control" value="<c:out value='${boardDataVO.performer}'/>" readonly/>
				                        </div>
					                </div>
					            </div>
					            <div class="row">
					                <div class="col-lg-6">
				                        <div class="form-group">
				                            <label for="title">제목</label>
				                            <input class="form-control" value="<c:out value='${boardDataVO.title}'/>" readonly/>
				                        </div>
				                        <div class="form-group">
				                            <label>내용</label>
				                            <textarea readonly="readonly" style="height:300px;" class="form-control"><c:out value='${boardDataVO.contents}'/></textarea>
				                        </div>
				                        <button style="float:right;" type="button" class="btn btn-default" onclick="javascript:postExecute('List');">리스트</button>
				                        <button style="float:right; margin-right:8px;" type="button" class="btn btn-default" onclick="javascript:fn_deleteRecord('<c:out value="${searchVO.searchIdx}"/>');">삭제</button>
				                        <button style="float:right; margin-right:8px;" type="button" class="btn btn-default" onclick="javascript:postExecute('Modify');">수정</button>
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
</body>

<script type="text/javaScript" charset="UTF-8" defer="defer">
$(document).ready(function($) {
	window.fn_deleteRecord = function(boardidx) {
		setValue(getForm().searchIdx, boardidx);
		setValue(getForm().command, "List");
		setValue(getForm().execute, "Del");
		POST("/BoardDataProc.do");
	};
});
</script>

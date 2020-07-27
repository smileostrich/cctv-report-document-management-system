<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>

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
                    <h1 class="page-header">A/S 게시판</h1>
                </div>
            </div>
            <form:form commandName="boardDataVO" name="form" method="post" action="/BoardData.do" onsubmit="javascript:fn_submitForm(this); return false;">	
				<input type="hidden" name="command" value="<c:out value='${searchVO.command}'/>" title="실행구분" />
				<form:hidden path="execute" title="상세실행구분" />
				<div class="row">
				    <div class="col-lg-12">
				        <div class="panel panel-default">
				            <div class="panel-heading">
		                		게시물 작성
				            </div>
				            <div class="panel-body">
				                <div class="row">
				                    <div class="col-lg-6">
				                        <form role="form">
				                            <div class="form-group">
				                                <label for="title">제목</label>
				                                <form:input path="title" class="form-control" placeholder="제목을 입력해 주세요" />
	<!-- 			                                <p class="help-block">내용을 적어주세요</p> -->
				                            </div>
				                            <div class="form-group">
				                                <label>내용</label>
				                                <form:textarea path="contents" style="height:300px;" class="form-control" placeholder="내용을 입력해 주세요" />
				                            </div>
				                            <div class="form-group">
				                                <label>진행상태</label>
				                                <form:select path="state" class="form-control">
				                                	<option value="미진행">미진행</option>
				                                	<option value="진행중">진행중</option>
				                                	<option value="진행완료">진행완료</option>
				                                </form:select>
				                            </div>
				                            <div class="form-group">
				                                <label for="performer">처리자</label>
				                                <form:input path="performer" class="form-control"/>
				                            </div>
				                            
				                            <button style="float:right;" type="button" class="btn btn-default" onclick="javascript:postExecute('List');">리스트</button>
				                            <button style="float:right; margin-right:8px;" type="submit" class="btn btn-default">등록</button>
				                        </form>
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
	$(document).ready(function($) {
		/**등록*/
		window.fn_submitForm = function(obj) {
			setValue(obj.command, "List");
			setValue(obj.execute, "Write");
			POST("/BoardDataProc.do");
		};
	});
</script>
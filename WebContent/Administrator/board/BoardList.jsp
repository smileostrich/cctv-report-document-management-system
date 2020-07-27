<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="/jsp/Header.jsp" flush="true"/>

	<!-- Page Content start -->
    <div id="page-wrapper">
		<div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시판 관리</h1>
                </div>
            </div>
            <div class="row">
            	<form:form commandName="searchVO" name="form" method="post" action="/ADMIN/Board.do" onsubmit="javascript:return fn_submitForm(this);">
					<form:hidden path="command" title="실행구분"/>
					<form:hidden path="searchCode" title="검색일련번호"/>
					<form:hidden path="execute" title="세부실행구분"/>
					<hr class="ui-height15"/>
					<div class="ui-fr">
						<label for="searchValue">검색어</label>
						<form:input path="searchValue" title="검색어를 입력하세요."/>
						<input type="submit" value="검색"/>
					</div>
					<p class="ui-fl">총 <c:out value='${pageInfo.totalRecordCount}'/>개의 게시판이 있습니다.</p>
					<hr class="ui-height15"/>
					<table class="ui-viewer vs-top-visual">
						<thead>
							<tr>
								<th>번호</th>
								<th>게시판아이디</th>
								<th>게시판명</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="rs" items="${boardList}" varStatus="status">
								<tr>
									<td><c:out value='${(pageInfo.totalRecordCount - ((searchVO.pageIndex-1) * searchVO.pageUnit))-(status.count-1)}'/></td>
									<td><c:out value='${rs.boardid}'/></td>
									<td>
										<a href="<c:url value='/ADMIN/BoardData.do?pageid=${rs.boardid}'/>">
											<c:out value='${rs.boardname}'/>
										</a>
									</td>
									<td>
										<input type="button" onclick="javascript:fn_setAuth('<c:out value="${rs.boardid}"/>');" class="ui-btn-auth" value="권한설정"/>
										<input type="button" onclick="javascript:fn_editBoard('<c:out value="${rs.boardid}"/>')" class="ui-btn-modify" value="수정"/>
										<input type="button" onclick="javascript:fn_delBoard('<c:out value="${rs.boardid}"/>')" class="ui-btn-del" value="삭제"/>
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
						<input type="button" onclick="javascript:postExecute('Write')" value="등록"/>
					</div>
				</form:form>
            </div>
        </div>
    </div>
    <!-- Page Content end -->


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
		POST("/ADMIN/Board.do");
	};
	
	/**삭제*/
	window.fn_delBoard = function(boardid) {
		setValue(getForm().searchCode, boardid);
		setValue(getForm().execute, "Del");
		POST("/ADMIN/BoardProc.do");
	};
});
//]]>
</script>

<!-- 헤더닫기 -->
</div>
</body>
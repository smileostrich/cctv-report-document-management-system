<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="/jsp/Header.jsp" flush="true"/>

    <!-- Page Content start -->
    <div id="page-wrapper">
    	<div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">A/S 게시판</h1>
                </div>
            </div>
	    	<div class="row">
	    		<form:form commandName="searchVO" name="form" method="get" action="/BoardData.do" onsubmit="javascript:return fn_submitForm(this);">
				<form:hidden path="command" title="실행구분" />
				<form:hidden path="pageid" title="페이지아이디" />
				<form:hidden path="searchIdx" title="검색일련번호" />
			    <div class="col-lg-12">
			        <div class="panel panel-default">
			            <div class="panel-heading">A/S 접수내역 <input type="button" style="float:right; margin-top: -7px;" class="btn btn-default" onclick="javascript:postExecute('Write');" value="등록" /></div>
			            <div class="panel-body">
			                <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
			                    <div class="row">
			                    	<div class="col-sm-12" style="margin-left: 4px; margin-bottom: 5px;">
										<span>진행상태 :</span>
										<form:select class="form-control input-sm" path="searchType" onchange="javascript:postExecute('List');">
											<form:option value="" label="전체"/>
											<form:option value="미진행" label="미진행"/>
											<form:option value="진행중" label="진행중"/>
											<form:option value="진행완료" label="진행완료"/>
										</form:select>
									</div>
			                    </div>
			                    <div class="row">
			                        <div class="col-sm-12">
			                            <table class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" role="grid" style="width: 100%;">
			                                <thead>
			                                    <tr role="row">
			                                        <th class="sorting" tabindex="0" rowspan="1" colspan="1" style="width: 285px;">진행상태</th>
			                                        <th class="sorting" tabindex="0" rowspan="1" colspan="1" style="width: 342px;">제목</th>
			                                        <th class="sorting" tabindex="0" rowspan="1" colspan="1" style="width: 313px;">담당자</th>
			                                        <th class="sorting" tabindex="0" rowspan="1" colspan="1" style="width: 249px;">담당자 연락처</th>
			                                        <th class="sorting" tabindex="0" rowspan="1" colspan="1" style="width: 187px;">요청일</th>
			                                    </tr>
			                                </thead>
			                                <tbody>
												<c:forEach var="rs" items="${dataList}" varStatus="status">
													<tr class="gradeA" role="row">
														<td>
															<c:out value='${rs.state}' />
														</td>
														<td>
															<a href="javascript:fn_viewBoard('<c:out value="${rs.idx}"/>');">
																<c:out value="${rs.title}" />
															</a>
<%-- 															<c:out value='${rs.contents}' /> --%>
														</td>
														<td>
															<c:out value='${rs.regname}' />
<%-- 															<a href="javascript:fn_viewBoard('<c:out value="${rs.idx}"/>');"> --%>
<%-- 																<c:out value="${rs.title}" /> --%>
<!-- 															</a> -->
														</td>
														<td class="center">
															<c:out value='${rs.tel}' />
														</td>
														<td>
															<c:out value='${rs.regdate}' />
														</td>
													</tr>
												</c:forEach>
												<c:if test="${pageInfo.totalRecordCount < 1}">
													<tr>
														<td colspan="<c:out value='${colspan}'/>">
															해당 데이터가 없습니다.
														</td>
													</tr>
												</c:if>
											</tbody>
			                            </table>
			                        </div>
			                    </div>
<!-- 			                    <div class="row"> -->
<!-- 			                        <div class="col-sm-6"> -->
<!-- 			                            <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate"> -->
<!-- 			                                <ul class="pagination"> -->
<!-- 												<li class="paginate_button " aria-controls="dataTables-example" tabindex="0"> -->
<!-- 													<a href="#"> -->
<%-- 														<ui:pagination paginationInfo="${pageInfo}" type="image" jsFunction="postPage" /> --%>
<%-- 														<form:hidden path="pageIndex" title="페이지번호" /> --%>
<!-- 													</a> -->
<!-- 												</li> -->
<!-- 			                                </ul> -->
<!-- 			                            </div> -->
<!-- 			                        </div> -->
<!-- 			                    </div> -->
			                </div>
			            </div>
			        </div>
			    </div>
			    </form:form>
			</div>
		</div>
	</div>
    <!-- Page Content end -->
<!-- 헤더닫기 -->
</div>
</body>    


<script type="text/javaScript" charset="UTF-8" defer="defer">
//<![CDATA[
$(document).ready(function($) {
	/**검색*/
	window.fn_submitForm = function(obj) {
		setValue(obj.pageIndex, "1");
		return true;
	};
	
	/**뷰어*/
	window.fn_viewBoard = function(idx) {
		setValue(getForm().searchIdx, idx);
		setValue(getForm().command, "View");
		GET("<c:url value='${submitUrl}'/>");
	};
});
//]]>
</script>
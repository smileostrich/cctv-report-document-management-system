<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: 낙동강 오토캠핑장 :: 우대승인 신청자 현황 ::</title>
</head>
<body>
	<table border="1" width="750px;" summary="낙동강 오토캠핑장 우대승인 신청자 현황표">
		<colgroup>
			<col style="width: 7%;"/>
			<col style="width: 15%;"/>
			<col style="width: 15%;"/>
			<col style="width: 15%;"/>
			<col style="width: 7%;"/>
			<col style="width: 20%;"/>
			<col style="width: 25%;"/>
		</colgroup>
		
		<thead>
			<tr>
				<th style="font-weight: bold; background-color: gray;">번호</th>
				<th style="font-weight: bold; background-color: gray;">아이디</th>
				<th style="font-weight: bold; background-color: gray;">성명</th>
				<th style="font-weight: bold; background-color: gray;">생년월일</th>
				<th style="font-weight: bold; background-color: gray;">성별</th>
				<th style="font-weight: bold; background-color: gray;">휴대전화</th>
				<th style="font-weight: bold; background-color: gray;">전자우편</th>
			</tr>		
		</thead>
		
		<tbody>
<c:choose>
	<c:when test="${fn:length(userMeritList) > 0}">
		<c:forEach var="rs" items="${userMeritList}" varStatus="status">
			<tr>
				<td style="text-align: center;"><c:out value='${status.count}'/></td>
				<td style="text-align: center;"><c:out value='${rs.userid}'/></td>
				<td style="text-align: center;"><c:out value='${rs.name}'/></td>
				<td style="text-align: center;"><c:out value='${rs.birth}'/></td>
				<td style="text-align: center;"><c:out value='${rs.sex}'/></td>
				<td style="text-align: center;"><c:out value='${rs.mobile}'/></td>
				<td style="text-align: center;"><c:out value='${rs.email}'/></td>
			</tr>
		</c:forEach>
	</c:when>
	<c:otherwise>
			<tr><td colspan="7" style="text-align: center;">등록된 우대승인 신청자가 없습니다.</td></tr>
	</c:otherwise>
</c:choose>
		</tbody>
	</table>
</body>
</html>
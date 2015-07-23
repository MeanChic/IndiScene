<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/artist.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/artist.css"/>
</head>
<body>
	<div class="zipcodeForm">
		<div class="zipcodeContent">	
			<div align="center">
				<form action="${root }/artist/zipcode.do" method="post" style="margin-top:1.5px">
					<input type="text" name="dong" />
					<input type="submit" value="검색" id="searchStyle"/>
				</form>
			</div>
			<hr id="zipcodeHr">
			<c:if test="${list==null }">
				<div id="noSearch" align="center" >
					검색결과가 없습니다.
				</div>
			</c:if>
			
			<c:if test="${list!=null }">
				<div align="center">
					<table>				
						<c:forEach var="zipcode" items="${list }">
							<tr>
								<td>
									<a href="javascript:sendAddress('${zipcode.zipcode}', '${zipcode.sido }', '${zipcode.gugun }', '${zipcode.dong}', '${zipcode.ri}', '${zipcode.bldg}', '${zipcode.bunji}')">
										${zipcode.zipcode} ${zipcode.sido } ${zipcode.gugun } ${zipcode.dong} ${zipcode.ri} ${zipcode.bldg} ${zipcode.bunji}
									</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</c:if>
		</div>
	</div>
</body>

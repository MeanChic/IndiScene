<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<%-- <c:set var="artist_id"  value="indi"/> --%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="${root}/css/jquery-ui.css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
</head>
<body>
<script type="text/javascript">
$(function(){
	var root = $("#root").val();
	var artist_id=$("input[name='artist_id']").val();
	var sendData= "artist_id=" + artist_id;
	var url = root + "/museCreate/museCheck.do?" + sendData;
	var muse_name;
	 $.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function (data){
			if(data == "0"){
				$("input[name='create']").val("Create")
			}else{
				$("input[name='create']").val("Admission")
				$("input[name='muse_name']").val(data);	
				muse_name = $("input[name='muse_name']").val();	
			}
		}
	});
	 
	 $("input[name='create']").click(function(){
		 //alert(muse_name);
		 if($(this).val()=="Admission"){
			// location.href=root + "/museCreate/goin.do?muse_name="+muse_name;
			goinmuse(muse_name);
			//goinmuse
		 }else{
			//location.href=root + "/museCreate/logup.do";
			logupmuse();
		 }
	}); 
});
</script>
<div id="boardBasic">
	<input type="hidden" name="artist_id" value="${artist_id}"/>
	<input type="hidden" id="root" value="${root}"/>
	<input type="hidden" name="muse_name" value="${muse_name}"/>
	<h3>Indi's Muse</h3>
	<div class="marketBoardX-location02 marketBoardInterval03">
		<input class="marketBoardAttribute01 btn btn-default" type="button" name="create"/>
	</div>
	<%-- ===============인기있는 MUSE============= --%>
	<div class="form-controlMarket">
		<div id="best" class="boardBlock marketBoardAttribute01 marketBoardSize495 marketBoardInterval01 musemainHeight marketBoardY-location01">
			<h4>Best Muse</h4>
			<c:forEach var="best" items="${bestMuse}">
				<div class="${best.MUSE_NAME} form-controlBoard">
					<img class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01" src="${root }${best.MUSE_FILEPATH }" style="width:40px; height:40px"/>
					<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${best.ARTIST_ID}</label>
					<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${best.MUSE_NAME}</label>
					<button type="button" class="boardlabelBlock marketBoardSize30 marketBoardAttribute01" data-toggle="tooltip" data-placement="top" title="${best.MUSE_COMMENT}">Comment</button>
						<%--${best.MUSE_DATE} --%>
					<c:if test="${best.MUSE_YN == 'n'}">
						<input class="boardlabelBlock marketBoardSize30 label-color marketBoardAttribute01" type="button" value="Cancel" onclick="cancle('${artist_id}','${best.MUSE_NAME}')"/>
					</c:if>
					<c:if test="${best.MUSE_YN == 'y'}">
						<a <%-- href="${root}/museCreate/goin.do?muse_name=${best.MUSE_NAME} --%>href="javascript:goinmuse('${best.MUSE_NAME}')"><input class="boardlabelBlock marketBoardSize30 label-color marketBoardAttribute01" type="button" value="Enter" /></a>
					</c:if> 
					<c:if test="${best.MUSE_YN == '0'}">
						<input class="boardlabelBlock marketBoardSize30 label-color marketBoardAttribute01" type="button" value="AppJoin" onclick="signup('${artist_id}','${best.MUSE_NAME}')"/>
					</c:if>
				</div>
			</c:forEach>
		</div>
	<%--==============내가 가입되어 있는 MUSE============== --%>
		<div id="my" class="boardBlock marketBoardAttribute01 marketBoardSize495 marketBoardInterval01 musemainHeight">
			<h4>My Muse</h4>
			<c:forEach var="my" items="${myMuse}">
				<div class="${my.MUSE_NAME} form-controlBoard">
					<img class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01" src="${root }${my.MUSE_FILEPATH }" style="width:40px; height:40px"/>
					<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${my.MUSE_NAME}</label>
					<label class="boardlabelBlock marketBoardSize40 label-color marketBoardAttribute01">${my.MUSE_COMMENT}</label>
					<c:if test="${my.MUSE_YN == 'n'}">
						<input class="boardlabelBlock marketBoardSize30 label-color marketBoardAttribute01" type="button" value="Cancel" onclick="cancle('${artist_id}','${my.MUSE_NAME}')"/>
					</c:if>
					<c:if test="${my.MUSE_YN == 'y'}">
						<a href="javascript:goinmuse('${my.MUSE_NAME}')"<%-- href="${root}/museCreate/goin.do?muse_name=${my.MUSE_NAME}" --%>><input class="boardlabelBlock marketBoardSize30 label-color marketBoardAttribute01" type="button" value="Enter"/></a>
					</c:if>
				</div>
			</c:forEach>
		</div>
	</div>
	<%--===============모든 뮤즈============= --%>
	<div id="all" class="boardBlock form-controlMarket marketBoardInterval03">
		<h4>All Muse</h4>
		<c:forEach var="all" items="${allMuse}">
			<div class="${all.muse_name} marketBoardAttribute02">
				<img class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01" src="${root }${all.muse_filepath }" style="width:40px; height:40px"/>
				<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01">${all.muse_name}</label>
				<label class="boardlabelBlock marketBoardSize02 label-color marketBoardAttribute01">${all.muse_comment}</label>
				<label class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01"><fmt:formatDate value="${all.muse_date}" type="date"/></label> 
				<input class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01" type="button" value="AppJoin" onclick="signup('${artist_id}','${all.muse_name}')"/>
			</div>
		</c:forEach>
	</div>
	
	<div class="panel-group marginLR20" id="accordion" role="tablist" aria-multiselectable="true">
		<c:forEach var="all" items="${allMuse}">
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingOne">
					<h4 class="panel-title">
						<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							${all.muse_name}
						</a>
						<input class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01" type="button" value="AppJoin" onclick="signup('${artist_id}','${all.muse_name}')"/>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body">
						<img class="boardlabelBlock marketBoardSize12 label-color marketBoardAttribute01" src="${root}${all.muse_filepath}" style="width:100px; height:100px"/>
							${all.muse_comment}
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<!-- 검색 작업창 시작 --------------------------------------------------->
	<div id="MuseMainDiv"> 
		<form id="searchForm" name="searchForm" method="get" action="javascript:searchMuseMain('${root}','1','${pageContext.request.servletPath }');">
	<!--   페이징작업을위한 GET방식 -->     
	<input type="hidden" name="searchflag" value="true"/> <!-- 검색글 요청시 플래그값을 true로 넘김 -->
              <table id="">
                    <tr class="searchBox">
                         <td class="">
                               <select id="searchType" name="searchType">
									  <option value="total">전체</option>	                              			
                                      <option value="artist_id">개설자</option>
                                      <option value="subject">MuseName</option>
                                      <option value="content">Muse 설명</option>
                               </select>
                         </td>
                         <td class="">
                               <input type="text"  id="searchWord" name="searchWord">
                         </td>
                         <td class="searchBtn">
                               <input type="submit" id="searchBtn" value="submit"></input>
                         </td>
                    </tr>
             </table>
        </form>
	
	</div>
</div>
</body>
</html>
	
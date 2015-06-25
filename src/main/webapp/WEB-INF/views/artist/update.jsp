<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/artist.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/artist.css"/>
</head>
<body>
<div align="center">
		<font size="2"><b>정보수정(*필수입력사항입니다.)</b></font>
	</div>

	<div align="center">
		<form class="form_style" name="memberForm" action="${root }/member/update.do" method="post" onsubmit="return registerForm(this)">
			<div class="line">
				<label class="title">아이디</label>
				<span class="content">
					<input type="hidden" name="num" value="${member.num }"/>
					*<input type="text" name="id" value="${member.id }" disabled="disabled"/>
				</span>
			</div>
			
			<div class="line">
				<label  class="title">비밀번호</label>
				<span class="content">
					*<input type="password" name="password" value="${member.password }" />
				</span>
			</div>
			
			<div class="line">
				<label class="title">비밀번호확인</label>
				<span class="content">
					*<input type="password" name="passwordCheck" value="${member.password }"/>
				</span>
			</div>
	
			<div class="line">
				<label class="title">이름</label>
				<span class="content">
					*<input type="text" name="name" value="${member.name }"/>
				</span>
			</div>
			
			<div class="line">
				<label class="title">주민번호</label>
				<span class="content">
					*<input type="text" name="jumin1" size="11" maxlength="6" value="${member.jumin1 }" />
					-<input type="text" name="jumin2" size="12" maxlength="7" value="${member.jumin2 }" />
				</span>	
			</div>
			
			<div class="line">
				<label class="title">이메일</label>
				<span class="content">
					<input type="text" name="email" size="25" value="${member.email }" />
				</span>
			</div>
			
			<div class="line">
				<label class="title">우편번호</label>
				<span class="content">
					<input type="text" name="zipcode" value="${member.zipcode }" />
					<input type="button" value="우편번호검색" onclick="zipcodeCheck(memberForm,'${root}')"/>
				</span>
		  	</div>
			
			<div class="line">
				<label class="title">주소</label>
				<span class="content">
					<input type="text" name="address" size="48" value="${member.address }" />
				</span>
			</div>
			
			<div class="line">
				<label class="title">직업</label>
				<span class="content">
					<select name="job">
						<option></option>
						<option value="회사원">회사원</option>
						<option value="학생">학생</option>
						<option value="전문직">전문직</option>
						<option value="기타">기타</option>
					</select>
				</span>
				
	 		 	<script type="text/javascript">
					//memberForm.job.value="${member.job}";
					
					//jquery사용하기
					$("option:eq(0)").text("${member.job}");
				</script>		 
				
					
			</div>
			
			<div class="line">
				<label class="title">메일수신</label>
				<span class="content">
					<input type="radio" name="mailing" value="yes" />yes
					<input type="radio" name="mailing" value="no" />no
				</span>
				
	<!-- 		<script type="text/javascript">
					memberForm.mailing.value="${member.mailing}";
				</script>	 -->
				
				<script type="text/javascript">
					/* for(var i=0;i<memberForm.mailing.length;i++){
						if(memberForm.mailing[i].value=="${member.mailing}"){
							memberForm.mailing[i].checked=true;
						}
					} */
					
					//jquery사용하기
					$("input[name='mailing']").each(function(){
						if($(this).val()=="${member.mailing}"){
							$(this).attr("checked","true");
						}
					});
				</script>
				
			</div>
			
			<div class="line">
				<label class="title">관심분야</label>
				<span class="content">
					<input type="checkbox" name="interestValue" value="경제"/> 경제 &nbsp;
					<input type="checkbox" name="interestValue" value="IT"/> IT &nbsp;
					<input type="checkbox" name="interestValue" value="음악"/> 음악 &nbsp;
					<input type="checkbox" name="interestValue" value="미술"/> 미술 &nbsp;
					<input type="hidden" name="interest" />
					<!-- 실제로 값이 넘어가는 건 hidden -> 배열형태의 interestValue의 값들을 하나로 합쳐서 넘길거야(script.js에서) -->
				</span>

				<c:forTokens var="interest" items="${member.interest }" delims=",">
					<script type="text/javascript">
					/* 	for(var i=0;i<memberForm.interestValue.length;i++){
							if(memberForm.interestValue[i].value=="${interest}"){
								memberForm.interestValue[i].checked=true;
							}								
						} */
						
						//jquery사용하기
						$("input[name='interestValue']").each(function(){
							if($(this).val()=="${interest}"){
								$(this).attr("checked","true");
							}
						});
					</script>				
				</c:forTokens>
				
			</div>
			
			<div class="line" style="width:498px; border-width:2px; text-align:center;">
				<input type="submit" value="수정" />
				<input type="reset" value="취소" />
			</div>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Artist</title>
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/artist.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/artist.css"/>
</head>
<body>
	<center>[Artist register]</center>
	<a href="${root}/artist.jsp">artist page</a><br/><br/>
	
	<div id="RegisterForm">
		<form name="artistForm" action="${root}/artist/register.do" method="POST" onsubmit="return registerForm(this)">
			<div>
				<label>Id</label>
				<input type="text" name="artist_id"/>
				<input type="button" value="Duplicate Check" onclick="return idCheck(artistForm, '${root}')"/>
			</div><br/>
			<div>
				<label>Password</label>
				<input type="password" name="artist_password"/>
				<label>Password Check</label>
				<input type="password" name="passwordCheck"/>
			</div><br/>
			<div>
				<label>Name</label>
				<input type="text" name="artist_name"/>
			</div><br/>
			<div>
				<label>Nickname</label>
				<input type="text" name="artist_nickname"/>
				<input type="button" value="Duplicate Check" onclick="nicknameCheck(artistForm, '${root}')"/>
			</div><br/>
			<div>
				<label>Phone</label>
				<input type="text" name="artist_phone"/>
			</div><br/>
			<div>
				<label>Zipcode</label>
				<input type="text" name="artist_zipcode"/>
				<input type="button" value="Zipcode" onclick="zipcodeCheck(artistForm,'${root}')"/>
			</div><br/>
			<div>
				<label>Address</label>
				<input type="text" name="artist_address"/>
			</div><br/>
			<div>
				<label>Birth</label>
				<input type="date" name="artist_birth"/>
			</div><br/>
			<div>
				<label>Profile Image</label>
				<div>
					<input type="file" name="artist_picturePath"/>
					<div>
						<script type="text/javascript">
							var path=$("input[name='artist_picturePath']").val();
							$("input[name='artist_picturePath']").val()==path;
							return false;
						</script>
					</div>
					<input type="text" name="artist_picture"/>
				</div>
			</div><br/>
			<div>
				<input type="submit" value="sign up"/>
			</div><br/>
		</form>
	</div>
</body>
</html>


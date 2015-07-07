<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${root}/js/artist.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/artist.css"/>

<center>[Artist update]</center>
	<div id="RegisterForm">
		<form name="artistForm" onsubmit="return registerForm(this)">
			<div>
				<label>Id</label>
				<input type="text" name="artist_idView" value="${artist.artist_id}" disabled="disabled"/>
				<input type="hidden" name="artist_id" value="${artist.artist_id}"/>
			</div><br/>
			<div>
				<label>Password</label>
				<input type="password" name="artist_password"/>
				<label>Password Check</label>
				<input type="password" name="passwordCheck"/>
			</div><br/>
			<div>
				<label>Name</label>
				<input type="text" name="artist_name" value="${artist.artist_name}"/>
			</div><br/>
			<div>
				<label>Nickname</label>
				<input type="text" name="artist_nickname" value="${artist.artist_nickname}"/>
				<input type="button" value="Duplicate Check" onclick="nicknameCheck(artistForm, '${root}')"/>
			</div><br/>
			<div>
				<label>Phone</label>
				<input type="text" name="artist_phone" value="${artist.artist_phone}"/>
			</div><br/>
			<div>
				<label>Zipcode</label>
				<input type="text" name="artist_zipcode" value="${artist.artist_zipcode}"/>
				<input type="button" value="Zipcode" onclick="zipcodeCheck(artistForm,'${root}')"/>
			</div><br/>
			<div>
				<label>Address</label>
				<input type="text" name="artist_address" value="${artist.artist_address}"/>
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
					<input type="text" name="artist_picture" value="${artist.artist_picture}"/>
				</div>
			</div><br/>
			<input type="hidden" name="artist_level" value="${artist.artist_level}"/>
			<div>
				<input type="submit" name="updateOk" value="submit"/>
				<input type="button" value="cancel"/>
			</div><br/>
		</form>
	</div>



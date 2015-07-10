<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type='text/javascript'>

//alert('${CKEditorFuncNum}');
//alert('${filePath}');
window.parent.CKEDITOR.tools.callFunction('${CKEditorFuncNum}', '${filePath}', '이미지 업로드 완료.');

</script>
</body>
</html>
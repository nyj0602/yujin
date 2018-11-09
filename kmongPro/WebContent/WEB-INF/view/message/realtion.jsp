<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2018. 3. 14. - 오전 10:55:45</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

<form action="message.do">
	<input type="hidden" value = "${sessionMr_seq }" name = "sessionMr_seq"/>
	<input type="hidden" value = "${mr_seq }" name = "mr_seq"/>
	<input type="hidden" value = "${t_seq }" name = "t_seq"/>
</form>
<script type="text/javascript">
$(function () {
	$("form").submit();
});
</script>







</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스목록</title>
<style>
	.page-content {
    	width: 1200px;
    	margin: 0 auto;
    	margin-bottom: 10px;
    	flex-grow: 1;
	}
	.posting-wrap {
    	display: flex;
    	flex-wrap: wrap;
	}
	.posting-item{
	    box-sizing: border-box;
    	width: calc(100% / 5);
    	padding: 13px;
	}
	.posting-content {
    	width: 80%;
    	margin: 0 auto;
	}
</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>	
</head>
<body>
<div class="page-content">
<div class="posting-wrap">
	<div class="posting-item">
		<div class="posting-img">
			<img src="/momo.png">
		</div>
		<div class="posting-content">
			<th>제목</th>
			
		</div>
	</div>
</div>
</div>

</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>
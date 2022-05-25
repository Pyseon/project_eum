<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 커뮤니티</title>

</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="comm-header">
			<button class="comm-nav" value="2">전체</button>
			<button class="comm-nav" value="0">요즘뭐하니</button>
			<button class="comm-nav" value="1">이건어때</button>
		</div>
		<div id=comm-content>
			<%@ include file="/WEB-INF/views/community/communityListCat2.jsp"%>
		</div>
		<!-- com-content -->
	</div>
	<script>
	$(function() {
	    $(".comm-nav").on("click", function() {
	    	let param = $(this).val();
	    	let urlData = "/communityList.do?menu=false&category="+param+"&reqPage=1"
	    			console.log(urlData);
	    	$.ajax({
				url: urlData,
				success:function(){
					$("#comm-content").load(urlData);
				}
			});
	    });
	});
	
	/*
	function allList(){
		$.ajax({
			url: "/communityAllList.do?category=2&reqPage=1",
			success:function(){
				$("#comm-content").load("communityAllList.do?category=2&reqPage=1");
			}
		});
	}
	function cat0List(){
		$.ajax({
			url: "/communityListCat0.do?category=0&reqPage=1",
			success:function(){
				$("#comm-content").load("communityListCat0.do?category=0&reqPage=1");
			}
		});
	}
	function cat1List(){
		$.ajax({
			url: "/communityListCat0.do?category=1&reqPage=1",
			success:function(){
				$("#comm-content").load("communityListCat0.do?category=1&reqPage=1");
			}
		});
	}
	*/
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
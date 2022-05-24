<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
	<div class="memberWrap">
		<div>
			<ul>
				<li><button class="selectMemberBtn" value=0>회원</button></li>
				<li><button class="selectMemberBtn" value=1>전문가</button></li>
				<li><button class="selectMemberBtn" value=2>일반회원</button></li>
				<li><button class="selectMemberBtn" value=3>사업자</button></li>
				<li><button class="selectMemberBtn" value=4>블랙리스트</button>
			</ul>
		</div>
		<div id="resultTbl">
			<table class="memberTbl" border="1"></table>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		$(".selectMemberBtn").on("click",function(){
			const selectMemberBtn = this.value;
			$.ajax({
				url : "/selectMember.do?selectMemberBtn="+selectMemberBtn,
				success : function(data){
					const table = $("#resultTbl>table");
					table.empty();
					const titleTr = $("<tr>");
					titleTr.append("<th>번호</th><th>등급</th><th>이메일</th><th>닉네임</th><th>전화번호</th><th>가입일</th><th>신고 누적 횟수</th><th>블랙리스트 등록</th>");
					table.append(titleTr);
					for(let i=0;i<data.length;i++){
						const tr=$("<tr>");
						tr.append("<td>"+data[i].memberNo+"</td>");
						tr.append("<td>"+data[i].Grade+"</td>");
						tr.append("<td>"+data[i].memberId+"</td>");
						tr.append("<td>"+data[i].memberNick+"</td>");
						tr.append("<td>"+data[i].memberPhone+"</td>");
						tr.append("<td>"+data[i].enrollDate+"</td>");
						tr.append("<td>"+data[i].memberReportCount+"</td>");
						if(selectMemberBtn == 4){
							tr.append("<td><input type='button' onclick=location='/clearBlackList.do?memberNo="+data[i].memberNo+"&selectMemberBtn="+selectMemberBtn+"'>블랙리스트 해제</button></td>");
						}else{
							tr.append("<td><input type='button' onclick=location='/registBlackList.do?memberNo="+data[i].memberNo+"&selectMemberBtn="+selectMemberBtn+"'>블랙리스트 등록</button></td>");	
						}
						table.append(tr);
					}
				}
			});
		});
		
	</script>
</body>
</html>
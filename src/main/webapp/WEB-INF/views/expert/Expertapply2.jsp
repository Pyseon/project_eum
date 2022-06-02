<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전문가 신청3</title>
</head>
<body>
	<form action="/Expertapply3.do" method="post">
		<ul>
			<li>
				<label>상담분야*</label>
				<select size="11" id="class" name="expertClass" multiple>
					<option value="law" selected>법률</option>
					<option value="law" selected>비지니스</option>
					<option value="law" selected>심리/헬스</option>
					<option value="law" selected>학습</option>
					<option value="law" selected>금융</option>
					<option value="law" selected>라이프</option>
					<option value="law" selected>취미</option>
					<option value="law" selected>어학</option>
					<option value="law" selected>레저</option>
					<option value="law" selected>IT/테크</option>
					<option value="law" selected>자기계발</option>
				</select>
			</li>
			<li>
				<label>태그*</label>
				<input type="text" name="expertTag" placeholder="#태그">
			</li>
			<li>
				<label>자격*</label>
				<input type="text" name="expertQual" placeholder="">
			</li>
			<br>
			<li>
				<label>자격증*</label>
				<input type="text" name="expertLicense" placeholder="자격증명">
			</li>
			<li>
				<label>발급기관/취득일시*</label>
				<input type="text" name="expertIssuer" placeholder="발급기관">
				<input type="text" name="expertDate" placeholder="취득일시">
			</li>
			
			
		</ul>
		<div>
		
		<!-- 수정예정
		<input type="text" class="input-form" placeholder="input" /> <br>
		<select class="input-form">
			<option>value1</option>
			<option>value2</option>
			<option>value3</option>
		</select>
		<textarea class="input-form" placeholder="textarea"></textarea>
		<input type="text" class="input-form" placeholder="disabled" disabled />
		<input type="text" class="input-form" placeholder="readonly" readonly />
		
		 -->
		<h2>입력양식</h2>
		
	</div>
		
		<a href="/Expertapply.do">이전</a>
		<input type="submit" value="다음">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<style>
.chartBody > h2{
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
<div class="manaContentWrap">
		<div class="chartBody">
		<h2>>이달의 신규 회원수: ${chart.memberMonth }</h2>
			<input type="hidden" name="memberMonth" value=${chart.memberMonth } >
			<input type="hidden" name="janMember" value=${chart.janMember } >
			<input type="hidden" name="febMember" value=${chart.febMember } >
			<input type="hidden" name="marMember" value=${chart.marMember } >
			<input type="hidden" name="aprMember" value=${chart.aprMember } >
			<input type="hidden" name="mayMember" value=${chart.mayMember } >
			<input type="hidden" name="junMember" value=${chart.junMember } >
			<input type="hidden" name="julMember" value=${chart.julMember } >
			<input type="hidden" name="augMember" value=${chart.augMember } >
			<input type="hidden" name="sepMember" value=${chart.sepMember } >
			<input type="hidden" name="octMember" value=${chart.octMember } >
			<input type="hidden" name="novMember" value=${chart.novMember } >
			<input type="hidden" name="decMember" value=${chart.decMember } >
			<canvas id="memberChart" width="100%" height="40"></canvas>
		</div>
		<div class="chartBody">
		<h2>성별</h2>
			<input type="hidden" name="genderMale" value=${chart.genderMale } >
			<input type="hidden" name="genderFemale" value=${chart.genderFemale } >
			<input type="hidden" name="unknownGender" value=${chart.unknownGender } >
			<div class="card-body"><canvas id="genderPie" width="100%" height="50"></canvas></div>
		</div>
		<div class="chartBody">
		<h2>등급</h2>
			<input type="hidden" name="generalMember" value=${chart.generalMember } >
			<input type="hidden" name="expertCount" value=${chart.expertCount } >
			<input type="hidden" name="blackCount" value=${chart.blackCount } >
			<div class="card-body"><canvas id="gradePie" width="100%" height="50"></canvas></div>
		</div>
		<div class="chartBody">
		<h2>매출(상품별)</h2>
			<div class="card-body">
				<canvas id="salesChart" width="100%" height="50"></canvas>
			</div>
		</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script>


const janMember = $("input[name=junMember]").val();
const febMember = $("input[name=febMember]").val();
const marMember = $("input[name=marMember]").val();
const aprMember = $("input[name=aprMember]").val();
const mayMember = $("input[name=mayMember]").val();
const junMember = $("input[name=junMember]").val();
const julMember = $("input[name=julMember]").val();
const augMember = $("input[name=augMember]").val();
const sepMember = $("input[name=sepMember]").val();
const octMember = $("input[name=octMember]").val();
const novMember = $("input[name=novMember]").val();
const decMember = $("input[name=decMember]").val();

var memberChart = document.getElementById("memberChart");
var memberLineChart = new Chart(memberChart, {
  type: 'line',
  data: {
    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    datasets: [{
      label: "신규회원",
      lineTension: 0.3,									//각 꼭지점 근처 라인의 둥글기
      backgroundColor: "rgba(2,117,216,0.2)",			//차트배경색
      borderColor: "rgba(2,117,216,1)",					//라인 색
      pointRadius: 5,									//꼭짓점 둥글기
      pointBackgroundColor: "rgba(2,117,216,1)",		//꼭짓점 색
      pointBorderColor: "rgba(255,255,255,0.8)",		//꼭짓점 테두리 색
      pointHoverRadius: 5,								//호버되었을때 둥글기
      pointHoverBackgroundColor: "rgba(2,117,216,1)",	//호버 되었을때 꼭짓점 색
      pointHitRadius: 50,								//호버 되었을때 라벨이 뜨는 영역 크기
      pointBorderWidth: 2,								//꼭짓점 테두리 넓이
      data: [junMember,febMember,marMember,aprMember,mayMember,junMember,julMember,augMember,sepMember,octMember,novMember,decMember ],
    }],
  },
  options: {
    scales: {
    	
      xAxes: [{
        time: {
          unit: 'month'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 12		//x축 출력할 숫자 n개로 제한
        }
      }],
      
      yAxes: [{
        ticks: {
          min: 0,
          max: 50,
          maxTicksLimit: 5		//y축 출력할 숫자 n개로 제한
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    
    legend: {
      display: false
    }
  }
});

const genderMale = $("input[name=genderMale]").val();
const genderFemale = $("input[name=genderFemale]").val();
const unknownGender = $("input[name=unknownGender]").val();
var genderPie = document.getElementById("genderPie");
var genderChart = new Chart(genderPie, {
  type: 'pie',
  data: {
    labels: ["남성", "여성", "입력안함"],
    datasets: [{
      data: [genderMale, genderFemale, unknownGender],
      backgroundColor: ['#3865f2', '#F5532A', '#E6E7E8'],
    }],
  },
});

const generalMember = $("input[name=generalMember]").val();
const expertCount = $("input[name=expertCount]").val();
const blackCount = $("input[name=blackCount]").val();
var gradePie = document.getElementById("gradePie");
var gradeChart = new Chart(gradePie, {
  type: 'pie',
  data: {
    labels: ["일반 회원", "전문가", "블랙 리스트"],
    datasets: [{
      data: [generalMember, expertCount, blackCount],
      backgroundColor: ['#3865f2', '#F5532A', '#E6E7E8'],
    }],
  },
});

var memberChart = document.getElementById("memberChart");
var memberLineChart = new Chart(memberChart, {
  type: 'line',
  data: {
    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    datasets: [{
      label: "신규회원",
      lineTension: 0.3,									//각 꼭지점 근처 라인의 둥글기
      backgroundColor: "rgba(2,117,216,0.2)",			//차트배경색
      borderColor: "rgba(2,117,216,1)",					//라인 색
      pointRadius: 5,									//꼭짓점 둥글기
      pointBackgroundColor: "rgba(2,117,216,1)",		//꼭짓점 색
      pointBorderColor: "rgba(255,255,255,0.8)",		//꼭짓점 테두리 색
      pointHoverRadius: 5,								//호버되었을때 둥글기
      pointHoverBackgroundColor: "rgba(2,117,216,1)",	//호버 되었을때 꼭짓점 색
      pointHitRadius: 50,								//호버 되었을때 라벨이 뜨는 영역 크기
      pointBorderWidth: 2,								//꼭짓점 테두리 넓이
      data: [junMember,febMember,marMember,aprMember,mayMember,junMember,julMember,augMember,sepMember,octMember,novMember,decMember ],
    }],
  },
  options: {
    scales: {
    	
      xAxes: [{
        time: {
          unit: 'month'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 12		//x축 출력할 숫자 n개로 제한
        }
      }],
      
      yAxes: [{
        ticks: {
          min: 0,
          max: 50,
          maxTicksLimit: 5		//y축 출력할 숫자 n개로 제한
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    
    legend: {
      display: false
    }
  }
});
</script>
</body>
</html>
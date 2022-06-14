<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 관리자</title>
<link rel="stylesheet" href="css/manager.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
<div class="manaContentWrap">
<h1 id="main-title">> 사이트 통계</h1>
	<hr>
		<div class="newMemberChart chartDiv">
		<h2>>이달의 신규 회원수: ${chart.memberMonth }</h2>
		<div class="selectBox">
		<select name="year" id="memberChartYear">
					<option value="2022">2022</option>
					<option value="2021">2021</option>
					<option value="2020">2020</option>
				</select>
		</div>
		<div class="memberChartBody chartBody">
			<canvas id="memberChart" width="100%" height="40"></canvas>
		</div>
		</div>
		<div class="pieChart chartDiv genderChart">
		<h2>성별</h2>
			<input type="hidden" name="genderMale" value=${chart.genderMale } >
			<input type="hidden" name="genderFemale" value=${chart.genderFemale } >
			<input type="hidden" name="unknownGender" value=${chart.unknownGender } >
			<div class="chartbody">
				<canvas id="genderPie" width="100%" height="50"></canvas>
			</div>
		</div>
		<hr>
		<div class="pieChart chartDiv gradeChart">
		<h2>등급</h2>
			<input type="hidden" name="generalMember" value=${chart.generalMember } >
			<input type="hidden" name="expertCount" value=${chart.expertCount } >
			<input type="hidden" name="blackCount" value=${chart.blackCount } >
			<div class="chart">
				<canvas id="gradePie" width="100%" height="50"></canvas>
			</div>
		</div>
		<hr>
		<div class="salesChart chartDiv">
		<h2>매출</h2>
		<button class="salesBtn" value="0">총매출</button>
		<button class="salesBtn" value="1">상품별</button>
		<button class="salesBtn" value="2">카테고리별</button>
		<div class="selectBox">
			<select name="year" id="salesChartYear">
				<option value="22">2022</option>
				<option value="21">2021</option>
				<option value="20">2020</option>
			</select>
		</div>
			<div class="salesChartBody chartBody">
				<canvas id="salesChart" width="100%" height="50"></canvas>
			</div>
		</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script>
var salesBtnType = 0;

$("document").ready(function(){
	$.ajax({
		url: "/memberChart.do",
		data: {'year':"2022"},
		success : function(data) {
			const memberChart = document.getElementById("memberChart");
			const memberLineChart = new Chart(memberChart, {
			type: 'line',
			  data: {
			    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			    datasets: [{
			      label: "신규회원",
			      fill: false,
			      borderColor: "#3865f2",
			      data: [data.janMember, data.febMember, data.marMember, data.aprMember, data.mayMember, data.junMember, data.julMember, data.augMember, data.sepMember, data.octMember, data.novMember, data.decMember ],
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
		}
	});
});

$("#memberChartYear").change(function() {
	$.ajax({
		url: "/memberChart.do",
		data: {'year':$("#memberChartYear").val()},
		success : function(data) {
			$("#memberChart").remove();
			$(".memberChartBody").append('<canvas id="memberChart"></canvas>');
			const memberChart = document.getElementById("memberChart");
			const memberLineChart = new Chart(memberChart, {
			type: 'line',
			  data: {
			    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			    datasets: [{
			      label: "신규회원",
			      fill: false,
			      borderColor: "#3865f2",
			      data: [data.janMember, data.febMember, data.marMember, data.aprMember, data.mayMember, data.junMember, data.julMember, data.augMember, data.sepMember, data.octMember, data.novMember, data.decMember ],
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
		}
	});
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

$("document").ready(function(){
	$.ajax({
		url: "/salesChart.do",
		data: {'year':"22", 'salesType':0 },
		success : function(data) {
			const salesChart = document.getElementById("salesChart");
			const salesLineChart = new Chart(salesChart, {
			type: 'line',
			  data: {
			    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			    datasets: [{
			      label: "전체매출",
			      data: [data[0].janSales, data[0].febSales, data[0].marSales, data[0].aprSales, data[0].maySales, data[0].junSales, data[0].julSales, data[0].augSales, data[0].sepSales, data[0].octSales, data[0].novSales, data[0].decSales ],
			      borderColor: "#3865f2",
			      fill: false
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
			          max: 500000,
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
		}
	});
});

$(".salesBtn").click(function(){
	salesBtnType = $(this).val();
	$("#salesChart").remove();
	$(".salesChartBody").append('<canvas id="salesChart"></canvas>');
	const memberChart = document.getElementById("salesChart");
	if(salesBtnType == 1){
		$.ajax({
			url: "/salesChart.do",
			data: {'year':$("#salesChartYear").val(), 'salesType':salesBtnType},
			success : function(data) {
				const salesChart = document.getElementById("salesChart");
				const salesLineChart = new Chart(salesChart, {
				type: 'line',
				  data: {
				    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				    datasets: [{
				      	data: [data[0].janSales, data[0].febSales, data[0].marSales, data[0].aprSales, data[0].maySales, data[0].junSales, data[0].julSales, data[0].augSales, data[0].sepSales, data[0].octSales, data[0].novSales, data[0].decSales ],
				      	label: "상담",
				      	borderColor: "blue",
				      	fill: false
				    }, {
				    	data: [data[1].janSales, data[1].febSales, data[1].marSales, data[1].aprSales, data[1].maySales, data[1].junSales, data[1].julSales, data[1].augSales, data[1].sepSales, data[1].octSales, data[1].novSales, data[1].decSales ],
				      	label: "클래스",
				      	borderColor: "red",
				      	fill: false
				    }, {
				    	data: [data[2].janSales, data[2].febSales, data[2].marSales, data[2].aprSales, data[2].maySales, data[2].junSales, data[2].julSales, data[2].augSales, data[2].sepSales, data[2].octSales, data[2].novSales, data[2].decSales ],
				      	label: "클래스",
				      	borderColor: "green",
				      	fill: false
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
				          max: 500000,
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
			}
		});
	}else if(salesBtnType == 2){
		$.ajax({
			url: "/salesChart.do",
			data: {'year':$("#salesChartYear").val(), 'salesType':salesBtnType},
			success : function(data) {
				const salesChart = document.getElementById("salesChart");
				const salesLineChart = new Chart(salesChart, {
				type: 'line',
				  data: {
				    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				    datasets: [{
				      	data: [data[0].janSales, data[0].febSales, data[0].marSales, data[0].aprSales, data[0].maySales, data[0].junSales, data[0].julSales, data[0].augSales, data[0].sepSales, data[0].octSales, data[0].novSales, data[0].decSales ],
				      	label: "법률",
				      	borderColor: "blue",
				      	fill: false
				    }, {
				    	data: [data[1].janSales, data[1].febSales, data[1].marSales, data[1].aprSales, data[1].maySales, data[1].junSales, data[1].julSales, data[1].augSales, data[1].sepSales, data[1].octSales, data[1].novSales, data[1].decSales ],
				      	label: "비즈니스",
				      	borderColor: "red",
				      	fill: false
				    }, {
				    	data: [data[2].janSales, data[2].febSales, data[2].marSales, data[2].aprSales, data[2].maySales, data[2].junSales, data[2].julSales, data[2].augSales, data[2].sepSales, data[2].octSales, data[2].novSales, data[2].decSales ],
				      	label: "심리",
				      	borderColor: "green",
				      	fill: false
				    }, {
					  data: [data[3].janSales, data[3].febSales, data[3].marSales, data[3].aprSales, data[3].maySales, data[3].junSales, data[3].julSales, data[3].augSales, data[3].sepSales, data[3].octSales, data[3].novSales, data[3].decSales ],
				      	label: "학습",
				      	borderColor: "green",
				      	fill: false  
				  }, {
					  data: [data[4].janSales, data[4].febSales, data[4].marSales, data[4].aprSales, data[4].maySales, data[4].junSales, data[4].julSales, data[4].augSales, data[4].sepSales, data[4].octSales, data[4].novSales, data[4].decSales ],
				      	label: "금융",
				      	borderColor: "green",
				      	fill: false
				  }, {
					  data: [data[5].janSales, data[5].febSales, data[5].marSales, data[5].aprSales, data[5].maySales, data[5].junSales, data[5].julSales, data[5].augSales, data[5].sepSales, data[5].octSales, data[5].novSales, data[5].decSales ],
				      	label: "라이프",
				      	borderColor: "green",
				      	fill: false
				  }, {
					  data: [data[6].janSales, data[6].febSales, data[6].marSales, data[6].aprSales, data[6].maySales, data[6].junSales, data[6].julSales, data[6].augSales, data[6].sepSales, data[6].octSales, data[6].novSales, data[6].decSales ],
				      	label: "취미",
				      	borderColor: "green",
				      	fill: false
				  }, {
					  data: [data[7].janSales, data[7].febSales, data[7].marSales, data[7].aprSales, data[7].maySales, data[7].junSales, data[7].julSales, data[7].augSales, data[7].sepSales, data[7].octSales, data[7].novSales, data[7].decSales ],
				      	label: "어학",
				      	borderColor: "green",
				      	fill: false
				  }, {
					  data: [data[8].janSales, data[8].febSales, data[8].marSales, data[8].aprSales, data[8].maySales, data[8].junSales, data[8].julSales, data[8].augSales, data[8].sepSales, data[8].octSales, data[8].novSales, data[8].decSales ],
				      	label: "레저",
				      	borderColor: "green",
				      	fill: false
				  }, {
					  data: [data[9].janSales, data[9].febSales, data[9].marSales, data[9].aprSales, data[9].maySales, data[9].junSales, data[9].julSales, data[9].augSales, data[9].sepSales, data[9].octSales, data[9].novSales, data[9].decSales ],
				      	label: "IT",
				      	borderColor: "green",
				      	fill: false
				  }, {
					  data: [data[10].janSales, data[10].febSales, data[10].marSales, data[10].aprSales, data[10].maySales, data[10].junSales, data[10].julSales, data[10].augSales, data[10].sepSales, data[10].octSales, data[10].novSales, data[10].decSales ],
				      	label: "자기계발",
				      	borderColor: "green",
				      	fill: false
				  }],
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
				          max: 500000,
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
			}
		});
	}
});
	}else{
		$.ajax({
			url: "/salesChart.do",
			data: {'year':"22", 'salesType':0 },
			success : function(data) {
				const salesChart = document.getElementById("salesChart");
				const salesLineChart = new Chart(salesChart, {
				type: 'line',
				  data: {
				    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				    datasets: [{
				      label: "전체매출",
				      data: [data[0].janSales, data[0].febSales, data[0].marSales, data[0].aprSales, data[0].maySales, data[0].junSales, data[0].julSales, data[0].augSales, data[0].sepSales, data[0].octSales, data[0].novSales, data[0].decSales ],
				      borderColor: "#3865f2",
				      fill: false
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
				          max: 500000,
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
			}
		});
	}
});

$("#salesChartYear").change(function() {
	if(salesBtnType == 0){
		$.ajax({
			url: "/salesChart.do",
			data: {'year':$("#salesChartYear").val(), 'salesType':0 },
			success : function(data) {
				const salesChart = document.getElementById("salesChart");
				const salesLineChart = new Chart(salesChart, {
				type: 'line',
				  data: {
				    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				    datasets: [{
				      label: "전체매출",
				      data: [data[0].janSales, data[0].febSales, data[0].marSales, data[0].aprSales, data[0].maySales, data[0].junSales, data[0].julSales, data[0].augSales, data[0].sepSales, data[0].octSales, data[0].novSales, data[0].decSales ],
				      borderColor: "#3865f2",
				      fill: false
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
				          max: 500000,
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
			}
		});
	}else if(salesBtnType == 1){
		$.ajax({
			url: "/salesChart.do",
			data: {'year':$("#salesChartYear").val(), 'salesType':salesBtnType},
			success : function(data) {
				const salesChart = document.getElementById("salesChart");
				const salesLineChart = new Chart(salesChart, {
				type: 'line',
				  data: {
				    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				    datasets: [{
				      	data: [data[0].janSales, data[0].febSales, data[0].marSales, data[0].aprSales, data[0].maySales, data[0].junSales, data[0].julSales, data[0].augSales, data[0].sepSales, data[0].octSales, data[0].novSales, data[0].decSales ],
				      	label: "상담",
				      	borderColor: "blue",
				      	fill: false
				    }, {
				    	data: [data[1].janSales, data[1].febSales, data[1].marSales, data[1].aprSales, data[1].maySales, data[1].junSales, data[1].julSales, data[1].augSales, data[1].sepSales, data[1].octSales, data[1].novSales, data[1].decSales ],
				      	label: "클래스",
				      	borderColor: "red",
				      	fill: false
				    }, {
				    	data: [data[2].janSales, data[2].febSales, data[2].marSales, data[2].aprSales, data[2].maySales, data[2].junSales, data[2].julSales, data[2].augSales, data[2].sepSales, data[2].octSales, data[2].novSales, data[2].decSales ],
				      	label: "클래스",
				      	borderColor: "green",
				      	fill: false
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
				          max: 500000,
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
			}
		});
	}else if(salesBtnType == 2){
		$.ajax({
			url: "/salesChart.do",
			data: {'year':$("#salesChartYear").val(), 'salesType':salesBtnType},
			success : function(data) {
				const salesChart = document.getElementById("salesChart");
				const salesLineChart = new Chart(salesChart, {
				type: 'line',
				  data: {
				    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				    datasets: [{
				      	data: [data[0].janSales, data[0].febSales, data[0].marSales, data[0].aprSales, data[0].maySales, data[0].junSales, data[0].julSales, data[0].augSales, data[0].sepSales, data[0].octSales, data[0].novSales, data[0].decSales ],
				      	label: "법률",
				      	borderColor: "blue",
				      	fill: false
				    }, {
				    	data: [data[1].janSales, data[1].febSales, data[1].marSales, data[1].aprSales, data[1].maySales, data[1].junSales, data[1].julSales, data[1].augSales, data[1].sepSales, data[1].octSales, data[1].novSales, data[1].decSales ],
				      	label: "비즈니스",
				      	borderColor: "red",
				      	fill: false
				    }, {
				    	data: [data[2].janSales, data[2].febSales, data[2].marSales, data[2].aprSales, data[2].maySales, data[2].junSales, data[2].julSales, data[2].augSales, data[2].sepSales, data[2].octSales, data[2].novSales, data[2].decSales ],
				      	label: "심리",
				      	borderColor: "green",
				      	fill: false
				    }, {
					  data: [data[3].janSales, data[3].febSales, data[3].marSales, data[3].aprSales, data[3].maySales, data[3].junSales, data[3].julSales, data[3].augSales, data[3].sepSales, data[3].octSales, data[3].novSales, data[3].decSales ],
				      	label: "학습",
				      	borderColor: "green",
				      	fill: false  
				  }, {
					  data: [data[4].janSales, data[4].febSales, data[4].marSales, data[4].aprSales, data[4].maySales, data[4].junSales, data[4].julSales, data[4].augSales, data[4].sepSales, data[4].octSales, data[4].novSales, data[4].decSales ],
				      	label: "금융",
				      	borderColor: "green",
				      	fill: false
				  }, {
					  data: [data[5].janSales, data[5].febSales, data[5].marSales, data[5].aprSales, data[5].maySales, data[5].junSales, data[5].julSales, data[5].augSales, data[5].sepSales, data[5].octSales, data[5].novSales, data[5].decSales ],
				      	label: "라이프",
				      	borderColor: "green",
				      	fill: false
				  }, {
					  data: [data[6].janSales, data[6].febSales, data[6].marSales, data[6].aprSales, data[6].maySales, data[6].junSales, data[6].julSales, data[6].augSales, data[6].sepSales, data[6].octSales, data[6].novSales, data[6].decSales ],
				      	label: "취미",
				      	borderColor: "green",
				      	fill: false
				  }, {
					  data: [data[7].janSales, data[7].febSales, data[7].marSales, data[7].aprSales, data[7].maySales, data[7].junSales, data[7].julSales, data[7].augSales, data[7].sepSales, data[7].octSales, data[7].novSales, data[7].decSales ],
				      	label: "어학",
				      	borderColor: "green",
				      	fill: false
				  }, {
					  data: [data[8].janSales, data[8].febSales, data[8].marSales, data[8].aprSales, data[8].maySales, data[8].junSales, data[8].julSales, data[8].augSales, data[8].sepSales, data[8].octSales, data[8].novSales, data[8].decSales ],
				      	label: "레저",
				      	borderColor: "green",
				      	fill: false
				  }, {
					  data: [data[9].janSales, data[9].febSales, data[9].marSales, data[9].aprSales, data[9].maySales, data[9].junSales, data[9].julSales, data[9].augSales, data[9].sepSales, data[9].octSales, data[9].novSales, data[9].decSales ],
				      	label: "IT",
				      	borderColor: "green",
				      	fill: false
				  }, {
					  data: [data[10].janSales, data[10].febSales, data[10].marSales, data[10].aprSales, data[10].maySales, data[10].junSales, data[10].julSales, data[10].augSales, data[10].sepSales, data[10].octSales, data[10].novSales, data[10].decSales ],
				      	label: "자기계발",
				      	borderColor: "green",
				      	fill: false
				  }],
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
				          max: 500000,
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
			}
		});
	}
});
	}
});

</script>
</body>
</html>
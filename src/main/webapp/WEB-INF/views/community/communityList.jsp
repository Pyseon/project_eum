<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>	
<body>
 <div class="container">
      <div class="comm-header">
        <button class="comm-nav">전체</button>
        <button class="comm-nav">요즘뭐하니</button>
        <button class="comm-nav">이건어때</button>
      </div>

      <!--리스트-->
      <div class="card-wrap">
        <img
          class="card-img"
          src="./img/promo_big.jpg"
          alt=""
          onload="imgOnload(this)"
          style="display: inline"
        />
        <figcaption>
          <div class="card-date-right card-reg">2022.05.21</div>
          <div class="card-caption card-flex">
            <span class="card-category fs-bold">요즘뭐하니</span>
            <div class="card-icon card-flex">
              <div class="card-like">
                <i class="fa-solid fa-heart"></i>
                <span class="noto-sb mb-1 fs-bold">7</span>
              </div>
              <div class="card-comment">
                <i class="fa-solid fa-message"></i>
                <span class="noto-sb mb-1 fs-bold">8</span>
              </div>
            </div>
          </div>
          <div class="card-title fs-bold">요즘 나의 은밀한 취미</div>
          <div class="card-content">
            가족들 모르게 몰래 야식을 먹고 있습니다. 아주 맛있습니다 즐거워요!
            행복합니다!! 빨리 야식두번 드세요 좋습니다 배달시키세요 당장
          </div>
          <div class="card-info card-flex">
            <div class="card-profile">
              <div class="card-user-img-wrap">
                <img class="card-user-img" src="./img/toeic.png" alt="" />
              </div>
              <span class="card-user-name">다이어터</span>
            </div>
            <div class="card-readcount">
              <span class="mr-1">조회수</span>
              <span>912</span>
            </div>
          </div>
        </figcaption>
      </div>
    </div>





</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>
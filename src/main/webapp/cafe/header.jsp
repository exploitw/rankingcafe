<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cafe</title>

    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&amp;display=swap"
      rel="stylesheet"
    />
    <!-- 나눔고딕 -->
    <link
      href="https://fonts.googleapis.com/css2?family=Hind+Guntur:wght@300;400;500;600;700&amp;display=swap"
      rel="stylesheet"
    />
    <!-- Hind Guntur -->
    <link
      href="https://fonts.googleapis.com/css2?family=Overpass:wght@100;200;300;400;600;700;800;900&amp;display=swap"
      rel="stylesheet"
    />
    <!-- en -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/@kfonts/nanum-barun-pen/index.css"
    />
    <!-- 나눔바른펜 -->

    <!-- <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous"
    /> -->


    <link href="<c:url value="/cafe/css/reset.css"/>" rel="stylesheet" />
    <link href="<c:url value="/cafe/css/style.css"/>" rel="stylesheet" />
    <link href="<c:url value="/cafe/css/header.css"/>" rel="stylesheet" />
    <link href="<c:url value="/cafe/css/footer.css"/>" rel="stylesheet" />
    <link href="<c:url value="/cafe/css/home.css"/>" rel="stylesheet" />
    <link href="<c:url value="/cafe/css/cafeList.css"/>" rel="stylesheet" />
    <link href="<c:url value="/cafe/css/login.css"/>" rel="stylesheet" />
    <link href="<c:url value="/cafe/css/register.css"/>" rel="stylesheet" />
    <link href="<c:url value="/cafe/css/community.css"/>" rel="stylesheet" />
    <link href="<c:url value="/cafe/css/myPage1.css"/>" rel="stylesheet" />
    <link href="<c:url value="/cafe/css/myPage1-1.css"/>" rel="stylesheet" />
    <link href="<c:url value="/cafe/css/myPage2.css"/>" rel="stylesheet" />
    <link href="<c:url value="/cafe/css/myPage3.css"/>" rel="stylesheet" />
    <link href="<c:url value="/cafe/css/myPage3-1.css"/>" rel="stylesheet" />

    <script
      src="http://code.jquery.com/jquery-latest.js"
      type="text/javascript"
    ></script>
    <!-- <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"
    ></script> -->
    <script
      src="https://kit.fontawesome.com/d1f97cbcf5.js"
      crossorigin="anonymous"
    ></script>
    <script
      type="module"
      src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
      nomodule
      src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"
    ></script>

		<script src="<c:url value="/cafe/js/jquery.mousewheel.js"/>"></script>
		<script src="<c:url value="/cafe/js/jquery.isotope.js"/>"></script>
		<script src="<c:url value="/cafe/js/jquery.viewbox.js"/>"></script>
		<script src="<c:url value="/cafe/js/jquery.viewbox.min.js"/>"></script>
		<script src="<c:url value="/cafe/js/masonry-docs.min.js"/>"></script>
		<script src="<c:url value="/cafe/js/jquery-ui.min.js"/>"></script>
		<script src="<c:url value="/cafe/js/jquery.ui.touch-punch.min.js"/>"></script>
		<script src="<c:url value="/cafe/js/common.js"/>"></script>
		<script src="<c:url value="/cafe/js/header.js"/>"></script>
		<script src="<c:url value="/cafe/js/home.js"/>"></script>
		<script src="<c:url value="/cafe/js/cafeList.js"/>"></script>
		<script src="<c:url value="/cafe/js/register.js"/>"></script>
		<script src="<c:url value="/cafe/js/page3-1.js"/>"></script>

  </head>
  <body>
  <c:if test="${sessionEMAIL != null }">
		${sessionEMAIL } 로그인 중<br />
		${sessionnickName } 로그인 중<br />
		${sessionCustomerId }로그인 중<br />
	</c:if>
  <header id="header">
      <h1>
        <a href="#">Cafe</a>
      </h1>

      <nav class="gnb gnb_lg">
        <ul class="menu">
          <li><a class="btn1-1" href="<c:url value="/cafe"/>?action=login">Home</a></li>
          <li><a class="btn1-1" href="<c:url value="/cafe"/>?action=cafeList">List</a></li>
          <li><a href="<c:url value="/cafe?action=community"/>" id="community">Community</a></li>
        </ul>
        <ul class="member">
          <li>
            <a href="#"><ion-icon name="person-outline"></ion-icon> My Page</a>
          </li>
          <li>
            <a href="<c:url value="/cafe"/>?action=logout"><ion-icon name="log-out-outline"></ion-icon> Logout</a>
          </li>
        </ul>
      </nav>

      <div class="frame frame_l"></div>
      <div class="frame frame_r"></div>
      <div class="frame frame_b"></div>

      <nav class="gnb gnb_sm">
        <div>
          <ul class="menu">
            <li><a href="#">Home</a></li>
            <li><a href="#">List</a></li>
            <li><a href="<c:url value="/cafe?action=community"/>" id="community">Community</a></li>
            
          </ul>
          <ul class="member">
            <li>
              <a href="#">
                <ion-icon name="person-outline"></ion-icon>
                <span> My Page</span>
              </a>
            </li>
            <li>
              <a href="#">
                <ion-icon name="log-out-outline"></ion-icon>
                <span> Logout</span>
              </a>
            </li>
          </ul>
        </div>
      </nav>

      <button class="btn btn_menu">
        <i class="fas fa-bars" aria-hidden="true"></i>
      </button>

      <button class="btn btn_close active">
        <i class="fas fa-times" aria-hidden="true"></i>
      </button>
    </header>
  

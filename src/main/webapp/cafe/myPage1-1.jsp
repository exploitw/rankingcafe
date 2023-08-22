<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"/>

<section id="myPage1_1">
      <div id="hBox"><h2>My Page</h2></div>
      <ul>
        <li class="active"><a href="<c:url value="/cafe?action=myPage1"/>">내가 쓴 글</a></li>
        <li><a href="<c:url value="/cafe?action=myPage2"/>">좋아요 한 카페</a></li>
        <li><a href="<c:url value="/cafe?action=myPage3"/>">내 정보 수정</a></li>
      </ul>
      <hr />
      <div id="myPage1_1Wrap">
        <div class="contentTitle">
          <h3>Title</h3>
        </div>
        <div class="contentDetail">
          <p class="username">
            <span>작성자</span>
            <span>44y</span>
          </p>
          <p>
            <span>작성일</span>
            <span>2023-04-04 13:45</span>
          </p>
          <p>
            <span>조회수</span>
            <span>44</span>
          </p>
        </div>
        <div class="content">
          <p>
            Lorem Ipsum is simply dummy text of the printing and typesetting
            industry. Lorem Ipsum has been the industry's standard dummy text
            ever since the 1500s, when an unknown printer took a galley of type
            and scrambled it to make a type specimen book. It has survived not
            only five centuries, but also the leap into electronic typesetting,
            remaining essentially unchanged. It was popularised in the 1960s
            with the release of Letraset sheets containing Lorem Ipsum passages,
            and more recently with desktop publishing software like Aldus
            PageMaker including versions of Lorem Ipsum.
          </p>
        </div>
        <div class="like">
          <div><img src=<c:url value="/cafe/img/heart-outline.svg"/> alt="" /></div>
          <span>44</span>
        </div>
        <div class="control">
          <div class="left">
            <p><a href="<c:url value="/cafe?action=myPage1"/>">목록보기</a></p>
          </div>
          <div class="right">
            <p><a href="#">글 수정</a></p>
            <p><a href="#">글 삭제</a></p>
          </div>
        </div>
      </div>
    </section>
	
<jsp:include page="footer.jsp"/>
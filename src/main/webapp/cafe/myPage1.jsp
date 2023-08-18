<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"/>
	
 	<section id="myPage1">
      <div id="hBox"><h2>My Page</h2></div>
      <ul>
        <li class="active"><a href="<c:url value="/cafe?action=myPage1"/>">내가 쓴 글</a></li>
        <li><a href="<c:url value="/cafe?action=myPage2"/>">좋아요 한 카페</a></li>
        <li><a href="<c:url value="/cafe?action=myPage3"/>">내 정보 수정</a></li>
      </ul>
      <hr />
      <div id="myPage1Wrap">
        <div class="tbContainer">
          <table>
            <thead>
              <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
              </tr>
            </thead>

            <tbody>
              <tr>
                <!-- 1 -->
                <td>1</td>
                <td>
                  <a href="#">44y</a>
                </td>
                <td>eh44y</td>
                <td>2023/08/11</td>
                <td>4444</td>
              </tr>
            </tbody>
          </table>
        </div>
<!--         <p>
          <button id="btn_write"><a href="#">글쓰기</a></button>
        </p> -->
      </div>
    </section>

	
<jsp:include page="footer.jsp"/>
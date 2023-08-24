<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="header.jsp"/>
	
	<section id="communityWrite">
		<div id="hBox"><h2>게시글 수정</h2></div>
		<div id="communityWriteWrap">
            <form id="community_form" action="<c:url value="/cafe"/>" method="post" data-id="${community.id}" enctype="multipart/form-data">
                <input type="hidden" name="action" id="community_form_action" /> 
		        <input type="hidden" name="id" value="${community.id}" />
                <div class="contentDetail">
                    <p class="username">
                        <span>작성자</span>
                        <c:forEach var="customer" items="${customerList}">
                            <c:if test="${community.customerId == customer.id}">
                                <span>${customer.nickName}</span>
                            </c:if>
                        </c:forEach>
                    </p>
                    <p>
                        <span>작성일</span>
                        <span><fmt:formatDate value="${community.date}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
                    </p>
                    <p>
                        <span>조회수</span>
                        <span>미구현</span>
                    </p>
                </div>
                <table>
                    <thead>
                        <tr>
                            <td><p>제목</p></td>
                            <td>
                            <input type="text" name="title" required id="title" id="title" value="${community.title}"/>
                            </td>
                        </tr>
                        <tr>
                            <td><p>카페 이름</p></td>
                            <td>
                            <input type="text" name="cafeName" required id="title" />
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <img
                                width="300"
                                height="300"
                                class="cafe-img"
                                src="${community.img}"
                                id="${community.img}"
                                >
                            </td>
                            <td colspan="2">
                                <textarea
                                    rows="12"
                                    cols="50"
                                    name="content"
                                    id="content"
                                    required
                                >${community.content}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="file" class="form-control" name="file" id="img" value="${community.img}" multiple /></td>
                            <!-- <td><p>파일 첨부</p></td>
                            <td>
                            <label class="form-label hidden">이미지</label>
                            <input type="file" name="file" class="form-control" multiple />
                            </td> -->
                        </tr>
                    </tbody>
                </table>
            </form>
		<div class="btn_container">
            <div class="btn1">
                <a href="javascript:history.back()">돌아가기</a>
            </div>
            <div class="btn2">
                <button class="button" id="updateCommunity_button">저장</button>
				<button class="button" id="deleteCommunity_button">삭제</button>
                <button type="reset">내용 초기화</button>
            </div>
        </div>
      </div>
	</section>

	
<jsp:include page="footer.jsp"/>
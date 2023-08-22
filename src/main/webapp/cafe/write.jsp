<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"/>
	
	<section id="communityWrite">
		<div id="hBox"><h2>게시글 작성</h2></div>
		<div id="communityWriteWrap">
		<form id="communityWriteForm" action="<c:url value="/cafe"/>?action=write"  method="post" enctype="multipart/form-data">
			<table>
            <thead>
              <tr>
                <td><p>제목</p></td>
                <td>
                  <input type="text" name="title" required id="title" />
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
                <td colspan="2">
                  <textarea
                    rows="12"
                    cols="50"
                    name="content"
                    required
                  ></textarea>
                </td>
              </tr>
              <tr>
                <td><p>파일 첨부</p></td>
                <td>
                  <label class="form-label hidden">이미지</label>
                  <input type="file" name="file" class="form-control" multiple />
                </td>
              </tr>
            </tbody>
          </table>
		</form>
		<div class="btn_container">
          <div class="btn1">
            <a href="javascript:history.back()">돌아가기</a>
          </div>
          <div class="btn2">
            <button type="submit">작성</button>
            <button type="reset">내용 초기화</button>
          </div>
        </div>
      </div>
	</section>

	
<jsp:include page="footer.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 상세보기</title>
</head>
<body>
	<table>
	<thead>
		<tr>
					<td><img class="cafe-img" src="${cafe.img}"></td>
				</tr>
	</thead>
	<tbody>
				
                <tr class="only-desktop">
                  <th>주소</th>
                  <td>${cafe.address}<br/>
                        <span class="Restaurant__InfoAddress--Rectangle"></span>
                      <span class="Restaurant__InfoAddress--Text"></span>
                  </td>
                </tr>

                <tr class="only-desktop">
                  <th>전화번호</th>
                  <td>${cafe.phone}</td>
                </tr>

                <tr>
                  <th>음식 종류</th>
                  <td>
                    <span>세계음식 기타</span>
                  </td>
                </tr>

                <tr>
                  <th>가격대</th>
                  <td>만원-2만원</td>
                </tr>


                <tr>
                  <th style="vertical-align:top;">휴무일</th>
                  <td>${cafe.dayOff}</td>
                </tr>

                <tr>
                  <th style="vertical-align:top;">여는시간</th>
                  <td>${cafe.openingHours}</td>
                </tr>

                <tr> 
                  <th>마지막주문</th>
                  <td>월-금: 14:00, 토-일: 19:00</td>
                </tr>

                <tr>
                  <th>휴일</th>
                  <td>월</td>
                </tr>

                <tr>
                  <th>웹 사이트</th>
                  <td>
                    <a href="${cafe.website}" class="under_line" target="_blank" style="color: black;"
                       onclick="trackEvent('CLICK_RESTO_WEBSITE', {&quot;restaurant_key&quot;:&quot;DvNMlU2Qj2&quot;})">
                      식당 홈페이지로 가기
                    </a>
                  </td>
                </tr>

                <tr>
                  <th>메뉴</th>
                  <td class="menu_td">
                    <ul class="Restaurant_MenuList">
                        <li class="Restaurant_MenuItem">
                          <span class="Restaurant_Menu">피쉬&amp;카이막</span>
                            <span class="Restaurant_MenuPrice">8,000원</span>
                        </li>
                        <li class="Restaurant_MenuItem">
                          <span class="Restaurant_Menu">시시케밥세트</span>
                            <span class="Restaurant_MenuPrice">20,000원</span>
                        </li>
                        <li class="Restaurant_MenuItem">
                          <span class="Restaurant_Menu">새우귀벳치세트</span>
                            <span class="Restaurant_MenuPrice">20,000원</span>
                        </li>
                        <li class="Restaurant_MenuItem">
                          <span class="Restaurant_Menu">터키만트세트</span>
                            <span class="Restaurant_MenuPrice">20,000원</span>
                        </li>
                        <li class="Restaurant_MenuItem">
                          <span class="Restaurant_Menu">치마라이스세트</span>
                            <span class="Restaurant_MenuPrice">15,000원</span>
                        </li>
                    </ul>
                  </td>
                </tr>

              </tbody>
            </table>
</body>
</html>
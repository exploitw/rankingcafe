<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta name="metro4:locale" content="ko-KR" />
        <meta name="metro4:init" content="false" />

        <title>Community</title>

        <link rel="stylesheet" href="https://cdn.korzh.com/metroui/v4.5.1/css/metro-all.min.css" />
        <style>
            a.community_id, a.community_id:visited {
                cursor: pointer;
                text-decoration: underline;
                color: blue;
            }
        </style>
    </head>

    <body>
	    <c:if test="${sessionEMAIL != null }">
			${sessionEMAIL } 로그인 중<br />
			${sessionnickName } 로그인 중<br />
			${sessionCustomerId }로그인 중<br />
			<!-- <a href="/rankingcafe/cafe/login.jsp"><button>로그아웃</button></a> -->
			<a href="<c:url value="/cafe"/>?action=logout"><button>로그아웃</button></a>
			<a href="<c:url value="/cafe"/>?action=login"><button>메인</button></a>
		</c:if>
    	<div class="container">
            <label>커뮤니티</label>
            <br />
            <table class="table" data-role="table"
                   data-rows="-1"
                   data-show-pagination="false" data-show-search="false" data-show-rows-steps="false" data-show-table-info="false">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>등록일</th>
                    </tr>
                </thead>
                <tbody id="community">
                    <c:forEach var="community" items="${communityList}">
                        <tr>
                            <td>${community.id}</td>
                            <td><a class="community_title" href="<c:url value="/cafe"/>?action=communityInfo&id=${community.id}" data-id="${community.id}">${community.title}</a></td>
                            <td>${community.customerId}</td>
                            <td><fmt:formatDate value="${community.date}" pattern="yyyy-MM-dd HH:mm"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="container">
            <form id="goto_form" action="<c:url value="/cafe"/>?action=writing" method="post">
                <input type="hidden" name="action" value="community"/>
                <input type="hidden" name="id" value="-1"/>
                <input type="submit" value="추가" id="add_button"/>
            </form>
        </div>

        <script src="https://cdn.korzh.com/metroui/v4.5.1/js/metro.min.js"></script>
        <script>
            Metro.utils.addLocale({
                'ko-KR': {
                    calendar: {
                        months: [
                            'January',
                            'February',
                            'March',
                            'April',
                            'May',
                            'June',
                            'July',
                            'August',
                            'September',
                            'October',
                            'November',
                            'December',
                            'Jan',
                            'Feb',
                            'Mar',
                            'Apr',
                            'May',
                            'Jun',
                            'Jul',
                            'Aug',
                            'Sep',
                            'Oct',
                            'Nov',
                            'Dec',
                        ],
                        days: [
                            'Sunday',
                            'Monday',
                            'Tuesday',
                            'Wednesday',
                            'Thursday',
                            'Friday',
                            'Saturday',
                            'Su',
                            'Mo',
                            'Tu',
                            'We',
                            'Th',
                            'Fr',
                            'Sa',
                            'Sun',
                            'Mon',
                            'Tus',
                            'Wen',
                            'Thu',
                            'Fri',
                            'Sat',
                        ],
                        time: {
                            days: 'DAYS',
                            hours: 'HOURS',
                            minutes: 'MINS',
                            seconds: 'SECS',
                            month: 'MON',
                            day: 'DAY',
                            year: 'YEAR',
                        },
                        weekStart: 0,
                    },
                    buttons: {
                        ok: 'OK',
                        cancel: 'Cancel',
                        done: 'Done',
                        today: 'Today',
                        now: 'Now',
                        clear: 'Clear',
                        help: 'Help',
                        yes: 'Yes',
                        no: 'No',
                        random: 'Random',
                        save: 'Save',
                        reset: 'Reset',
                    },
                    table: {
                        rowsCount: 'Show entries:',
                        search: 'Search:',
                        info: 'Showing $1 to $2 of $3 entries',
                        prev: 'Prev',
                        next: 'Next',
                        all: 'All',
                        inspector: 'Inspector',
                        skip: 'Goto page',
                        empty: 'N/A',
                    },
                    colorSelector: {
                        addUserColorButton: 'ADD TO SWATCHES',
                        userColorsTitle: 'USER COLORS',
                    },
                    switch : {
                        on: 'on',
                        off: 'off',
                    },
                },
            });
            Metro.init();
        </script>

        <script>
            let hasOrdering = ${hasOrdering};
        </script>
    </body>
</html>
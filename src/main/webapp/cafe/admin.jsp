<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"/>
	<section id="register">
	<form>
		<input type="hidden" value="dgadege"/>
	</form>
	//
	<form id="admin_form" action="<c:url value="cafe"/>" method="post">
	<input type="hidden" name="action" value="${customer.id}" id="admin_form_action"/>
		<%-- <div class="row">
		    <div class="cell-10"><input type="hidden" data-role="input" name="id" value="${customer.id}" id="id" readonly /></div>
		</div>
		<div class="row">
        	<div class="cell-10"><input type="hidden" data-role="input" name="name" value="${customer.name}" id="name" readonly/></div>
        </div>
        <div class="row">
            <div class="cell-10"><input type="hidden" data-role="input" name="email" value="${customer.email}" id="email" /></div>
        </div>
        <div class="row">
			<div class="cell-10"><input type="hidden" data-role="input" name="nickName" value="${customer.nickName}" id="nickName" /></div>
        </div>
        <div class="row">
            <div class="cell-10"><input type="hidden" data-role="input" name="address" value="${customer.address}" id="address" /></div>
        </div>
        <div class="row">
            <div class="cell-10"><input type="text" data-role="input" name="phone" value="${customer.phone}" id="phone" /></div>
        </div>
        <div class="row">
        	<div class="cell-10"><input class="hidden" type="text" data-role="input" name="admin" value="${customer.admin}" id="admin" /></div>
        </div>
        <br/> --%>
		<table>
			<thead>
				<tr>
					<th>NO</th>
					<th>NAME</th>
					<th>EMAIL</th>
					<th>NICKNAME</th>
					<th>ADDRESS</th>
					<th>PHONE</th>
					<th>ADMIN</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="customer" items="${customerList}">
					<tr>
						<td>${customer.id}</td>
						<td><input type="hidden" data-role="input" name="name" value="${customer.admin}" id="name" />${customer.name}</td>
						<td>${customer.email}</td>
						<td>${customer.nickName}</td>
						<td>${customer.address}</td>
						<td>${customer.phone}</td>
						<td><input type="text" data-role="input" name="admin" value="${customer.admin}" id="admin" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
        <div class="row">
            <div class="cell-3"></div>
            <div class="cell-3">
        	    <button class="button" id="updateAdmin_button">회원정보수정1</button>
            </div>
            <div class="cell-3"></div>
            <div class="cell-3"></div>
        </div>
    </form>
	</section>
 <jsp:include page="footer.jsp"/>
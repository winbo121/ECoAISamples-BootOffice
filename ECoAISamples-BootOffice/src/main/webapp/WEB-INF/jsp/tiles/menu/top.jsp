<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="devonboot.sample.office.common.model.User" %>
<div id="LblockHeader">
<div id="LblockHeaderIn">
<div id="LblockTopLogo">
	<a href="<c:url value="/main.do"/>"><img src="<c:url value='/resource/images/topLogo.jpg'/>" alt="사이트 상단 로고" /></a>
</div>

<div id="LblockWelcome">
	<p><span><c:out value="${loginUser.usrNm}"/></span>님 환영합니다.</p><a href="<c:url value="/common/login/logout.do" />">로그아웃</a>
</div>

<div id="LblockSupportMenu">
	<ul>
		<li class="Lfirst"><a href="<c:url value="/main.do"/>">HOME</a></li>
		<li class="Lidx1"><a href="#">CONTACT</a></li>
		<li class="Llast"><a href="#">ENGLISH</a></li>
	</ul>
</div>

<div id="LblockTotalSearch">
	<form method="get" action="">
		<label for="totalSearch">통합검색:</label> <input id="totalSearch" type="text" class="Ltext" size="15" /><input type="image" class="Limage" src="<c:url value='/resource/images/totalSearch_btn.gif'/>" alt="검색" />
	</form>
</div>

<div id="LblockTopMenu">
	<ul class="Lclear">
		<li class="Lfirst <c:if test="${param.menu1 =='0'}">Lcurrent</c:if>"><span><a href="#" onclick="_topMenu.setCurrent(0);">UI Pattern</a></span>
			<ul>
				<li class="Lfirst <c:if test="${param.menu2 =='0'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/p11/retrieveEmployee.do?menu1=0&menu2=0'/>" onclick="_topMenu.setCurrent(0,0);">Web Pattern</a></span></li>
				<li class="Lidx1 <c:if test="${param.menu2 =='1'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/pp1/retrieveEmployeeList.do?menu1=0&menu2=1'/>" onclick="_topMenu.setCurrent(0,1);">Page Pattern</a></span></li>
				<%-- 
				<li class="Lidx1 <c:if test="${param.menu2 =='2'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/mp11/retrieveEmployee.do?menu1=0&menu2=2'/>" onclick="_topMenu.setCurrent(0,2);">Web Pattern(Map)</a></span></li>
				<li class="Llast <c:if test="${param.menu2 =='3'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/mpp1/retrieveEmployeeList.do?menu1=0&menu2=3'/>" onclick="_topMenu.setCurrent(0,3);">Page Pattern(Map)</a></span></li> 
				--%>
			</ul>
		</li>
		<li class="Llast <c:if test="${param.menu1 =='1'}">Lcurrent</c:if>"><span><a href="#" onclick="_topMenu.setCurrent(1);">Function</a></span>
			<ul>
				<li class="Lfirst <c:if test="${param.menu2 =='0'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/configuration/employeeForm.do?menu1=1&menu2=0"/>" onclick="_topMenu.setCurrent(1,0);">Foundation</a></span></li>
				<li class="Lidx1 <c:if test="${param.menu2 =='1'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/webmvc/saymessage/employeeForm.do?menu1=1&menu2=1"/>" onclick="_topMenu.setCurrent(1,1);">Presentation</a></span></li>
				<li class="Lidx1 <c:if test="${param.menu2 =='2'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/webmvc/saymessage/employeeForm.do?menu1=1&menu2=2"/>" onclick="_topMenu.setCurrent(1,2);">Persistence</a></span></li>
				<li class="Llast <c:if test="${param.menu2 =='3'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/excel/retrieveEmployeeList.do?menu1=1&menu2=3"/>" onclick="_topMenu.setCurrent(1,3);">Support</a></span></li>
			</ul>
		</li>
	</ul>
</div>

</div>

</div>
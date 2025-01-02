<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="LblockMain" class="LblockMain">
<img id="LmainTitleImage" src="<c:url value='/resource/images/main_title.jpg'/>" alt="메인 타이틀이미지" />

<div id="LmainWrapper" class="Lclear">
	<div id="LcontentBox01" class="LcontentBox"><div><div><div>
		<div class="Ltitlebar">
			<h2><span>공지사항</span></h2>
			<img src="<c:url value='/resource/images/main_btn_more.gif'/>" alt="more" />
		</div>
		<ul class="Lclear">
			<li class="Lfirst"><a href="#">[언론사 전화응대 Guide]유선 전화기.. </a><span>[2009-11-11]</span></li>
			<li class="Leven"><a href="#">[신종플루 관련 가이드 및 FAQ]_11월..</a><span>[2009-11-11]</span></li>
			<li><a href="#">[중요]전사손익 개선방안</a><span>[2009-11-11]</span></li>
			<li class="Leven"><a href="#">[공지]V3 제품군 최신 엔진 업데이트..</a><span>[2009-11-10]</span></li>
			<li><a href="#">[공지]보안레터 1차 퀴즈이벤트 당첨..</a><span>[2009-11-10]</span></li>
			<li class="Llast Leven"><a href="#">[행사]보안레터 2차 퀴즈이벤트 (11..</a><span>[2009-11-10]</span></li>
		</ul>
	</div></div></div></div><!-- end LcontentBox01 -->

	<div id="LtabBox01" class="LtabBox"><div><div><div>
	<div class="LblockTab Lclear">
		<ul>
			<li class="Lfirst Lcurrent"><span><a href="#LtabIndustryNews">업계뉴스</a></span></li>
			<li class="Lidx1"><span><a href="#LtabLGNews">LG뉴스</a></span></li>
			<li class="Llast"><span><a href="#LtabReport">보도자료</a></span></li>
		</ul>
	</div>
	<img src="<c:url value='/resource/images/main_tab_btn_more.gif'/>" alt="more" />
	<div id="LtabIndustryNews" class="LtabContent">
		<ul class="Lclear">
			<li class="Lfirst"><a href="#">2040년 과학기술 미래비전 뭘 담았나</a><span>[2009-11-13]</span></li>
			<li class="Leven"><a href="#">교과부 '2040년 과학기술 미래비전'..</a><span>[2009-11-13]</span></li>
			<li><a href="#">한전-자회사 10곳 통합 ERP 내년에..</a><span>[2009-11-13]</span></li>
			<li class="Leven"><a href="#">아시아 최대 IT센터 인천 송도에 들..</a><span>[2009-11-13]</span></li>
			<li><a href="#">KTㆍ티맥스, 소프트웨어 합작사 세..</a><span>[2009-11-13]</span></li>
			<li class="Llast Leven"><a href="#">지자체 정보시스템 표준화한다</a><span>[2009-11-13]</span></li>
		</ul>
	</div>
	<div id="LtabLGNews" class="LtabContent Lnodisplay">
		<ul class="Lclear">
			<li class="Lfirst"><a href="#">IT신사업 금맥을 찾아라! - 신사업발..</a><span>[2009-11-10]</span></li>
			<li class="Leven"><a href="#">[뉴스 카페] 하영목 상무 등 전.현직..</a><span>[2009-11-10]</span></li>
			<li><a href="#">기술과 서비스의 하모니, 대법원 등..</a><span>[2009-11-06]</span></li>
			<li class="Leven"><a href="#">리더의 시각으로 리더십을 발휘해야</a><span>[2009-11-06]</span></li>
			<li><a href="#">저렴하게 책도 사고, 수익금으로 이..</a><span>[2009-11-02]</span></li>
			<li class="Llast Leven"><a href="#">상생을 위한 Step 1, 협력회사 신입..</a><span>[2009-11-02]</span></li>
		</ul>
	</div>
	<div id="LtabReport" class="LtabContent Lnodisplay">
		<ul class="Lclear">
			<li class="Lfirst"><a href="#">LG CNS, 국내IT서비스기업 최초로 ..</a><span>[2009-10-26]</span></li>
			<li class="Leven"><a href="#">LG CNS, DDoS 방어장비 ‘세이프존..</a><span>[2009-09-29]</span></li>
			<li><a href="#">LG CNS, 정보보호 위한 획기적인 ..</a><span>[2009-08-26]</span></li>
			<li class="Leven"><a href="#">LG CNS, 디지털 경영혁신 아이디어..</a><span>[2009-08-19]</span></li>
			<li><a href="#">LG CNS, 인도네시아 국가재정정보..</a><span>[2009-07-13]</span></li>
			<li class="Llast Leven"><a href="#">LG CNS, 해외 시장서 ‘훨훨’</a><span>[2009-06-23]</span></li>
		</ul>
	</div>
	</div></div></div></div><!-- end LtabBox01 -->

	<div id="Lgroup01" class="Lclear">
	<div id="Ltoday" class="LcontentBox2"><div><div><div>
		<h2>Today<span>2009.12.25</span></h2>
		<ul class="Lclear">
			<li class="mail"><a href="#"><img src="<c:url value='/resource/images/main_today_mail.gif'/>" alt="메일" /><span>메일(3)</span></a></li>
			<li class="sche"><a href="#"><img src="<c:url value='/resource/images/main_today_sche.gif'/>" alt="일정" /><span>일정(1)</span></a></li>
			<li class="todo"><a href="#"><img src="<c:url value='/resource/images/main_today_todo.gif'/>" alt="할일" /><span>할일(9)</span></a></li>
			<li class="todo"><a href="#"><img src="<c:url value='/resource/images/main_today_todo.gif'/>" alt="할일" /><spring:message	code="dev.inf.com.nodata" /></a></li>
		</ul>
	</div></div></div></div>

	<div id="Lrelated" class="LcontentBox2 Lclear"><div><div><div>
		<h2>관련사이트</h2>
		<div>
			<select>
				<option>관련사이트</option>
			</select>
		</div>
	</div></div></div></div>
	</div><!-- end Lgroup01 -->

</div><!-- end LmainWrapper -->
</div>
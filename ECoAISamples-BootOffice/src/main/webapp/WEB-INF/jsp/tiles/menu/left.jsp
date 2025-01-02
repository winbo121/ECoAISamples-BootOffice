<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="LblockLeft">
<div id="LblockLeftTitle">
<div id="LblockLeftMenuStyle">
	<a href="#" onclick="return false;"><img src="<c:url value='/resource/images/slideMenu.gif'/>" alt="슬라이드메뉴" /></a>
	<a href="#" onclick="return false;"><img src="<c:url value='/resource/images/treeMenu.gif'/>" alt="트리메뉴" /></a>
</div>
	<h1>
		<c:if test="${MenuInfoInterceptor_menu1 =='0'}">UI Pattern</c:if>
		<c:if test="${MenuInfoInterceptor_menu1 =='1'}">Function</c:if>
	</h1>
</div>
<div id="LblockLeftMenu" class="LslideMenu">
	<ul>
		<c:if test="${MenuInfoInterceptor_menu1 =='0'}">
			<li class="Lfirst LhasChild <c:if test="${MenuInfoInterceptor_menu2 =='0'}">Lopen</c:if>"><span><a href="#">Web Pattern</a></span>
				<ul>
					<li class="Lfirst LhasChild <c:if test="${MenuInfoInterceptor_menu3 =='0'}">Lopen</c:if>"><span><a href="#">P1 Single</a></span>
						<ul>
							<li class="Lfirst <c:if test="${MenuInfoInterceptor_menu4 =='0'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/p11/retrieveEmployee.do?menu1=0&menu2=0&menu3=0&menu4=0'/>">Single View to Edit</a></span></li>
							<li class="Llast <c:if test="${MenuInfoInterceptor_menu4 =='1'}">Lcurrent</c:if>"><span><a href="<c:url value="/pattern/p12/employeeForm.do?menu1=0&menu2=0&menu3=0&menu4=1" />">Single Edit </a></span></li>
						</ul>
					</li>
					<li class="Lidx1 LhasChild <c:if test="${MenuInfoInterceptor_menu3 =='1'}">Lopen</c:if>">
						<span><a href="#">P2 Multi</a></span>
						<ul>
							<li class="Llast <c:if test="${MenuInfoInterceptor_menu4 =='0'}">Lcurrent</c:if>"><span><a href="<c:url value="/pattern/p2/retrieveEmployeeList.do?menu1=0&menu2=0&menu3=1&menu4=0" />">Multi Edit</a></span></li>
						</ul>
					</li>
					<li class="Lidx2 LhasChild <c:if test="${MenuInfoInterceptor_menu3 =='2'}">Lopen</c:if>"><span><a href="#">P3 List</a></span>
						<ul>
							<li class="Lfirst <c:if test="${MenuInfoInterceptor_menu4 =='0'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/p31/retrieveEmployeeList.do?menu1=0&menu2=0&menu3=2&menu4=0'/>">List to Detail</a></span></li>
							<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menu4 =='1'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/p32/retrieveEmployeeList.do?menu1=0&menu2=0&menu3=2&menu4=1'/>">List to Edit</a></span></li>
							<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menu4 =='2'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/p33/retrieveEmployeeList.do?menu1=0&menu2=0&menu3=2&menu4=2'/>">List/Detail View</a></span></li>
							<li class="Llast <c:if test="${MenuInfoInterceptor_menu4 =='3'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/p34/retrieveEmployeeList.do?menu1=0&menu2=0&menu3=2&menu4=3'/>">List/Detail Edit</a></span></li>
						</ul>
					</li>
					<li class="Lidx3 LhasChild <c:if test="${MenuInfoInterceptor_menu3 =='3'}">Lopen</c:if>"><span><a href="#">P4 Master/Detail</a></span>
						<ul>
							<li class="Lfirst <c:if test="${MenuInfoInterceptor_menu4 =='0'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/p41/employeeDetail.do?menu1=0&menu2=0&menu3=3&menu4=0'/>">[1:1]</a></span></li>
							<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menu4 =='1'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/p42/employeeDetailList.do?menu1=0&menu2=0&menu3=3&menu4=1'/>">[1:n] </a></span></li>
							<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menu4 =='2'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/p43/employeeListDetail.do?menu1=0&menu2=0&menu3=3&menu4=2'/>">[n:1] </a></span></li>
							<li class="Llast <c:if test="${MenuInfoInterceptor_menu4 =='3'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/p44/employeeList.do?menu1=0&menu2=0&menu3=3&menu4=3'/>">[n:n] </a></span></li>
						</ul>
					</li>
					<li class="Llast LhasChild <c:if test="${MenuInfoInterceptor_menu3 =='4'}">Lopen</c:if>"><span><a href="#">Extra Pattern</a></span>
						<ul>
							<li class="Lfirst <c:if test="${MenuInfoInterceptor_menu4 =='0'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/px1/retrieveShuttleEmployeeList.do?menu1=0&menu2=0&menu3=4&menu4=0'/>">Shuttle</a></span></li>
							<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menu4 =='1'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/px2/initializeEmployeeList.do?menu1=0&menu2=0&menu3=4&menu4=1'/>">Tree</a></span></li>
						</ul>
					</li>
				</ul>
			</li>
			<li class="Lidx1 LhasChild <c:if test="${MenuInfoInterceptor_menu2 =='1'}">Lopen</c:if>"><span><a href="#">Page Pattern</a></span>
				<ul>
					<li class="Lfirst <c:if test="${MenuInfoInterceptor_menu3 =='0'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/pp1/retrieveEmployeeList.do?menu1=0&menu2=1&menu3=0'/>">Web Page</a></span></li>
					<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menu3 =='1'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/pp2/retrieveEmployeeList.do?menu1=0&menu2=1&menu3=1'/>">Ajax Page </a></span></li>
					<li class="Llast <c:if test="${MenuInfoInterceptor_menu3 =='2'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/pp3/retrieveEmployeeList.do?menu1=0&menu2=1&menu3=2'/>">Scroll Page </a></span></li>
				</ul>
			</li>
			<%-- 
			<li class="Lidx2 LhasChild <c:if test="${MenuInfoInterceptor_menu2 =='2'}">Lopen</c:if>"><span><a href="#">Web Pattern(Map)</a></span>
				<ul>
					<li class="Lfirst LhasChild <c:if test="${MenuInfoInterceptor_menu3 =='0'}">Lopen</c:if>"><span><a href="#">MP1 Single</a></span>
						<ul>
							<li class="Lfirst <c:if test="${MenuInfoInterceptor_menu4 =='0'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/mp11/retrieveEmployee.do?menu1=0&menu2=2&menu3=0&menu4=0'/>">Single View to Edit</a></span></li>
							<li class="Llast <c:if test="${MenuInfoInterceptor_menu4 =='1'}">Lcurrent</c:if>"><span><a href="<c:url value="/pattern/mp12/employeeForm.do?menu1=0&menu2=2&menu3=0&menu4=1" />">Single Edit </a></span></li>
						</ul>
					</li>
					<li class="Lidx1 LhasChild <c:if test="${MenuInfoInterceptor_menu3 =='1'}">Lopen</c:if>">
						<span><a href="#">MP2 Multi</a></span>
						<ul>
							<li class="Llast <c:if test="${MenuInfoInterceptor_menu4 =='0'}">Lcurrent</c:if>"><span><a href="<c:url value="/pattern/mp2/retrieveEmployeeList.do?menu1=0&menu2=2&menu3=1&menu4=0" />">Multi Edit</a></span></li>
						</ul>
					</li>
					<li class="Llast LhasChild <c:if test="${MenuInfoInterceptor_menu3 =='2'}">Lopen</c:if>"><span><a href="#">MP3 List</a></span>
						<ul>
							<li class="Lfirst <c:if test="${MenuInfoInterceptor_menu4 =='0'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/mp31/retrieveEmployeeList.do?menu1=0&menu2=2&menu3=2&menu4=0'/>">List to Detail</a></span></li>
							<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menu4 =='1'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/mp32/retrieveEmployeeList.do?menu1=0&menu2=2&menu3=2&menu4=1'/>">List to Edit</a></span></li>
							<!--
							<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menu4 =='2'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/mp33/retrieveEmployeeList.do?menu2=2&menu1=0&menu3=2&menu4=2'/>">List/Detail View</a></span></li>
							<li class="Llast <c:if test="${MenuInfoInterceptor_menu4 =='3'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/mp34/employeeListDetail.do?menu1=0&menu2=2&menu3=2&menu4=3'/>">List/Detail Edit</a></span></li>
							 -->
						</ul>
					</li>
				</ul>
			</li>
			<li class="Lidx2 LhasChild <c:if test="${MenuInfoInterceptor_menu2 =='3'}">Lopen</c:if>"><span><a href="#">Page Pattern(Map)</a></span>
				<ul>
					<li class="Lfirst <c:if test="${MenuInfoInterceptor_menu3 =='0'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/mpp1/retrieveEmployeeList.do?menu1=0&menu2=3&menu3=0'/>">Web Page</a></span></li>
					<li class="Llast <c:if test="${MenuInfoInterceptor_menu3 =='1'}">Lcurrent</c:if>"><span><a href="<c:url value='/pattern/mpp2/retrieveEmployeeList.do?menu1=0&menu2=3&menu3=1'/>">Ajax Page </a></span></li>
				</ul>
			</li>
			 --%>
		</c:if>
		<c:if test="${MenuInfoInterceptor_menu1 =='1'}">
			<li class="LfirstLlast LhasChild <c:if test="${MenuInfoInterceptor_menu2 =='0'}">Lopen</c:if>"><span><a href="#">Foundation</a></span>
				<ul>
					<li class="Lfirst <c:if test="${MenuInfoInterceptor_menu3 =='0'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/configuration/employeeForm.do?menu1=1&menu2=0&menu3=0"/>">Configuration</a></span></li>
					<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menu3 =='1'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/log/logDbForm.do?menu1=1&menu2=0&menu3=1"/>">Log</a></span></li>
					<li class="Llast <c:if test="${MenuInfoInterceptor_menu3 =='2'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/message/messageForm.do?menu1=1&menu2=0&menu3=2"/>">Message</a></span></li>
					<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menu3 =='3'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/exception/employeeForm.do?menu1=1&menu2=0&menu3=3"/>">Exception</a></span></li>
				</ul>
			</li>
			<li class="Lidx1 LhasChild <c:if test="${MenuInfoInterceptor_menu2 =='1'}">Lopen</c:if>"><span><a href="#">Presentation</a></span>
				<ul>
					<li class="Lfirst <c:if test="${MenuInfoInterceptor_menu3 =='0'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/webmvc/saymessage/employeeForm.do?menu1=1&menu2=1&menu3=0"/>">SayMessage</a></span></li>
					<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menu3 =='1'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/fileupload/fileUploadForm.do?menu1=1&menu2=1&menu3=1"/>">File Upload</a></span></li>
					<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menu3 =='2'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/filedownload/retrieveFileDownloadList.do?menu1=1&menu2=1&menu3=2"/>">File Download</a></span></li>
					<li class="Llast <c:if test="${MenuInfoInterceptor_menu3 =='3'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/webmvc/savedtoken/employeeForm.do?menu1=1&menu2=1&menu3=3"/>">SavedToken</a></span></li>
				</ul>
			</li>
			<li class="Lidx1 LhasChild <c:if test="${MenuInfoInterceptor_menu2 =='2'}">Lopen</c:if>"><span><a href="#">Persistence</a></span>
				<ul>
					<li class="Lfirst <c:if test="${MenuInfoInterceptor_menu3 =='0'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/dao/retrieveEmployeeList.do?menu1=1&menu2=2&menu3=0"/>">Custom DAO</a></span></li>
					<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menu3 =='1'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/transaction/employeeForm.do?menu1=1&menu2=2&menu3=1"/>">Transaction</a></span></li>
					<li class="Llast <c:if test="${MenuInfoInterceptor_menu3 =='2'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/resultHandler/retrieveEmployeeListForm.do?menu1=1&menu2=2&menu3=2"/>">대용량 처리</a></span></li>
				</ul>
			</li>
			<li class="Llast LhasChild <c:if test="${MenuInfoInterceptor_menu2 =='3'}">Lopen</c:if>"><span><a href="#">Support</a></span>
				<ul>
					<li class="Lfirst <c:if test="${MenuInfoInterceptor_menu3 =='0'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/excel/retrieveEmployeeList.do?menu1=1&menu2=3&menu3=0"/>">Excel</a></span></li>
					<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menu3 =='1'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/idGeneration/idGenerationForm.do?menu1=1&menu2=3&menu3=1"/>">IdGeneration</a></span></li>
					<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menu3 =='2'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/mail/mailForm.do?menu1=1&menu2=3&menu3=2"/>">Mail</a></span></li>
					<li class="Llast <c:if test="${MenuInfoInterceptor_menu3 =='3'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/crypto/cryptoForm.do?menu1=1&menu2=3&menu3=3"/>">Crypto</a></span></li>
					<li class="Lidx1 <c:if test="${MenuInfoInterceptor_menu3 =='4'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/validator/bean/employeeForm.do?menu1=1&menu2=3&menu3=4"/>">Bean Validator</a></span></li>
					<li class="Llast <c:if test="${MenuInfoInterceptor_menu3 =='5'}">Lcurrent</c:if>"><span><a href="<c:url value="/function/validator/commons/employeeForm.do?menu1=1&menu2=3&menu3=5"/>">Commons Validator</a></span></li>
				</ul>
			</li>
		</c:if>
	</ul>
	
</div>

</div>
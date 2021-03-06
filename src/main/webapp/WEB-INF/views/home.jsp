<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<div class="mainBack">
	<div class="mainSearch">
		<div class="detailSearch">
			<div class="mailFilterDiv1">
				<section class="mainCheckIn">
					<h3 class="calendar">체크인</h3>
					<div class="todayCalendarIn">
						<div class="todayAndTomorrowIn"></div>
					</div>
					<div class="filterCalendarIn calendarHidden">
						<div class="calendarDay">
							<button class="calendarPrevIn"></button>
							<div class="calendarYearIn"></div>
							<button class="calendarNextIn"></button>
						</div>
						<table id="calendarTableIn">
							<thead>
								<tr>
									<th class="calendarYoil"><span>일</span></th>
									<th class="calendarYoil"><span>월</span></th>
									<th class="calendarYoil"><span>화</span></th>
									<th class="calendarYoil"><span>수</span></th>
									<th class="calendarYoil"><span>목</span></th>
									<th class="calendarYoil"><span>금</span></th>
									<th class="calendarYoil"><span>토</span></th>
								</tr>
							</thead>
							<tbody class="calendarTbody">
								<tr></tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
							</tbody>
						</table>
						<div><button class="calendarSubmitIn" value="선택완료">선택완료</button></div>
					</div>
				</section>
				<section class="mainCheckOut">
					<h3 class="calendar">체크아웃</h3>
					<div class="todayCalendarOut">
						<div class="todayAndTomorrowOut"></div>
					</div>
					<div class="filterCalendarOut calendarHidden">
						<div class="calendarDay">
							<button class="calendarPrevOut"></button>
							<div class="calendarYearOut"></div>
							<button class="calendarNextOut"></button>
						</div>
						<table id="calendarTableOut">
							<thead>
								<tr>
									<th class="calendarYoil"><span>일</span></th>
									<th class="calendarYoil"><span>월</span></th>
									<th class="calendarYoil"><span>화</span></th>
									<th class="calendarYoil"><span>수</span></th>
									<th class="calendarYoil"><span>목</span></th>
									<th class="calendarYoil"><span>금</span></th>
									<th class="calendarYoil"><span>토</span></th>
								</tr>
							</thead>
							<tbody class="calendarTbody">
								<tr></tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
							</tbody>
						</table>
						<div><button class="calendarSubmitOut" value="선택완료">선택완료</button></div>
					</div>
				</section>
			</div>
			<div class="mainFilterDiv2">
				<section class="mainAreaFilter">
					<h3 class="mainH2">지역</h3>
					<select class="mainAreaSelect">
						<option class="mainArea" value="5001">경기/인천권</option>
						<option class="mainArea" value="5003">충천권</option>
						<option class="mainArea" value="5004">경상/부산권</option>
						<option class="mainArea" value="5005">전라/제주권</option>
						<option class="mainArea" value="5002">강원권</option>
					</select>
				</section>
			
				
				<div>
					<button type="submit" class="mainFilterSubmit">캠핑장 검색</button>
				</div>
			</div>	
		</div>
	</div>
	<div class="mainBackImg">
		<img src="${cpath }/resources/img/mainBack.png">
	</div>
</div>
<div class="mainMid">
	<div class="mainMidBox">
		<div class="midDiv">
			<div class="midMain">
				<div class="midMainDiv">
					<div class="midMainTitle">공지사항</div>
					<div class="midMainContents">
						<div>
							<img src="${cpath }/resources/img/seemore.png">
						</div>
						<div>
							<div class="midMainText1">
								<a href="${cpath }/more/notice">[발표] 랜덤여행 럭키백 16탄</a>
							</div>
							<div class="midMainText2">
								<a href="${cpath }/more/notice">2천명 한정 수량 내 구매를 성공하신 고객님께 축하와 감사의 인사드리며, 럭키백 경품 추첨 결과 안내드립니다.</a>
							</div>
						</div>
					</div>
				</div>
				<div class="midMainDiv">
					<div class="midMainTitle">공지사항</div>
					<div class="midMainContents">
						<div>
							<img src="${cpath }/resources/img/seemore.png">
						</div>
						<div>
							<div class="midMainText1">
								<a href="${cpath }/more/notice">[발표] 공간대여 서비스 오픈 사전 이벤트</a>
							</div>
							<div class="midMainText2">
								<a href="${cpath }/more/notice">안녕하세요 대한민국 1등 종합숙박앱 여기어때입니다. [공간대여 서비스 오픈 사전 이벤트] 당첨자를 발표합니다</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="footer">
</div>
<div class="footerText">
	<div>
		<img src="${cpath }/resources/img/logo.png">
	</div>
</div>
<div class="TextAll">
	<div class="footerTextAll">
		<div class="footerName">
			<ul>
				<li><a href="">김유성</a></li>
				<li><a href="">신은욱</a></li>
				<li><a href="">조경민</a></li>
				<li><a href="">윤다영</a></li>
				<li><a href="">박진영</a></li>
			</ul>
		</div>
	</div>
</div>
<div class="footerEnd">
	<div class="footerEnd2">
		Copyrightⓒ 2022.AfterCamping.Allright reserved.
	</div>
</div>


<script src="${cpath }/resources/js/filterJs/function5.js"></script>
<script>
	const mainBackImg = document.querySelector('.mainBackImg')
	
	mainBackImg.addEventListener('click', closeHandler)
	
	function closeHandler(evnet){
		filterCalendarOut.classList.add('calendarHidden')
		filterCalendarIn.classList.add('calendarHidden')
	}
	
	mainFilterSubmit.addEventListener('click', mainFilter)
	
	
</script>
</body>
</html>
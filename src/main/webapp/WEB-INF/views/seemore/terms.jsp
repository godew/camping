<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="${cpath }/resources/css/seemore/seemore.css">
<link rel="stylesheet" href="https://static.goodchoice.kr/yg-webview/css/terms/terms-basic.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${cpath }/resources/js/seemore/seemore.js"></script>
<html>
<body>
	
	<div class="content-more">
		<div class="sub_wrap more_wrap">
			<nav>
				<ul>
			        <li><a href="${cpath }/more/notice">공지사항</a></li>
			        <li><a href="javascript:alert('미구현 페이지');">이벤트</a></li>
			        <li><a href="javascript:alert('미구현 페이지');">혁신 프로젝트</a></li>
			        <li><a href="javascript:alert('미구현 페이지');">자주 묻는 질문</a></li>
			        <li><a href="javascript:alert('미구현 페이지');">1:1 문의</a></li>
			        <li><a href="${cpath }/more/terms" class="active">약관 및 정책</a></li>
			    </ul>
			</nav>
			<div class="align_rt">
				
				<div class="faq terms_wrap">
					<div class="top_link half_4 terms_tab" data-default="term">
						<ul id="tabs_ul">
						</ul>
					</div>
				</div>
				
				<div class="terms terms_new" style="display: block;" id="contentsDiv">
					
				</div>
				
				
			</div>
		</div>
	</div>

	<script>
		
		window.onload = () => {
			
			notice_info.init();
		};
		
		const notice_info = {
				
			init() {
				this.setTab();
			},
			
			param : {
				top_class : 'TERM',
			},
			
			tabInfo : {
				
			},
			
			setTab() {
				ajaxRequest("${cpath}/more/terms/tabsList", {
					...this.param,
				})
				.then(data => {
					data.forEach(obj => {
						this.tabInfo[obj.mid_class] = obj.t_contents;
						this.tabInfo[obj.mid_class + '_dUse'] = obj.enfm_date_use;
					})
					return data
				})
				.then(data => this.setTabHtml(data) )
				.then(strHtml => $('#tabs_ul').html(strHtml) )
				.then(() => this.selectTabClickEvent() )
				.then(() => {
					if('${pageDetail}' === 'location') {
						$('#tabs_ul li:eq(1)').trigger('click'); 						
					} else if('${pageDetail}' === 'privacy') {
						$('#tabs_ul li:eq(2)').trigger('click');
					} else if('${pageDetail}' === 'teenager') {
						$('#tabs_ul li:eq(3)').trigger('click');
					}else {
						$('#tabs_ul li:eq(0)').trigger('click'); 
					}
				})
				.catch(console.log);
			},
			
			getData(idx = -1) {
				
				this.param.t_number = idx;
				ajaxRequest("${cpath}/more/terms/dataList", {
					...this.param,
				})
				.then(data => {
					this.setContentsInit(this.param.mid_class);		
					return data;
				})
				.then(data =>  $('#policy_contents_div').html(data[0].t_contents) )
				.then(() => this.setLiClickEvent() )
				.catch(console.log);
			},
			
			getEnfmDate() {
				
				ajaxRequest("${cpath}/more/terms/getEnfmDateList", {
					...this.param,
				})
				.then(data => {
					$('#policy_term_select').empty();
					data.forEach(obj => {
						let selected = "";
						if(this.tabInfo.enfmIdx) {
							selected = this.tabInfo.enfmIdx == obj.IDX_NUM ? 'selected' : '';
						}
						const option = $(`<option value=\${obj.IDX_NUM} \${selected}>
											\${obj.ENFM_DATE}
							  			</option>`);
		                $('#policy_term_select').append(option);
					});
				})
				.then(() => this.setChangeEvent() )
				.catch(console.log);
			},
			
			setContentsInit(mid_class) {
				
				$('#contentsDiv').html(this.tabInfo[mid_class]);
				if(this.tabInfo[mid_class + '_dUse'] === 'Y') {
					this.getEnfmDate();
				}
			},
			
			choiceTab(list) {
				
				$('#contentsDiv').html('');
				list.forEach(data => {
					if(data !== 'on') {
						
						this.tabInfo.enfmIdx = null;
						this.param.mid_class = data.substring(0, 4); 
						if(typeof history.pushState) {
							const pathInfo = ('/' + data.toLowerCase()) === '/term' ? '' : '/' + data.toLowerCase();
							history.pushState('', '', `${cpath}/more/terms\${pathInfo}`);
						}
						this.getData();
					}
				});
			},
			
			setTabHtml(list) {
				
				const resultArr = [];
				list.forEach(data => {
					const strHtml = `<li>
						<a href="javascript:void(0);" class=\${data.etc}>\${data.title}</a>
					</li>
					`;
					resultArr.push(strHtml);
				});
				
				return resultArr.join('');				
			},
			
			selectTabClickEvent() {
				
				const liTags = document.querySelectorAll('#tabs_ul li');
				liTags.forEach(el => {
					el.addEventListener('click', e => {
						document.querySelectorAll('#tabs_ul li a').forEach(item => item.classList.remove('on'));
						e.currentTarget.childNodes[1].classList.add('on');
						this.choiceTab( e.currentTarget.childNodes[1].classList );
					});
				});
			},
			
			setLiClickEvent() {
				
				const divTags = document.querySelectorAll('.term-accordion-title');
				divTags.forEach(el => {
					el.addEventListener('click', e => {
						if(e.currentTarget.parentNode.classList.contains('term-accordion__open')) {
							e.currentTarget.parentNode.classList.remove('term-accordion__open');
						} else {
							e.currentTarget.parentNode.classList.add('term-accordion__open');
						}
					});
				});
			},
			
			setChangeEvent() {
				
				const selectTag = document.querySelector('.term-select');
				selectTag.addEventListener('change', e => {
					const idx = e.target.value;
					this.tabInfo.enfmIdx = idx;
					this.getData(idx);
				});
			},
		};
		
	</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="${cpath }/resources/css/seemore/seemore.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${cpath }/resources/js/seemore/seemore.js"></script>
<html>
<body>
	
	<div class="content">
		<div class="sub_wrap more_wrap">
			<nav>
				<ul>
			        <li><a href="${cpath }/more/notice" class="active">공지사항</a></li>
			        <li><a href="javascript:alert('미구현 페이지');">이벤트</a></li>
			        <li><a href="javascript:alert('미구현 페이지');">혁신 프로젝트</a></li>
			        <li><a href="javascript:alert('미구현 페이지');">자주 묻는 질문</a></li>
			        <li><a href="javascript:alert('미구현 페이지');">1:1 문의</a></li>
			        <li><a href="${cpath }/more/terms">약관 및 정책</a></li>
			    </ul>
			</nav>
		
			<div class="align_rt">
				<div class="notice">
					<div class="tab">	
						<span class="tab_btn active">
							서비스 공지사항<i class="ico_new">NEW</i>
						</span>
					</div>
		
					<div class="tab_each">
						<ul id="notices" class="show_list"></ul>
		
						<div id="notice_pagination"></div>
					</div>
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
				this.getData();
			},
			
			param: {
				top_class : 'INFO',
				mid_class : 'SVCE',
				not_in_condition : 'INFOSVCEMST',
				pageIdx: 1,
			},
			
			getData() {
				ajaxRequest("${cpath}/more/notice/data", {
					...this.param,
					start_page_num : 10 * (this.param.pageIdx - 1) + 1,
					end_page_num : 10 * this.param.pageIdx,
				})
				.then(data => {
					setPagination('notice_pagination', data.pTotalCount, this.param.pageIdx);
					return data;
				})
				.then(data => this.setHtml(data.list) )
				.then(strHtml => $('#notices').html(strHtml) )
				.then(() => this.setLiClickEvent() )
				.then(() => $("html, body").animate({ scrollTop: 0 }, "fast") )
				.catch(console.log);
			},
			
			setHtml(list) {
				const resultArr = [];
				list.forEach(data => {
					const tempRegDate = new Date(data.reg_date);
					const regDate = `\${tempRegDate.getFullYear()}.\${tempRegDate.getMonth() + 1}.\${tempRegDate.getDate()}`; 
					
					const strHtml = `<li>
						<a id="notive_tab" class="list_que">
							<p>\${data.title}</p> 
							<span>\${regDate}</span>
						</a>
						<div style="display:none;">
						\${data.t_contents}
						</div>
					</li>
					`;
					resultArr.push(strHtml);
				});
				return resultArr.join('');
			},
			
			setLiClickEvent() {
				
				const liTags = document.querySelectorAll('.list_que');
				liTags.forEach(el => el.addEventListener('click', el => {
					
					if(el.currentTarget.parentNode.childNodes[3].style.display === 'none') {
						el.currentTarget.parentNode.childNodes[3].style.display = 'block';
					} else if(el.currentTarget.parentNode.childNodes[3].style.display === 'block') {
						el.currentTarget.parentNode.childNodes[3].style.display = 'none';
					}	
				}));
				
				const pageBtns = document.querySelectorAll('.paging button');
				pageBtns.forEach(el =>  {
					el.addEventListener('click', e => {
						const element = e.target;
						let pageNum = element.innerHTML;
						if(isNaN(Number(pageNum))) {
							if(element.classList.contains('next')) {
								pageNum = Math.ceil(this.param.pageIdx / 5) * 5 + 1;
							} else if(element.classList.contains('prev')) {
								pageNum = Math.floor((this.param.pageIdx - 1) / 5) * 5 ;
							}
						}
						location.href = `${cpath}/more/notice#\${pageNum}`;
						this.param.pageIdx = pageNum;
						this.getData();
					});
				});
			}
		};
		
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>  
<style>
#divMain {
	width:1000px;
	margin: 0 auto;
}

.proList {
	border-collapse: collapse;
	width: 1000px;
}

thead>*{
	background-color: lightgray;
}

th,td {
	text-align: center;
	border-bottom: 1px solid #000;
	height: 50;
}

span {
	display: flex;
}

.divTop {
	float: right;
	margin: 20px 0;
}

.delButton {
	border: 1px solid rebeccapurple;
	width: 50;
	float: right;
	margin: 10px 0;
}

.text {
	width: 55;
	border: 1px solid red;
	display: flex;
}
.pagination {
  display: flex;
  justify-content: center;
  list-style-type: none;
  padding: 0;
  margin: 20px 0;
}

.pagination li {
  margin: 0 5px;
  font-size: 16px;
  font-weight: bold;
}

.pagination li a {
  display: block;
  padding: 8px 16px;
  text-decoration: none;
  color: #333;
  border-radius: 4px;
}

.pagination li.active a {
  background-color: #007bff;
  color: #fff;
}

.pagination li a:hover {
  background-color: #e9ecef;
  color: #495057;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
	<div id="divMain">
		<table align="center" class="proList">
			<div class="divTop">
				<span> 
				<select name="revNum" class="selectNum">
						<option value="전체">전체</option>
						<option value="삭제">삭제</option>
						<option value="심사중">심사중</option>
						<option value="펀딩중">펀딩중</option>
						<option value="펀딩완료">펀딩완료</option>
						<option value="펀딩실패">펀딩실패</option>
				</select>
						<input type="text" placeholder="검색어를 입력하세요" class="keyWord" onKeyPress="enterKey()">
						<input type="button" value="검색" onclick="searchDo(1)">
				</span>
			</div>
			<thead>
				<tr>
					<th class="proIdx">번호
					</td>
					<th class="userId">사용자 ID
					</td>
					<th class="proTitle">프로젝트 제목
					</td>
					<th class="proDeadLine">마감기한
					</td>
					<th class="rewPrice">리워드 가격
					</td>
					<th class="targerPrice">목표 금액
					</td>
					<th class="progress">할인율
					</td>
					<th class="fundState">펀딩 상태
					</td>
				</tr>
			</thead>
			<tbody id="list">
			</tbody>
			<tr>
	      		<td colspan="8">
					<div class="container">                           
	               		<nav aria-label="Page navigation" style="text-align:center">
	                		<ul class="pagination" id="pagination"></ul>
						</nav>               
	            	</div>
	      		</td>
      		</tr>
		</table>
	</div>
</body>
<script>
	var showPage = 1;
	

	$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
		listCall(cate,showPage);
	});

	var cate = '전체';
	$('.selectNum').on('change',function(){
		$('#pagination').twbsPagination('destroy');
		var cate;
		if ($('.selectNum').val() == '심사중') {
			cate ='A';
		}
		if ($('.selectNum').val() == '펀딩완료') {
			cate ='B';
		}
		if ($('.selectNum').val() == '펀딩중') {
			cate ='C';
		}
		if ($('.selectNum').val() == '삭제') {
			cate ='D';
		}
		if ($('.selectNum').val() == '펀딩실패') {
			cate ='E';
		}
		if ($('.selectNum').val() == '거절') {
			cate ='F';
		}
		if ($('.selectNum').val() == '전체') {
			cate =$('.selectNum').val();
		}
		listCall(cate,showPage);
	})
	
	function listCall(cate,showPage){
		console.log(cate);
		console.log(showPage);
		$.ajax({
			type:'get'
			,url:'./adminList.ajax'
			,data:{
				category:cate,
				page:showPage,
				cnt:20
			}
			,dataType:'json'
			,success:function(data){
				drawList(data.list);
				$('#pagination').twbsPagination({
	            	startPage:1, // 시작페이지
	            	totalPages:data.totalPages, // 총 페이지 수
	            	visiblePages:5, // 보여줄 페이지 수 1,2,3,4,5
	            	onPageClick:function(evt,pg){ // 페이지 클릭시 실행 함수
	            		console.log(pg); // 클릭한 페이지 번호
	            		num = pg;
	            		listCall(cate,pg);
	            	}
	            })
			}
			,error:function(error){
				console.log(error);
			}
		});
	}
	
	function drawList(list){
		var num = 1;
		var content = '';
		for (item of list) {
			
			content += '<tr>';
			content += '<td class="proIdx">' + item.pro_idx + '</td>';
			content += '<td class="userId">' + item.mem_id + '</td>';
			content += '<td class="proTitle"><a href="detail.go?pro_idx=' + item.pro_idx + '">' + item.pro_title + '</a></td>';
			var date = new Date(item.pro_deadline);
			var dateStr = date.toLocaleDateString("ko-KR");
			content += '<td class="proDeadLine">' + dateStr + '</td>';
			content += '<td class="rewPrice">' + (item.rew_price !== null ? Number(item.rew_price).toLocaleString() : '') + '원</td>';
			content += '<td class="targerPrice">' + (item.target_price !== null ? Number(item.target_price).toLocaleString() : '') + '원</td>';
			content += '<td class="progress">' + (item.progress !== null ? item.progress + '%' : '') + '</td>';

			var state = '';
			if (item.pro_state == 'A') {
				state = '심사중';
			}
			if (item.pro_state == 'B') {
				state = '펀딩완료';
			}
			if (item.pro_state == 'C') {
				state = '펀딩중';
			}
			if (item.pro_state == 'D') {
				state = '삭제';
			}
			if (item.pro_state == 'E') {
				state = '실패';
			}
			if (item.pro_state == 'F') {
				state = '거절';
			}
			content += '<td class="fundState">' + state + '</td>';
			content += '</tr>';
			num += 1;
		}
		$('#list').html(content);
	};
	
	function search(showPage) {
		console.log($('.keyWord').val());
		console.log(showPage);
		$('.selectNum').val('전체');
		$.ajax({
			type:'get'
			,url:'./search.ajax'
			,data:{
				keyWord:$('.keyWord').val(),
				page:showPage,
				cnt:20
			}
			,dataType:'json'
			,success:function(data){
				console.log(data.list);
				console.log(data.totalPages);
				drawList(data.list);
				$('#pagination').twbsPagination({
	            	startPage:1, // 시작페이지
	            	totalPages:data.totalPages, // 총 페이지 수
	            	visiblePages:5, // 보여줄 페이지 수 1,2,3,4,5
	            	onPageClick:function(evt,pg){ // 페이지 클릭시 실행 함수
	            		console.log(pg); // 클릭한 페이지 번호
	            		num = pg;
	            		search(pg);
	            	}
	            })
			}
			,error:function(error){
				console.log(error);
			}
		});
	}
	
	
	function searchDo(showPage) {
		$('#pagination').twbsPagination('destroy');
		search(showPage);
	}
	
	function enterKey() {
		if (event.keyCode==13) {
			var showPage = 1;
			$('#pagination').twbsPagination('destroy');
			search(showPage);
		}
	}
	
	
	
	
	
	
	(function ($, window, document, undefined) {

	    'use strict';

	    var old = $.fn.twbsPagination;

	    // PROTOTYPE AND CONSTRUCTOR

	    var TwbsPagination = function (element, options) {
	        this.$element = $(element);
	        this.options = $.extend({}, $.fn.twbsPagination.defaults, options);

	        if (this.options.startPage < 1 || this.options.startPage > this.options.totalPages) {
	            throw new Error('Start page option is incorrect');
	        }

	        this.options.totalPages = parseInt(this.options.totalPages);
	        if (isNaN(this.options.totalPages)) {
	            throw new Error('Total pages option is not correct!');
	        }

	        this.options.visiblePages = parseInt(this.options.visiblePages);
	        if (isNaN(this.options.visiblePages)) {
	            throw new Error('Visible pages option is not correct!');
	        }

	        if (this.options.onPageClick instanceof Function) {
	            this.$element.first().on('page', this.options.onPageClick);
	        }

	        // hide if only one page exists
	        if (this.options.hideOnlyOnePage && this.options.totalPages == 1) {
	            this.$element.trigger('page', 1);
	            return this;
	        }

	        if (this.options.totalPages < this.options.visiblePages) {
	            this.options.visiblePages = this.options.totalPages;
	        }

	        if (this.options.href) {
	            this.options.startPage = this.getPageFromQueryString();
	            if (!this.options.startPage) {
	                this.options.startPage = 1;
	            }
	        }

	        var tagName = (typeof this.$element.prop === 'function') ?
	            this.$element.prop('tagName') : this.$element.attr('tagName');

	        if (tagName === 'UL') {
	            this.$listContainer = this.$element;
	        } else {
	            this.$listContainer = $('<ul></ul>');
	        }

	        this.$listContainer.addClass(this.options.paginationClass);

	        if (tagName !== 'UL') {
	            this.$element.append(this.$listContainer);
	        }

	        if (this.options.initiateStartPageClick) {
	            this.show(this.options.startPage);
	        } else {
	            this.currentPage = this.options.startPage;
	            this.render(this.getPages(this.options.startPage));
	            this.setupEvents();
	        }

	        return this;
	    };

	    TwbsPagination.prototype = {

	        constructor: TwbsPagination,

	        destroy: function () {
	            this.$element.empty();
	            this.$element.removeData('twbs-pagination');
	            this.$element.off('page');

	            return this;
	        },

	        show: function (page) {
	            if (page < 1 || page > this.options.totalPages) {
	                throw new Error('Page is incorrect.');
	            }
	            this.currentPage = page;

	            this.render(this.getPages(page));
	            this.setupEvents();

	            this.$element.trigger('page', page);

	            return this;
	        },

	        enable: function () {
	            this.show(this.currentPage);
	        },

	        disable: function () {
	            var _this = this;
	            this.$listContainer.off('click').on('click', 'li', function (evt) {
	                evt.preventDefault();
	            });
	            this.$listContainer.children().each(function () {
	                var $this = $(this);
	                if (!$this.hasClass(_this.options.activeClass)) {
	                    $(this).addClass(_this.options.disabledClass);
	                }
	            });
	        },

	        buildListItems: function (pages) {
	            var listItems = [];

	            if (this.options.first) {
	                listItems.push(this.buildItem('first', 1));
	            }

	            if (this.options.prev) {
	                var prev = pages.currentPage > 1 ? pages.currentPage - 1 : this.options.loop ? this.options.totalPages  : 1;
	                listItems.push(this.buildItem('prev', prev));
	            }

	            for (var i = 0; i < pages.numeric.length; i++) {
	                listItems.push(this.buildItem('page', pages.numeric[i]));
	            }

	            if (this.options.next) {
	                var next = pages.currentPage < this.options.totalPages ? pages.currentPage + 1 : this.options.loop ? 1 : this.options.totalPages;
	                listItems.push(this.buildItem('next', next));
	            }

	            if (this.options.last) {
	                listItems.push(this.buildItem('last', this.options.totalPages));
	            }

	            return listItems;
	        },

	        buildItem: function (type, page) {
	            var $itemContainer = $('<li></li>'),
	                $itemContent = $('<a></a>'),
	                itemText = this.options[type] ? this.makeText(this.options[type], page) : page;

	            $itemContainer.addClass(this.options[type + 'Class']);
	            $itemContainer.data('page', page);
	            $itemContainer.data('page-type', type);
	            $itemContainer.append($itemContent.attr('href', this.makeHref(page)).addClass(this.options.anchorClass).html(itemText));

	            return $itemContainer;
	        },

	        getPages: function (currentPage) {
	            var pages = [];

	            var half = Math.floor(this.options.visiblePages / 2);
	            var start = currentPage - half + 1 - this.options.visiblePages % 2;
	            var end = currentPage + half;

	            // handle boundary case
	            if (start <= 0) {
	                start = 1;
	                end = this.options.visiblePages;
	            }
	            if (end > this.options.totalPages) {
	                start = this.options.totalPages - this.options.visiblePages + 1;
	                end = this.options.totalPages;
	            }

	            var itPage = start;
	            while (itPage <= end) {
	                pages.push(itPage);
	                itPage++;
	            }

	            return {"currentPage": currentPage, "numeric": pages};
	        },

	        render: function (pages) {
	            var _this = this;
	            this.$listContainer.children().remove();
	            var items = this.buildListItems(pages);
	            $.each(items, function(key, item){
	                _this.$listContainer.append(item);
	            });

	            this.$listContainer.children().each(function () {
	                var $this = $(this),
	                    pageType = $this.data('page-type');

	                switch (pageType) {
	                    case 'page':
	                        if ($this.data('page') === pages.currentPage) {
	                            $this.addClass(_this.options.activeClass);
	                        }
	                        break;
	                    case 'first':
	                            $this.toggleClass(_this.options.disabledClass, pages.currentPage === 1);
	                        break;
	                    case 'last':
	                            $this.toggleClass(_this.options.disabledClass, pages.currentPage === _this.options.totalPages);
	                        break;
	                    case 'prev':
	                            $this.toggleClass(_this.options.disabledClass, !_this.options.loop && pages.currentPage === 1);
	                        break;
	                    case 'next':
	                            $this.toggleClass(_this.options.disabledClass,
	                                !_this.options.loop && pages.currentPage === _this.options.totalPages);
	                        break;
	                    default:
	                        break;
	                }

	            });
	        },

	        setupEvents: function () {
	            var _this = this;
	            this.$listContainer.off('click').on('click', 'li', function (evt) {
	                var $this = $(this);
	                if ($this.hasClass(_this.options.disabledClass) || $this.hasClass(_this.options.activeClass)) {
	                    return false;
	                }
	                // Prevent click event if href is not set.
	                !_this.options.href && evt.preventDefault();
	                _this.show(parseInt($this.data('page')));
	            });
	        },

	        makeHref: function (page) {
	            return this.options.href ? this.generateQueryString(page) : "#";
	        },

	        makeText: function (text, page) {
	            return text.replace(this.options.pageVariable, page)
	                .replace(this.options.totalPagesVariable, this.options.totalPages)
	        },
	        getPageFromQueryString: function (searchStr) {
	            var search = this.getSearchString(searchStr),
	                regex = new RegExp(this.options.pageVariable + '(=([^&#]*)|&|#|$)'),
	                page = regex.exec(search);
	            if (!page || !page[2]) {
	                return null;
	            }
	            page = decodeURIComponent(page[2]);
	            page = parseInt(page);
	            if (isNaN(page)) {
	                return null;
	            }
	            return page;
	        },
	        generateQueryString: function (pageNumber, searchStr) {
	            var search = this.getSearchString(searchStr),
	                regex = new RegExp(this.options.pageVariable + '=*[^&#]*');
	            if (!search) return '';
	            return '?' + search.replace(regex, this.options.pageVariable + '=' + pageNumber);

	        },
	        getSearchString: function (searchStr) {
	            var search = searchStr || window.location.search;
	            if (search === '') {
	                return null;
	            }
	            if (search.indexOf('?') === 0) search = search.substr(1);
	            return search;
	        },
	        getCurrentPage: function () {
	            return this.currentPage;
	        }
	    };

	    // PLUGIN DEFINITION

	    $.fn.twbsPagination = function (option) {
	        var args = Array.prototype.slice.call(arguments, 1);
	        var methodReturn;

	        var $this = $(this);
	        var data = $this.data('twbs-pagination');
	        var options = typeof option === 'object' ? option : {};

	        if (!data) $this.data('twbs-pagination', (data = new TwbsPagination(this, options) ));
	        if (typeof option === 'string') methodReturn = data[ option ].apply(data, args);

	        return ( methodReturn === undefined ) ? $this : methodReturn;
	    };

	    $.fn.twbsPagination.defaults = {
	        totalPages: 1,
	        startPage: 1,
	        visiblePages: 5,
	        initiateStartPageClick: true,
	        hideOnlyOnePage: false,
	        href: false,
	        pageVariable: '{{page}}',
	        totalPagesVariable: '{{total_pages}}',
	        page: null,
	        first: 'First',
	        prev: 'Previous',
	        next: 'Next',
	        last: 'Last',
	        loop: false,
	        onPageClick: null,
	        paginationClass: 'pagination',
	        nextClass: 'page-item next',
	        prevClass: 'page-item prev',
	        lastClass: 'page-item last',
	        firstClass: 'page-item first',
	        pageClass: 'page-item',
	        activeClass: 'active',
	        disabledClass: 'disabled',
	        anchorClass: 'page-link'
	    };

	    $.fn.twbsPagination.Constructor = TwbsPagination;

	    $.fn.twbsPagination.noConflict = function () {
	        $.fn.twbsPagination = old;
	        return this;
	    };

	    $.fn.twbsPagination.version = "1.4.1";

	})(window.jQuery, window, document);
	
	
	
	
	
	
	
	
	
</script>
</html>
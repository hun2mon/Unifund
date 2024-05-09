<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<style>
table {
	border-collapse: collapse;
	margin-top: 20;
	box-shadow: 0px 8px 32px rgba(0, 0, 0, 0.3);
	background-color: rgba(255, 255, 255, 0.15);
	font-size: 20;
}

th, td {
	width: 500;
	height: 50px;
	text-align: center;
	border: 1px solid rgba(0, 0, 0, 0.3);
	vertical-align: top;
	vertical-align: bottom;
	vertical-align: middle;
}

.mainDiv {
	width: 1300;
	margin: 0 auto;
	margin-top: 20;
}

.middle {
	width: 1300;
}

.topTitle {
	font-size: 40;
}

thead {
	background-color: lightgray;
}

.cashBtn {
	width: 325;
	margin: 0 auto;
	margin-top: 20;
}

.chargeBtn, .cancleBtn {
	width: 150;
	height: 35;
	font-size: 15;
	border: 0px;
	box-shadow: 0px 8px 32px rgba(60, 59, 59, 0.3);
	background-color: rgba(255, 255, 255, 0.15);
	border-radius: 170px;
}

.cancleBtn {
	margin-left: 20;
}

.writeNum {
	height: 30;
	font-size: 15;
	text-align: right;
}

.middleBottom, .middleTop, .dateSelect {
	display: flex;
	font-size: 20;
}

.middleTop {
	margin-left: 1220;
	width: 80;
}

.middleBottom {
	width: 1300;
}

.nowCash {
	margin-left: 881;
	width: 208;
	font-size: 40;
	text-align: right;
}

.selectYear, .selectMonth {
	width: 104;
	height: 30;
	font-size: 20;
}

.dateSelect {
	height: 30;
	width: 1300;
}

.selectMonth {
	margin-left: 10px;
}

.moveMoney{
	display: flex;
	margin-left: 30;
}
.search{
	margin-left: 593;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
	<div class="mainDiv">
		<div class="topTitle">캐시내역</div>
		<hr>
		<div class="middle">
			<div class="middleBottom">
				<div class="dateSelect">
					<select name="year" class="selectYear" id="year">
					</select> <select name="month" class="selectMonth">
						<option value="전체">전체</option>
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
					<div class="moveMoney">
						<input type="button" value="마일리지 리스트" onclick="location.href='./adminMileageList.go'">
					</div>
					<div class="search">
						<input type="text" class="searchVal">
						<input type="button" value="검색" onclick="search()">
					</div>
				</div>
			</div>
		</div>
		<form action="./charge.do">
			<table align="center">
				<thead>
					<tr>
						<th scope="col"></th>
			            <th scope="col">사용자ID</th>
			            <th scope="col">구분</th>
			            <th scope="col">금액</th>
			            <th scope="col">입출금 내역</th>
			            <th scope="col">입출금 날짜</th>
					</tr>
				</thead>
				<tbody id="list">
				</tbody>
				<tr>
					<td colspan="6">
						<div class="container">
							<nav aria-label="Page navigation" style="text-align: center">
								<ul class="pagination" id="pagination"></ul>
							</nav>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script>
	var isRun = false;

	$(document).ready(function(){
		var year = '전체';
		var month = '전체';
		listCall(year,month,showPage);
	});
	
	var showPage = 1;
	
 	$('.selectMonth').on('change',function(){
		var month = $('.selectMonth').val();
		var year = $('.selectYear').val();
		isRun = false;
		$('#pagination').twbsPagination('destroy');
		listCall(year,month,showPage);
	})
	
	$('.selectYear').on('change',function(){
		var month = $('.selectMonth').val();
		var year = $('.selectYear').val();
		isRun = false;
		$('#pagination').twbsPagination('destroy');
		listCall(year,month,showPage);
	}) 
	
	function search() {
		console.log($('.searchVal').val());
		var month = $('.selectMonth').val();
		var year = $('.selectYear').val();
		var keyWord = $('.searchVal').val(); 
		isRun = false;
		$('#pagination').twbsPagination('destroy');
		console.log(month);
		console.log(year);
		listCall(year,month,showPage, keyWord);
	}

	function listCall(year,month,showPage, keyWord) {
 		console.log(year);
 		console.log(month);
 		if(isRun == true) {
 	        return;
 	    }

 	    isRun = true;
 	    
		$.ajax({
			type : 'post',
			url : './allCashList.ajax',
			data : {
				year:year,
				month:month,
				page:showPage,
				cnt:20,
				keyWord:keyWord
			},
			dataType : 'json',
			success : function(data) {
				console.log(data.list);
				console.log(data.year);
				drawList(data.list);
				if (data.year != null) {
					$('#year').html('');		
					drawYear(data.year);							
				}
 				$('#pagination').twbsPagination({
	            	startPage:data.currPage, 
	            	totalPages:data.totalPages,
	            	visiblePages:5,
		            onPageClick:function(evt,pg){
		            	console.log(pg);
		            	listCall(year,month,pg, keyWord);
		            	isRun = false;
		            }
	            }) 
			},
			error : function(error) {
				console.log(error);
			}
		});
	}
	
	function drawList(list){
		var content = '';
		for (item of list) {
			content += '<tr>';
			content += '<td>' + item.cash_idx + '</td>';
			content += '<td>' + item.mem_id + '</td>';
			content += '<td>캐시</td>';
			content += '<td>' + item.cash_content +item.cash_amount.toLocaleString() + '</td>';
			content += '<td>' + item.cash_division + '</td>';
			var date = new Date(item.cash_date);
			var dateStr = date.toLocaleDateString("ko-KR");//en_US
			content += '<td>' + dateStr + '</td>';
			content += '</tr>';
		}		
		$('#list').html(content);
	};
	
	function drawYear(list){
		var content = '';
		content+='<option value="전체">전체</option>';
		for (item of list) {
			console.log(item.year)
			content += '<option value="' + item.year + '">' + item.year + '</option>'
		}
		$('#year').append(content);
	};
	
	
	
	
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
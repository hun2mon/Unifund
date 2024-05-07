<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    

<style>
table {
	width: 50%;
	border-collapse: collapse;
	margin: 20px auto;
}

th, td {
	border: WHITE;
	padding: 8px;
	text-align: center;
	cursor: pointer;
}

th {
	background-color: #f2f2f2;
}

.red-text {
	color: red;
}

.green-text {
	color: green;
}

.search-bar {
	text-align: center;
	height: 30;
    margin-left: 710;
}
.mainDiv{
	width: 1200;
	margin: 0 auto;
}
.topDiv{
	display: flex;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	<div class="mainDiv">
		<h2>공지사항</h2>
		<hr>
		<div class="topDiv">
				<div style="text-align: center;">
					<button onclick="goToAdminAnnForm()">공지사항 작성</button>
				</div>
				<div style="text-align: center;">
			        <button onclick="deleteSelectedAnnouncements()">선택된 공지사항 삭제</button>
			    </div>
			<div class="search-bar">
				<input type="text" placeholder="검색어를 입력하세요" id="keyWord"
					class="keyWord" onKeyPress="enterKey()"> <input type="button"
					value="검색" onclick="searchDo()">
			</div>
		</div>
		<table>
			<thead>
				<tr>
				    <th><input type="checkbox" class="checkbox" id="selectAll" onclick="selectAll()"></th>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody id="list">
	
			</tbody>
			<tr>
				<td colspan="6" id="paging">
					<div class="container">
						<nav aria-label="Page navigation" style="text-align: center">
							<ul class="pagination" id="pagination"></ul>
						</nav>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
	<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<script>
var showPage = 1;

$(document).ready(function(){ 
    listCall(showPage);
});

function listCall(page){
	console.log(showPage);
	$.ajax({
		type:'get'
		,url:'./adminList.ajax'
		,data:{
			'page':page,
            'cnt':20,
		}
		,dataType:'json'
		,success:function(data){
			drawList(data.adminList);
			$('#pagination').twbsPagination({
            	startPage:1, // 시작페이지
            	totalPages:data.totalPages, // 총 페이지 수
            	visiblePages:5, // 보여줄 페이지 수 1,2,3,4,5
            	onPageClick:function(evt,pg){ // 페이지 클릭시 실행 함수
            		console.log(pg); // 클릭한 페이지 번호
            		num = pg;
            		listCall(pg);
            	}
            })
		}
		,error:function(error){
			console.log(error);
		}
	});
}

function drawList(list){
    var content = '';
    if (Array.isArray(list)) { // list가 배열인지 확인
        for(var item of list){
            console.log(item);
            content += '<tr>';
            content += '<td><input type="checkbox" class="checkBox" value="' + item.noti_idx + '"></td>';
            content += '<td>' + item.noti_idx + '</td>';
            content += '<td';
            if(item.noti_top === 'B') {
                content += ' class="red-text"';
            }
            content += '>' + item.mem_id + '</td>';
            content += '<td';
            console.log(item.noti_status);
            if(item.noti_status === 'B') {
                content += ' class="green-text"';
            }
            content += ' onclick="goToDetail(' + item.noti_idx + ')">';
            
            // 제목 길이가 20자를 넘어가면 ...
            if (item.noti_title.length > 20) {
                content += item.noti_title.substring(0, 20) + '...';
            } else {
                content += item.noti_title;
            }
            
            content += '</td>';
            var notiDate = new Date(item.noti_date);
            var notiDateStr = notiDate.toLocaleDateString("ko-KR");
            content += '<td>' + notiDateStr + '</td>';
            content += '</tr>';
        }
    } else {
        content = '<tr><td colspan="3">공지 목록을 불러올 수 없습니다.</td></tr>';
    }
    
    $('#list').html(content);
}

function deleteSelectedAnnouncements() {
    var selectedNotiIdxList = [];
    $(".checkBox:checked").each(function () {
        selectedNotiIdxList.push($(this).val());
    });

    if (selectedNotiIdxList.length === 0) {
        alert("선택된 공지사항이 없습니다.");
        return;
    }

    $.ajax({
        type: 'post',
        url: './delete.ajax',
        traditional: true, // 배열 파라미터 전송을 위해 필요
        data: {
            'notiIdxList': selectedNotiIdxList
        },
        success: function (response) {
            if (response === "success") {
                alert("선택된 공지사항이 삭제되었습니다.");
                // 삭제 후 목록 다시 불러오기
                listCall(showPage);
            } else {
                alert("공지사항 삭제에 실패했습니다.");
            }
        },
        error: function (error) {
            console.log(error);
            alert("공지사항 삭제에 실패했습니다.");
        }
    });
}




function enterKey() {
	if (event.keyCode==13) {
		var showPage = 1;
		$('#pagination').twbsPagination('destroy');
		search(showPage);
	}
}

function search(showpage) {
    var keyWord = $('#keyWord').val(); // 검색어를 가져옴 (keyWord로 수정)
    console.log(keyWord),
    $.ajax({
        type: 'get',
        url: './adminListSearch.ajax',
        data: {
            'keyWord': keyWord, // 검색어를 keyWord로 전달
            'page': showpage,
            'cnt': 20
        },
        dataType: 'json',
        success: function(data) {
            console.log(data.adminList);
            console.log(data.totalPages);
            drawList(data.adminList);
            $('#pagination').twbsPagination({
                startPage:1, // 시작페이지
                totalPages: data.totalPages, // 총 페이지 수
                visiblePages: 5, // 보여줄 페이지 수 1,2,3,4,5
                onPageClick: function(evt, pg) { // 페이지 클릭시 실행 함수
                    console.log(pg); // 클릭한 페이지 번호
                    num = pg;
                    search(pg); // 페이지를 넘겨가면서 검색
                }
            })
        },
        error: function(error) {
            console.log(error);
        }
    });
}
function goToDetail(notiIdx) {
    window.location.href = '/main/announcement/annDetail.go?noti_idx=' + notiIdx; // 공지사항 상세 페이지로 이동
}
function searchDo(){
	var showPage = 1;
	$('#pagination').twbsPagination('destroy');
	search(showPage);
}


function goToAdminAnnForm() {
    window.location.href = 'adminAnnForm.go'; // 공지사항 작성 페이지로 이동
}



var isAllChecked = false;

function selectAll() {
    var checkBoxes = $('.checkBox');
    if (isAllChecked) {
        checkBoxes.prop('checked', false);
    } else {
        checkBoxes.prop('checked', true);
    }
    isAllChecked = !isAllChecked;
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
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
<script src="../resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
	  table {
            border-collapse: collapse;
            width: 70%;
            margin: auto;
        }

        th, td {
            width: 50%;
            height: 100px;
            text-align: center;
            border: 1px solid #ddd;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
            color: #333;
        }

        td {
            background-color: #fff;
            color: #555;
        }

        th:first-child, td:first-child {
            border-left: none;
        }

        th:last-child, td:last-child {
            border-right: none;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }
</style>
<body>
	 <table>
        <tr>
            <th>신고 내용</th>
        </tr>
        <tr>
            <td>${repCon.rep_content}</td>
        </tr>
        <tr>
            <th>처리 내용</th>
        </tr>
        <tr>
            <td>${repCon.trans_content}</td>
        </tr>
    </table>
</body>
</html>
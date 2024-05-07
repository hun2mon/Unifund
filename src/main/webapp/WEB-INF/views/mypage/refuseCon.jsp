<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거절 사유</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
    }
    
    .container {
        width: 70%;
        margin: auto;
        margin-top: 50px;
    }
    
    .table-container {
        margin-top: 20px;
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
        border: 1px solid #ddd;
        background-color: #fff;
    }
    
    th, td {
        padding: 10px;
        text-align: center;
        border: 1px solid #ddd;
    }
    
    th {
        background-color: #f2f2f2;
        color: #333;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }
    
    .textarea-container {
        margin-top: 20px;
    }
    
    textarea {
        width: 100%;
        height: 150px;
        padding: 10px;
        border: 1px solid #ddd;
        resize: none;
        text-align: center;
    }
</style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">거절 사유</h2>
        
        <%-- <div class="table-container">
            <table>
                <tr>
                    <th>거절 사유</th>
                </tr>
                <tr>
                    <td>${refuseCon}</td>
                </tr>
            </table>
        </div> --%>
        
        <div class="textarea-container">
            <textarea readonly="readonly">${refuseCon}</textarea>
        </div>
    </div>
</body>
</html>

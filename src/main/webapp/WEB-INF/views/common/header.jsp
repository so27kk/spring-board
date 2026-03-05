<%-- TODO 1. 파일 상단에 page 지시어와 taglib 을 선언하시오 --%>
<%-- 조건 1 : contentType = text/html; charset=UTF-8 --%>
<%-- 조건 2 : JSTL core 태그 사용을 위한 taglib 선언 --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- TODO 2. <head> 태그 전체를 작성하시오 --%>
<%-- 조건 : Bootstrap CSS CDN 링크 포함 / <title>Spring Board</title> --%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spring Board</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .hero {
            background-color: #ffffff;
            border-bottom: 1px solid #e9ecef;
            padding: 80px 0;
        }

        .card {
            border: none;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
            transition: transform;
        }

        .card:hover {
            transform: translateY(-4px);
        }
    </style>
</head>

<%-- TODO 3. <body> 태그를 열고 navbar 를 작성하시오 --%>
<%-- 조건 1 : <body> 태그는 header.jsp 에서 열기만 한다 (닫지 않음) --%>
<%-- 조건 2 : 로그인 전 → 회원가입 / 로그인 링크 노출 --%>
<%-- 조건 3 : 로그인 후 → "이름님 환영해요!" + 로그아웃 링크 노출 --%>
<%-- 조건 4 : 로그인 여부는 sessionScope.loginUser 로 판별 --%>
<body>
<ul class="navbar-nav ms-auto">
    <li class="nav-item">
        <a class="nav-link" href="/board/list">게시판</a>
    </li>
    <c:if test="${empty sessionScope.loginUser}">

    </c:if>
</ul>
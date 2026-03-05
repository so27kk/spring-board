<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spring Board</title>
    <!-- TODO 1. Bootstrap 5 CDN 링크를 작성하시오 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        body {
            /* TODO 2. 배경색을 연한 회색(#f8f9fa)으로 설정하시오 */
            background-color: #f8f9fa;
        }

        .hero {
            background-color: #ffffff;
            border-bottom: 1px solid #e9ecef;
            padding: 80px 0;
        }

        .card {
            border: none;
            /* TODO 3. 카드에 그림자 효과를 주시오 */
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
            /* TODO 4. 카드에 hover시 위로 살짝 올라오는 transition 효과를 주시오 */
            transition: transform;
        }

        .card:hover {
            /* TODO 5. 카드 hover시 위로 4px 이동하시오 */
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
        <!-- TODO 7. 게시판 링크를 작성하시오 -->
        <a class="nav-link" href="/board/list">게시판</a>
    </li>
    <%-- TODO 1. 로그인이 되어있지 않을 때만 아래 메뉴를 보여주시오 --%>
    <%-- 조건 : sessionScope.loginUser 가 비어있을 때 --%>
    <c:if test="${empty sessionScope.loginUser}">
        <li class="nav-item">
            <a class="nav-link" href="/user/register">회원가입</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/user/login">로그인</a>
        </li>
    </c:if>

    <%-- TODO 2. 로그인이 되어있을 때만 아래 메뉴를 보여주시오 --%>
    <%-- 조건 : sessionScope.loginUser 가 비어있지 않을 때 --%>
    <c:if test="${not empty sessionScope.loginUser}">

        <%-- TODO 3. 로그인한 유저의 이름을 출력하시오 --%>
        <%-- 출력 형식 : "홍길동님 환영해요!" --%>
        <li class="nav-item">
            <span class="nav-link">${sessionScope.loginUser.name}님 환영해요!</span>
        </li>

        <%-- TODO 4. 로그아웃 링크를 작성하시오 (/user/logout) --%>
        <li class="nav-item">
            <a class="nav-link" href="/user/logout">로그아웃</a>
        </li>
    </c:if>
</ul>
</ul>
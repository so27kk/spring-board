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
<body>

<!-- TODO 6. 네비게이션 바를 작성하시오 -->
<!-- 조건 : 왼쪽에 브랜드명(SpringBoard), 오른쪽에 게시판 링크(/board/list) -->
<nav class="navbar navbar-expand-lg shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="/">SpringBoard</a>
        <div class="collapse navbar-collapse">
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
        </div>
    </div>
</nav>

<!-- TODO 8. 히어로 섹션을 완성하시오 -->
<!-- 조건 : 제목, 설명, 게시판 바로가기 버튼 포함 -->
<section class="hero text-center">
    <div class="container">
        <h1>Spring 게시판에 오신 것을 환영합니다.</h1>
        <p class="mt-3">봄같은 게시판 입니다.</p>
        <!-- TODO 9. btn-dark 버튼으로 게시판 바로가기 작성하시오 -->
        <a href="/board/list" class="btn btn-dark mt-3 px-4">게시판 바로가기</a>
    </div>
</section>

<!-- TODO 10. 카드 2개를 작성하시오 -->

<!-- 카드2 : 게시물 목록 → /board/list -->
<section class="py-5">
    <div class="container">
        <div class="row g-4 justify-content-center">
            <!-- 카드1 : 게시물 작성 → /board/write -->
            <div class="col-md-4">
                <div class="card p-4 text-center h-100">
                    <div class="fs-1">📝</div>
                    <h5 class="mt-3 fw-bold">게시물 작성</h5>
                    <p class="text-muted">새로운 게시물을 작성해보세요.</p>
                    <a href="/board/write" class="btn btn-outline-dark mt-auto">작성하기</a>
                </div>
            </div>

            <!-- TODO 11. 게시물 목록 카드를 위와 동일한 형식으로 작성하시오 -->
            <div class="col-md-4">
                <div class="card p-4 text-center h-100">
                    <div class="fs-1">📜</div>
                    <h5 class="mt-3 fw-bold">게시물 목록</h5>
                    <p class="text-muted">등록된 게시물을 확인세요.</p>
                    <a href="/board/list" class="btn btn-outline-dark mt-auto">목록보기</a>
                </div>
            </div>

        </div>
    </div>
</section>

<!-- TODO 12. 푸터를 완성하시오 -->
<footer class="text-center py-4 mt-5">
    <div class="container">
        <small>&copy; 2026 SpringBoard. All rights reserved.</small>
    </div>
</footer>

<!-- TODO 13. Bootstrap 5 JS CDN 링크를 작성하시오 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
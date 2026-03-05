<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>유저 찾기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5" style="max-width: 500px;">
    <div class="card p-4 shadow-sm">
        <h2 class="mb-4 text-center fw-bold">이메일로 유저 찾기</h2>

        <!-- TODO 6. form action 주소와 method 를 작성하시오 -->
        <!-- 조건 : action = /user/find / method = 데이터 전송 방식 -->
        <form action="/user/find" method="post">
            <div class="mb-3">
                <label class="form-label">이메일</label>
                <!-- TODO 7. input type 과 name 속성을 작성하시오 -->
                <input type="email" name="email" class="form-control" placeholder="이메일을 입력하세요" required>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-dark">검색</button>
            </div>
        </form>

        <%-- TODO 8. 조회된 유저가 있을 때만 아래 결과를 출력하시오 --%>
        <%-- 조건 : Controller 에서 "user" 라는 이름으로 데이터를 전달받음 --%>
        <c:if test="${user != null}">
            <hr class="mt-4">
            <h5 class="mt-3 fw-bold">조회 결과</h5>
            <table class="table mt-3">
                <tr>
                    <th>이름</th>
                        <%-- TODO 9. 유저 이름을 출력하시오 --%>
                    <td>${user.name}</td>
                </tr>
                <tr>
                    <th>이메일</th>
                        <%-- TODO 10. 유저 이메일을 출력하시오 --%>
                    <td>${user.email}</td>
                </tr>
                <tr>
                    <th>가입일</th>
                        <%-- TODO 11. 유저 가입일을 출력하시오 --%>
                    <td>${user.create_at}</td>
                </tr>
            </table>
        </c:if>

        <%-- TODO 12. 이메일이 존재하지 않을 때 에러 메시지를 출력하시오 --%>
        <%-- 조건 : param.error == 'notfound' 일 때 --%>
        <c:if test="${param.error == notfound}">
            <div class="alert alert-danger mt-4">존재하지 않는 이메일입니다.</div>
        </c:if>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
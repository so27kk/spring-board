<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body class="bg-light">

<div class="container mt-5" style="max-width: 500px;">
    <div class="card p-4 shadow-sm">

        <h2 class="mb-4 text-center fw-bold">로그인</h2>

        <c:if test="${param.success == 'join'}">
            <div class="alert alert-success">🎉 회원가입이 완료되었습니다. 로그인해주세요.</div>
        </c:if>

        <%-- Login은 회사에서 요구하는 로직에 따라
             Post 도 가능하고 Get 가능
         --%>
        <input type="email" id="email">

            <div class="mb-3">
                <label class="form-label">이메일</label>
                <input type="email" name="email"
                       class="form-control"
                       placeholder="이메일을 입력하세요" required>
            </div>
            <c:if test="${param.error == 'fail'}">
                <div class="alert alert-danger mt-2">이메일 또는 정보가 올바르지 않습니다.</div>
            </c:if>

            <div class="d-grid mt-4">
                <button onclick="로그인()">로그인</button>
            </div>

            <div class="text-center mt-3">
                <a href="/user/register" class="text-muted">계정이 없으신가요? 회원가입</a>
            </div>
            <div class="text-center mt-2">
                <!--
                href 에는 .jsp 파일 이름 쓰는 것이 아니라
                @GetMapping() 이나 @__Mapping() 에 연결된 "" 내부에 작성되어 있는
                주소 데이터를 작성하는 것이다.
                -->
                <a href="/user/find-email" class="text-muted"> 이메일 찾기!</a>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
<form id="registerForm">
    <div class="mb-3">
        <label class="form-label">이름</label>
        <input type="text" name="name" id="name" class="form-control" placeholder="이름을 입력하세요" required>
    </div>
    <div class="mb-3">
        <label class="form-label">이메일</label>
        <input type="email" name="email" id="email" class="form-control" placeholder="이메일을 입력하세요" required>
    </div>

    <div id="에러창"></div>

    <div class="d-grid mt-4">
        <button type="button" id="registerBtn" onclick="회원가입기능()" class="btn btn-dark">가입하기</button>
    </div>
</form>

<script>
    async function 회원가입기능() {

        const 이름   = document.getElementById("name").value.trim();
        const 이메일  = document.getElementById("email").value.trim();
        const 에러창  = document.getElementById("에러창");
        const 가입버튼 = document.getElementById("registerBtn");

        if (!이름) {
            const div = document.createElement("div");
            div.className = "alert alert-danger";
            div.innerText = "이름을 입력해주세요.";
            에러창.innerHTML = "";
            에러창.appendChild(div);
            return;
        }

        if (!이메일) {
            const div = document.createElement("div");
            div.className = "alert alert-danger";
            div.innerText = "이메일을 입력해주세요.";
            에러창.innerHTML = "";
            에러창.appendChild(div);
            return;
        }

        가입버튼.disabled = true;
        가입버튼.textContent = "가입 중...";
        에러창.innerHTML = "";

        try {
            const 응답 = await fetch("/user/register", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ name : 이름, email : 이메일 })
            });

            if (!응답.ok) throw new Error(`서버 오류: ${응답.status}`);

            const 결과 = await 응답.json();

            if (결과.success) {
                window.location.href = "/user/login";
            } else if (결과.error === "email") {
                const div = document.createElement("div");
                div.className = "alert alert-danger";
                div.innerText = "이미 사용중인 이메일입니다.";
                에러창.innerHTML = "";
                에러창.appendChild(div);
            } else {
                const div = document.createElement("div");
                div.className = "alert alert-danger";
                div.innerText = "가입 중 오류가 발생했습니다.";
                에러창.innerHTML = "";
                에러창.appendChild(div);
            }

        } catch (err) {
            const div = document.createElement("div");
            div.className = "alert alert-danger";
            div.innerText = "회원가입 중 오류가 발생했습니다. 다시 시도해주세요.";
            에러창.innerHTML = "";
            에러창.appendChild(div);

        } finally {
            가입버튼.disabled = false;
            가입버튼.textContent = "가입하기";
        }
    }
</script>
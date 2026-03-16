async function 로그인기능() {

const 이메일   = document.getElementById("email").value;
const 에러창   = document.getElementById("에러창");
const 로그인버튼 = document.getElementById("loginBtn");

if (이메일.trim() === "") {
const div = document.createElement("div");
div.className = "alert alert-danger mt-2";
div.innerText = "이메일을 입력해주세요.";
에러창.innerHTML = "";
에러창.appendChild(div);
return;
}

로그인버튼.disabled = true;
로그인버튼.textContent = "로그인 중...";
에러창.innerHTML = "";

try {
const 응답 = await fetch("/user/login", {
method: "POST",
headers: { "Content-Type": "application/json" },
body: JSON.stringify({ email : 이메일 })
});

if (!응답.ok) throw new Error(`서버 오류: ${응답.status}`);

const 결과 = await 응답.json();

if (결과.success) {
window.location.href = 결과.redirectUrl || "/";
} else {
const div = document.createElement("div");
div.className = "alert alert-danger mt-2";
div.innerText = "이메일 또는 정보가 올바르지 않습니다.";
에러창.innerHTML = "";
에러창.appendChild(div);
}

} catch (err) {
console.error("로그인 실패:", err);
const div = document.createElement("div");
div.className = "alert alert-danger mt-2";
div.innerText = "로그인 중 오류가 발생했습니다. 다시 시도해주세요.";
에러창.innerHTML = "";
에러창.appendChild(div);

} finally {
로그인버튼.disabled = false;
로그인버튼.textContent = "로그인";
}
}
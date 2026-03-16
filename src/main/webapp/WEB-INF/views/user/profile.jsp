function 파일을Base64로읽기(file) {
return new Promise((resolve, reject) => {
const reader = new FileReader();
reader.onload  = (e) => resolve(e.target.result);
reader.onerror = () => reject(new Error("파일 읽기 실패"));
reader.readAsDataURL(file);
});
}

async function 미리보기기능(input) {
const preview = document.getElementById("미리보기");
const noImg   = document.getElementById("noImg");

if (!input.files || !input.files[0]) return;

try {
const dataUrl = await 파일을Base64로읽기(input.files[0]);
preview.src = dataUrl;
preview.style.display = "block";
if (noImg) noImg.style.display = "none";

} catch (err) {
console.error("미리보기 실패:", err);
alert("이미지를 불러오지 못했습니다.");
}
}

async function 프로필사진업로드() {
const 메시지창 = document.getElementById("메시지창");

try {
const formData = new FormData(document.getElementById("uploadForm"));

const 응답 = await fetch("/user/profile/upload", {
method: "POST",
body: formData
});

if (!응답.ok) throw new Error(`서버 오류: ${응답.status}`);

const div = document.createElement("div");
div.className = "alert alert-success";
div.innerText = "프로필 사진이 업로드되었습니다.";
메시지창.innerHTML = "";
메시지창.appendChild(div);

} catch (err) {
const div = document.createElement("div");
div.className = "alert alert-danger";
div.innerText = "사진 업로드 중 오류가 발생했습니다.";
메시지창.innerHTML = "";
메시지창.appendChild(div);
}
}

async function 프로필정보수정() {
const 메시지창 = document.getElementById("메시지창");
const data = Object.fromEntries(new FormData(document.getElementById("editForm")).entries());

try {
const 응답 = await fetch("/user/profile/edit", {
method: "POST",
headers: { "Content-Type": "application/json" },
body: JSON.stringify(data)
});

if (!응답.ok) throw new Error(`서버 오류: ${응답.status}`);

const div = document.createElement("div");
div.className = "alert alert-success";
div.innerText = "프로필 정보가 수정되었습니다.";
메시지창.innerHTML = "";
메시지창.appendChild(div);

} catch (err) {
const div = document.createElement("div");
div.className = "alert alert-danger";
div.innerText = "정보 수정 중 오류가 발생했습니다.";
메시지창.innerHTML = "";
메시지창.appendChild(div);
}
}
package com.board.springboard.controller;

import com.board.springboard.model.dto.User;
import com.board.springboard.model.service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/*
대소문자 / 대문자 -> 집중 주의 할 때 사용
자바 파일 맨 첫글자만 주로 사용
변수 상수
상수 공간은 모두다 대문자 형태로 스네이크 케이스 형태로 사용

api  주소들의 모음
  @GetMapping
  endpoint = "/"              도메인이 정의 내리는 마지막 지점
  endpoint = "/board/detail"
  endpoint = "/board/list"
  endpoint = "/board/write"
  endpoint = "/board/edit"
  endpoint = "/board/delete"
  @PostMapping
    endpoint = "/board/write"

 */

@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    /**
     * file.upload.path = C:/프로필사진을 업로드할 경로
     *
     * 프로필 사진 업로드 경로를 키이름으로 가져와서 외부에 노출되지 않도록 한다.
     */
    @Value("${file.upload.path}") // application.properties 에 작성한 키이름 가져오는 방법
    private String uploadPath;



    /**
     * 회원가입 페이지 이동
     *
     * @return user/register.jsp
     */
    @GetMapping("/user/register")
    public String registerView() {
        return "user/register";
    }

    /**
     * 회원가입 처리 (DB 저장)
     * 성공 시 로그인 페이지로 이동
     * 실패(이메일 중복) 시 회원가입 페이지로 이동
     *
     * @param user 작성된 회원 데이터
     * @return 성공 → 로그인 페이지 / 실패 → 회원가입 페이지
     */
    @PostMapping("/user/register")
    public String register(User user) {
        /*
        UserService 의 회원가입 기능을 실행한다.
        클라이언트가 입력한 회원 정보(user)를 전달하며,
        회원가입 처리 결과(성공 = true, 실패 = false)를
        result 에 담아 결과에 따라 클라이언트를 다른 페이지로 안내한다.
         */
        boolean result = userService.회원가입(user);
        if (result) { // 회원가입을 성공했을 경우 로그인을 위하여
            // 개발자가 로그인페이지로 클라이언트를 이동처리
            return "redirect:/user/login";
        } else { // result 가 false 일 경우
            return "redirect:/user/resister";
        }
    }

    /**
     * 로그인 페이지 이동
     *
     * @return user/login.jsp
     */
    @GetMapping("/user/login")
    public String loginView() {
        return "user/login";
    }


    @PostMapping("/user/login")
    public String login(@RequestParam String email, HttpSession session) {
        /*
        email로 userService.로그인 기능을 작동한 결과는 User 객체 타입으로 데이터가 존재하며,
        SQL 결과를 로그인한유저데이터 라는 변수 명칭의 공간에 잠시 담아둘 것
        로그인기능이 User 라는 타입으로 전달할 예정이기 때문에 로그인한유저데이터 라는 공간 또한
        User 형태로 생성하여 메모리에 존재하도록 설정
         */
        User 로그인한유저데이터 = userService.로그인(email);

        if (로그인한유저데이터 != null) { // 로그인한 유저 정보가 존재하는게 사실일경우
            // 로그인성공 -> 세션에 유저 정보 저장
            session.setAttribute("loginUser", 로그인한유저데이터);
            return "redirect:/";
        } else { // 로그인실패할 경우 에러 파라미터와 함께 로그인 페이지로 이동
            return "redirect:/user/login?error=fail";
        }
    }

    /**
     * 로그아웃 처리
     * 세션을 초기화하고 메인페이지로 이동
     *
     * @param session 현재 로그인된 세션
     * @return 메인페이지로 redirect
     */
    @GetMapping("/user/logout")
    public String 로그아웃(HttpSession session) {
        session.invalidate(); // 세션 전체 초기화
        return "redirect:/";
    }


    @GetMapping("/user/find-email")
    public String findEmailView() {
        return "user/findUser";
    }

    @PostMapping("/user/find-email")
    public String findEmail(@RequestParam String name, Model model) {
        User 유저데이터 = userService.이메일로유저찾기(name);

        if (유저데이터 != null) {
            model.addAttribute("email", 유저데이터.getEmail());
        } else {
            model.addAttribute("error", "해당 이름으로 가입된 이메일이 없습니다.");
        }
        return "user/findUser";
    }


    // TODO 4: 빈칸을 채우세요


    @GetMapping("/user/profile")
    public String profileView(HttpSession 로그인유저정보, Model model) {
        // 무조건 모든 언어에서는
        // set 으로 시작하는 기능의 명칭은 저장하다 의미 가 담겨있다. (개발자 적 관례)
        // get 으로 시작하는 기능의 명칭은 저장된 데이터를 가져와서 사용하겠다 의미가 담겨있다. (개발자 적 관례)
        // 로그인유저정보 에서 loginUser 라는 공간에 저장되어 있는 유저에 대한 정보를 가져오기 = getAttribute
        로그인유저정보.getAttribute("loginUser");

        // 가져온 유저 정보를 User 틀에 맞춰 특정 변수 공간에 임시 보관
        //  (User) 가져온 유저 정보를 User 객체 형태로 변환하여 임시보관된_유저정보 보관
        User 임시보관된_유저정보 = (User) 로그인유저정보.getAttribute("loginUser");

        // 로그인한 유저의 정보가 없는데.. 악의적으로 URL을 접속해서 유저정보를 조회하려 할 경우
        if (임시보관된_유저정보 == null) return "redirect:/user/login"; // 한줄코드는 중괄호 {} 를 생략할 수 있다.


        User 프로필수정된_최신유저정보데이터 = userService.유저단건조회(임시보관된_유저정보.getId());
        model.addAttribute("user", 프로필수정된_최신유저정보데이터); // 일시적으로 넘겨주는 데이터가 아니라 지속적으로 유지하는데이터
        // 새로고침을 하더라도 user 키이름 내부에 존재하는 데이터 보존
        return "user/profile";
    }

    @PostMapping("/user/profile/upload")
    public String 프로필사진업로드하기(@RequestParam("imageFile") MultipartFile imageFile,
                             HttpSession session, RedirectAttributes redirectAttributes) {
        User 로그인된_유저정보 = (User) session.getAttribute("loginUser");
        if (로그인된_유저정보 == null) return "redirect:/user/login";

        try {
            // 파일 저장 + DB 업데이트 + 최신 유저 반환
            User updateUser = userService.프로필사진업로드(로그인된_유저정보, imageFile, uploadPath);
            session.setAttribute("loginUser", updateUser);
            redirectAttributes.addFlashAttribute("msg", "프로필 사진이 변경되었습니다.");

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "사진 업로드에 실패했습니다.");
        }
        return  "redirect:/user/profile";
    }

    // TODO 4: 빈칸을 채우세요
    @PostMapping("/user/profile/edit")
    public String 유저정보수정(@ModelAttribute User user,
                         HttpSession session,
                         RedirectAttributes redirectAttributes) {

        User 로그인유저 = (User) session.getAttribute("loginUser");
        if (로그인유저 == null) return "redirect:/user/login";

        // 세션에서 꺼낸 id 를 수정할 user 객체에 세팅
        user.setId(로그인유저.getId());

        userService.유저정보수정(user);

        // 세션 최신 정보로 갱신
        User 최신유저 = userService.유저단건조회(로그인유저.getId());
        session.setAttribute("loginUser", 최신유저);

        redirectAttributes.addFlashAttribute("msg", "정보가 수정되었습니다.");
        return "redirect:/user/profile";
    }

}

/*
// 미완성된 기능
 접근제어자 반환타입 기능명칭(매개변수자리);

// 완성된 기능 {}내부에 기능이 작성되지 않더라도 {} 존재 자체만으로 완성된 기능
 접근제어자 반환타입 기능명칭(매개변수자리){기능자리}
 */
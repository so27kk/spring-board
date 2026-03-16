package com.board.springboard.common;


import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * JWT 토큰 발급 검증
 *
 * Access Token : 30 -> 매 API 요청 헤더 or 쿠키 첨부
 * Refresh Token : 14일 -> 임시 저장 / 만료 시 재발급용 (=Redis 임시 저장)
 *                 ConcurrentHashMap 컴퓨터 메모리 임시 저장
 */

/**
 * 브라우저가 서버에 요청을 보낼 떄마다 자동으로 실행
 * 쿠키에서 엑세스 토큰을 꺼내서 유효하면 로그인상태로 등록
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class JwtFilter extends OncePerRequestFilter {
    private final JwtUtil jwtUtil; // 토큰 검증은 util에 맡긴다.

    @Override
    protected void doFilterInternal(HttpServletRequest 요청,
                                    HttpServletResponse 응답,
                                    FilterChain 다음필터) throws ServletException, IOException {
        String token = 쿠키에서토큰꺼내기(요청);

        if(token != null && jwtUtil.유효토큰인지확인하는기능(token)){

            String email = jwtUtil.이메일가져오기(token);

            UsernamePasswordAuthenticationToken 인증정보 =
                    new UsernamePasswordAuthenticationToken(
                            email,
                            null,
                            List.of(new SimpleGrantedAuthority("ROLE_USER"))
                    );
            SecurityContextHolder.getContext().setAuthentication(인증정보);
        }
        다음필터.doFilter(요청, 응답);
    }

    private String 쿠키에서토큰꺼내기(HttpServletRequest 요청){
        Cookie[] 쿠키목록 = 요청.getCookies();
        if(쿠키목록 == null) return null;

        return Arrays.stream(쿠키목록)
                .filter(c -> "access_token".equals(c.getName()))
                .map(Cookie::getValue)
                .findFirst()
                .orElse(null);
    }

}
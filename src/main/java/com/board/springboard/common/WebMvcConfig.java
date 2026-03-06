package com.board.springboard.common;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Value("${file.upload.path}")
        private String uploadPath;

    // DB에 작성한 프로필 이미지 경로
    // 진따 회사 컴퓨터에 존재하는 프로필 이미지 경로 맞춤 설정
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
       registry.addResourceHandler("/uploads/profile/**") // DB 에서 설정한 가짜 경로
               .addResourceLocations("file:///" + uploadPath + "/"); // 진짜
    }
}

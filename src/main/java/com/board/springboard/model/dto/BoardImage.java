package com.board.springboard.model.dto;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BoardImage {
    private Integer id;                // PK
    private Integer board_no;          // board 테이블 FK 외래키 다른 기본키와 테이블 연결을 위한 키
    private String img_path;          // 웹 접근 경로
    private LocalDateTime created_at; // 생성 일자

}
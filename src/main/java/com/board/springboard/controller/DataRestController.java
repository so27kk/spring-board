package com.board.springboard.controller;


import com.board.springboard.model.dto.Board;
import com.board.springboard.model.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/*
@Controller
@ResponseBody

 */

/**
 * @RestController = @Controller + @ResponseBody
 */
@RestController
@RequiredArgsConstructor
public class DataRestController {

    private final BoardService boardService;

    @GetMapping("/dataCheck")
    public List<Board> 데이터확인(){
        return boardService.findAllBoard();
    }
}
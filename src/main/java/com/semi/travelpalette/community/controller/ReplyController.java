package com.semi.travelpalette.community.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.semi.travelpalette.community.domain.Reply;
import com.semi.travelpalette.community.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService rService;
	
	@PostMapping("/add.tp")
    @ResponseBody
    public Map<String, Object> insertReply(@ModelAttribute Reply reply
    		, HttpSession session
    		, HttpServletResponse responce) {
		
    	Map<String, Object> response = new HashMap<>();
        reply.setUserId((String) session.getAttribute("userId"));
        reply.setUserNickname((String) session.getAttribute("userNickname"));
        int result = rService.insertReply(reply);
        if (result > 0) {
        	response.put("success", true);
        } else {
        	response.put("success", false);
            response.put("message", "댓글 작성 함수를 가져올 수 없습니다.");
        }
        return response;
    }
	
	@PostMapping("/modify.tp")
    @ResponseBody
    public Map<String, Object> modifyReply(@ModelAttribute Reply reply
    		, HttpSession session
    		, HttpServletResponse responce) {
		
    	Map<String, Object> response = new HashMap<>();
        int result = rService.modifyReply(reply);
        if (result > 0) {
        	response.put("success", true);
        } else {
        	response.put("success", false);
            response.put("message", "댓글 수정 함수를 가져올 수 없습니다.");
        }
        return response;
    }
	
	@GetMapping("/delete.tp")
    public ModelAndView deleteReply(@ModelAttribute Reply reply
    		, ModelAndView mv) {
		
    	
        int result = rService.deleteReply(reply);
        if (result > 0) {
        	mv.setViewName("redirect:/community/detail.tp?boardNo="+reply.getBoardNo()+"&boardType="+reply.getBoardType());
        	return mv;
        } else {
        	mv.addObject("msg", "리스트 불러오기에 실패하였습니다.");
            mv.addObject("url", "/");
            mv.setViewName("common/errorPage");
            return mv;
        }
    }
}







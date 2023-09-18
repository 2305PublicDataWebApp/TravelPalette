package com.semi.travelpalette.community.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.semi.travelpalette.community.domain.Reply;
import com.semi.travelpalette.community.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService rService;
	
	@PostMapping("/add.tp")
	public ModelAndView insertReply(ModelAndView mv
			, @ModelAttribute Reply reply 
			, HttpSession session) {
		String url = "";
		try {
				if (reply.getReplySecretType() == ' ') {
				    reply.setReplySecretType('N');
				}
				String replyWriter = (String)session.getAttribute("userId");
				reply.setUserId(replyWriter);
				int result = rService.insertReply(reply);
				url = "/community/detail.tp?boardNo="+reply.getBoardNo()+"&boardType="+reply.getBoardType();
				if(result > 0) {
					mv.setViewName("redirect:"+url);
					 return mv;
				}else {
					mv.addObject("msg", "댓글 등록이 완료되지 않았습니다.");
	                mv.addObject("url", "/");
	                mv.setViewName("common/errorPage");
	                return mv;
				}
		} catch (Exception e) {
			System.out.println(e.getMessage());
            mv.setViewName("/");
            return mv;
		}
	}
}

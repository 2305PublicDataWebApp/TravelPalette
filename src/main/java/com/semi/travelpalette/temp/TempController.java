package com.semi.travelpalette.temp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/temp")
@Controller
public class TempController {

	@GetMapping
	@ResponseBody
	public String test() {
		throw new RuntimeException("fail");
//		return "success!!!";
	}
	
}

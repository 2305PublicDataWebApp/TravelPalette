package com.semi.travelpalette.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.semi.travelpalette.common.domain.PageInfo;
import com.semi.travelpalette.community.domain.Community;
import com.semi.travelpalette.community.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {
    
    @Autowired
    private CommunityService cService;
    
    @RequestMapping(value="/qList.tp", method=RequestMethod.GET)
    public ModelAndView goBoardListPage(ModelAndView mv
            , @RequestParam(value= "page", required = false, defaultValue="1") Integer curruntPage
            , @RequestParam(value= "boardType", required = false, defaultValue="QnABoard") String boardType) {
        
        try {
            int totalCount = cService.getListCountByBoardType(boardType);
            PageInfo pInfo = this.getPageInfo(curruntPage, totalCount, boardType);
            List<Community> cList = cService.selectCommunityList(pInfo);

            if (cList.size() > 0) {
                mv.addObject("cList", cList).addObject("pInfo", pInfo);
                mv.setViewName("community/questionList");
                return mv;
            } else {
                mv.addObject("msg", "리스트 불러오기에 실패하였습니다.");
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
    
    @RequestMapping(value="/detail.tp", method=RequestMethod.GET)
    public ModelAndView goBoardDatailPage(ModelAndView mv
            , @RequestParam("boardType") String boardType
            , @RequestParam("boardNo") int boardNo) {
        
        try {
            Community cOne = new Community(boardNo, boardType);
            Community community = cService.selectOneByClass(cOne);

            if (!community.getBoardTitle().equals("")) {
                mv.addObject("community", community);
                mv.setViewName("community/detail");
                return mv;
            } else {
                mv.addObject("msg", "게시물 상세보기에 실패하였습니다.");
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
    
    @RequestMapping(value="/insert.tp", method=RequestMethod.GET)
    public ModelAndView goInsertBoardPage(ModelAndView mv) {
        
        mv.setViewName("community/insert");
        return mv;
    }
    
    @RequestMapping(value="/insert.tp", method=RequestMethod.POST)
    public ModelAndView insertBoard(ModelAndView mv
            ,@ModelAttribute Community community) {
        
        try {
            int maxNo = cService.selectMaxNo();
            int result = cService.insertBoard(community);
            
            if(result > 0) {
                mv.setViewName("redirect:/community/detail.tp?boardType="+community.getBoardType()+"&boardNo="+(maxNo+1));
                return mv;
            }else {
                mv.addObject("msg", "게시물 등록에 실패하였습니다.");
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
    
    @RequestMapping(value="/modify.tp", method=RequestMethod.GET)
    public ModelAndView goBoardModifyPage(ModelAndView mv
            , @RequestParam("boardType") String boardType
            , @RequestParam("boardNo") int boardNo) {
        
        try {
            Community cOne = new Community(boardNo, boardType);
            Community community = cService.selectOneByClass(cOne);

            if (!community.getBoardTitle().equals("")) {
                mv.addObject("community", community);
                mv.setViewName("community/modify");
                return mv;
            } else {
                mv.addObject("msg", "게시물 수정페이지 이동에 실패하였습니다.");
                mv.addObject("url", "/");
                mv.setViewName("common/errorPage");
                return mv;
            } 

        } catch (Exception e) {
            System.out.println(e.getMessage());
            mv.setViewName("community/detail?boardType"+boardType+"&boardNo="+boardNo);
            return mv;
        }
    }
    
    @RequestMapping(value="/modify.tp", method=RequestMethod.POST)
    public ModelAndView modifyBoard(ModelAndView mv
            ,@ModelAttribute Community community) {
        
        try {
            int totalCount = cService.getListCountByBoardType(community.getBoardTitle());
            int result = cService.updateBoard(community);
            
            if(result > 0) {
                mv.setViewName("redirect:/community/detail.tp?boardType="+community.getBoardType()+"&boardNo="+(totalCount+1));
                return mv;
            }else {
                mv.addObject("msg", "게시물 수정에 실패하였습니다.");
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
    
    @RequestMapping(value="/delete.tp", method=RequestMethod.GET)
    public ModelAndView deleteBoard(ModelAndView mv
            ,@ModelAttribute Community community) {
        
        try {
            int result = cService.deleteBoard(community);
            
            if(result > 0) {
                mv.setViewName("redirect:/community/qList.tp");
                return mv;
            }else {
                mv.addObject("msg", "게시물 삭제에 실패하였습니다.");
                mv.addObject("url", "/");
                mv.setViewName("community/errorPage");
                return mv;
            } 
        } catch (Exception e) {
            System.out.println(e.getMessage());
            mv.setViewName("/");
            return mv;
        }
    }
    
    public PageInfo getPageInfo(int curruntPage, int totalCount, String boardType) {

        PageInfo pi = null;
        int recordCountPerPage = 10;
        int naviCountPerPage = 5;
        int naviTotalCount;
        int startNavi;
        int endNavi;

        naviTotalCount = (int)((double) totalCount / recordCountPerPage + 0.9);

        startNavi = (((int) ((double) curruntPage / naviCountPerPage + 0.9)) - 1) * naviCountPerPage + 1;

        endNavi = startNavi + naviCountPerPage - 1;
        if (endNavi > naviTotalCount) {
            endNavi = naviTotalCount;
        }

        pi = new PageInfo(curruntPage, recordCountPerPage, naviCountPerPage, startNavi, endNavi, totalCount,
                naviTotalCount, boardType);
        return pi;
    }
}
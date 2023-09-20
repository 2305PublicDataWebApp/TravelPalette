package com.semi.travelpalette.travel.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.semi.travelpalette.common.domain.PageInfo;
import com.semi.travelpalette.travel.domain.Travel;
import com.semi.travelpalette.travel.domain.TravelFile;

public interface TravelService {


	/**
	 * 여행정보 등록 Service
	 * @param travel
	 * @param uploadFiles 
	 * @param request 
	 * @return
	 */
	int insertTravel(Travel travel, MultipartFile[] uploadFiles, HttpServletRequest request);

	/**
	 * 여행정보 수정 Service
	 * @param travel
	 * @param uploadFiles
	 * @param request
	 * @return
	 */
	int updateTravel(Travel travel, MultipartFile[] uploadFiles, HttpServletRequest request);

	/**
	 * 조회수 증가 Service
	 * @param travelNo
	 */
	void updateViewCount(int travelNo);

	/**
	 * 여행정보 삭제 Service
	 * @param travelNo
	 * @return
	 */
	int deleteByNo(Integer travelNo);

	/**
	 * 첨부파일 삭제 Service
	 * @param travelFile
	 * @return
	 */
	int deleteFileByNo(TravelFile travelFile);

	/**
	 * 여행정보 상세조회 Service
	 * @param travelNo
	 * @return
	 */
	Travel selectTravelByNo(int travelNo);

	/**
	 * 첨부파일 리스트 Service
	 * @param travelNo
	 * @return
	 */
	List<TravelFile> selectTravelFileByNo(int travelNo);

	/**
	 * 여행정보 정렬 Service
	 * @param sortMap
	 * @return
	 */
	List<Travel> travelSortList(Map<String, Object> sortMap);

	/**
	 * 전체 레코드 개수 Service
	 * @return
	 */
	int getTotalCount();

	/**
	 * 검색 레코드 개수 Service
	 * @param searchKeyword
	 * @return
	 */
	int getSearchListCount(String searchKeyword);

	/**
	 * 여행지역 키워드 검색 Service
	 * @param searchPInfo
	 * @param searchKeyword
	 * @return
	 */
	List<Travel> searchListByKeyword(PageInfo searchPInfo, String searchKeyword);


	

}

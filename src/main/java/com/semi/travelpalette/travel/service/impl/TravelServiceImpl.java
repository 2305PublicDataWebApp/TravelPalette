package com.semi.travelpalette.travel.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.semi.travelpalette.travel.domain.Travel;
import com.semi.travelpalette.travel.domain.TravelFile;
import com.semi.travelpalette.travel.service.TravelService;
import com.semi.travelpalette.travel.store.TravelStore;

@Service
public class TravelServiceImpl implements TravelService{

	@Autowired
	private SqlSession session;
	@Autowired
	private TravelStore tStore;
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertTravel(Travel travel, MultipartFile[] uploadFiles, HttpServletRequest request) {
		int result = 0;
		try {
			// 1. 여행정보 db에 먼저 저장
			result = tStore.insertTravel(session, travel);
			// 2. 저장성공시 파일업로드
			if(result > 0) {									 
				int travelNo = tStore.selectSeq(session);
				for(MultipartFile uploadFile : uploadFiles) {
					if(uploadFile != null && !uploadFile.isEmpty()) {
						//파일저장 메소드 호출
						Map<String, Object> travelFileMap = this.saveFile(uploadFile, request);
						String travelFileName = (String)travelFileMap.get("travelFileName");
						String travelFileRename = (String)travelFileMap.get("travelFileRename");
						String travelFilePath = (String)travelFileMap.get("travelFilePath");
						TravelFile travelFile = new TravelFile(travelNo, travelFileName, travelFileRename, travelFilePath);
						tStore.insertTravelFile(session, travelFile);	
					}
				}
			}
		} catch (Exception e) {
			 e.printStackTrace();
			 result = -1;
		}
		return result;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateTravel(Travel travel, MultipartFile[] uploadFiles, HttpServletRequest request) {
		int result = 0;
		try {
			// 1. 여행정보 db를 먼저 수정
			result = tStore.updateTravel(session, travel);
			
			// 2. 수정이 완료되면 파일업로드 로직 실행
			if(result > 0) {
				int travelNo = travel.getTravelNo();
				// 3. 기존 업로드 파일목록 불러오기
				List<TravelFile> existingFiles = tStore.selectTravelFileByNo(session, travelNo); 
				
				// 4. 새로운 업로드 파일 저장
				for(MultipartFile uploadFile : uploadFiles) {
					if(uploadFile != null && !uploadFile.isEmpty()) {
						//파일저장 메소드 호출
						Map<String, Object> travelFileMap = this.saveFile(uploadFile, request);
						String travelFileName = (String)travelFileMap.get("travelFileName");
						String travelFileRename = (String)travelFileMap.get("travelFileRename");
						String travelFilePath = (String)travelFileMap.get("travelFilePath");
						TravelFile travelFile = new TravelFile(travel.getTravelNo(), travelFileName, travelFileRename, travelFilePath);
						//db에 파일 저장
						tStore.insertTravelFile(session, travelFile);
						
						// 5. 기존 업로드 파일 삭제
						for (TravelFile existingFile : existingFiles) {
							// 기존 파일과 새 파일의 파일 이름이 다르면 기존 파일 삭제
							if (!existingFile.getTravelFileName().equals(travelFileName)) {
								this.deleteFile(request, existingFile.getTravelFileRename());
							}
						}
					}
				}
			}
		} catch (Exception e) {
			 e.printStackTrace();
			 result = -1;
		}
		return result;
	}

	@Transactional
	@Override
	public void updateViewCount(int travelNo) {
		tStore.updateViewCount(session, travelNo);
	}

	@Override
	public int deleteByNo(Integer travelNo) {
		int result = tStore.deleteByNo(session, travelNo);
		return result;
	}

	@Override
	public int deleteFileByNo(int travelFileNo) {
		int result = tStore.deleteFileByNo(session, travelFileNo);
		return result;
	}

	@Override
	public Travel selectTravelByNo(int travelNo) {
		Travel travel = tStore.selectTravelByNo(session, travelNo);
		return travel;
	}

	@Override
	public List<TravelFile> selectTravelFileByNo(int travelNo) {
		List<TravelFile> travelFiles = tStore.selectTravelFileByNo(session, travelNo);
		return travelFiles;
	}

	@Override
	public List<Travel> travelSortList(Map<String, Object> sortMap) {
		List<Travel> tList = tStore.travelSortList(session, sortMap);
		return tList;
	}

	@Override
	public int getTotalCount() {
		int totalCount = tStore.getTotalCount(session);
		return totalCount;
	}

	private Map<String, Object> saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		Map<String, Object> fileInfoMap = new HashMap<String, Object>();
		try {
			//업로드 저장 경로생성
			String root = request.getSession().getServletContext().getRealPath("resources");
			String saveFolder = root + "\\tUploadFiles";
			File folder = new File(saveFolder);
			if(!folder.exists()) folder.mkdir();
			
			// 파일 이름, 경로 생성
			String travelFileName = uploadFile.getOriginalFilename(); 					// 실제파일명
			String ext = travelFileName.substring(travelFileName.lastIndexOf(".")+1);   // 확장자 추출
			String travelFileRename = UUID.randomUUID().toString() + "." + ext; 		// 파일리네임 - UUID객체로 랜덤 생성
			String savePath = saveFolder + "\\" + travelFileRename; 					// 파일경로
			
			//파일 객체 생성 후 실제파일저장
			File file = new File(savePath);
			uploadFile.transferTo(file);
				
			//Map 저장
			fileInfoMap.put("travelFileName", travelFileName);
			fileInfoMap.put("travelFileRename", travelFileRename);
			fileInfoMap.put("travelFilePath", savePath);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
		return fileInfoMap;
	}

	private void deleteFile(HttpServletRequest request, String travelFileRename) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delFilepath = root+"\\tUploadFiles\\"+travelFileRename;
		File file = new File(delFilepath);
		if(file.exists()) {
			file.delete();
		}
	}


	
	
}

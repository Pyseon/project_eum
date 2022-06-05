package kr.or.eum.community.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.eum.community.model.service.CommunityService;
import kr.or.eum.community.model.vo.Community;
import kr.or.eum.community.model.vo.CommunityCo;
import kr.or.eum.community.model.vo.CommunityDetailData;
import kr.or.eum.community.model.vo.CommunityPageData;

@Controller
public class CommunityController {
	@Autowired
	private CommunityService service;

	@RequestMapping(value = "/communityList.do")
	public String communityList(int category, int reqPage, Model model) {
		CommunityPageData cpd = service.selectCommunityList(category, reqPage);
		model.addAttribute("list", cpd.getList());
		model.addAttribute("pageNavi", cpd.getPageNavi());
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("category", category);
		return "community/communityList";
	}

//>>>>>>>>>>>> 읽기	
	@RequestMapping(value = "/communityDetail.do")
	public String communityDetail(int commNo, int category, Model model) {
		// Community cm = service.communityDetail(commNo);
		CommunityDetailData cdd = service.communityDetail(commNo);
		model.addAttribute("comm", cdd.getComm());
		model.addAttribute("cmntList", cdd.getCmntList());
		if (category == 0) {
			return "community/detailCat0";
		} else {
			return "community/detailCat1";
		}
	}

// >>>>>>>>>>쓰기
	@RequestMapping(value = "/communityWriteFrm.do")
	public String communityWriteFrm() {
		return "community/communityWriteFrm";
	}

	@RequestMapping(value = "/communityWrite.do")
	public String communityWrite(Community comm, MultipartFile file, HttpServletRequest request) {
		Community community = imgUpload(comm, file, request);
		service.communityWrite(community);
		return "redirect:/communityList.do?category=" + comm.getCommCategory() + "&reqPage=1";
	}
	
	@ResponseBody
	@RequestMapping(value="/commCoWrite.do", produces="application/json;charset=utf-8")
	public String communityCoWrite(CommunityCo commCo) {
		//insert 후 selectKey를 이용해 방금 insert 한 pk값 얻어옴
		service.commCoWrite(commCo);
		//얻어온 pk값으로 데이터 조회 후 리턴
		CommunityCo comment = service.commCoDetail(commCo.getCmntNo());
		return new Gson().toJson(comment);
	}
	
	
//>>>>>>>>>>>수정
	@RequestMapping(value = "/communityUpdateFrm.do")
	public String communityUpdateFrm(int commNo, Model model) {
		Community comm = service.communityDetailNotCmnt(commNo);
		model.addAttribute("comm", comm);
		return "community/communityUpdateFrm";
	}

	@RequestMapping(value = "/communityUpdate.do")
	public String communityUpdate(Community comm, Model model, MultipartFile file, HttpServletRequest request) {
		String getUri;
		// 파일이름을 가져옴
		String filename = file.getOriginalFilename();
		// 이미지 수정을 안하면 파일이름은 빈칸, 수정을했다면 파일이름이 존재
		if (filename != "") {
			Community community = imgUpload(comm, file, request);
			service.communityUpdate(community);
			getUri = communityDetail(community.getCommNo(), community.getCommCategory(), model);
		} else {
			service.communityUpdate(comm);
			getUri = communityDetail(comm.getCommNo(), comm.getCommCategory(), model);
		}

		return getUri;
	}

//>>>>>>>>>>삭제
	@RequestMapping(value="/communityDelete.do")
	public String communityDelete(int category, int commNo) {
		service.communityDelete(commNo);
		return "redirect:/communityList.do?category="+category+"&reqPage=1";
	}

	
	
	
	
	
	
	

//////  >>>>>>>>>>>>>>   이미지 업로드 메소드  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	public Community imgUpload(Community comm, MultipartFile file, HttpServletRequest request) {
		System.out.println("이미지 업로드 메소드 진입!!");
		// 파일 저장할 경로 설정
		String savePath = request.getSession().getServletContext().getRealPath("/img/community/");

		// 파일명이 기존파일과 겹치는 경우 기존파일을 삭제하고 새파일만 남는 현상이 생김(덮어쓰기)
		// 파일명 중복처리 (뒤에 넘버를 붙인다든가..)
		// 사용자가 업로드한 파일 이름
		String filename = file.getOriginalFilename();
		// test.txt -> text_1.text / text_1.txt->text_2.txt 중복처리 로직
		// 업로드한 파일명이 test.txt인경우 -> test / .txt 두부분으로 분리함
		// subString은 매개변수 두개면 첫번쨰부터 두번째까지 잘라서 반환
		// 매개변수가 하나면 매개변수부터 잘라서 반환
		String onlyFilename = filename.substring(0, filename.lastIndexOf("."));// test
		String extension = filename.substring(filename.lastIndexOf("."));// .txt
		// 실제 업로드할 파일명을 저장할 변수
		String filepath = null;
		// 파일명 중복시 뒤에 붙일 숫자 변수
		int count = 0;
		while (true) {
			if (count == 0) {
				// 반복 첫번째 회차에서는 원본파일명을 그대로 적용
				filepath = onlyFilename + extension; // test.txt
			}
			File checkFile = new File(savePath + filepath);
			if (!checkFile.exists()) { // 경로에 파일이 존재하지않으면 (exists() method 사용)
				break; // 겹치지않으면 >> while 문 종료
			} else {
				filepath = onlyFilename + "_" + count + extension;
			}
			count++; // 존재하면 카운트를 ++ 하고 반복문 다시 실행
		}
		// 파일명 중복검사했을때 경로에 중복 파일이 존재하지 않아서 while문나온시점
		// 해당파일 업로드 작업
		try {
			// 중복처리가 끝난파일명 (filepath)으로 파일을 업로드할 FileOutputStream객체 생성
			FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
			// 업로드 속도증가를 위한 보조스트림 생성
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			// 파일 업로드
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		comm.setCommFilename(filename);
		comm.setCommFilepath(filepath);

		return comm;
	}

}

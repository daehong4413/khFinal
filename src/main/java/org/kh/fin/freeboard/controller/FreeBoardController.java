package org.kh.fin.freeboard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.kh.fin.common.PageInfo;
import org.kh.fin.common.Pagination;
import org.kh.fin.freeboard.domain.FreeBoard;
import org.kh.fin.freeboard.domain.FreeComment;
import org.kh.fin.freeboard.domain.Search;
import org.kh.fin.freeboard.service.FreeboardService;
import org.kh.fin.member.domain.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;

@Controller
public class FreeBoardController {

	@Autowired
	private FreeboardService fService;

	// 자유게시판 전체 조회 서비스
	@RequestMapping("flist.do")
	public ModelAndView freeBoardList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {

		int currentPage = (page != null) ? page : 1;
		int listCount = fService.getListCount();
		int pageLimit = 10; // 한 페이지에서 보여질 페이징 수
		int boardLimit = 5; // 한 페이지에 보여질 게시글 갯수
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, pageLimit, boardLimit);

		ArrayList<FreeBoard> list = fService.freeBoardList(pi);
		
		if (!list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("freeboard/freeboardListViews");
		} else {
			/*mv.addObject("msg", "자유게시판 전체조회 실패");
			mv.setViewName("common/errorPage");*/
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("freeboard/freeboardListViews");
		}
		return mv;
	}
	
	// 자유게시판 검색 서비스
	@RequestMapping("fsearch.do")
	public ModelAndView freeBoardSearch(Search search, ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {
		
		int currentPage = (page != null) ? page : 1;
		int listCount = fService.getSearchListCount(search);
		int pageLimit = 10; // 한 페이지에서 보여질 페이징 수
		int boardLimit = 5; // 한 페이지에 보여질 게시글 갯수
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, pageLimit, boardLimit);
		
		ArrayList<FreeBoard> searchList = fService.searchList(search, pi);
		
			mv.addObject("list", searchList);
			mv.addObject("pi", pi);
			mv.addObject("search", search);
			mv.setViewName("freeboard/freeboardListViews");
		return mv;
	}
	
	// 자유게시판 상세 조회 서비스
	@RequestMapping("fdetail.do")
	public String noticeDetail(int boardNo, Model model) {
		FreeBoard freeboard = fService.selectBoard(boardNo);
		if (freeboard != null) {
			model.addAttribute("freeboard", freeboard);
			return "freeboard/freeboardDetailViews";
		} else {
			model.addAttribute("msg", "공지사항 상세조회 실패");
			return "common/errorPage";
		}
	}



	// 자유게시판 작성페이지 화면
	@RequestMapping("fWriteView.do")
	public String fWriteView() {
		return "freeboard/freeboardWriteForm";
	}

	// 자유게시판 작성
	@RequestMapping(value = "finsert.do", method = RequestMethod.POST)
	public String insertFreeBoard(FreeBoard freeboard, Model model, HttpServletRequest request) {
		int result = 0;
		String path = null;
		System.out.println(model.toString());
		System.out.println(freeboard.toString());
		result = fService.insertFreeBoard(freeboard, request);
		if (result > 0) {
			path = "redirect:flist.do";
		} else {
			model.addAttribute("msg", "게시글 등록 실패");
			return "common/errorPage";
		}
		return path;
	}

	// 자유게시판 수정페이지 화면
	@RequestMapping("fupdateView.do")
	public String updateFreeBoardView(int boardNo, Model model) {
		FreeBoard freeboard = fService.selectBoard(boardNo);
		if (freeboard != null) {
			model.addAttribute("freeboard", freeboard);
			return "freeboard/freeboardUpdateForm";
		} else {
			model.addAttribute("msg", "공지사항 상세조회 실패");
			return "common/errorPage";
		}
	}

	// 자유게시판 수정
	@RequestMapping(value = "fupdate.do", method = RequestMethod.POST)
	public String updateFreeBoard(FreeBoard freeboard, Model model, HttpServletRequest request) {
		int result = 0;
		String path = null;
		System.out.println(model.toString());
		System.out.println(freeboard.toString());
		result = fService.updateFreeBoard(freeboard, request);
		if (result > 0) {			 
			path = "redirect:flist.do";
		} else {
			model.addAttribute("msg", "게시글 등록 실패");
			return "common/errorPage";
		}
		return path;
	}
	// 자유게시판 삭제
	@RequestMapping("fdelete.do")
	public String deleteFreeBoard(int boardNo, SessionStatus status, Model model, RedirectAttributes rd) {
		int result = fService.deleteFreeBoard(boardNo);
		if(result > 0) {
			rd.addFlashAttribute("msg", "게시글 삭제 완료");
			status.setComplete();
			return "redirect:flist.do";
		}else {
			model.addAttribute("msg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	// 자유게시판 댓글 조회 서비스
	@RequestMapping("clist.do")
	public void getReplyList(HttpServletResponse response, int boardNo) throws JsonIOException, IOException {
		ArrayList<FreeComment> cList = fService.selectFreeCommentList(boardNo);
		
		for(FreeComment fc : cList) {
			fc.setcContent(URLEncoder.encode(fc.getcContent(), "utf-8"));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(cList, response.getWriter());
	}

	// 자유게시판 댓글 등록 서비스
	@RequestMapping("cinsert.do")
	@ResponseBody
	public String addReply(FreeComment fc, HttpSession session) {
		Member loginInfo =(Member)session.getAttribute("loginInfo");
		String memberId = loginInfo.getMemberId();
		fc.setMemberId(memberId);
		int result = fService.insertFreeComment(fc);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	// 자유게시판 댓글 수정 서비스
	@RequestMapping("cupdate.do")
	@ResponseBody
	public String updateComment(FreeComment fc, HttpSession session) {
		Member loginInfo =(Member)session.getAttribute("loginInfo");
		String memberId = loginInfo.getMemberId();
		fc.setMemberId(memberId);
		int result = fService.updateFreeComment(fc);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	// 자유게시판 댓글 삭제 서비스
	@RequestMapping("cdelete.do")
	@ResponseBody
	public String deleteFreeComment(@RequestParam("commentNum")int commentNum) {
		int result =fService.deleteFreeComment(commentNum);
		if(result > 0) {
			return "success";
		}else {
			return "common/errorPage";
		}
	}

	// 자유게시판 사진 저장 서비스
	@RequestMapping(value = "fileupload.do")
	@ResponseBody
	public String fileUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile) throws Exception {
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if (file != null) {
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {
					try {
						String fileName = file.getName();
						byte[] bytes = file.getBytes();
						String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/freeboardimg");
						File uploadFile = new File(uploadPath);
						if (!uploadFile.exists()) {
							uploadFile.mkdirs();
						}
						fileName = UUID.randomUUID().toString();
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);

						printWriter = response.getWriter();
						response.setContentType("text/html");
						String fileUrl = request.getContextPath() + "/resources/images/freeboardimg/" + fileName;
						// json 데이터로 등록
						// {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
						// 이런 형태로 리턴이 나가야함.
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						System.out.println(json);

						String callback = request.getParameter("CKEditorFuncNum");
						System.out.println(callback);
						System.out.println(fileUrl);
						/*printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
								+ callback + ",'" + fileUrl + "','이미지를 업로드 하였습니다.'" + ")</script>");*/
						printWriter.println(json);
					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (printWriter != null) {
							printWriter.close();
						}

					}
				}
			}
		}
		return null;
	}

}

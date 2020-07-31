package org.kh.fin.order.controller;

import java.io.PrintWriter;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.kh.fin.common.PageInfo;
import org.kh.fin.common.Pagination;
import org.kh.fin.member.domain.Member;
import org.kh.fin.mypage.domain.Bucket;
import org.kh.fin.order.domain.Order;
import org.kh.fin.order.domain.OrderDetail;
import org.kh.fin.order.domain.OrderReview;
import org.kh.fin.order.domain.OrderReviewFile;
import org.kh.fin.order.domain.OrderValidate;
import org.kh.fin.order.service.OrderService;
import org.kh.fin.product.domain.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


@Controller
public class OrderController {

	@Autowired
	OrderService oService;

	@RequestMapping(value = "orderDetailInsertInfo.do", method = RequestMethod.POST)
	public ModelAndView orderFinish(OrderDetail orderDetail, Order order, ModelAndView mv, HttpSession session) {

		Member member = (Member) session.getAttribute("loginInfo");
		order.setMemberId(member.getMemberId());
		String orderNum = oService.getOrderNum();
		System.out.println(orderNum);

		order.setOrderNum(orderNum);
		orderDetail.setOrderNum(orderNum);

		System.out.println("오더디테일" + orderDetail);
		System.out.println("오더" + order);

		int resultOrder = oService.insertOrder(order);
		int resultOrderDetail = oService.insertOrderDetail(orderDetail);
		int resultProductCnt = oService.updateProductCnt(orderDetail);

		if (resultOrder > 0 && resultOrderDetail > 0 && resultProductCnt > 0) {
			mv.addObject("order", order);
			mv.addObject("orderDetail", orderDetail);
			mv.setViewName("order/finishOrder");
		} else {
			mv.setViewName("error");
		}
		return mv;

	}
	
	@ResponseBody
	@RequestMapping(value="bucketToOrder.do", method = RequestMethod.POST)
	public void bucketToOrder(HttpServletRequest request, HttpServletResponse response, 
			@RequestBody Map<String, Object> map) {
		try {
			PrintWriter out;
			JSONObject jResult = new JSONObject();
			out = response.getWriter();
		
			response.setContentType("application/json"); //핵중요

			Order order = new Order();
			Map<String, String> orderInfo = (Map)map.get("receiverData");
			String orderNum = oService.getOrderNum();
			order.setOrderNum(orderNum);
			String memberId = orderInfo.get("memberId").toString();
			order.setMemberId(memberId);
			String orderName = orderInfo.get("name").toString();
			order.setOrderName(orderName);
			String orderPhone = orderInfo.get("phone").toString();
			order.setOrderPhone(orderPhone);
			String orderPost = orderInfo.get("postcode").toString();
			order.setOrderPost(orderPost);
			String address = orderInfo.get("address").toString();
			order.setOrderAddress(address);
			String detailAddress = orderInfo.get("detailAddress").toString();
			order.setOrderAddressDetail(detailAddress);
			String purchaseType = orderInfo.get("type").toString();
			order.setPurchaseType(purchaseType);
			String dcRate = orderInfo.get("dcRate").toString();
			order.setDcRate(Integer.parseInt(dcRate));
			order.setStatusNum(1);
			System.out.println(order.toString());
			
					
			oService.insertOrder(order);
			ArrayList<Object> list = (ArrayList)map.get("multiParam");
			for (Object object : list) {
				Map<String, String> data = (Map)object;
				OrderDetail orderDetail = new OrderDetail(Integer.parseInt(data.get("productNum")), orderNum, Integer.parseInt(data.get("cnt")), 0);
				oService.insertOrderDetail(orderDetail);
				oService.updateProductCnt(orderDetail);
			}
			HttpSession session = request.getSession();
			session.removeAttribute("pList");
			session.removeAttribute("cart");
			jResult.put("result","success");
		    out.print(jResult);
		      
		    out.flush();// 버퍼링되어서 아직 기록되지않은 데이터를 출력스트림에 모두 출력
		    out.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	//상세 상품 조회시 상품리뷰 리스트
	@RequestMapping("orderReview.do")
	public ModelAndView orderReviewPage(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = oService.getListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount,10,5);

		ArrayList<OrderReview> list = oService.selectAllOrderReview(pi);

		if (!list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("order/orderReviewPage");
			return mv;
		} else {
			mv.setViewName("common/error");
			return mv;
		}
	}
	// 리뷰 삭제
	@RequestMapping("deleteReview.do")
	public String orderReviewDelete(@RequestParam(value="pNum") int pNum,@RequestParam(value="oNum") String oNum) {
		
		System.out.println(pNum);
		System.out.println(oNum);
		OrderReview review = new OrderReview();
		review.setProductNum(pNum);
		review.setOrderNum(oNum);
		int result = oService.deleteReview(review);
		 if(result>0) {
			return "redirect:ProductDetailView.do?pNum="+pNum;
		 }
		 else {
			 return "common/error";
		 }
		
	}
	//페이징 ajax
	@RequestMapping("reviewpaging.do")
	public void reviewPaging(@RequestParam(value="page") Integer page,HttpServletResponse response) {
		System.out.println(page);
		
		int currentPage = (page != null) ? page : 1;
		int listCount = oService.getListCount();
		

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount,10,5);

		ArrayList<OrderReview> list = oService.selectAllOrderReview(pi);
		try {
		for (OrderReview review : list) {
			review.setOrderNum(URLEncoder.encode(review.getOrderNum(), "utf-8"));
			review.setContent(URLEncoder.encode(review.getContent(), "utf-8"));
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		}catch (Exception e) {
			// TODO: handle exception
		}

}
	
	@RequestMapping(value="insertOrderReview.do" ,method=RequestMethod.POST)
	public String insertReview(HttpServletRequest request,OrderReview oReview,@RequestParam("pNum") int pNum,HttpSession session,@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile) {
		Member member=(Member)session.getAttribute("loginInfo");
		
		System.out.println(uploadFile);
		System.out.println("제목:"+oReview.getTitle());
		System.out.println("내용:"+oReview.getContent());
		
		OrderValidate orderVali= new OrderValidate();
		orderVali.setMemberId(member.getMemberId());
		orderVali.setProductNum(pNum);
		
		
		int result = 0;
		
		
		OrderDetail detail = oService.insertValidate(orderVali);
		System.out.println(detail.getOrderNum());
		
		if(detail != null) {
			OrderReview review = new OrderReview();
			review.setProductNum(pNum);
			review.setOrderNum(detail.getOrderNum());
			review.setTitle(oReview.getTitle());
			review.setContent(oReview.getContent());
			
			result = oService.insertReview(review);
			
			
		}
		if(result>0) {
			OrderReviewFile orFile= new OrderReviewFile();
			//사진 파일저장
			if (!uploadFile.getOriginalFilename().equals("") && !uploadFile.getOriginalFilename().equals("")) {
				
				String filePath = saveFile(uploadFile, request);
				
				if (filePath != null ) {
					orFile.setFileName(uploadFile.getOriginalFilename());
					orFile.setFilePath("\\resources\\images\\orderRviewImg\\");
					orFile.setProductNum(pNum);
					orFile.setOrderNum(detail.getOrderNum());
					
					int fileResult = oService.insertReviewFile(orFile);
				}
				else {
					return "common/errorPage";
				}
				
			}else {
				return "common/errorPage";
			}
			
		}
		return "redirect:ProductDetailView.do?pNum="+pNum;
		
		
		
	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\images\\orderRviewImg";
		// 저장 폴더 선택
		File folder = new File(savePath);

		// 만약 폴더가 없을 경우 자동 생성
		if (!folder.exists()) {
			folder.mkdir();
		}

		String filePath = folder + "\\" + file.getOriginalFilename();

		try {
			file.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return filePath;

	}
	
	@RequestMapping(value="updateReview",method=RequestMethod.POST)
	public String updateReview(HttpServletRequest request,OrderReview oReview,@RequestParam("pNum") int pNum,HttpSession session,
			@RequestParam(value = "updateFile", required = false) MultipartFile updateFile) {
		
		OrderReview review = new OrderReview();
		
		review.setOrderNum(oReview.getOrderNum());
		review.setContent(oReview.getContent());
		review.setTitle(oReview.getTitle());
		review.setProductNum(pNum);
		
		int result = oService.updateReview(review);
		
		if(result>0) {
			OrderReviewFile orFile= new OrderReviewFile();
				if (!updateFile.getOriginalFilename().equals("") && !updateFile.getOriginalFilename().equals("")) {
				
				String filePath = saveFile(updateFile, request);
				
				if (filePath != null ) {
					orFile.setFileName(updateFile.getOriginalFilename());
					orFile.setFilePath("\\resources\\images\\orderRviewImg\\");
					orFile.setProductNum(pNum);
					orFile.setOrderNum(oReview.getOrderNum());
					
					int fileResult = oService.updateReviewFile(orFile);
					if(fileResult>0) {
						return "redirect:ProductDetailView.do?pNum="+pNum;
					}
				}
				else {
					return "common/errorPage";
				}
				
			}else {
				return "common/errorPage";
			}
		}else {
			return "common/errorPage";
		}
		return "redirect:ProductDetailView.do?pNum="+pNum;
	}
}

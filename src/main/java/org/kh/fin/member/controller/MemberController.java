package org.kh.fin.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.fin.member.domain.Member;
import org.kh.fin.member.service.MemberService;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@SessionAttributes({ "loginInfo" })
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	@Inject // 서비스를 호출하기 위해서 의존성을 주입
	JavaMailSender mailSender; // 메일 서비스를 사용하기 위해 의존성을 주입함.
	MemberService memberservice; // 서비스를 호출하기 위해 의존성을 주입

	// 로깅을 위한 변수
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(MemberController.class);
	private static final String String = null;

	// mailSending 코드
	@RequestMapping(value = "auth.me", method = RequestMethod.POST)
	public ModelAndView mailSending(HttpServletRequest request, String email, HttpServletResponse response_email)
			throws IOException {

		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)

		String setfrom = "fisherguysKH@gmail.com";
		String tomail = request.getParameter("email"); // 받는 사람 이메일
		String title = "비밀번호 찾기 인증 이메일 입니다."; // 제목
		String content =

				System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

						System.getProperty("line.separator") +

						"안녕하세요 회원님 다시 저희 어부바를 찾아주셔서 감사합니다"

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						" 인증번호는 " + dice + " 입니다. "

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		ModelAndView mv = new ModelAndView(); // ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
		mv.setViewName("find/email_number"); // 뷰의이름
		mv.addObject("dice", dice);
		mv.addObject("email", email);

		System.out.println("mv : " + mv);
		System.out.println("email : " + email);
		response_email.setContentType("text/html; charset=UTF-8");
		PrintWriter out_email = response_email.getWriter();
		out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		out_email.flush();

		return mv;

	}

	// 인증번호를 입력한 후에 확인 버튼을 누르면 자료가 넘어오는 컨트롤러
	@RequestMapping(value = "emailNumber.me", method = RequestMethod.POST)
	public ModelAndView pass_injeung(HttpServletResponse response_equals, HttpServletRequest request,
			String email_injeung) throws IOException {

//            System.out.println("마지막 : pass_injeung : "+email_injeung);

		String dice = request.getParameter("dice");
		String email = request.getParameter("email");

		System.out.println("마지막 : dice : " + dice);

		ModelAndView mv = new ModelAndView();

//            mv.setViewName("/find/pass_change");

		mv.addObject("email", email);

		if (email_injeung.equals(dice)) {

			// 인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 비밀번호 변경창으로 이동시킨다

			mv.setViewName("/find/pass_change");

			mv.addObject("email", email);

			// 만약 인증번호가 같다면 이메일을 비밀번호 변경 페이지로 넘기고, 활용할 수 있도록 한다.

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하였습니다. 비밀번호 변경창으로 이동합니다.');</script>");
			out_equals.flush();

			return mv;

		} else if (email_injeung != dice) {

			ModelAndView mv2 = new ModelAndView();

			mv2.setViewName("find/email_number");

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
			out_equals.flush();

			return mv2;

		}

		return mv;

	}

	// 변경할 비밀번호를 입력한 후에 확인 버튼을 누르면 넘어오는 컨트롤러
	@ResponseBody
	@RequestMapping(value = "passChange.me", method = RequestMethod.POST)
	public String pass_change(HttpServletRequest request, Member mem, String password, String email,
			HttpServletResponse response) throws Exception {

//        String memberPwd = request.getParameter("memberPwd");
//                    
//        String email = request.getParameter("email");

		System.out.println("memberPwd : " + password);
		System.out.println("email : " + email);
//        mem.setEmail(email);
//        mem.setMemberPwd(memberPwd);

		// 값을 여러개 담아야 하므로 해쉬맵을 사용해서 값을 저장함

		Map<String, String> params = new HashMap<String, String>();

		params.put("email", email);
		params.put("password", password);

		int result = 0;

		String resultUrl = "";
		try {
			result = mService.passchange(params);
			if (result > 0) {
				resultUrl = "success";
						
			} else {
				resultUrl = "fail";
			}	
			
		}catch(Exception e) {
			if(e.getCause() instanceof SQLException) {
				return ((SQLException)e.getCause()).getErrorCode() + "";
			}else {
				return "fail";
			}
		}
		
		return resultUrl;
		

	}

	@RequestMapping(value = "callback.me")
	public String loginSuccess() {
		return "callback";
	}

	// 로그인 창 띄우기
	@RequestMapping(value = "loginMain.me")
	public String MemberLogin() {
		return "loginMain";
	}

	// 약관 동의 페이지
	@RequestMapping(value = "agree.me")
	public String agreeFormView() {
		return "agreeForm";
	}

	// 회원가입 페이지
	@RequestMapping(value = "resister.me")
	public String ResisterView() {
		return "resisterMember";
	}

	// 내 정보 수정 페이지
	@RequestMapping(value = "myPage.me")
	public String myPageView() {
		return "modifyMyMain";
	}

	// 내 정보 수정 페이지
	@RequestMapping(value = "findIdPwd.me")
	public String findIdPwd() {
		return "find/findMain";
	}

	// 회원가입하기
	@RequestMapping(value = "newRegister.me", method = RequestMethod.POST)
	public String memberInsert(Member mem) {
		System.out.println(mem.toString());
		int result = mService.insertMember(mem);
		if (result > 0) {
			return "redirect:index.jsp";
		} else {
			return "망";
		}
	}

	/**
	 * checkId.me parameter request return JsonObject
	 */
	@ResponseBody
	@RequestMapping(value = "checkId.me", method = RequestMethod.POST)
	public String checkId(HttpServletRequest request) {
		String result;
		String userId = request.getParameter("id");
		System.out.println("id : " + userId);

		result = this.mService.checkIdDup(userId);
		System.out.println(result.toString());
		return result;
	}

	/**
	 * findId.me 아이디 찾기 할때 이름과 타입을 가져오고 타입의 값을 가져와서 검색함.
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "findId.me", method = RequestMethod.POST)
	public String findId(HttpServletRequest request, String name) {
		String result;
		String key = request.getParameter("key");
		String findType = request.getParameter("findType");
		System.out.println("name :" + name);
		Map<String, String> params = new HashMap<String, String>();
		params.put("key", key);
		params.put("findType", findType);
		params.put("name", name);

		System.out.println(params.toString());

		result = this.mService.findId(params);
		System.out.println(result.toString());
		return result;
	}

	/**
	 * 입력한 값 받아서 맞으면 새로운 비밀번호 입력칸 보여주기
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "findPwView.me", method = RequestMethod.POST)
	public String findPwView(HttpServletRequest request, String memberId, String phone) {
		String result;
		System.out.println("memberId : " + memberId);
		System.out.println("memberId : " + phone);
		Map<String, String> params = new HashMap<String, String>();
		params.put("memberId", memberId);
		params.put("phone", phone);
		System.out.println("params.toString()" + params.toString());
		result = this.mService.findPwView(params);
		System.out.println("result.toString()" + result.toString());
		return result;

	}

	/**
	 * 비밀번호 찾기 후 비밀번호 변경하기
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "changePw.me", method = RequestMethod.POST)
	public String changePw(HttpServletRequest request, String memberId, String password) {
		int result = 0;
		System.out.println("memberId : " + memberId);
		System.out.println("password : " + password);
		Map<String, String> params = new HashMap<String, String>();
		params.put("memberId", memberId);
		params.put("password", password);
		System.out.println("params.toString()" + params.toString());
		String resultUrl = "";
			try {
				result = this.mService.changePw(params);
				if (result > 0) {
					resultUrl = "redirect:index.jsp";
							
				} else {
					resultUrl = "common.errorPage";
				}	
				
			}catch(Exception e) {
				System.out.println(e.getMessage());
				resultUrl = "common.errorPage";
			}
			
			return resultUrl;
	}

	
	//닉네임 중복 테스트
	@ResponseBody
	@RequestMapping(value = "chekNickName.me", method = RequestMethod.POST)
	public String checkNickName(HttpServletRequest request) {
		String result;
		String nick = request.getParameter("nick");
		System.out.println("nick : " + nick);

		result = this.mService.checkNickDup(nick);
		System.out.println(result.toString());
		return result;
	}

	// 로그인 !
	@RequestMapping(value = "login.me", method = RequestMethod.POST)
	public ModelAndView MemberLogin(Member mem, ModelAndView mv) {
		Member loginInfo = mService.loginMember(mem);

		if (loginInfo != null) {
			mv.addObject("loginInfo", loginInfo);
			mv.setViewName("loginSuccess");
		} else {
			mv.addObject("flag", "login");
			mv.addObject("msg","로그인 실패");
			mv.setViewName("../common/errorPage");
		}

		return mv;
	}

	// 로그아웃
	@RequestMapping("logout.me")
	public String MemberLogout(SessionStatus status, HttpSession session) {
		session.invalidate();
		status.setComplete();
		return "redirect:/";
	}
}

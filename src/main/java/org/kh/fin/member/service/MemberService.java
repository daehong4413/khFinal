package org.kh.fin.member.service;

import java.util.Map;

import org.kh.fin.member.domain.Member;

public interface MemberService {
	
	
		/**
		 * 로그인 유저.!
		 * @param mem
		 * @return loginInfo
		 */
		public Member loginMember(Member mem);
		
		/**
		 * 아이디 중복 체크
		 * @param userId
		 * @return
		 */
		public String checkIdDup(String userId);
		
		
		/**
		 * 회원가입..
		 * @param mem
		 * @return mem
		 */
		public int insertMember(Member mem);
		
		/**
		 * 정보 업데이트
		 * @param mem
		 * @return
		 */
		public int updateMember(Member mem);
		
		/**
		 * 아이디 업데이트해서 로그인 못하게 하기
		 * @param id
		 * @return
		 */
		public int deleteMember(String id);

		/**
		 * 아이디 중복 체크
		 * @param nickName
		 * @return
		 */
		public String checkNickDup(String nickName);

		/**
		 * 아이디 찾기(이메일, 전화번호, 생년월일로)
		 * @param params
		 * @return
		 */
		public String findId(Map<String, String> params);

		
		/**
		 * 값받아서와서 비밀번호 변경창 연결
		 * @param params
		 * @return
		 */
		public String findPwView(Map<String, String> params);

		/**
		 * 
		 * @param mem
		 * @return
		 */
		public String find_passCheck(Member mem);

		/**
		 * 비밀번호 변경
		 * @param params
		 * @return
		 */
		public int passchange(Map<String, String> params);

		public int changePw(Map<String, String> params); 

}

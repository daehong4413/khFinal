package org.kh.fin.member.store;

import java.util.Map;

import org.kh.fin.member.domain.Member;

public interface MemberStore {
	
	public Member selectMember(Member mem);
	
	public int insertMember(Member mem);
	
	public int checkIdDup(String userId);
	
	public int update(Member mem);
	
	public int deleteMember(String userId);

	public int checkNick(String nickName);

	public String findId(Map<String, String> params);

	public String findPwView(Map<String, String> params);

	public int changePw(Map<String, String> params);

	public String find_passCheck(Member mem);

	public int passchange(Map<String, String> params);
}

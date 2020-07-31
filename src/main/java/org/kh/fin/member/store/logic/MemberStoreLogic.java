package org.kh.fin.member.store.logic;

import java.util.Map;

import org.kh.fin.member.domain.Member;
import org.kh.fin.member.store.MemberStore;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberStoreLogic implements MemberStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member selectMember(Member mem) {
		
		return sqlSession.selectOne("memberMapper.loginUser", mem);
	}

	@Override
	public int insertMember(Member mem) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertMem",mem);
	}

	@Override
	public int checkIdDup(String userId) {
		return sqlSession.selectOne("memberMapper.checkIdDup", userId);
	}

	@Override
	public int update(Member mem) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String findId(Map<String, String> params) {
		String result = "";
		String findType = params.get("findType");
		String key = params.get("key");
		String name = params.get("name");
		System.out.println("findType : " + findType);
		System.out.println("key : " + key);
		System.out.println("name : " + name);
		if("phone".equals(findType)) {
			result = sqlSession.selectOne("memberMapper.findId_phone", params);
		} else if ("email".equals(findType)) {
			result = sqlSession.selectOne("memberMapper.findId_email", params);
		} else if ("birth".equals(findType)) {
			result = sqlSession.selectOne("memberMapper.findId_birth", params);
		}
		System.out.println("result : " + result);
		
		if(!"".equals(result) && result != null) {
			StringBuffer sb = new StringBuffer();
			
			for(int i=0; i<result.length(); i++) {
				if(i<3) {
					sb.append(result.substring(i, i+1));
				}else {
					sb.append("*");
				}
			}
			result = sb.toString();
			
		}
		return result;
		//return sqlSession.selectOne("memberMapper.findId", params);
	}
	
	@Override
	public int checkNick(String nick) {
		
		return sqlSession.selectOne("memberMapper.checkNick",nick);
	}

	@Override
	public String findPwView(Map<String, String> params) {
		return sqlSession.selectOne("memberMapper.findPwView",params);
	}

	@Override
	public int changePw(Map<String, String> params) {
		return sqlSession.update("memberMapper.changePw",params);
	}

	@Override
	public String find_passCheck(Member mem) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int passchange(Map<String, String> params) {
		System.out.println("store params : " + params.toString());
		return sqlSession.update("memberMapper.changePw",params);
	}



}

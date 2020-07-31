package org.kh.fin.common.store;

import java.util.ArrayList;

import org.kh.fin.common.domain.MainItem;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonStore {
	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<MainItem> selectShowList(){
		return (ArrayList)session.selectList("commonMapper.showList");
	}
	
	public ArrayList<MainItem> selectFavoriteList(){
		return (ArrayList)session.selectList("commonMapper.favoriteList");
	}
	
	public ArrayList<MainItem> selectSoldList(){
		return (ArrayList)session.selectList("commonMapper.soldList");
	}
}

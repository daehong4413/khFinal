package org.kh.fin.common.service;

import java.util.ArrayList;

import org.kh.fin.common.domain.MainItem;
import org.kh.fin.common.store.CommonStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommonService {
	@Autowired
	private CommonStore cStore;
	
	public ArrayList<MainItem> selectShowList(){
		return cStore.selectShowList();
	}
	
	public ArrayList<MainItem> selectFavoriteList(){
		return cStore.selectFavoriteList();
	}
	public ArrayList<MainItem> selectSoldList(){
		return cStore.selectSoldList();
	}
}

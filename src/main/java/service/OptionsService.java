package service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.OptionsDao;
import pojo.Options;
import pojo.OptionsVo;
import pojo.Vote;

@Service("optionsService")
@Transactional
public class OptionsService {
	 @Autowired
	  private OptionsDao optionsDao;
	 public int insertOptions(Options vo){
		 return optionsDao.insertOptions(vo);
	 }
	 
	 public ArrayList<Options> selectOptions(Vote vote){
		 return optionsDao.selectOptions(vote);
	 }
	 
	 public int selectId(){
		 return optionsDao.selectId();
	 }
}

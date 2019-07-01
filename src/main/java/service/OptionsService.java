package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.OptionsDao;
import pojo.Options;
import pojo.OptionsVo;

@Service("optionsService")
@Transactional
public class OptionsService {
	 @Autowired
	  private OptionsDao optionsDao;
	 public int insertOptions(Options vo){
		 return optionsDao.insertOptions(vo);
	 }
	 
	 public List<Options> selectOptions(Options op){
		 return optionsDao.selectOptions(op);
	 }
	 
	 public int selectId(){
		 return optionsDao.selectId();
	 }
}

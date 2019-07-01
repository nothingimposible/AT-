package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import pojo.Options;
import pojo.OptionsVo;
import pojo.Vote;

@Repository("optionsDao")
@Mapper
public interface OptionsDao {
   public int insertOptions(Options vo);
   public ArrayList<Options> selectOptions(Vote vote);
   public int selectId();
}

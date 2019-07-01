package dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import pojo.Options;
import pojo.OptionsVo;

@Repository("optionsDao")
@Mapper
public interface OptionsDao {
   public int insertOptions(Options vo);
   public List<Options> selectOptions(Options op);
   public int selectId();
}

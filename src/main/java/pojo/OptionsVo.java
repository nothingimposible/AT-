package pojo;

import java.util.List;

public class OptionsVo {
  private List<Options> lis;

public List<Options> getLis() {
	return lis;
}

public void setLis(List<Options> lis) {
	this.lis = lis;
}

@Override
public String toString() {
	return "OptionsVo [lis=" + lis + "]";
}
  
}

package pojo;

public class Vote {
  private int VS_ID;
  private String VS_TITLE;
  private int VS_TYPE;
public int getVS_ID() {
	return VS_ID;
}
public void setVS_ID(int vS_ID) {
	VS_ID = vS_ID;
}
public String getVS_TITLE() {
	return VS_TITLE;
}
public void setVS_TITLE(String vS_TITLE) {
	VS_TITLE = vS_TITLE;
}
public int getVS_TYPE() {
	return VS_TYPE;
}
public void setVS_TYPE(int vS_TYPE) {
	VS_TYPE = vS_TYPE;
}
@Override
public String toString() {
	return "Vote [VS_ID=" + VS_ID + ", VS_TITLE=" + VS_TITLE + ", VS_TYPE=" + VS_TYPE + "]";
}
  
}

package pojo;

public class Options {
   private int VO_ID;
   private String VO_OPTION;
   private int VS_ID;
   private int NUMBER;
public int getVO_ID() {
	return VO_ID;
}
public void setVO_ID(int vO_ID) {
	VO_ID = vO_ID;
}
public String getVO_TITLE() {
	return VO_OPTION;
}
public void setVO_TITLE(String vO_TITLE) {
	VO_OPTION = vO_TITLE;
}
public int getVS_ID() {
	return VS_ID;
}
public void setVS_ID(int vS_ID) {
	VS_ID = vS_ID;
}

public int getNUMBER() {
	return NUMBER;
}
public void setNUMBER(int nUMBER) {
	NUMBER = nUMBER;
}
@Override
public String toString() {
	return "Options [VO_ID=" + VO_ID + ", VO_TITLE=" + VO_OPTION + ", VS_ID=" + VS_ID + ", NUMBER=" + NUMBER + "]";
}

   
}

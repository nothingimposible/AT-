package pojo;

public class Item {
   private int VI_ID;
   private int VO_ID;
   private int VS_ID;
   private String VU_USER_ID;
public int getVI_ID() {
	return VI_ID;
}
public void setVI_ID(int vI_ID) {
	VI_ID = vI_ID;
}
public int getVO_ID() {
	return VO_ID;
}
public void setVO_ID(int vO_ID) {
	VO_ID = vO_ID;
}
public int getVS_ID() {
	return VS_ID;
}
public void setVS_ID(int vS_ID) {
	VS_ID = vS_ID;
}
public String getVU_USER_ID() {
	return VU_USER_ID;
}
public void setVU_USER_ID(String vU_USER_ID) {
	VU_USER_ID = vU_USER_ID;
}

@Override
public String toString() {
	return "Item [VI_ID=" + VI_ID + ", VO_ID=" + VO_ID + ", VS_ID=" + VS_ID + ", VU_USER_ID=" + VU_USER_ID;
}

}

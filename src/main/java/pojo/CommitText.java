package pojo;

public class CommitText {
   private int VC_ID;
   private int VS_ID;
   private String VU_USER_NAME;
   private String VC_COMMIT;
   private String VC_TIME;
public int getVC_ID() {
	return VC_ID;
}
public void setVC_ID(int vC_ID) {
	VC_ID = vC_ID;
}
public int getVS_ID() {
	return VS_ID;
}
public void setVS_ID(int vS_ID) {
	VS_ID = vS_ID;
}
public String getVU_USER_NAME() {
	return VU_USER_NAME;
}
public void setVU_USER_NAME(String vU_USER_NAME) {
	VU_USER_NAME = vU_USER_NAME;
}
public String getVC_COMMIT() {
	return VC_COMMIT;
}
public void setVC_COMMIT(String VC_cOMMIT) {
	VC_COMMIT = VC_cOMMIT;
}
public String getVC_TIME() {
	return VC_TIME;
}
public void setVC_TIME(String tIME) {
	VC_TIME = tIME;
}
@Override
public String toString() {
	return "CommitText [VC_ID=" + VC_ID + ", VS_ID=" + VS_ID + ", VU_USER_ID=" + VU_USER_NAME + ", COMMIT=" + VC_COMMIT
			+ ", TIME=" + VC_TIME + "]";
}
   
}

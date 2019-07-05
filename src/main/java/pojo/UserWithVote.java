package pojo;

public class UserWithVote {
  private int VS_ID;
  private String VU_USER_ID;
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
	return "UserWithVote [VS_ID=" + VS_ID + ", VU_USER_ID=" + VU_USER_ID + "]";
}
  
}

package pojo;

public class UserWithOptions {
private String VU_USER_ID;
private int VO_ID;
public String getVU_USER_ID() {
	return VU_USER_ID;
}
public void setVU_USER_ID(String vU_USER_ID) {
	VU_USER_ID = vU_USER_ID;
}
public int getVO_ID() {
	return VO_ID;
}
public void setVO_ID(int vO_ID) {
	VO_ID = vO_ID;
}
@Override
public String toString() {
	return "UserWithOptions [VU_USER_ID=" + VU_USER_ID + ", VO_ID=" + VO_ID + "]";
}

}

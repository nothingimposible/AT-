package pojo;

import java.util.List;

public class SubjectList {
  private Vote vote;
  private List<Options> options;
  private User user;
public Vote getVote() {
	return vote;
}
public void setVote(Vote vote) {
	this.vote = vote;
}
public List<Options> getOptions() {
	return options;
}
public void setOptions(List<Options> options) {
	this.options = options;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
@Override
public String toString() {
	return "SubjectList [vote=" + vote + ", options=" + options + ", user=" + user + "]";
}
  
}

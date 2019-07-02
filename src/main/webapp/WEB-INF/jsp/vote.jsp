<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.util.ArrayList"%>
<%@ page import="pojo.Vote" %>
<%@ page import="pojo.Options" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投票</title>
<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
</head>
	<style>
		.vote{
			width: 60%;
			margin-left: 20%;
			height: 400px;
		
		}
        .vote li{
			list-style: none;
			font-size: 20px;
			display: block;
			margin-top: 10px;
			margin-left: -10px;
		}
		.radios{
			width: 30px;
		}
		.vote .sub{
			width: 80px;
			height: 40px;
			border-style: none;
			background: green;
			color: white;
		}
	</style>
	
<body>
		<div class="loginmain">
			<div class="container">
				<div class="row">
					<div class="logintop">
						<h1>在线投票网</h1>
					</div>
    <%
	  Vote vote=(Vote)request.getAttribute("vote");
      ArrayList<Options> option=(ArrayList<Options>)request.getAttribute("option");
	%>
					<div class="vote">
						<h3>投票</h3>
						<hr />
						<h1><%=vote.getVS_TITLE() %></h1>
						<form action="" method="post">
							<ul>
								<!-- <li>
									<input type="radio" class="radios" name="single" id="single1" /><label for="single1">选项1</label>
								</li> -->
								<%
								  for(int i=0;i<option.size();i++){
									  int num=i+1;
									  out.print("<li><input type=");
									  if(vote.getVS_TYPE()==1)
										  out.print("'radio'");
									  else
										  out.print("'checkbox'");
									  out.print("class='radios' name='single' id='single"+num+"' value="+num+"/>");
									  out.print("<label for='single"+num+"'>"+option.get(i).getVO_TITLE()+"</label></li>");
									
								  }
								%>
							</ul>
							<input class="sub" type="submit" value="投票" />
						</form>
						
						
						<hr />
					</div>
				</div>
			</div>
		</div>
</body>
</html>
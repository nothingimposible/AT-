<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="pojo.Vote" %>
<%@ page import="pojo.Options" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投票结果</title>
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
		.len{
			background: #008000;
			height: 15px;
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
                     ArrayList<Integer> num=(ArrayList)request.getAttribute("num");
                     ArrayList<Options> options=(ArrayList)request.getAttribute("options");
                     ArrayList<Integer> flag=(ArrayList)request.getAttribute("flag");
                     ArrayList<String> width=new ArrayList<String>();
                     double znum1=0;
                     for(int i=0;i<num.size();i++){
                    	 znum1+=num.get(i);
                     }
                     for(int i=0;i<num.size();i++){
                    	 
                    	 double number=0;
                    	 if(znum1!=0)
                    	number=	num.get(i)/znum1*100;
                    	 String snum=String.valueOf(number);
                    	 if(snum.length()>6)
                    	 snum=snum.substring(0, 5);
                    	 width.add(snum+"%");
                     }
                     String znum=String.valueOf(znum1);
                     znum=znum.substring(0, znum.length()-2);
                    %>
					<div class="vote">
						<h3>投票结果</h3>
						<hr />
						<h1><%=vote.getVS_TITLE() %></h1>
						<form action="" method="post">
							<ul>
							<%
							  for(int i=0;i<options.size();i++){
								  out.print("<li><label ");
								  if(flag!=null)
								  if(flag.get(i)>0)
									  out.print("style='color:red'");
								  out.print(">"+options.get(i).getVO_TITLE()+"("+width.get(i)+",&nbsp"+num.get(i)+"票)</label>");
								  out.print(" <div class=\"len\" style=\"width:"+width.get(i)+"\"></div></li>");
							  }
							%>
							
							</ul>
							<h4 style="margin-top: 20px;">总票数：<%=znum %>票</h4>
						</form>
						
						<hr />
					</div>
				</div>
				
			</div>
		</div>
</body>
</html>
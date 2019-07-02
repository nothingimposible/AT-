<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.ArrayList"%>
  <%@page import="pojo.SubjectList"%>
   <%@page import="pojo.User"%>
   <%@page import="dao.ItemDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投票系统</title>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
</head>
	<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"
            +request.getServerName()+":"
            +request.getServerPort()+path+"/";
       %>
 <style>
		a:link{
			text-decoration: none;
		}
		.main{
			background: #D7DDE4;
			height: 1000px;
		}
		.top{
			height:70px ;
		}
        .login{
            font-size: 16px;
            line-height: 4;
            text-align: center;
        }
        .login p{
            margin-bottom: 0px;
        }
		.center{
			height: 800px;
			/* background: red; */
		}
		.center .vote{
			width: 100%;
			height: 100px;
			border: 2px solid black;
			border-radius: 5px;
			margin-top: 10px;
		}
		.center .vote .voteleft{
			width: 60%;
			height: 100px;
			/* background: #D7DDE4; */
			float: left;
		}
		.center .vote .votecenter{
			width: 20%;
			/* background: #FFA500; */
			float: left;
			height: 100px;
		}
		.center .vote .votecenter p{
			margin-left: 20px;
		}
		.center .vote .voteright{
			width: 20%;
			height: 100px;
			font-size: 20px;
			float: left;
		}
		.center .vote .voteright a{
			display: block;
			text-align: center;
			line-height: 100px;
		}
		.last .page{
			display: block;
			list-style: none;
			margin-left: 40%;
		}
		.last .page a{
			float: left;
			display: block;
			width: 30px;
			height: 30px;
			border: 3px solid orange;
			margin-left: 5px;
			text-align: center;
			line-height: 30px;
			color: orange;
			font-size: 20px;
		}
		.last .page a:hover{
			color: blue;
		}
    </style>
<body>
<%
User us=(User)session.getAttribute("useronline");

%>
    <div class="main">
		<div class="container">
		    <div class="row">
		        <!--//top-->
				<div class="top">
					<div class="col-log-12">
					    <div class="col-lg-2 login" style="background: #5B6270;">
					        <p id="username" class="username"><a href="#"><%=us.getVU_USER_NAME() %></a>,<span>你好!</span></p>
					    </div>
					    <div class="login col-lg-2" style="background: #F5F7F9;">
					        <a class="destory">注销</a>
					    </div>
					    <div class="login col-lg-2">
							<a class="destory">发布投票</a>
						</div>
					    <div class="login col-lg-2">
							<a class="destory">投票维护</a>
						</div>
					    <div class="login col-lg-2">
							<a class="destory">投票查询</a>
						</div>
					    <div class="login col-lg-2"></div>
					</div>
				</div>
		        
		        <!--//center-->
		        <div class="col-log-12">
		            <div class="center">
  <%
  ItemDao itemDao=null;
      ArrayList<SubjectList> sub= (ArrayList<SubjectList>)request.getAttribute("votelist");
      ArrayList<Integer> flag=(ArrayList<Integer>)request.getAttribute("flag");
  int number=sub.size();
       for(int i=0;i<number;i++){  
	 //  out.print("<p>"+sub.get(i).toString()+"</p>");
	    out.print("<div class='vote'>");
	   out.print("<div class='voteleft'>");
	   out.print("<h4>投票内容："+sub.get(i).getVote().getVS_TITLE()+"</h2>");
	   out.print("</div>");
	   out.print("<div class='votecenter'>");
	   out.print("<p>发布者：<span>"+sub.get(i).getUser().getVU_USER_NAME()+"</span> </p>");
	   out.print("</div>");
	   out.print("<div class='voteright'>");
	   if(flag.get(i)<1)
	   out.print("<a href=\""+basePath+"vote/vote?subjectid="+sub.get(i).getVote().getVS_ID()+"\">进入投票</a>");
	   else
		   out.print("<a href='"+basePath+"vote/vote?subjectid="+sub.get(i).getVote().getVS_ID()+"'>查看结果</a>");  
	   out.print("</div>");
	   out.print("</div>"); 
         }
   
  %>
					<!-- 	<div class="vote">
							<div class="voteleft">
								<h4>投票内容：吧啦吧啦吧</h2>
							</div>
							<div class="votecenter">
								<p>发布者：<span>xxx</span> </p>
							</div>
							<div class="voteright">
								<a>进入投票</a>
							</div>
						</div> -->
		
		            </div>
		        </div>
		        <!--//bottom-->
		        <div class="col-log-12">
		            <div class="last">
						<ul class="page">
							<li><a href="#"><<</a> </li>
							<li><a href="#">1</a> </li>
							<li><a href="#">2</a> </li>
							<li><a href="#">>></a> </li>
						</ul>
					</div>
		        </div>
		        <!--//other-->
		        <div class="col-log-12"></div>
		    </div>
		</div>
		
	</div>
  
</body>
</html>
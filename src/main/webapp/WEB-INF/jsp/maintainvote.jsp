<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="pojo.Vote" %>
<%@ page import="pojo.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投票维护</title>
<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
</head>
    <style>
		a:link{
			text-decoration: none;
		}
		.main{
			background: #D7DDE4;
			height: 1000px;
		}
		.top{
			height:100px ;
			width: 100%;
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
		
		}
		.center .vote{
			width: 100%;
			height: 60px;
			background: darkgrey;
			margin-top: 10px;
		}
		.center .vote .voteleft{
			width: 30%;
			height: 60px;
		    line-height: 60px; 
			text-align: center;
			float: left;
		}
		.center .vote .votecenter{
			width: 20%;
			float: left;
			height: 60px;
			line-height: 60px;
			text-align: center;
		}
		.center .vote .number{
			width: 10%;
			height: 60px;
			float: left;
			line-height: 60px;
			text-align: center;
			font-size: 15px;
		}
		.center .vote .statis{
			width: 10%;
			height: 60px;
			float: left;
			line-height: 60px;
			text-align: center;
			font-size: 15px;
		}
		.center .vote .comment{
			width: 10%;
			height: 60px;
			float: left;
			line-height: 60px;
			text-align: center;
			font-size: 15px;
		}
		.center .vote .votecenter p{
			margin-left: 20px;
		}
		.center .vote .voteright{
			width: 20%;
			height: 60px;
			font-size: 20px;
			float: left;
			text-align: center; 
			line-height: 60px;
		}
		.center .vote .voteright a{
			text-align: center;
			line-height: 60px;
			font-size: 15px;
			margin-left: 5px;
			text-decoration: none;
			color: black;
		}
		.center .vote .voteright a:hover{
			color: #008000;
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
			text-decoration: none;
		}
		.last .page a:hover{
			color: blue;
		}
    </style>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"
            +request.getServerName()+":"
            +request.getServerPort()+path+"/";
       %>
<body>
 	
    <div class="main">
		<div class="container">
		    <div class="row">
		        <!--//top-->
				<div class="top">
					<h1>在线投票网站</h1>
					<div class="col-log-12">
					  
					</div>
					 <h2 style="text-align: center;">投票维护</h2>
				</div>
		        
		        <!--//center-->
		        <div class="col-log-12">
		            <div class="center">
						
						<div class="vote" style="background: green;color: white;">
							<div class="voteleft">
								<h4>投票标题</h4>
							</div>
							<div class="votecenter">
								<p>发布者 </p>
							</div>
							<div class="number">
								投票总数
							</div>
							<div class="statis">
								状态
							</div>
							<div class="comment">
								评论数
							</div>
							<div class="voteright">
								<p>操作</p>
							</div>
						</div>
						<%
						   ArrayList<Vote> vote=(ArrayList)request.getAttribute("vote");
						   ArrayList<Integer> votenum=(ArrayList)request.getAttribute("votenum");
						   User user=(User)request.getAttribute("user");
						   for(int i=0;i<vote.size();i++){
							   out.print("<div class='vote'>");
							   out.print("<div class='voteleft'>");
							   out.print("<p>"+vote.get(i).getVS_TITLE()+"</p>");
							   out.print("</div><div class='votecenter'>");
							   out.print("<p>"+user.getVU_USER_NAME()+" </p>");
							   out.print("</div><div class='number'>"+votenum.get(i)+"票</div><div class='statis'>进行中</div>");
							   out.print("<div class='comment'>3</div><div class='voteright'><p>");
							   out.print("<a href='"+basePath+"item/result?subjectid="+vote.get(i).getVS_ID()+"'>统计</a>");
							   out.print("<a href='"+basePath+"vote/deletevote?subjectid="+vote.get(i).getVS_ID()+"'>删除</a>");
							   out.print("<a href='"+basePath+"vote/changevote?subjectid="+vote.get(i).getVS_ID()+"'>修改</a>");
							   out.print("</p></div></div>");
						   }
						%>
						<!-- <div class="vote">
							<div class="voteleft">
								<p>吧啦吧啦吧氨基酸的噶三季度咖喱</p>
							</div>
							<div class="votecenter">
								<p>xxx </p>
							</div>
							<div class="number">
								15票
							</div>
							<div class="statis">
								进行中
							</div>
							<div class="comment">
								3
							</div>
							<div class="voteright">
								<p><a>统计</a><a>删除</a><a>修改</a></p>	
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
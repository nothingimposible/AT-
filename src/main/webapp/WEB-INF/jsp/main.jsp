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
			height: 1200px;
		}
		.top{
			height:70px ;
			background: #008000;
			color: white;
		}
		.top a{
			color: white;
			
		}
		.top a:hover{
			color: #FFA500;
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
			height: 1200px;
			
		}
		.center .vote{
			width: 100%;
			height: 100px;
			background: #A9A9A9;
			border-radius: 50px;
			margin-top: 10px;
			padding-left: 30px;
		}
		.center .vote .voteleft{
			width: 60%;
			height: 100px;
			
			float: left;
		}
		.center .vote .votecenter{
			width: 20%;
			
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
			color: white;
		}
		.center .vote .voteright a:hover{
			color: #FFA500;
		}
		.last .page{
			display: block;
			list-style: none;
			margin-left: 40%;
		}
		.last .page a{
			float: left;
			display: block;
			width: 40px;
			height: 35px;
			background: #343434;
			margin-left: 5px;
			text-align: center;
			line-height: 35px;
			color: white;
			font-size: 20px;
		}
		.last .page a:hover{
			background: #2ecc71;
		}
		.searchbox{
			color: black;
			
		}
		.searchbox input{
		    
			margin-top: 20px;
			display: block;
			float: left;
			height: 30px;
		}
		.searchbox .searchtext{
			width: 200px;
			border-style: none;
			padding-left: 5px;
			border-radius: 5px;
		}
		.searchbox .searchbtn{
			border-style: none;
			margin-left: 2px;
			border-radius: 5px;
			background: #FFA500;
			color: #F5F7F9;
		}
    </style>
<body>
<%
User us=(User)session.getAttribute("useronline");
String name;
String url;
if(us==null){
	name="请登录";
	url="/user/login";
}
else{
	name=us.getVU_USER_NAME();
	url="/vote/votelist";
}
	
%>
    <div class="main">
		<div class="container">
		    <div class="row">
		        <!--//top-->
				<div class="top">
					<div class="col-log-12">
					    <div class="col-lg-2 login">
					        <p id="username" class="username"><a href="${pageContext.request.contextPath }<%=url %>" ><%=name %></a>,<span>你好!</span></p>
					    </div>
					    <div class="login col-lg-2">
					        <a href="${pageContext.request.contextPath }/user/add" class="destory">注册</a>
					        <a href="${pageContext.request.contextPath }/user/logout" style="margin-left:10px" class="destory">注销</a>
					    </div>
					    <div class="login col-lg-2">
					    
							<a href="${pageContext.request.contextPath }/vote/send" class="destory">
							<%
							if(us!=null)
								out.print("发布投票");
							%>		
							</a>
						</div>
					    <div class="login col-lg-2">
					     <a href="${pageContext.request.contextPath }/vote/maintainvote" class="destory">
					    <%
					     if(us!=null){
					    	 out.print("投票维护");
					     }
					    %>
						</a>
						</div>
					     <div class="searchbox col-lg-4">
							<form action="${pageContext.request.contextPath }/vote/search" method="post">
								<input type="text" class="searchtext" name="search" />
								<input type="submit" class="searchbtn"  value="查询" />
							</form>
						</div>
					    
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
	   out.print("<a href='"+basePath+"item/result?subjectid="+sub.get(i).getVote().getVS_ID()+"'>查看结果</a>");  
	   out.print("</div>");
	   out.print("</div>"); 
         }
   
  %>
		
		            </div>
		        </div>
		        <!--//bottom-->
		        <div class="col-log-12">
		            <div class="last">
						<ul class="page">
						<%
						Integer ipage=(Integer)request.getAttribute("page");
					      Integer zpage=(Integer)request.getAttribute("zpage");

						if(ipage>1)
						 out.print("<li><a href=\""+basePath+"vote/votelist?page="+(ipage-1)+"\"><<</a> </li>");
						else
						 out.print("<li><a href=''><<</a> </li>");
						   for(int i=1;i<=zpage;i++){
							   if(i==ipage)
							   out.print("<li><a style='background: #2ecc71;' href=\""+basePath+"vote/votelist?page="+i+"\">"+i+"</a> </li>");
							   else
							   out.print("<li><a href=\""+basePath+"vote/votelist?page="+i+"\">"+i+"</a> </li>");   
						   }
						   if(ipage<zpage)
								 out.print("<li><a href=\""+basePath+"vote/votelist?page="+(ipage+1)+"\">>></a> </li>");
								else
								 out.print("<li><a href=''>>></a> </li>");
						%>
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
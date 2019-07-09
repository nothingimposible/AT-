<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="pojo.User" %>
<%@ page import="pojo.Vote" %>
<%@ page import="pojo.Options" %>
<%@ page import="pojo.CommitText" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投票结果</title>
<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
</head>
	<style>
		.vote{
			width: 60%;
			margin-left: 20%;
			
		
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
		.commitregional{
			width: 60%;
			margin-left: 20%;
			padding: 10px;
			background: white;
			
		}
		.commit{
			width: 100%;
		
		}
		.commit textarea{
			width: 400px;
			height: 200px;
			background: #eeeeee;
			border: none;
		}
		.commit input{
			width: 100px;
			height: 50px;
			border-style: none;
			display: block;
			margin-left: 20%;
			background: #FFA500;
			color: white;
			margin-top: 20px;
		}
		
		.committext li{
			list-style: none;
		}
		.committext h4{
			display: inline-block;
			color: #2ECC71;
		}
		.committext span{
			margin-left: 10px;
			color: #A9A9A9;
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
                     ArrayList<CommitText> ct=(ArrayList)request.getAttribute("ct");
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
						<p name="voteId" id="voteId" style="display: none;"><%=vote.getVS_ID() %></p>
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
					
			<div class="commitregional">
				<div class="committext">
					<h3>评论区</h3>
					<ul id="commitul">
					<%
					if(ct!=null)
					  for(int i=0;i<ct.size();i++){
						  out.print("<li> <h4>"+ct.get(i).getVU_USER_NAME()+"</h4>");
						  out.print("<span>●  "+ct.get(i).getVC_TIME()+"</span>");
						  out.print("<p>"+ct.get(i).getVC_COMMIT()+"</p> </li>");
					  }
					%>
						<!-- <li>
							<h4>吧啦啦啦</h4><span>●  2019年6月15日18:53</span>
							<p>啦啦啦啦啦啦滴滴滴滴滴滴</p>
						</li> -->
					</ul>
				</div>
				
				<div class="commit">
					<textarea name="inputc" id="inputc" placeholder="输入内容"></textarea>
					<%
					  User user=(User)request.getAttribute("user");
					  if(user!=null)
						  out.print("<input type=\"button\" value=\"发布\" onclick=\"sendcommit()\"/>");
					  else
						  out.print("<input type=\"button\" value=\"登录后评论\" style=\"background: red;color: white;\" />");
					%>
					
				</div>
			</div>
					
				</div>
				
			</div>
		</div>
		
		<script type="text/javascript">
		
		function sendcommit(){
			var idtext=document.getElementById("voteId").textContent;
			var text=document.getElementById("inputc").value;
			if(text==null||text.length<1){
				alert("评论不能为空！");
				return false;
			}
			else{
			    $.ajax({
	                type:'post',
	                url:'http://localhost:8081/votesystem/addcommit',
	                dataType:"json",//注意使用的是打他dataType，而不是Content-Type
	                async: true,
	                data:{committext:text,idtext:idtext},
	                success:function(data){
	                   if(data==null){
	                       alert("发表评论失败！");
	                   }
	                   else{
	                    //   alert("发表成功！"+data.VC_COMMIT+data.VU_USER_NAME+data.VC_TIME);
	                       var ul=document.querySelector("#commitul");
	           			var li=document.createElement("li");
	           			var h4=document.createElement("h4");
	           			var span=document.createElement("span");
	           			var p=document.createElement("p");
	           			h4.textContent=data.VU_USER_NAME;
	           			span.textContent="● "+data.VC_TIME;
	           			p.textContent=data.VC_COMMIT;
	           			li.appendChild(h4);
	           			li.appendChild(span);
	           			li.appendChild(p);
	           			ul.appendChild(li);
	           			document.getElementById("inputc").value="";
	                  //  window.location.href ="vote?subjectid="+idtext;
	                   }
	                },
	                error: function(XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
                    }
	            });
			}
		}
		</script>
		
</body>
</html>
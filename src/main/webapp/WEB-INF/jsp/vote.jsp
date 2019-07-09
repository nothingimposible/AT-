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
<title>投票</title>
<!-- 新 Bootstrap4 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
 
<!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
<script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
 
<!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>

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
		.logintop{
			display: block;
		     width: 100%;
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
      ArrayList<Options> option=(ArrayList<Options>)request.getAttribute("option");
      ArrayList<CommitText> ct=(ArrayList<CommitText>)request.getAttribute("ct");
	%>
					<div class="vote">
						<h3>投票</h3>
						<hr />
						<h1><%=vote.getVS_TITLE() %></h1>
					    <p name="voteId" id="voteId" style="display: none;"><%=vote.getVS_ID() %></p>
						  <form action="${pageContext.request.contextPath }/item/additem?voteId=<%=vote.getVS_ID() %>" method="post" class="form_table" id="form_table">
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
							 <input class="btn btn-danger" disabled="disabled" type="submit" value="投票" id="btn_submit" />
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
		
		function choose(inner){
			var choose=inner;
			 if (choose===null||choose===undefined){
			  //  alert("没有获取到");
			  $("#btn_submit").attr("disabled","disabled");
			  $("#btn_submit").removeClass("btn-success");
			  $("#btn_submit").addClass("btn-danger");
			}else{
			 //   alert("获取到"+choose);
			    $("#btn_submit").removeAttr("disabled");
				$("#btn_submit").removeClass("btn-danger");
				$("#btn_submit").addClass("btn-success");
			}
		}
	    $("#form_table").click(function () {
	        var choose1=$("input:checkbox[name='single']:checked").val();
		    var choose2=$("input:radio[name='single']:checked").val();
	        var type=$(".form_table>ul>li>input").attr("type").toLocaleLowerCase();
			//alert(type);
			if(type==="radio"){
				choose(choose2);
			}
			else if(type==="checkbox"){
				choose(choose1);
			}
	    })
</script>
</body>
</html>
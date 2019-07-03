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
		.logintop{
			display: block;
		     width: 100%;
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
					    <p name="voteId" style="display: none;"><%=vote.getVS_ID() %></p>
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
				</div>
			</div>
		</div>
		<script type="text/javascript">
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
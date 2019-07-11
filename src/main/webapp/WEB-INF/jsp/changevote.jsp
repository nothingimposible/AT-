<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.util.ArrayList"%>
<%@ page import="pojo.Vote" %>
<%@ page import="pojo.Options" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投票修改</title>
<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
</head>
	<style>
		.create{
			width: 60%;
			margin-left: 20%;
			height: 400px;
		
		}
		.inputc{
			width: 200px;
			height: 30px;
			border-radius: 5px;
			font-size: 15px;
			border-style: solid;
			padding: 5px;
		}
		#div1 li{
			list-style: none;
			margin-top: 10px;
		}
		#div1 a{
			text-decoration: none;
			width: 50px;
			height: 30px;
			display: block;
			background: green;
			margin-left: 120px;
			margin-top: 10px;
			border-radius: 10px;
			color: white;
			text-align: center;
			line-height: 30px;
		}
		#div1 span{
			font-size: 20px;
		}
		#b{
			width: 80px;
			height: 40px;
			border-radius: 10px;
			background: #008000;
			border-style: none;
			color: #F5F7F9;
		}
        #ul1{
			margin-top: 30px;
		}
		.send{
			width: 300px;
			height: 50px;
			display: block;
			color: white;
			background: #FFA500;
			margin-top: 20px;
			border-style: none;
		}
	</style>
<body >
		<div class="createmain">
			<div class="container">
				<div class="row">
					<div>
						<h1>在线投票网</h1>
					</div>
                    <%
                      Vote vote=(Vote)request.getAttribute("vote");
                      ArrayList<Options> options=(ArrayList)request.getAttribute("options");
                    %>
					<div class="create">
						<h3>修改投票</h3>
						<hr />
						<form action="${pageContext.request.contextPath }/vote/savechange?subjectid=<%=vote.getVS_ID() %>" method="post">
							<div id="div1" >
							<h3>投票标题</h3>
							<input name="VS_TITLE" class="inputc" style="width: 300px;" value="<%=vote.getVS_TITLE()%>"/>
							<ul id="ul1">
							  <%
							   for(int i=0;i<options.size();i++){
								   int d=i+1;
								   out.print("<li id='"+i+"'>");
								   out.print("<span id='spa"+i+"'>选项"+d+"</span>");
								   
								   out.print("<input class='inputc' id='inp"+i+"' name='lis["+i+"].VO_TITLE' value='"+options.get(i).getVO_TITLE()+"' >");
								   out.print("<a id='a"+i+"' href=\"javascript:del('"+i+"'); \">删除</a> </li> ");
								   
							   }
							  %>
							</ul>
							</div>
							<button type="button" id="b" onclick="s()">增加选项</button>
							
							<p style="margin-top: 20px;font-size: 20px;">单选/多选:</p>
							<span>单选</span>
							<%
							  String rad1="";
							  String rad2="";
							  if(vote.getVS_TYPE()==1)
								  rad1="checked=\"checked\"";
							  else if(vote.getVS_TYPE()==2)
								  rad2="checked=\"checked\"";
							%>
							<input type="radio" name="VS_TYPE" value=1 <%=rad1 %>/>
							<span  style="margin-left: 20px;">多选</span>
							<input type="radio" name="VS_TYPE" value=2 <%=rad2 %>/>
							
							<h4 style="margin-top: 20px;">截止时间</h4>
                            <input id="VS_TIME" name="VS_TIME" type="datetime-local" value="2019-07-10T13:59" min="2018-09-16" max="2030-09-26"/>
							<input type="submit" value="保存修改" class="send"/>
						</form>
						<hr />
					</div>
				</div>
			</div>
		</div>
		
			<script type="text/javascript">
			var  b=document.querySelector("#ul1")
			var originid=0;
			if(getid("ul1").getElementsByTagName("li").length>0)
			originid=getid("ul1").getElementsByTagName("li").length-1;
			function s(){
			var inp=document.createElement("input");
			var a1=document.createElement("a");
			var li=document.createElement("li");
			var spa=document.createElement("span");
			var num=getid("ul1").getElementsByTagName("li").length;
			
		    var id=0;
		    var nameid=originid;
			var nameid1=0;
			if(num>0){
				var nu=parseInt(getid("ul1").getElementsByTagName("li")[num-1].id);
				nameid1=getid("ul1").getElementsByTagName("li")[num-1].childNodes[1].name;
				nameid=parseInt(nameid1.substring(4,nameid1.length-10))+1;
				id=nu+1;
			}
			var num1=parseInt(num)+1;
		    spa.id="spa"+id;
			spa.textContent="选项"+num1;
			li.id=id;
			a1.innerHTML="删除";
			a1.href="javascript:del('"+id+"');";
			a1.id="a"+id;
			inp.name="lis["+nameid+"].VO_TITLE";
			inp.id="inp"+id;
			
			inp.className="inputc";
			li.appendChild(spa);
			li.appendChild(inp);
			b.appendChild(li);
			li.appendChild(a1);
			}
			
			function getid(id){
				var d=document.getElementById(id);
				return d;
			}
			function del(id){
				getid("ul1").removeChild(getid(id));
				var leng=getid("ul1").getElementsByTagName("li").length;
				for(i=parseInt(id);i<getid("ul1").getElementsByTagName("li").length;i++){
					var aa="a"+getid("ul1").getElementsByTagName("li")[i].id;
					var inp="inp"+getid("ul1").getElementsByTagName("li")[i].id;
					var spa="spa"+getid("ul1").getElementsByTagName("li")[i].id;
					var aa2=parseInt(getid("ul1").getElementsByTagName("li")[i].id)-1;
				    var num=parseInt(getid("ul1").getElementsByTagName("li")[i].id);
					getid(aa).href="javascript:del('"+aa2+"');";
					getid(aa).id="a"+aa2;
					getid(inp).id="inp"+aa2;
					getid(spa).textContent="选项"+num;
					getid(spa).id="spa"+aa2;
					
					
					getid("ul1").getElementsByTagName("li")[i].id=parseInt(getid("ul1").getElementsByTagName("li")[i].id)-1;
				}
			}
		//	b.addEventListener("click",s);
		</script>
	</body>
</html>
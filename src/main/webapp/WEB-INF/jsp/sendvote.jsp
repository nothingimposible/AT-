<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
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
		#VS_TIME{
			width:250px;
			height:30px;
			font-size:20px;
			border:2px solid green;
			display: block;
			border-radius: 5px;
			margin-top: 20px;
		}
	</style>
<body onload="s()">
		<div class="createmain">
			<div class="container">
				<div class="row">
					<div>
						<h1>在线投票网</h1>
					</div>

					<div class="create">
						<h3>创建投票</h3>
						<hr />
						<form action="${pageContext.request.contextPath }/vote/addvote" method="post">
							<div id="div1" >
							<h3>投票标题</h3>
							<input name="VS_TITLE" class="inputc" style="width: 300px;"/>
							<ul id="ul1"></ul>
							</div>
							<button type="button" id="b" onclick="s()">增加选项</button>
							
							<p style="margin-top: 20px;font-size: 20px;">单选/多选:</p>
							<span>单选</span>
							<input type="radio" name="VS_TYPE" value=1 checked="checked"/>
							<span  style="margin-left: 20px;">多选</span>
							<input type="radio" name="VS_TYPE" value=2 />

							<h4 style="margin-top: 20px;">截止时间</h4>
                            <input id="VS_TIME" name="VS_TIME" type="datetime-local" value="2019-07-10T13:59" min="2018-09-16" max="2030-09-26"/>
							<input type="submit" value="发布投票" class="send"/>
						</form>
						<hr />
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			var  b=document.querySelector("#ul1")
			function s(){
			var inp=document.createElement("input");
			var a1=document.createElement("a");
			var li=document.createElement("li");
			var spa=document.createElement("span");
			var num=getid("ul1").childNodes.length;
		    var id=0;
			if(num>0){
				var nu=parseInt(getid("ul1").childNodes[num-1].id);
				id=nu+1;
			}
			var num1=parseInt(num)+1;
		    spa.id="spa"+id;
			spa.textContent="选项"+num1;
			li.id=id;
			a1.innerHTML="删除";
			a1.href="javascript:del('"+id+"');";
			a1.id="a"+id;
			inp.name="lis["+id+"].VO_TITLE";
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
				var linumber=getid("ul1").getElementsByTagName("li").length;
				if(linumber>2){
				getid("ul1").removeChild(getid(id));
				for(i=parseInt(id);i<getid("ul1").childNodes.length;i++){
					var aa="a"+getid("ul1").childNodes[i].id;
					var inp="inp"+getid("ul1").childNodes[i].id;
					var spa="spa"+getid("ul1").childNodes[i].id;
					var aa2=parseInt(getid("ul1").childNodes[i].id)-1;
				    var num=parseInt(getid("ul1").childNodes[i].id);
					getid(aa).href="javascript:del('"+aa2+"');";
					getid(aa).id="a"+aa2;
					getid(inp).name="lis["+aa2+"].VO_TITLE";
					getid(spa).textContent="选项"+num;
					getid(spa).id="spa"+aa2;
					getid("ul1").childNodes[i].id=parseInt(getid("ul1").childNodes[i].id)-1;
				}
				}else{
					alert("不能再删了");
				}
			}
		//	b.addEventListener("click",s);
		</script>
	</body>
</html>
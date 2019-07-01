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
		.login{
			width: 60%;
			margin-left: 20%;
			height: 400px;
		
		}
		.login .item{
			margin-left: 25%;
			margin-top: 50px;
			font-size: 20px;
		}
		.login .item input{
			width: 250px;
			height: 40px;
			border-radius: 5px;
			border-color: #5B6270;
			padding-left: 8px;
		}
		.login .item2 input{
			margin-left: 20%;
			display: block;
			width: 100px;
			height: 40px;
			border-radius: 10px;
			background: orange;
			border-style: none;
		}
	</style>
<body>
	
		<div class="loginmain">
			<div class="container">
				<div class="row">
					<div class="logintop">
						<h1>在线投票网</h1>
					</div>

					<div class="login">
						<h3>用户登录</h3>
						<hr />
						<form action="${pageContext.request.contextPath }/user/loginjudge" method="post">
							<div class="item">
								<span>账号/用户名</span>
								<input type="text" name="VU_USER_ID" placeholder="输入用户名..."/>
							</div>
							<div class="item">
								<span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</span>
								<input type="text" name="VU_PASSWORD" placeholder="输入密码..."/>
							</div>
							<div class="item item2">
								<input type="submit" value="登录" />
							</div>

						</form>
						<hr />
					</div>
				</div>
			</div>
		</div>
</body>
</html>
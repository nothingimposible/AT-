<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

					<div class="vote">
						<h3>投票结果</h3>
						<hr />
						<h1>黑界知名家族最新排名</h1>
						<form action="" method="post">
							<ul>
								<li>
								   <label>选项1(56.15%,89票)</label>
								   <div class="len" style="width: 56.15%"></div>
								</li>
								<li>
								   <label>选项1</label>
								    <div class="len" style="width: 12.36%;"></div>
								</li>
								<li>
								    <label>选项1</label>
									 <div class="len" style="width: 32.15%;"></div>
								</li>
							</ul>
							<h4 style="margin-top: 20px;">总票数：156票</h4>
						</form>
						
						
						<hr />
					</div>
				</div>
			</div>
		</div>
</body>
</html>
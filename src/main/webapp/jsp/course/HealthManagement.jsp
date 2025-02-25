<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>享健你，遇見更好的自己．</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/gymstyle.css">
</head>
<body>
	<div id="header">
		<h1>享健你，遇見更好的自己．</h1>
		<h2>你，今天健了嗎？</h2>
	</div>
	<div id="navigation">
		<ul>
			<li><a href="HealthManagement.jsp" class="active">首頁</a></li>
			<li><a href="#">會員管理</a></li>
			<li><a href="#">商城購物</a></li>
			<li><a href="#">健身成效</a></li>
			<li><a href="index.jsp">課程管理</a></li>
			<li><a href="#">社群論壇</a></li>
		</ul>
	</div>
	<div id="content">
		<h1>Important</h1>

		<p>
			Licensed under the <a
				href="http://creativecommons.org/licenses/by/2.5/">Creative
				Commons Attribution 2.5</a>. I have left the actual text design style
			very basic for you to add your own text / header / quotes / list etc.
			styles yourself. You MUST retain the backlink to my site (
			www.edg3.co.uk ) at the bottom.
		</p>

		<h1>About</h1>

		<p>
			Designed by Christopher Robinson of <a href="http://www.edg3.co.uk/">EDG3</a>.
		</p>

		<p>
			This template would be great as a simple personal site, you are free
			to use this design for whatever purpose you wish as long as you do <strong>NOT</strong>
			sell it or claim it as your own and you leave the link back to my
			site at the bottom of your pages.
		</p>

		<p>This design uses no images whatsoever so this page loads
			extremely fast!</p>

		<h1>header two</h1>

		<p>Volutpat at varius sed sollicitudin et, arcu. Vivamus viverra.
			Nullam turpis. Vestibulum sed etiam. Lorem ipsum sit amet dolore.
			Nulla facilisi. Sed tortor. Aenean felis. Quisque eros. Cras lobortis
			commodo metus. Vestibulum vel purus. In eget odio in sapien
			adipiscing blandit. Quisque augue tortor, facilisis sit amet,
			aliquam, suscipit vitae, cursus sed, arcu lorem ipsum dolor sit amet.

		</p>
		<h1>header three</h1>

		<p>Volutpat at varius sed sollicitudin et, arcu. Vivamus viverra.
			Nullam turpis. Vestibulum sed etiam. Lorem ipsum sit amet dolore.
			Nulla facilisi. Sed tortor. Aenean felis. Quisque eros. Cras lobortis
			commodo metus. Vestibulum vel purus. In eget odio in sapien
			adipiscing blandit. Quisque augue tortor, facilisis sit amet,
			aliquam, suscipit vitae, cursus sed, arcu lorem ipsum dolor sit amet.

			Fermentum at, varius pretium, elit. Mauris egestas scelerisque nunc.
			Mauris non ligula quis wisi laoreet malesuada. In commodo. Maecenas
			lobortis cursus dolor.</p>
	</div>
	
</body>
<script>
    // 選擇所有的 <a> 元素
    const links = document.querySelectorAll("#navigation a");

    // 為每個 <a> 元素添加點擊事件
    links.forEach(link => {
        link.addEventListener("click", function(event) {
            // 移除所有其他 <a> 元素的 'active' 類別
            links.forEach(link => link.classList.remove("active"));

            // 為當前點擊的 <a> 元素添加 'active' 類別
            this.classList.add("active");
        });
    });
</script>
</html>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<!-- Webix Library -->
	<script type="text/javascript" src="./webix/webix.js"></script>
	<link rel="stylesheet" type="text/css" href="./webix/skins/mini.css">

	<!-- App -->
	<script type="text/javascript" src="./codebase/app.js"></script>
	<link rel="stylesheet" type="text/css" href="./codebase/app.css">

	<script src="./webix/justgage.js"></script>

	<script type="text/javascript">
		webix.ready(function(){
			if (webix.CustomScroll)
				webix.CustomScroll.init();

			const app = new csms.App();
			app.render(document.body);
		});
	</script>
</head>
<body></body>
</html>
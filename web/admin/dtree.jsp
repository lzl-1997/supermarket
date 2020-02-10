<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<link rel="StyleSheet" href="../css/dtree2.05.css" type="text/css" />
    <script type="text/javascript" src="../js/dtree.js"></script>

    <style>
        body {background-color: #E6E6E6;margin: 0px;text-align:left;}
        td {font-size:12px;color:#303030;line-height:20px;}
        a:link,a:visited {color:#012F68;text-decoration: none;}
        a:hover {color: #406EA8;text-decoration:none}
    </style>
</head>
<body>
<table width="100" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td>
<div class="dtree">

	<a href="javascript: d.openAll();">展开所有</a> || <a href="javascript: d.closeAll();">关闭所有</a>
	
	<script type="text/javascript">
	
		d = new dTree('d');
		d.add('01',-1,'系统菜单');

		d.add('0102','01','用户管理','','','mainFrame');
		d.add('010201','0102','&nbsp;&nbsp;&nbsp;用户列表','/FindUserByPageServlet','','mainFrame');

		d.add('0103','01','商品管理');
        d.add('010301','0103','&nbsp;&nbsp;&nbsp;商品列表','/FindProductByPageServlet','','mainFrame');

        // d.add("0104","01","信息管理");
        // d.add('010401','0104','&nbsp;&nbsp;&nbsp;我的消息','','','mainFrame');
        // d.add('010402','0104','我的消息','/FindProductByPageServlet','','mainFrame');

        document.write(d);
		
	</script>
</div>	</td>
  </tr>
</table>
</body>
</html>

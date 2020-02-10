<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>查询商品列表</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <style type="text/css">
        td,th{
            text-align: center;
        }
    </style>
    <script>
        window.onload=function () {
            document.getElementById("deleteSelected").onclick=function () {
                var flag = false;
                var pids = document.getElementsByName("pid");
                for (var i = 0; i < pids.length; i++) {
                    if (pids[i].checked) {
                        flag = true;
                        break;
                    }
                }
                if (flag) {
                    //确认后在提交
                    if (confirm("你确定要删除吗？")) {
                        //表单提交
                        document.getElementById("form").submit();
                    }
                }
            };
            document.getElementById("checkid").onclick = function () {

                var pids = document.getElementsByName("pid");
                for (var i = 0; i < pids.length; i++) {
                    pids[i].checked = this.checked;
                }
            }
        }
        function deleteProduct(pid) {
            if(confirm("你确定删除吗？")){
            window.location.href="${pageContext.request.contextPath}/DeleteProductServlet?pid="+pid;
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h3 align="center">产品信息列表</h3><br><br>
    <div style="float: left">
        <form class="form-inline" action="${pageContext.request.contextPath}/FindProductByPageServlet" method="post">
            商品名<input type="text" class="form-control" name="pname" value="${requestScope.condition.pname[0]}">
            &nbsp;&nbsp;&nbsp;&nbsp;
            种类<input type="text" class="form-control" name="kind" value="${requestScope.condition.kind[0]}">
            <input type="submit" class="btn btn-default" value="查询">
        </form>
    </div>
    <div style="float: right"><a class="btn btn-primary" href="admin/product/add.jsp">添加商品</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="deleteSelected">删除选中</a>
    </div>
    <br><br>
    <form action="${pageContext.request.contextPath}/DeleteSelectedProductServlet" id="form" method="post">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th><input type="checkbox" id="checkid"></th>
                <th>编号</th>
                <th>商品名</th>
                <th>价格</th>
                <th>库存</th>
                <th>种类</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageBean.list}" var="product" varStatus="s">
                <tr>
                    <td><input type="checkbox" name="pid" value="${product.pid}"></td>
                    <td>${s.count}</td>
                    <td>${product.pname}</td>
                    <td>${product.price}</td>
                    <td>${product.count}</td>
                    <td>${product.kind}</td>
                    <td>
                        <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/FindProductServlet?pid=${product.pid}">修改</a>
                        <a class="btn btn-default btn-sm" href="javascript:deleteProduct('${product.pid}')">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>
    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">

                <li>

                <c:choose>

                <c:when test="${pageBean.currentPage==1}">
                    <a hidden href="${pageContext.request.contextPath}/FindProductByPageServlet?currentPage=${pageBean.currentPage}&count=5&pname=${requestScope.condition.pname[0]}&kind=${requestScope.condition.kind[0]}" aria-label="Next" aria-hidden="true">
                        <span aria-hidden="true" hidden>&laquo;</span>
                    </a>
                    </c:when>
                <c:when test="${pageBean.currentPage>1}">
                    <a href="${pageContext.request.contextPath}/FindProductByPageServlet?currentPage=${pageBean.currentPage-1}&count=5&pname=${requestScope.condition.pname[0]}&kind=${requestScope.condition.kind[0]}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                    </c:when>

                </c:choose>

                </li>


                <c:forEach begin="1" end="${pageBean.totalPage}" var="i">

                    <c:if test="${pageBean.currentPage==i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/FindProductByPageServlet?currentPage=${i}&count=5&pname=${requestScope.condition.pname[0]}&kind=${requestScope.condition.kind[0]}">${i}</a></li>
                    </c:if>

                    <c:if test="${pageBean.currentPage!=i}">
                        <li><a href="${pageContext.request.contextPath}/FindProductByPageServlet?currentPage=${i}&count=5&pname=${requestScope.condition.pname[0]}&kind=${requestScope.condition.kind[0]}">${i}</a></li>
                    </c:if>

                </c:forEach>


                <li>
                <c:choose>
                    <c:when test="${pageBean.currentPage==pageBean.totalPage}">
                        <a hidden href="${pageContext.request.contextPath}/FindProductByPageServlet?currentPage=${pageBean.currentPage}&count=5&pname=${requestScope.condition.pname[0]}&kind=${requestScope.condition.kind[0]}" aria-label="Next" aria-hidden="true">
                            &raquo;
                        </a>
                    </c:when>
                    <c:when test="${pageBean.currentPage<pageBean.totalPage}">
                        <a href="${pageContext.request.contextPath}/FindProductByPageServlet?currentPage=${pageBean.currentPage+1}&count=5&pname=${requestScope.condition.pname[0]}&kind=${requestScope.condition.kind[0]}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </c:when>
                </c:choose>
                </li>

                <span style="font-size: 25px">共${pageBean.totalCount}条记录，一共${pageBean.totalPage}页</span>
            </ul>
        </nav>
    </div>
</div>
</body>
</html>
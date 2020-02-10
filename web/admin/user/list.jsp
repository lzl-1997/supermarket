<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>查询用户列表</title>
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
                var ids = document.getElementsByName("id");
                for (var i = 0; i < ids.length; i++) {
                    if (ids[i].checked) {
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

                var ids = document.getElementsByName("id");
                for (var i = 0; i < ids.length; i++) {
                    ids[i].checked = this.checked;
                }
            }
            document.getElementsByName("id").onclick = function () {

                var ids = document.getElementsByName("id");
                var checkid = document.getElementById("checkid");
                for (var i = 0; i < ids.length; i++) {
                    if (!(this.checked)){
                        checkid.prop("checked",false)
                    }
                }
            }
        }
        function deleteuser(id) {
            if(confirm("你确定删除吗？")){
            window.location.href="${pageContext.request.contextPath}/DeleteUserServlet?id="+id;
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h3 align="center">用户信息列表</h3><br><br>
    <div style="float: left">
        <form class="form-inline" action="${pageContext.request.contextPath}/FindUserByPageServlet" method="post">
            用户名<input type="text" class="form-control" name="username" value="${requestScope.condition.username[0]}">
            电话<input type="text" class="form-control" name="phone" value="${requestScope.condition.phone[0]}">
            邮箱<input type="text" class="form-control" name="email" value="${requestScope.condition.email[0]}">
            <input type="submit" class="btn btn-default" value="查询">
            
        </form>
    </div>
    <div style="float: right"><a class="btn btn-primary" href="admin/user/add.jsp">添加用户</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="deleteSelected">删除选中</a>
    </div>
    <br><br>
    <form action="${pageContext.request.contextPath}/DeleteSelectedUserServlet" id="form" method="post">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th><input type="checkbox" id="checkid"></th>
                <th>用户名</th>
                <th>电话</th>
                <th>性别</th>
                <th>邮箱</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageBean.list}" var="user" varStatus="s">
                <tr>
                    <td><input type="checkbox" name="id" value="${user.id}"></td>
                    <td>${user.username}</td>
                    <td>${user.phone}</td>
                    <td>${user.sex}</td>
                    <td>${user.email}</td>
                    <td>
                        <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/FindUserServlet?id=${user.id}">修改</a>
                        <a class="btn btn-default btn-sm" href="javascript:deleteuser('${user.id}')">删除</a>
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
                    <a hidden href="${pageContext.request.contextPath}/FindUserByPageServlet?currentPage=${pageBean.currentPage}&count=5&username=${requestScope.condition.username[0]}&phone=${requestScope.condition.phone[0]}&email=${requestScope.condition.email[0]}" aria-label="Next" aria-hidden="true">
                        <span aria-hidden="true" hidden>&laquo;</span>
                    </a>
                    </c:when>
                <c:when test="${pageBean.currentPage>1}">
                    <a href="${pageContext.request.contextPath}/FindUserByPageServlet?currentPage=${pageBean.currentPage-1}&count=5&username=${requestScope.condition.username[0]}&phone=${requestScope.condition.phone[0]}&email=${requestScope.condition.email[0]}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                    </c:when>

                </c:choose>

                </li>


                <c:forEach begin="1" end="${pageBean.totalPage}" var="i">

                    <c:if test="${pageBean.currentPage==i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/FindUserByPageServlet?currentPage=${i}&count=5&username=${requestScope.condition.username[0]}&phone=${requestScope.condition.phone[0]}&email=${requestScope.condition.email[0]}">${i}</a></li>
                    </c:if>

                    <c:if test="${pageBean.currentPage!=i}">
                        <li><a href="${pageContext.request.contextPath}/FindUserByPageServlet?currentPage=${i}&count=5&username=${requestScope.condition.username[0]}&phone=${requestScope.condition.phone[0]}&email=${requestScope.condition.email[0]}">${i}</a></li>
                    </c:if>

                </c:forEach>


                <li>
                <c:choose>
                    <c:when test="${pageBean.currentPage==pageBean.totalPage}">
                        <a hidden href="${pageContext.request.contextPath}/FindUserByPageServlet?currentPage=${pageBean.currentPage}&count=5&username=${requestScope.condition.username[0]}&phone=${requestScope.condition.phone[0]}&email=${requestScope.condition.email[0]}" aria-label="Next" aria-hidden="true">
                            &raquo;
                        </a>
                    </c:when>
                    <c:when test="${pageBean.currentPage<pageBean.totalPage}">
                        <a href="${pageContext.request.contextPath}/FindUserByPageServlet?currentPage=${pageBean.currentPage+1}&count=5&username=${requestScope.condition.username[0]}&phone=${requestScope.condition.phone[0]}&email=${requestScope.condition.email[0]}" aria-label="Next">
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
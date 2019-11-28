
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>查看评论</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/lib/bootstrap-4.3.1-dist/css/bootstrap.min.css">
</head>
<body>

<div class="card m-auto" style="width: 60%;">
    <div class="card-header">
        评论
    </div>
    <div class="card-body">
        <h4 class="card-title">${title}</h4>
        <div class="row">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>评论编号</th>
                    <th>评论内容</th>
                    <th>评论人</th>
                    <th>评论时间</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${comments}" var="comment">
                    <tr>
                        <td width="15%">${comment.id}</td>
                        <td width="45%">${comment.content}</td>
                        <td width="20%">${comment.author}</td>
                        <td width="20%"><fmt:formatDate value="${comment.createdate}" pattern="yyyy-MM-dd HH:ss"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <a href="${pageContext.request.contextPath}/list" class="btn btn-primary">返回新闻列表</a>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/static/lib/jquery-3.4.1.min.js"></script>

<script src="${pageContext.request.contextPath}/static/lib/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<script>

</script>
</body>
</html>

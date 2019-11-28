<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>新闻列表</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/lib/bootstrap-4.3.1-dist/css/bootstrap.min.css">
</head>
<body>

<div class="card m-auto" style="width: 70%;">
    <div class="card-header">
        新闻列表
    </div>
    <div class="card-body">
        <div class="row" style="margin-bottom: 20px; ">
            <div class="input-group col-4">
                <input type="text" class="form-control" id="search-input" placeholder="按新闻标题查询" value="${param.search}">
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="button" id="search">查询</button>
                </div>
            </div>
        </div>
        <div class="row">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>新闻编号</th>
                    <th>新闻标题</th>
                    <th>新闻摘要</th>
                    <th>作者</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="news">
                    <tr>
                        <td width="5%">${news.id}</td>
                        <td width="20%">${news.title}</td>
                        <td width="40%">${news.summary}</td>
                        <td width="10%">${news.author}</td>
                        <td width="10%"><fmt:formatDate value="${news.createdate}" pattern="yyyy-MM-dd HH:ss"/></td>
                        <td width="15%">
                            <a href="${pageContext.request.contextPath}/comment?newsid=${news.id}">查看评论</a>
                            <a href="${pageContext.request.contextPath}/add?newsid=${news.id}">评论</a>
                            <a href="" data-toggle="modal" data-target="#exampleModal">删除</a>
                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">系统提示</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            确定要删除该新闻及其所有评论吗?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" value="${news.id}"
                                                    id="del-button">确定
                                            </button>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal -->
                            <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
                                 aria-labelledby="deleteModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="deleteModalLabel">系统提示</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            删除失败
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">确定
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/static/lib/jquery-3.4.1.min.js"></script>

<script src="${pageContext.request.contextPath}/static/lib/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>

<script>
    $('#search').click(function () {
        let value = $('#search-input').val();
        if (value != null && value != '') {
            window.location.href = "${pageContext.request.contextPath}/list?search=" + value;
        } else {
            window.location.href = "${pageContext.request.contextPath}/list"
        }

    });
    $('#del-button').click(function () {
        let value = $('#del-button').val();
        $.ajax({
            url: '${pageContext.request.contextPath}/delete',
            type: 'post',
            dataType: 'json',
            data: {
                newsid: value
            },
            success(result) {
                if (result == true) {
                    window.location.href = "${pageContext.request.contextPath}/list";
                } else {
                    $("#exampleModal").modal('hide');
                    $("#deleteModal").modal('show');
                }
            }
        })
    });
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/27 0027
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加评论</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/lib/bootstrap-4.3.1-dist/css/bootstrap.min.css">
</head>
<body>

<div class="card m-auto" style="width: 50%;">
    <div class="card-header">
        增加评论
    </div>
    <div class="card-body">
        <form  id="comment-form">
            <div class="row" style="margin-top: 20px;margin-bottom: 20px;">
                <div class="col-4" style="text-align: right">
                    评论内容
                </div>
                <textarea class="col-4" rows="5" name="content"></textarea>
                <div class="col-4" style="color: red"></div>
            </div>
            <div class="row" style="margin-bottom: 20px;">
                <div class="col-4" style="text-align: right">
                    评论人
                </div>
                <input type="text" class="col-4" name="author">
            </div>
            <div class="row" style="margin-bottom: 20px;">
                <div class="offset-4 col-4">
                    <input type="submit" class="btn btn-primary">
                    <a href="${pageContext.request.contextPath}/list" class="btn btn-primary">返回</a>
                </div>
            </div>
        </form>

    </div>

</div>


<script src="${pageContext.request.contextPath}/static/lib/jquery-3.4.1.min.js"></script>

<script src="${pageContext.request.contextPath}/static/lib/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/lib/jquery.validate.js"></script>
<script>
    $("#comment-form").validate({
        rules:{
            content:{
                required:true
            }
        },
        messages:{
            content:{
                required:'评论内容必填'
            }
        },
        errorPlacement:function(error,input){
            input.next().append(error)
        },
        submitHandler:function(form){
            $.ajax({
                url:'${pageContext.request.contextPath}/add?newsid='+${param.newsid},
                type:'post',
                dataType:'json',
                data:$(form).serialize(),
                success(result){
                    if(result == true){
                        window.location.href = "${pageContext.request.contextPath}/comment?newsid="+${param.newsid};
                    }else{
                        window.location.href = "${pageContext.request.contextPath}/list";
                    }
                }
            })
        }
    });
</script>
</body>
</html>

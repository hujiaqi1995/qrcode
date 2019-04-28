<html>
<head>
    <meta charset="utf-8">
    <title>错误页面</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="alert alert-dismissable alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4>发生错误!</h4>
                <#--<h4>"url: ${url}"</h4>-->
                <a href="/device/list" class="alert-link">2s后自动跳转</a>
            </div>
        </div>
    </div>
</div>

</body>

<script>
    setTimeout('location.href="/device/list"', 2000);
</script>

</html>
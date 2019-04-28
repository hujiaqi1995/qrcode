<html>
<head>
    <meta charset="UTF-8" name="viewport">
    <title>设备编辑</title>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .divForm{
            position: fixed;/*绝对定位*/
            width: 1000px;
            height: 800px;
            top: 50%;
            left: 50%;
            margin-top: -250px;
            margin-left: -300px;
        }
        .footer {
            left: 0px;
            position: fixed;
            width: 100%;
            height: 40px;
            text-align: center;
            font-size: 14px;
            /*font-weight:bold;*/
            bottom: 0px;
        }
        html{
            height: 100%;
            width: 100%;
        }

        body {
            position: absolute;
            margin: 0 auto;
            height:100%;
            width: 100%;
        }

        .out {
            width: 10em;
            height: 100%;
            background-color: #2f3e4e;
            position: fixed;
            top: 80px;
        }
        .nav ul {
            margin: 0;padding: 0;
            list-style-type: none;
            line-height: 3em;
        }

        .nav a {
            /*padding: 3px;*/
            display: block;
            width: 10em;
            text-decoration: none;
            background-color: #2f3e4e;
            color: #ffffff;
        }

        .nav a:hover {
            background-color: #4c6375;
            cursor: pointer;
        }
        #companyName {
            text-align: center;
            /*background: #72beda;*/
            background: #2f3e4e;
            height: 80px;
            width: 100%;
            line-height: 80px;
            font-size: xx-large;
            color: #ffffff;
            position: fixed;
        }
    </style>

</head>

<body>
<div class="row" id="companyName">
    <div id="name">杭州铁路职工培训基地资产录入系统</div>
</div>

<div class="row">
    <div class="col-xs-3 col-md-2">
        <#include "../common/left-nav.ftl">
    </div>
    <div class="col-xs-12 col-sm-6 col-md-8">
        <div class="divForm">
            <form action="/device/modify" method="post" class="form-horizontal">
                <div class="form-group">
                    <div for="fordeviceId" class="col-sm-2 control-label">设备编号:</div>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="fordeviceId" name="deviceId" value="${dto.getId()}" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <div for="fordeviceName" class="col-sm-2 control-label">设备名称:</div>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="fordeviceName" name="deviceName" value="${dto.getDeviceName()}" required>
                    </div>
                </div>
                <div class="form-group">
                    <div for="fordeviceDate" class="col-sm-2 control-label">购置日期:</div>
                    <div class="col-sm-4">
                        <input type="date" class="form-control" id="fordeviceDate" name="date" value="${dto.getDate()}" required>
                    </div>
                </div>
                <div class="form-group">
                    <div for="fordevicePrice" class="col-sm-2 control-label">对内造价:</div>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="fordevicePrice" name="price" value="${dto.getPrice()}" required>
                    </div>
                </div>
                <div class="form-group">
                    <div for="fordeviceAddress" class="col-sm-2 control-label">存放地址:</div>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="fordeviceAddress" name="address" value="${dto.getAddress()}" required>
                    </div>
                </div>
                <div class="form-group">
                    <div for="fordevicePrincipal" class="col-sm-2 control-label">责任人:</div>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="fordevicePrincipal" name="principal" value="${dto.getPrincipal()}" required>
                    </div>
                </div>
                <div class="form-group">
                    <div for="forcategory" class="col-sm-2 control-label">资产类别:</div>
                    <div class="col-sm-4">
                        <select name="category" id="forcategory">
                            <option value="固定">固定</option>
                            <option value="低值易耗品">低值易耗品</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-4">
                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary">保存</button>
                            <a class="btn btn-info" href="/device/list" role="button">取消</a>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

    <h1 class="footer">
        浙江华扩科技有限公司<br/>
    </h1>

</body>
</html>
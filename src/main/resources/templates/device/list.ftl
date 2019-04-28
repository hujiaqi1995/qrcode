<!DOCTYPE html>
<html lang="zh-CN" xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="UTF-8" name="viewport">
    <title>设备列表</title>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/body.css" rel="stylesheet"/>
    <script>
        //打印表格
        var idTmr;

        function getExplorer() {
            var explorer = window.navigator.userAgent;
            //ie
            if (explorer.indexOf("MSIE") >= 0) {
                return 'ie';
            }
            //firefox
            else if (explorer.indexOf("Firefox") >= 0) {
                return 'Firefox';
            }
            //Chrome
            else if (explorer.indexOf("Chrome") >= 0) {
                return 'Chrome';
            }
            //Opera
            else if (explorer.indexOf("Opera") >= 0) {
                return 'Opera';
            }
            //Safari
            else if (explorer.indexOf("Safari") >= 0) {
                return 'Safari';
            }
        }

        function method5(tableid) {
            if (getExplorer() == 'ie') {
                var curTbl = document.getElementById(tableid);
                var oXL = new ActiveXObject("Excel.Application");
                var oWB = oXL.Workbooks.Add();
                var xlsheet = oWB.Worksheets(1);
                var sel = document.body.createTextRange();
                sel.moveToElementText(curTbl);
                sel.select();
                sel.execCommand("Copy");
                xlsheet.Paste();
                oXL.Visible = true;

                try {
                    var fname = oXL.Application.GetSaveAsFilename("Excel.xls",
                            "Excel Spreadsheets (*.xls), *.xls");
                } catch (e) {
                    print("Nested catch caught " + e);
                } finally {
                    oWB.SaveAs(fname);
                    oWB.Close(savechanges = false);
                    oXL.Quit();
                    oXL = null;
                    idTmr = window.setInterval("Cleanup();", 1);
                }

            } else {
                tableToExcel(tableid)
            }
        }

        function Cleanup() {
            window.clearInterval(idTmr);
            CollectGarbage();
        }

        var tableToExcel = (function () {
            var uri = 'data:application/vnd.ms-excel;base64,',
                    template = '<html><head><meta charset="UTF-8"></head><body><table  border="1">{table}</table></body></html>',
                    base64 = function (
                            s) {
                        return window.btoa(unescape(encodeURIComponent(s)))
                    },
                    format = function (s, c) {
                        return s.replace(/{(\w+)}/g, function (m, p) {
                            return c[p];
                        })
                    }
            return function (table, name) {
                if (!table.nodeType)
                    table = document.getElementById(table)
                var ctx = {
                    worksheet: name || 'Worksheet',
                    table: table.innerHTML
                }
                window.location.href = uri + base64(format(template, ctx))
            }
        })()
    </script>
    <style type="text/css">
        html {
            height: 100%;
            width: 100%;
        }

        body {
            position: absolute;
            margin: 0 auto;
            height: 100%;
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
            margin: 0;
            padding: 0;
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

        .container {
            position: fixed; /*绝对定位*/
            top: 15%;
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

        th, td {
            text-align: center; /** 设置水平方向居中 */
            vertical-align: middle /** 设置垂直方向居中 */
        }

        #page1 {
            position: relatived;
            left: 40%;
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

        #search-device-detail{
            padding-bottom: 20px;
        }

    </style>
</head>

<body>
<#--样式待添加-->
<#--主要内容-->

<div class="row" id="companyName">
    <div id="name">杭州铁路职工培训基地资产录入系统</div>
</div>

<div class="row">
    <div class="col-xs-3 col-md-2">
        <#include "../common/left-nav.ftl">
    </div>

    <div class="col-xs-12 col-sm-6 col-md-8">
        <div class="container">
            <div class="row clearfix">

                <div class="col-md-12 column">

                    <div id="search-device-detail">
                        <form action="/device/detailPageByName">
                            <table>
                                <tr>
                                    <td><input type="text" name="deviceName" placeholder="设备名称" required></td>
                                    <td>
                                        <button type="submit">查找</button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>

                    <table class="table table-striped table-bordered table-hover" id="dataTable">
                        <thead style="text-align: center">
                        <tr>
                            <th>设备编号</th>
                            <th>设备名称</th>
                            <th>二维码</th>
                            <th>购置日期</th>
                            <th>对内造价</th>
                            <th>存放地址</th>
                            <th>责任人</th>
                            <th>资产类别</th>
                            <th colspan="3">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#list deviceDTOS as device>
                            <tr>
                                <td>${device.getId()}</td>
                                <td>${device.getDeviceName()}</td>
                                <td><a type="button" href="/device/qrcodePage?deviceId=${device.getId()}">查看</a></td>
                                <td>${device.getDate()}</td>
                                <td>${device.getPrice()}元</td>
                                <td>${device.getAddress()}</td>
                                <td>${device.getPrincipal()}</td>
                                <td>${device.getCategory()}</td>
                                <td><a href="/device/modifyPage?deviceId=${device.getId()}">修改</a></td>
                                <td><a href="/device/delete?deviceId=${device.getId()}">删除</a></td>
                                <td><a href="/detailPage?deviceId=${device.getId()}">查看维修记录</a></td>
                            </tr>
                            </#list>
                        </tbody>
                    </table>
                </div>
            <#--页码-->
                <div class="col-md-12 column" id="page1">
                    <ul class="pagination">
                <#if currentPage lte 1>
                    <li class="disabled"><a href="#">上一页</a></li>
                <#else>
                    <li><a href="/device/list?pageNum=#{currentPage-1}&pageSize=${pageSize}">上一页</a></li>
                </#if>

                <#list 1..devicePage.getTotalPages() as index>
                    <#if currentPage == index>
                        <li class="disabled"><a href="#">${index}</a></li>
                    <#elseif  index gt 0>
                        <li><a href="/device/list?pageNum=${index}&pageSize=${pageSize}">${index}</a></li>
                    </#if>
                </#list>

                <#if currentPage gte devicePage.getTotalPages()>
                    <li class="disabled"><a href="#">下一页</a></li>
                <#else>
                    <li><a href="/device/list?pageNum=${currentPage+1}&pageSize=${pageSize}">下一页</a></li>
                </#if>
                    </ul>
                </div>
            </div>
        </div>

        <h1 class="footer">浙江华扩科技有限公司</h1>
    </div>
</div>
</body>
</html>
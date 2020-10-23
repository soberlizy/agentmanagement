<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: li
  Date: 2020/10/22
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" isELIgnored="false" %>
<html>
<head>
    <title>事项列表</title>
    <!--引入jquery-->
    <%--
    web路径
    不以/开头的相对路径，找资源，以当前资源的路径为基准
    以/开始的相对路径 是以服务器的根路径为基准
    --%>
    <%
        request.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>

    <!--引入bootstrap样式-->
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="${APP_PATH}/static/js/list.js"></script>
    <script type="text/javascript"></script>

</head>
<body>
<%--添加的模态框！--%>
<div class="modal fade" id="thingsAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加事项</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="add_things">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户</label>
                        <div class="col-sm-10">
                            <input type="text" name="userName" class="form-control" id="add_UserName"
                                   placeholder="UserName" value=""/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">标题</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="add_title" placeholder="Title"
                                   name="thingName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">开始</label>
                        <div class="col-sm-5">
                            <input type="date" class="form-control" id="add_startTime"
                                   name="startTime" value="2020-01-01">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">结束</label>
                        <div class="col-sm-5">
                            <input type="date" class="form-control" id="add_endTime"
                                   name="endTime" value="2020-01-01">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">级别</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="state" id="add_state">
                                <option value="1">一般</option>>
                                <option value="2">重要</option>>
                                <option value="3">紧急</option>>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">内容</label>
                        <div class="col-sm-8">
                            <textarea rows="20" cols="30" class="form-control" id="desc" placeholder="Description"
                                      name="thingDetail"></textarea>
                            <span id="" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="things_save">保存</button>
            </div>
        </div>
    </div>
</div>
<%--***********************************************************************--%>
<%--修改模态框--%>
<div class="modal fade" id="thingsUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_things">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户</label>
                        <div class="col-sm-10">
                            <input type="text" name="userName" class="form-control" id="update_UserName"
                                   placeholder="UserName" value=""/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">标题</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="update_title" placeholder="Title"
                                   name="thingName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">开始</label>
                        <div class="col-sm-5">
                            <input type="date" class="form-control" id="update_startTime"
                                   name="startTime"  >
                        </div>

                    </div>
                    <div class="form-group">
                    <label class="col-sm-2 control-label">结束</label>
                    <div class="col-sm-5">
                        <input type="date" class="form-control" id="update_endTime"
                               name="endTime" >
                    </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">级别</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="state" id="update_state">
                                <option value="1">一般</option>>
                                <option value="2">重要</option>>
                                <option value="3">紧急</option>>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">内容</label>
                        <div class="col-sm-8">
                            <textarea rows="20" cols="30" class="form-control" id="update_desc"
                                      name="thingDetail"></textarea>
                            <span  class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_things_save">更新</button>
            </div>
        </div>
    </div>
</div>
<%--***********************************************************************--%>
<%--搭建页面--%>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class=".col-md-12">
            <h1>代办事项管理</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="but_add">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"/>
                新增
            </button>
            <button class="btn btn-danger" id="but_remAll">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"/>
                删除所有
            </button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row" class=".col-md-12">
        <table class="table table-bordered ">
            <tr>
                <th>id</th>
                <th>用户</th>
                <th>标题</th>
                <th>开始</th>
                <th>结束</th>
                <th>状态</th>
                <th>剩余</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${list}" var="thing" varStatus="loop">
                <tr>
                    <th>${thing.id}</th>
                    <th>${thing.userName}</th>
                    <th>${thing.thingName}</th>
                    <th class="aa">${thing.startTime}</th>
                    <th class="bb">${thing.endTime}</th>
                    <c:if test="${thing.state=='1'}">
                        <th class="info">一般</th>
                    </c:if>
                    <c:if test="${thing.state=='2'}">
                        <th class="warning">重要</th>
                    </c:if>
                    <c:if test="${thing.state=='3'}">
                        <th class="danger">紧急</th>
                    </c:if>
                   <c:if test="${times[loop.count-1]>0}">
                        <th >${times[loop.count-1]}天</th>
                    </c:if>
                    <c:if test="${times[loop.count-1]<=0}">
                        <th >0天</th>
                    </c:if>

                    <th>
                        <button type="button" class="btn btn-secondary btn-info" data-container="body" data-toggle="popover" title="事项内容" data-placement="left" data-content=${thing.thingDetail}>
                            <span class="glyphicon glyphicon-menu-left" aria-hidden="true">查看</span>
                    </button>
                        <button class="btn btn-primary  btn_edit" >
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"/>编辑
                        </button>
                        <button class="btn btn-danger but_remove">
                            <span class="glyphicon glyphicon-minus" aria-hidden="true">删除</span>
                        </button>
                    </th>
                </tr>
            </c:forEach>

        </table>
    </div>
</div>
</body>
</html>

$(function () {
    $('[data-toggle="popover"]').popover()

    /*刷新页面的方法*/
    function Refresh() {
        window.location.reload()
    }

    $(".but_edit").click(function () {
        Refresh();
    })
    $(".but_remove").click(function () {
        var deletename = $(this).parents("tr").find("th:eq(0)").text()
        if (confirm("确认要删除【" + deletename + "】号事项吗？")) {
            $.ajax({
                url: "del/" + deletename,
                type: "GET",
                success: function (result) {
                    alert(result.msg);
                    Refresh();
                }
            })
        }
    })
    /*添加按钮绑定单击事件*/
    $("#but_add").click(function () {
        $("#thingsAddModal form")[0].reset()
        $("#thingsAddModal").modal({
            backdrop: "static"
        })
    })
    /*给保存按钮绑定单击事件*/
    $("#things_save").click(function () {
        $.ajax({
            url: "save",
            type: "GET",
            data: $("#thingsAddModal form").serialize(),
            success: function (result) {
                alert(result.msg);
                $("#thingsAddModal").modal('hide')
                Refresh();
            }
        })
    })
    /*修改按钮绑定单击事件*/
    $(document).on("click", ".btn_edit", function () {
        //传入信息
        getthings($(this).parents("tr").find("th:eq(0)").text());
        /*将id传给更新按钮*/
        $("#update_things_save").attr("edit-id", $(this).parents("tr").find("th:eq(0)").text())
        //显示模态框
        $("#thingsUpdateModal").modal({
            backdrop: "static"
        })
    })
    /*给更新按钮绑定单击事件*/
    $("#update_things_save").click(function () {

        $.ajax({
            url: "updateThings/" + $(this).attr("edit-id"),
            data: $("#thingsUpdateModal form").serialize(),
            success: function (result) {
                alert(result.msg);
                $("#thingsUpdateModal").modal('hide')
                Refresh();
            }
        })
    })
    /*给删除全部绑定单击事件*/
    $("#but_remAll").click(function () {
        if (confirm("确认要删除所有的事项吗？")) {
            $.ajax({
                url: "delAll",
                success(result) {
                    alert(result.msg);
                    Refresh();
                }

            })
        }
    })

    function getthings(id) {
        $.ajax({
            url: "getThings/" + id,
            success: function (result) {
                var Thingsdate = result.map.things
                $("#update_UserName").val(Thingsdate.userName);
                $("#update_title").val(Thingsdate.thingName);
                $("#update_startTime").val(time(Thingsdate.startTime))
                $("#update_endTime").val(time(Thingsdate.endTime))
                $("#update_state").val(Thingsdate.state)
                $("#update_desc").val(Thingsdate.thingDetail);
            }
        })
    }

    function time(transTime) {
        var date = new Date(transTime);
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        month = month < 10 ? '0' + month : month;
        var d = date.getDate() < 10 ? '0' + date.getDate() : date.getDate();
        return year + '-' + month + '-' + d;
    }


})

<body>
	<div class="x-body">
		<form class="layui-form layui-form-pane">
			<div class="layui-form-item">
				<label for="name" class="layui-form-label">
					<span class="x-red">*</span>群组名称
				</label>
				<div class="layui-input-inline">
					<input type="text" id="name" name="name" value="{{.group.Name}}" required="" lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item layui-form-text" pane="">
				<label for="role" class="layui-form-label">
					拥有权限
				</label>
				 <table class="layui-table">
					<tbody>
						{{str2html .roleHtml}}
					</tbody>
				</table>
			</div>
			<div class="layui-form-item layui-form-text">
				<label for="desc" class="layui-form-label">
					描述
				</label>
				<div class="layui-input-block">
					<textarea placeholder="随便写些什么" id="desc" name="desc" autocomplete="off" class="layui-textarea" style="height: 80px;">{{.group.Desc}}</textarea>
				</div>
			</div>
	
			<div class="layui-form-item">
				<input type="hidden" id="group_id" name="group_id" value="{{.group.Id}}">
				<button  class="layui-btn" lay-filter="save" lay-submit="">
					保存
				</button>
			</div>
		</form>
	</div>
	<script>
		window.onload = function() {
			layui.use(['form','layer'], function() {
				$ = layui.jquery;

				var form = layui.form()
					,layer = layui.layer;

				// 监听提交
				form.on('submit(save)', function(data) {
					data.field.role_ids = get_list_ids("role_ids");
					ajax_post("{{.PostUrl}}", data.field);
					return false;
				});

				// 全选child
				form.on('checkbox', function(data) {
					if (data.elem.className == "roles-select") {
						$(".role_ids[pid='"+data.value+"']").prop("checked", data.elem.checked);
						form.render('checkbox');
					}
				});
			});
		}
	</script>
</body>

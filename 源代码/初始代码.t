@附加权限(安卓权限.文件权限_读取)
@全局主题("主题")
类 启动窗口 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 侧滑布局1 : 侧滑布局
	@布局配置([[父布局=侧滑布局1,宽度=-1,高度=-1]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,ID=3,宽度=-1,高度DP=64]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=64,高度DP=64]])
	变量 线性布局6 : 线性布局
	@布局配置([[父布局=线性布局6,宽度=-1,高度=-1,@外边距DP=12,图片资源="../../资源/menu.xml"]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局2,高度DP=64,内边距DP=8,对齐方式=16,字体大小=20,字体颜色=-16777216,宽度=-1,@权重=1.0,单行显示=真,省略显示=2]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局2,宽度DP=64,高度DP=64]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局2,高度DP=64,宽度DP=64]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局2,高度DP=64,宽度DP=64]])
	变量 线性布局5 : 线性布局
	@布局配置([[父布局=线性布局5,宽度=-1,高度=-1,@外边距DP=12,图片资源="../../资源/dots_vertical.xml"]])
	变量 图片框2 : 图片框
	@布局配置([[父布局=相对布局1,ID=2,@位于某组件之上=1,@位于某组件之下=3]])
	变量 分页布局1 : 分页布局
	@布局配置([[父布局=相对布局1,宽度=-1,高度DP=64,@位于布局底部=真,ID=1]])
	变量 线性布局1 : 线性布局


	变量 左侧滑 : 左侧滑布局
	变量 底栏 : 底部导航栏
	变量 页面组 : 集合
	事件 启动窗口:创建完毕()
		申请所有权限()
		订阅事件()
		本对象.显示到异形屏区域()
		本对象.状态栏颜色 = 白色
		本对象.状态栏字体黑色 = 真
		着色({图片框1, 图片框2}, 黑色)
		底栏.置入布局(线性布局1)
		页面组.添加成员("主页")
		底栏.刷新(页面组.长度)
		侧滑布局1.左侧布局 = 左侧滑
		加载左侧滑事件()
	结束 事件

	变量 底栏点击索引 : 整数
	事件 底栏:加载布局(索引 : 整数) : 组件容器
		变量 布局 : 文本底栏项目
		布局.文本框1.内容 = 页面组[索引]
		如果 索引 == 底栏点击索引 则
			布局.文本框1.字体颜色 = 黑色
		否则
			布局.文本框1.字体颜色 = 灰色
		结束 如果
		事件 布局.相对布局1:被单击()
			底栏点击索引 = 索引
			底栏.刷新(页面组.长度)
		结束 事件
		返回 布局
	结束 事件

	事件 底栏:底栏项目被单击(索引 : 整数)

	结束 事件

	//用户在组件上单击事件
	事件 图片框1:被单击()
		侧滑布局1.打开左侧滑栏()
	结束 事件

	/*
	当窗口要求另一个窗口返回数据成功时，会触发该事件用于接收返回数据
	*/
	事件 启动窗口:获得返回数据(请求码 : 整数,结果码 : 整数,数据 : 启动信息)
		如果 (请求码 > 0x0 且 请求码 < 0xff) 且 数据 != 空 则
			开始俘获异常()
			变量 输入 : 输入流 = 空
			@code
			android.net.Uri uri = #数据.getData();
			#输入 = getContentResolver().openInputStream(uri);
			@end
			假如 请求码
				是 0x1
					左侧滑.图片框1.位图对象 = 位图对象.从输入流创建位图(输入)
					刷新状态栏颜色()
				是 0x2
					左侧滑.圆形图片框1.位图对象 = 位图对象.从输入流创建位图(输入)
			结束 假如
			俘获所有异常()
			弹出提示(取俘获异常())
			结束俘获异常()
		结束 如果
	结束 事件

	//抽屉布局侧滑栏打开时触发该事件
	事件 侧滑布局1:侧滑打开()
		如果 侧滑布局1.是否已打开(对齐方式.靠左对齐) 则
			刷新状态栏颜色()
		结束 如果
	结束 事件

	//抽屉布局侧滑栏被关闭时触发该事件
	事件 侧滑布局1:侧滑关闭()
		如果 取反(侧滑布局1.是否已打开(对齐方式.靠左对齐)) 则
			设置状态栏颜色(白色)
		结束 如果
	结束 事件

	方法 刷新状态栏颜色()
		如果 左侧滑.图片框1.位图对象 != 空 则
			变量 颜色 : 取色板 = 取色板.构建(左侧滑.图片框1.位图对象)
			事件 颜色:解析完毕(结果 : 取色)
				设置状态栏颜色(结果.主导色())
			结束 事件
		结束 如果
	结束 方法

	方法 设置状态栏颜色(颜色 : 整数)
		变量 当前颜色 : 整数 = 0
		code #当前颜色 = #<启动窗口>.this.getWindow().getStatusBarColor();
		变量 动画 : 值动画 = 值动画.创建颜色动画(当前颜色, 颜色)
		事件 动画:动画正在播放(动画 : 值动画)
			本对象.状态栏颜色 = 动画.整数动画值()
		结束 事件
		动画.播放时间(500)
		动画.开始播放()
		如果 是否为浅色(颜色) 则
			本对象.状态栏字体黑色 = 真
		否则
			本对象.状态栏字体黑色 = 假
		结束 如果
	结束 方法

	方法 加载左侧滑事件()
		事件 左侧滑.图片框1:被单击()
			选择图片(0x1)
		结束 事件
		事件 左侧滑.圆形图片框1:被单击()
			选择图片(0x2)
		结束 事件
		事件 左侧滑.文本框1:被长按()
			变量 输入 : 输入对话框
			输入.标题 = "重命名"
			输入.提示文本 = "你的名称"
			输入.按钮1 = "确定"
			输入.按钮2 = "取消"
			输入.显示()
			事件 输入:按钮1被单击()
				左侧滑.文本框1.内容 = 输入.内容
			结束 事件
		结束 事件
	结束 方法

	@导入Java("android.content.Intent")
	方法 选择图片(请求码 : 整数)
		@code
		Intent intent = new Intent(Intent.ACTION_PICK);
		intent.setType("image/*");
		startActivityForResult(intent, #请求码);
		@end
	结束 方法

	/*方法 裁剪圆角图片(原始图片 : 位图对象, 左上圆角 : 单精度小数, 右上圆角 : 单精度小数, 右下圆角 : 单精度小数, 左下圆角 : 单精度小数) : 位图对象
		@code
		int width = #原始图片.getWidth();
		int height = #原始图片.getHeight();
		android.graphics.Bitmap output = android.graphics.Bitmap.createBitmap(width, height, android.graphics.Bitmap.Config.ARGB_8888);
		android.graphics.Bitmap rectBitmap = android.graphics.Bitmap.createBitmap(width, height, android.graphics.Bitmap.Config.ARGB_8888);
		android.graphics.Canvas canvas = new android.graphics.Canvas(output);
		android.graphics.Canvas rectCanvas = new android.graphics.Canvas(rectBitmap);
		android.graphics.Paint paint = new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
		android.graphics.RectF rectF = new android.graphics.RectF(0, 0, width, height);
		android.graphics.Path path = new android.graphics.Path();
		// 根据四个不同的圆角半径构建圆角矩形路径
		path.addRoundRect(rectF, new float[]{#左上圆角, #左上圆角, #右上圆角, #右上圆角,
		#右下圆角, #右下圆角, #左下圆角, #左下圆角}, android.graphics.Path.Direction.CW);
		paint.setColor(0xFFFF0000);
		rectCanvas.drawPath(path, paint);
		canvas.drawBitmap(rectBitmap, 0, 0, paint);
		paint.setXfermode(new android.graphics.PorterDuffXfermode(android.graphics.PorterDuff.Mode.SRC_IN));
		canvas.drawBitmap(#原始图片, 0, 0, paint);
		return output;
		@end
	结束 方法*/

	@主题配置.主题类型(主题类型.MD亮主题_无标题栏)
	变量 主题 : 主题资源 = "主题"

结束 类
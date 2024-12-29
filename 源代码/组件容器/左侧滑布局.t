类 左侧滑布局 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-1,背景图片="../../../样式/radius.xml"]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度=-1,完全显示=真]])
	变量 滚动布局1 : 滚动布局
	@布局配置([[父布局=滚动布局1,宽度=-1,高度=-1]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,宽度=-1,高度DP=200,ID=1]])
	变量 相对布局2 : 相对布局
	@布局配置([[父布局=相对布局2,宽度=-1,高度=-1,硬件加速=假]])
	变量 图片框1 : 圆角图片框
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1,@位于布局底部=真,@上外边距DP=180]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=相对布局1,宽度DP=80,高度DP=80,@位于布局右边=真,@右外边距DP=24,@位于某组件之下=1,纵向偏移DP=-40,ID=2,图片资源="../../../样式/circle.xml"]])
	变量 圆形图片框1 : 圆形图片框
	@布局配置([[父布局=相对布局1,字体颜色=-16777216,字体大小=22,@与某组件底部平齐=2,@位于某组件左边=2,纵向偏移DP=-48,内容="测试名称测试名称测名称",单行显示=真,省略显示=2,@左外边距DP=16]])
	变量 文本框1 : 文本框

	事件 左侧滑布局:创建完毕()
		订阅事件()
		图片框1.右上圆角 = DP到PX(取安卓环境(), 16)
		变量 监听回调 : 组件初始化监听回调 = 监听组件初始化事件(文本框1)
		事件 监听回调:已初始化() : 逻辑型
			@code
			int viewWidth = #文本框1.getView().getWidth();
			int viewHeight = #文本框1.getView().getHeight();
			int[][] colors = {{0xFF8ED1FC, 0xFF53C4D9, 0xFF319795},{0xFFFAD0C4, 0xFFF08080, 0xFFE6B8AF},{0xFF56CCF2, 0xFF2F80ED, 0xFF1C3F95},{0xFFFDD017, 0xFFFAAF08, 0xFFD4AF37},{0xFFFFE135, 0xFFFFC107, 0xFFDAA520}};
			float[] positions = null;
			android.graphics.LinearGradient grad = new android.graphics.LinearGradient(0, 0, viewWidth, viewHeight, colors[4], positions, android.graphics.Shader.TileMode.CLAMP);
			#文本框1.getView().getPaint().setShader(grad);
			@end
			返回 假
		结束 事件
		置圆角背景(线性布局2, 白色, DP到PX(取安卓环境(), 16), DP到PX(取安卓环境(), 16), DP到PX(取安卓环境(), 16), 0)
	结束 事件

结束 类
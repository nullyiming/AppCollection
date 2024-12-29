@外部依赖库("../../../绳包/安卓基本库/依赖库/androidx/core-1.3.0.aar")
@外部依赖库("../../../绳包/安卓基本库/依赖库/androidx/collection-1.1.0.jar")
@外部依赖库("../../../绳包/安卓基本库/依赖库/androidx/legacy-support-core-utils-1.0.0.aar")
@外部依赖库("../../../依赖/palette-1.0.0.aar")
@导入Java("androidx.palette.graphics.Palette")
@禁止创建对象
@后缀代码("implements Palette.PaletteAsyncListener")
类 取色板
	
	@静态
	方法 构建(图片 : 位图对象) : 取色板
		@code
		#<取色板> ts = new #<取色板>();
		Palette.from(#图片).generate(ts);
		return ts;
		@end
	结束 方法

	@code
	@Override
	public void onGenerated(Palette palette) {
		#解析完毕(palette);
	}
	@end
	
	定义事件 解析完毕(结果 : 取色)

结束 类

@指代类("androidx.palette.graphics.Palette")
类 取色
	
	方法 主导色(默认色 : 整数 = 白色) : 整数
		code return #this.getDominantColor(#默认色);
	结束 方法
	
	方法 活力色(默认色 : 整数 = 白色) : 整数
		code return #this.getVibrantColor(#默认色);
	结束 方法
	
	方法 亮活力色(默认色 : 整数 = 白色) : 整数
		code return #this.getLightVibrantColor(#默认色);
	结束 方法
	
	方法 暗活力色(默认色 : 整数 = 白色) : 整数
		code return #this.getDarkVibrantColor(#默认色);
	结束 方法
	
	方法 柔和色(默认色 : 整数 = 白色) : 整数
		code return #this.getMutedColor(#默认色);
	结束 方法
	
	方法 亮柔和色(默认色 : 整数 = 白色) : 整数
		code return #this.getLightMutedColor(#默认色);
	结束 方法
	
	方法 暗柔和色(默认色 : 整数 = 白色) : 整数
		code return #this.getDarkMutedColor(#默认色);
	结束 方法
	
结束 类
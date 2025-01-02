@全局类
类 组件工具

	@静态
	方法 着色(图片组 : 圆角图片框[], 颜色 : 整数)
		循环(图片组 -> 图片)
			code #图片.getView().setColorFilter(#颜色);
		结束 循环
	结束 方法

	@静态
	方法 监听组件初始化事件(组件 : 可视化组件) : 组件初始化监听回调
		code return new #<组件初始化监听回调>(#组件);
	结束 方法
结束 类

@后缀代码("implements android.view.ViewTreeObserver.OnGlobalLayoutListener")
类 组件初始化监听回调

	@隐藏
	变量 组件 : 可视化组件?

	@code
	public #<组件初始化监听回调>(#<可视化组件> view){
		#组件 = view;
		#组件.getView().getViewTreeObserver().addOnGlobalLayoutListener(this);
	}
	
	@Override
	public void onGlobalLayout(){
		if(!#已初始化()){
			#组件.getView().getViewTreeObserver().removeOnGlobalLayoutListener(this);
		}
	}
	@end

	定义事件 已初始化() : 逻辑型

结束 类
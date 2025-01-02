/*类 底部导航栏 : 基础自定义组件

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 线性布局1 : 线性布局
	
	方法 刷新(长度 : 整数)
		线性布局1.移除所有组件()
		循环(i, 0, 长度)
			变量 布局 : 组件容器 = 加载布局(i)
			//布局.创建完毕()
			变量 组件 : 布局组件 = 布局.取根布局()
			线性布局1.添加组件(组件)
			线性布局1.权重(组件, 1)
			常量 j = i
			事件 组件:被单击()
				底栏项目被单击(j)
			结束 事件
		结束 循环
	结束 方法
	
	定义事件 加载布局(索引 : 整数) : 组件容器
	定义事件 底栏项目被单击(索引 : 整数)
结束 类*/
类 底部导航栏 : 基础自定义组件

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 线性布局1 : 线性布局

	@隐藏
	变量 适配器对象 : 简单适配器

	事件 底部导航栏:创建完毕()
		订阅事件 适配器对象
	结束 事件

	事件 适配器对象:加载布局(索引 : 整数,项目布局 : 组件容器) : 组件容器
		返回 加载布局(索引, 项目布局)
	结束 事件

	@虚拟方法
	方法 置入布局(布局 : 布局组件)
		父对象.置入布局(布局)
	结束 方法

	/*
	通知适配器数据更新了，需要刷新项目
	*/
	方法 更新项目(项目总数 : 整数)
		线性布局1.移除所有组件()
		适配器对象.更新项目(项目总数)
		循环(i, 0, 适配器对象.取项目数量())
			变量 布局 : 可视化组件 = 空
			如果 i < 线性布局1.取子组件数量() 则
				布局 = 适配器对象.取项目布局(i, 线性布局1.取子组件(i))
			否则
				布局 = 适配器对象.取项目布局(i, 空)
			结束 如果
			线性布局1.添加组件(布局)
			线性布局1.权重(布局, 1)
			常量 j = i
			事件 布局:被单击()
				底栏项目被单击(j)
			结束 事件
			事件 布局:被单击()
				底栏项目被长按(j)
			结束 事件
			事件 布局:焦点被改变(是否获得焦点 : 逻辑型)
				如果 是否获得焦点 则
					底栏项目被选中(j)
				结束 如果
			结束 事件
		结束 循环
	结束 方法

	定义事件 加载布局(索引 : 整数, 项目布局 : 组件容器) : 组件容器
	定义事件 底栏项目被单击(索引 : 整数)
	定义事件 底栏项目被长按(索引 : 整数)
	定义事件 底栏项目被选中(索引 : 整数)
结束 类


类 文本底栏项目 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度DP=56]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,@位于布局中间=真,字体大小=20]])
	变量 文本框1 : 文本框

结束 类

类 图标文本底栏项目 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,@位于布局中间=真,宽度=-2,高度=-2,内边距DP=8]])
	变量 相对布局2 : 相对布局
	@布局配置([[父布局=相对布局2,宽度DP=32,高度DP=32,图片资源="../../../资源/home.xml",ID=1,@位于布局中间=真,@位于布局顶部=真]])
	变量 圆角图片框1 : 圆角图片框
	@布局配置([[父布局=相对布局2,@外边距DP=8,单行显示=真,省略显示=2,内容="主页",对齐方式=17,高度=-2,宽度=-2,@位于某组件之下=1,@位于布局中间=真]])
	变量 文本框1 : 文本框

	事件 图标文本底栏项目:创建完毕()
		订阅事件()
		//着色({圆角图片框1}, 黑色)
	结束 事件

结束 类
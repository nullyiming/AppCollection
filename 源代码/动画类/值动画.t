@导入Java("android.animation.ValueAnimator")
@禁止创建对象
@后缀代码("implements ValueAnimator.AnimatorUpdateListener")
类 值动画
	
	@code
	private ValueAnimator anim;
	public #<值动画>(ValueAnimator anim){
		this.anim = anim;
	}
	@end
	
	@静态
	方法 创建颜色动画(开始值 : 整数, 结束值 : 整数) : 值动画
		@code
		ValueAnimator anim = ValueAnimator.ofObject(new android.animation.ArgbEvaluator(), #开始值, #结束值);
		#<值动画> zdh = new #<值动画>(anim);
		anim.addUpdateListener(zdh);
		return zdh;
		@end
	结束 方法
	
	@静态
	方法 创建整数动画(开始值 : 整数, 结束值 : 整数) : 值动画
		@code
		ValueAnimator anim = ValueAnimator.ofInt(#开始值, #结束值);
		#<值动画> zdh = new #<值动画>(anim);
		anim.addUpdateListener(zdh);
		return zdh;
		@end
	结束 方法
	
	@code
	@Override
    public void onAnimationUpdate(ValueAnimator anim) {
		#动画正在播放(this);
	}
	@end
	
	方法 开始播放()
		code anim.start();
	结束 方法
	
	方法 播放时间(毫秒 : 长整数)
		code anim.setDuration(#毫秒);
	结束 方法
	
	方法 整数动画值() : 整数
		code return (Integer)anim.getAnimatedValue();
	结束 方法
	
	定义事件 动画正在播放(动画 : 值动画)
	
结束 类
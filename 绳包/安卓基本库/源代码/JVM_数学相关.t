包名 结绳.JVM

/*
大整数类，提供超大整数的计算功能
*/
@指代类("java.math.BigInteger")
类 大整数 : 数字
	@嵌入式代码
	@运算符重载
	方法 =(值 : 文本)
		code new java.math.BigInteger(#值)
	结束 方法
	
	@运算符重载
	方法 +(另一个大整数 : 大整数) : 大整数
		返回 加(另一个大整数)
	结束 方法
	
	@运算符重载
	方法 -(另一个大整数 : 大整数) : 大整数
		返回 减(另一个大整数)
	结束 方法
	
	@运算符重载
	方法 *(另一个大整数 : 大整数) : 大整数
		返回 乘(另一个大整数)
	结束 方法
	
	@运算符重载
	方法 /(另一个大整数 : 大整数) : 大整数
		返回 除以(另一个大整数)
	结束 方法
	
	/*
	与另一个大整数进行相加运算
	*/
	方法 加(另一个大整数 : 大整数) : 大整数
		code return #this.add(#另一个大整数);
	结束 方法
	
	/*
	与另一个大整数进行想减运算
	*/
	方法 减(另一个大整数 : 大整数) : 大整数
		code return #this.subtract(#另一个大整数);
	结束 方法
	
	/*
	与另一个大整数进行相乘运算
	*/
	方法 乘(另一个大整数 : 大整数) : 大整数
		code return #this.multiply(#另一个大整数);
	结束 方法
	
	/*
	与另一个大整数进行相除运算
	*/
	方法 除以(另一个大整数 : 大整数) : 大整数
		code return #this.divide(#另一个大整数);
	结束 方法
结束 类

/*
大数类，提供超大数字(整数/小数)的计算功能
*/
@指代类("java.math.BigDecimal")
类 大数字 : 数字
	@嵌入式代码
	@运算符重载
	方法 =(值 : 文本)
		code new java.math.BigDecimal(#值)
	结束 方法
	
	@运算符重载
	方法 +(另一个大数字 : 大数字) : 大数字
		返回 加(另一个大数字)
	结束 方法
	
	@运算符重载
	方法 -(另一个大数字 : 大数字) : 大数字
		返回 减(另一个大数字)
	结束 方法
	
	@运算符重载
	方法 *(另一个大数字 : 大数字) : 大数字
		返回 乘(另一个大数字)
	结束 方法
	
	@运算符重载
	方法 /(另一个大数字 : 大数字) : 大数字
		返回 除以(另一个大数字)
	结束 方法
	
	/*
	与另一个大数字进行相加运算
	*/
	方法 加(另一个大数字 : 大数字) : 大数字
		code return #this.add(#另一个大数字);
	结束 方法
	
	/*
	与另一个大数字进行相减运算
	*/
	方法 减(另一个大数字 : 大数字) : 大数字
		code return #this.subtract(#另一个大数字);
	结束 方法
	
	/*
	与另一个大数字进行相乘运算
	*/
	方法 乘(另一个大数字 : 大数字) : 大数字
		code return #this.multiply(#另一个大数字);
	结束 方法
	
	/*
	与另一个大数字进行相除运算
	*/
	方法 除以(另一个大数字 : 大数字) : 大数字
		code return #this.divide(#另一个大数字);
	结束 方法
结束 类
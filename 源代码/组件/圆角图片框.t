类 圆角图片框 : 可视化组件
	
	@code
	public #<圆角图片框>(android.content.Context context) {
		super(context);
	}

	@Override
	public RoundImageView onCreateView(android.content.Context context) {
		RoundImageView view = new RoundImageView(context);
		return view;
	}

	@Override
	public RoundImageView getView() {
		return (RoundImageView) view;
	}

	public class RoundImageView extends android.view.View {

		private float[] radius = new float[8];
		private android.graphics.Bitmap rect;
		private android.graphics.Bitmap image;
		private android.graphics.Paint paint;

		public RoundImageView(android.content.Context context){
			this(context, null);
		}

		public RoundImageView(android.content.Context context, android.util.AttributeSet attrs){
			this(context, attrs, 0);
		}

		public RoundImageView(android.content.Context context, android.util.AttributeSet attrs, int defStyleAttr){
			super(context, attrs, defStyleAttr);
			paint = new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
		}

		@Override
		protected void onDraw(android.graphics.Canvas canvas) {
			if(image != null){
     		   int bitmapWidth = image.getWidth();
       		 int bitmapHeight = image.getHeight();

     		   float widthScale = (float) getWidth() / bitmapWidth;
     		   float heightScale = (float) getHeight() / bitmapHeight;
      		  float scaleFactor = Math.max(widthScale, heightScale);

      		  android.graphics.Matrix matrix = new android.graphics.Matrix();
     		   matrix.postScale(scaleFactor, scaleFactor);

      		  // 计算图片居中显示的坐标偏移量
       		 int dx = (int) ((getWidth() - bitmapWidth * scaleFactor) / 2);
     		   int dy = (int) ((getHeight() - bitmapHeight * scaleFactor) / 2);
      		  matrix.postTranslate(dx, dy);
				int layerId = canvas.saveLayer(0,0, getWidth(), getHeight(), paint, android.graphics.Canvas.ALL_SAVE_FLAG);
				setLayerType(android.view.View.LAYER_TYPE_SOFTWARE, null);
				initRoundRect();
				canvas.drawBitmap(rect, 0, 0, paint);
				paint.setXfermode(new android.graphics.PorterDuffXfermode(android.graphics.PorterDuff.Mode.SRC_IN));
				canvas.drawBitmap(image, matrix, paint);
				paint.setXfermode(null);
				canvas.restoreToCount(layerId);
			}
	}


		@Override
		protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
			super.onMeasure(widthMeasureSpec, heightMeasureSpec);
		}

		private void initRoundRect(){
			rect = android.graphics.Bitmap.createBitmap(getWidth(), getHeight(), android.graphics.Bitmap.Config.ARGB_8888);
			android.graphics.Canvas canvas = new android.graphics.Canvas(rect);
			android.graphics.Path path = new android.graphics.Path();
			path.addRoundRect(0, 0, getWidth(), getHeight(), radius, android.graphics.Path.Direction.CW);
			canvas.drawPath(path, paint);
		}

		public void setRadius(float radius){
			for(int i = 0; i < this.radius.length; i++){
				this.radius[i] = radius;
			}
		}

		public void setTopLeftRadius(float radius){
			this.radius[0] = radius;
			this.radius[1] = radius;
		}

		public float getTopLeftRadius(){
		return this.radius[0];
		}

	public void setTopRightRadius(float radius){
		this.radius[2] = radius;
		this.radius[3] = radius;
	}

	public float getTopRightRadius(){
		return this.radius[2];
	}

	public void setBottomRightRadius(float radius){
		this.radius[4] = radius;
		this.radius[5] = radius;
	}

	public float getBottomRightRadius(){
	return this.radius[4];
	}

	public void setBottomLeftRadius(float radius){
	this.radius[6] = radius;
	this.radius[7] = radius;
	}

	public float getBottomLeftRadius(){
	return this.radius[6];
	}

	public void setImage(android.graphics.Bitmap image){
	this.image = image;
	invalidate();
	}

	public android.graphics.Bitmap getImage(){
	return this.image;
	}
	}
	@end

	属性写 位图对象(图片 : 位图对象)
		code getView().setImage(#图片);
	结束 属性

	属性读 位图对象() : 位图对象
		code return getView().getImage();
	结束 属性

	属性写 圆角(值 : 单精度小数)
		code getView().setRadius(#值);
	结束 属性

	属性写 左上圆角(值 : 单精度小数)
		code getView().setTopLeftRadius(#值);
	结束 属性

	属性读 左上圆角() : 单精度小数
		code return getView().getTopLeftRadius();
	结束 属性

	属性写 右上圆角(值 : 单精度小数)
		code getView().setTopRightRadius(#值);
	结束 属性

	属性读 右上圆角() : 单精度小数
		code return getView().getTopRightRadius();
	结束 属性

	属性写 右下圆角(值 : 单精度小数)
		code getView().setBottomRightRadius(#值);
	结束 属性

	属性读 右下圆角() : 单精度小数
		code return getView().getBottomRightRadius();
	结束 属性

	属性写 左下圆角(值 : 单精度小数)
		code getView().setBottomLeftRadius(#值);
	结束 属性

	属性读 左下圆角() : 单精度小数
		code return getView().getBottomLeftRadius();
	结束 属性


结束 类
package Pantallas
{
	
	import starling.display.Sprite;
	import starling.events.Event;

	public class Background extends Sprite
	{
		private var bgLayer:Parallax;
		private var _speed:Number = 0;
		
		public function Background()
		{
			addEventListener(Event.ADDED_TO_STAGE, agregadoAPantalla);
		}
		
		private function agregadoAPantalla():void
		{
			removeEventListener(Event.ADDED_TO_STAGE,agregadoAPantalla);
			bgLayer = new Parallax(1);
			bgLayer.parallax = 1;
			
			addChild(bgLayer);
			
			addEventListener(Event.ENTER_FRAME, parallax);
		}
		
		private function parallax(event:Event):void
		{
			bgLayer.x -= Math.ceil(_speed * bgLayer.parallax);
			if(bgLayer.x<-stage.stageWidth) bgLayer.x = 0;
			
		}
		
		public function get speed():Number
		{
			return _speed;
		}

		public function set speed(value:Number):void
		{
			_speed = value;
		}

	}
}
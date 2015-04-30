package Objetos{
	
	import flash.media.StageWebView;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class AbstractArma extends Sprite{
		private var imagen:Image;
		private var _velocidad:int;
		private var _municion:int;
		private var disparo:Boolean;
		
		public function AbstractArma(pimage:Image){
			
			imagen = pimage;
			municion = 0;
			velocidad = 1000;
			disparo = false;
			
		}
		
		public function get velocidad():int
		{
			return _velocidad;
		}

		public function set velocidad(value:int):void
		{
			_velocidad = value;
		}

		public function get municion():int
		{
			return _municion;
		}

		public function set municion(value:int):void
		{
			_municion = value;
		}

		public function disparar():void{
			
			municion--;
			
			if(municion>0){
				disparo = true;
			}else{
				municion = 0;
			}
		}
		
		private function fuego():void
		{
			if(disparo){
				if(imagen.x > stage.stageWidth){
					imagen.x = 0;
					disparo=false;
				}else{
					imagen.x+=velocidad;	
				}
			}
				
		}
	}
}
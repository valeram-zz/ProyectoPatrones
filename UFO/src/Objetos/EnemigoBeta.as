package Objetos{
	import flash.display.MovieClip;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Enemigo extends Sprite{
		private var _velocidad: Number = 17;
		private var imagen:Image;
		private var _distancia:int;
		private var golpeado:Boolean;
		private var _posicion:String;
		private var animacion:MovieClip;
		private var tipo:int;

		public function Enemigo(ptipo:int){
			super();
			
			golpeado = false;
			
			this.tipo= ptipo;
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, agregarImagen);
			
			this.addEventListener(Event.ENTER_FRAME, moverEnemigo);
			
		}
	 
		public function get posicion():String
		{
			return _posicion;
		}

		public function set posicion(value:String):void
		{
			_posicion = value;
		}

		public function get distancia():int
		{
			return _distancia;
		}

		public function set distancia(value:int):void
		{
			_distancia = value;
		}

		public function get velocidad():Number{
			return velocidad;
		}
	
		public function set velocidad(pvelocudad:Number):void{
			velocidad = pvelocudad;
		}
	
		private function agregarImagen(tipo:int):void{
			if(this.tipo==1){
			imagen= new Image(Assets.obtenerTextura("ovniMalo1"));
			addChild(imagen);
			}
			if(this.tipo==2){
				imagen= new Image(Assets.obtenerTextura("ovniMalo2"));
			addChild(imagen);
			}
				else if(this.tipo==3){
				imagen= new Image(Assets.obtenerTextura("ovniMalo3"));
			addChild(imagen);
				}
		}
		
		private function moverEnemigo(event:Event):void{
			this.x-=_velocidad;
		
		}
		
		private  function selfDestroy():void{
			
		}
		
//		private function demonios():void{
//			
//		}
		
	}	
}
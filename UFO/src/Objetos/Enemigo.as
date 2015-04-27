package Objetos{
	
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Enemigo extends Sprite{
		private var _tipo:int; //tipo de obstaculo
		private var _velocidad:int; //velocidad del obstaculo
		private var _distancia:int; //distancia del obstaculo con respecto al ovni
		private var _mensaje:Boolean; //alerta
		private var _golpeado:Boolean; //deshabilita el listener cuando es true
		private var _posicion:String; //posicion obstaculo en el vertical
		private var imagenEnemigo:Image;
		private var imagenEnemigoChocado:Image;
		private var animacion:MovieClip;
		private var animacionMendaje:MovieClip;
		
		public function Enemigo(ptipo:int, pdistacia:int, palerta:Boolean = true,pvelocidad:int = 0){
			super();
			
			_tipo = ptipo;
			_distancia = pdistacia;
			_mensaje = palerta;
			_velocidad = pvelocidad;
			
			_golpeado = false;
			
			this.addEventListener(Event.ADDED_TO_STAGE, agregadoAPantalla);
			
//			this.addEventListener(Event.ENTER_FRAME, moverEnemigo);
			
		}
		
		public function get distancia():int
		{
			return _distancia;
		}

		public function set distancia(value:int):void
		{
			_distancia = value;
		}

		public function get velocidad():int
		{
			return _velocidad;
		}

		public function set velocidad(value:int):void
		{
			_velocidad = value;
		}

		public function get golpeado():Boolean
		{
			return _golpeado;
		}

		public function set golpeado(value:Boolean):void
		{
			trace(value)
			_golpeado = value;
			trace(value);
			if(value){
				imagenEnemigoChocado.visible=true;
				imagenEnemigo.visible=false;
			}else{
				
			}
		}

		public function get posicion():String
		{
			return _posicion;
		}

		public function set posicion(value:String):void
		{
			_posicion = value;
		}


		private function agregadoAPantalla(event:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE, agregadoAPantalla);
			
			agregarImagen();
			agregarImagenGolpeado();
			crearAnimacionMensaje();
		}
		
		private function crearAnimacionMensaje():void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function agregarImagenGolpeado():void
		{
			imagenEnemigoChocado = new Image(Assets.obtenerTextura("ovniMalo2"));
			imagenEnemigoChocado.visible = false;
			addChild(imagenEnemigoChocado);
		}
		
		private function agregarImagen():void
		{
			imagenEnemigo = new Image(Assets.obtenerTextura("ovniMalo1"));
			addChild(imagenEnemigo);
		}
		
//		private function agregarImagen(tipo:int):void{
//			if(this.tipo==1){
//			imagen= new Image(Assets.obtenerTextura("ovniMalo1"));
//			addChild(imagen);
//			}
//			if(this.tipo==2){
//				imagen= new Image(Assets.obtenerTextura("ovniMalo2"));
//			addChild(imagen);
//			}
//				else if(this.tipo==3){
//				imagen= new Image(Assets.obtenerTextura("ovniMalo3"));
//			addChild(imagen);
//				}
//		}
//		
//		private function moverEnemigo(event:Event):void{
//			this.x-=_velocidad;
//		
//		}
//		

		
	}	
}
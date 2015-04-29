package Objetos
{
	import flash.display.MovieClip;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class AbstractObstaculo extends Sprite{

		private var _velocidad: Number = 20;
		private var distancia:int;
		private var cuidado:Boolean;
		private var golpeado:Boolean;
		private var posicion:String;
		private var animacion:starling.display.MovieClip;
		
		
		public function AbstractObstaculo(){
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, agregarImagen);
			this.addEventListener(Event.ENTER_FRAME, moverObstaculo);
		}
				
		public function get velocidad():Number{
			return velocidad;
		}
		
		public function set velocidad(pvelocudad:Number):void{
			velocidad = pvelocudad;
		}
		
		private function agregarImagen():void{
			
			animacion = new starling.display.MovieClip(Assets.getAtlas().getTextures("meteorito"),20);
			animacion.x = Math.ceil(-animacion.width/2);
			animacion.y = Math.ceil(-animacion.height/2);
			starling.core.Starling.juggler.add(animacion);
			
			this.addChild(animacion);
			
		}
		
		private function moverObstaculo(event:Event):void{
			this.x-=_velocidad;
		}
	}
}
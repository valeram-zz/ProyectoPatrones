package Objetos{
	
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;

	public class ObjetoVolador extends Sprite{
		private var heroArt:MovieClip;
		private var _vida:int;
		private var velocidad:int;
		private var arma:AbstractArma;
		
		public function ObjetoVolador(parma:AbstractArma, pvida:int){
			super();
			_vida = pvida
			arma = parma;
			addChild(arma);
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		public function get vida():int
		{
			return _vida;
		}

		public function set vida(value:int):void
		{
			_vida = value;
		}

		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			crearAnimacion();
		}
		
		private function crearAnimacion():void
		{
			heroArt = new MovieClip(Assets.getAtlas().getTextures("ovniMov"),20);
			heroArt.x = Math.ceil(-heroArt.width/2);
			heroArt.y = Math.ceil(-heroArt.height/2);
			starling.core.Starling.juggler.add(heroArt);
			
			this.addChild(heroArt);
		}
		
		public function disparar():void{
			
			arma.disparar();
			
		}
		
		public function getMunicion():int{
			return arma.municion;
		}
		
		public function setMunicion(pmunicion):void{
			arma.municion = pmunicion;
		}
		
		public function getArma():AbstractArma{
			return arma;
		}
	}
	
}
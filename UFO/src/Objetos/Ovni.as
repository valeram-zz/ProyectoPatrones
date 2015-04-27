package Objetos{
	
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.events.Event;
	
	public class Ovni extends ObjetoVolador{
		
		private var heroArt:MovieClip;
		
		public function Ovni(){
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
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
	}
}
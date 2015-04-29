package Pantallas
{

	import Objetos.ObjetoVolador;
	import Objetos.Ovni;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;

	public class PantallaPrincipal extends Sprite
	{
		private var btnIniciar:Button;
		private var btnInformacion:Button;
		private var ovni:ObjetoVolador;
		private var background:Image;
		private var logo:Image;
		private var derecha:Boolean = true;
		private var velocidad:int = 5;
		
		
		public function PantallaPrincipal(){	

			mostrarMenu();
			 
		}	
		
		public function mostrarMenu():void{
			background = new Image(Assets.obtenerTextura("bg"));
			addChild(background);
			
			logo = new Image(Assets.obtenerTextura("logo"));
			addChild(logo);
			logo.x=256;
			logo.y=100;
						
			ovni= new Ovni();
			addChild(ovni);
			ovni.x = 200;
			ovni.y = 400;
			
			btnIniciar = new Button(Assets.obtenerTextura("iniciar"));
			addChild(btnIniciar);
			btnIniciar.x =300;
			btnIniciar.y= 600;
			
			btnInformacion = new Button(Assets.obtenerTextura("informacion"));
			addChild(btnInformacion);
			btnInformacion.x = 600;
			btnInformacion.y = 600;
			
			addEventListener(Event.TRIGGERED, clickEnMenuPrincipal);
			
		}
		
		private function clickEnMenuPrincipal(event:Event):void
		{
			var clickeado:Button = event.target as Button;
			if(clickeado == btnIniciar){
				dispatchEvent(new EventoNavegacion(EventoNavegacion.CHANGE_SCREEN,{id:"play"},true));
			}else if(clickeado == btnInformacion){
				
			}
		}
		
		public function iniciar():void{
			visible = true;
			
			addEventListener(Event.ENTER_FRAME,animarPantalla);
				
		}
		
		private function animarPantalla(event:Event):void
		{
			animarOvni();
			
			var fechaActual:Date = new Date();
			
			btnIniciar.y = 600 + (Math.cos(fechaActual.getTime() * 0.002)* 10);
			btnInformacion.y  = 600 + (Math.cos(fechaActual.getTime() * 0.002)* 10);
		
		}
		
		private function animarOvni():void
		{
		
			if(derecha){
				ovni.x+=velocidad;
			}else{
				ovni.x-=velocidad;
			}
			
			if(ovni.x==1500){
				derecha=false;
				ovni.y+=5;
				
			}else if(ovni.x==-500){
				derecha=true;
				ovni.y+=5;
			}
			
		}
		
		public function esconder():void
		{
			visible = false;
			if(this.hasEventListener(Event.ENTER_FRAME))
				this.removeEventListener(Event.ENTER_FRAME,animarPantalla);
		}
	}
}
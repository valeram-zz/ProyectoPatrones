package Pantallas
{
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	
	import Objetos.AbstractArma;
	import Objetos.AbstractObstaculo;
	import Objetos.AbstractPowerUp;
	import Objetos.Enemigo;
	import Objetos.FabricaObstaculos;
	import Objetos.FabricaPowerUps;
	import Objetos.ObjetoVolador;
	import Objetos.Ovni;
	
	import starling.core.starling_internal;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.text.TextField;
	import starling.utils.deg2rad;

	public class PantallaJuego extends Sprite{
		private var fabricaObstaculos:FabricaObstaculos;
		private var fabricaPowerUps:FabricaPowerUps;
		
		
		private var obstaculo:AbstractObstaculo;
//		private var powerUp:AbstractPowerUp;
		
		
		
		
		private var hero:ObjetoVolador;
		
		private var ovniEnemigo:Enemigo;
		private var gameArea:Rectangle;
		private var contadorEnemigos:int;


		
		private var bg:Background;
		private var timePrevious:Number;
		private var timeCurrent:Number;
		private var elapsed:Number;
		private var btnIniciar:Button;
		private var velocidadJugador:Number;
		
		private var golpeObstaculo:Number = 0;
		
		private const MIN_SPEED:Number = 650;
		
		private var touch:Touch;
		private var touchX:Number;
		private var touchY:Number;
		
		private var estadoJuego:String;
		
		
		private var distanciaRecorrida:int;
		private var obstacleGapCount:int;
		//enemigos a seguir
		private var enemigos:Vector.<Enemigo>;
		//powerUps a usar
		private var powerUps:Vector.<AbstractPowerUp>;
		
		//Puntaje y vida 
		private var puntaje:Puntaje;
		private var vida:TextField;
		private var municion:TextField;
		
		//Opciones de partida perdido
		private var reiniciar:Button;
		
		//arma
		private var weapon:AbstractArma;
		private var bullets:Vector.<Image>;
		
		
		public function PantallaJuego(){
			
			addEventListener(starling.events.KeyboardEvent.KEY_DOWN,generarBalas);
			addEventListener(Event.ADDED_TO_STAGE, agregadoAPantalla);
			fabricaObstaculos = new FabricaObstaculos();
			fabricaPowerUps = new FabricaPowerUps();
			
		}
		
//		private function agregarEnemigo():void{
//			
//			while(Math.random()>0.99){
//				ovniEnemigo= new Enemigo(Math.ceil(Math.random()*3));
//				ovniEnemigo.x=stage.stageWidth+100;
//				ovniEnemigo.y= int(Math.random()*(gameArea.bottom-gameArea.top))+gameArea.top;
//				this.addChild(ovniEnemigo);
//				
//			}
//			agregarObstaculo();

			
//		}
		
//		private function agregarObstaculo():void
//		{
//			while(Math.random()>0.99){
//				obstaculo = fabricaObstaculos.crearObstaculo("Cometa");
//				obstaculo.x=stage.stageWidth+100;
//				obstaculo.y= int(Math.random()*(gameArea.bottom-gameArea.top))+gameArea.top;
//				this.addChild(obstaculo);
//			}
//			
//		}
		
		private function agregadoAPantalla():void{
			removeEventListener(Event.ADDED_TO_STAGE, agregadoAPantalla);			
			inicializarJuego();
			
			puntaje = new Puntaje(300,100,"Puntaje: 0","MyFontName",24,0xFFFFFF);
			
			vida = new TextField(300,100,"Vida: 300","MyFontName",24 ,0xFFFFFF);
			
			municion = new TextField(300,100,"Municion: 0","MyFontName",24 ,0xFFFFFF);
			
			addChild(municion);
			municion.x = 700;
			addChild(puntaje);
			vida.x = 400;
			addChild(vida);
		}
		
		private function inicializarJuego():void{
			
//			contadorEnemigos = 0;
			
			bg= new Background();
			
			addChild(bg);	
			
//			obstaculo = new Cometa();
//			obstaculo.x = 800;
//			obstaculo.y = 500;
//			addChild(obstaculo);
			
			hero = new Ovni();
			hero.x = stage.stageWidth/2;
			hero.y = stage.stageHeight/2;
			addChild(hero);
			
			btnIniciar = new Button(Assets.obtenerTextura("iniciar"));
			btnIniciar.x = stage.stageWidth * 0.5 - btnIniciar.width * 0.5;
			btnIniciar.y = stage.stageHeight * 0.5 - btnIniciar.height * 0.5;
			addChild(btnIniciar);
			
			gameArea= new Rectangle(0,200,stage.stageWidth,stage.stageHeight-250);

		}
		
		public function esconder():void
		{
			removeEventListener(TouchEvent.TOUCH,onTouch);
			removeEventListener(Event.ENTER_FRAME, OnGameTick);
			visible = false;			
			
		}
		
		public function iniciar():void
		{
			visible = true;
				
			addEventListener(Event.ENTER_FRAME, checkElapsed);
		
			hero.x = -stage.stageWidth;
			hero.y = stage.stageHeight * 0.5;
			
			estadoJuego = "idle";
			
			velocidadJugador = 0;
			golpeObstaculo = 0;
			
			bg.speed = 0;
			
			distanciaRecorrida = 0;
			obstacleGapCount = 0;
			
			btnIniciar.visible =true;
			
			enemigos = new Vector.<Enemigo>();
			powerUps = new Vector.<AbstractPowerUp>();
			bullets = new Vector.<Image>();
			btnIniciar.addEventListener(Event.TRIGGERED, botonIniciarSeleccionado);
		}
		
		private function botonIniciarSeleccionado(event:Event):void
		{
			btnIniciar.visible = false;
			removeEventListener(Event.TRIGGERED, botonIniciarSeleccionado);
			
			lanzarHero();
		}
		
		private function lanzarHero():void{
			addEventListener(TouchEvent.TOUCH,onTouch);
			addEventListener(Event.ENTER_FRAME, OnGameTick);
		}
		
		private function onTouch(event:TouchEvent):void
		{
			touch = event.getTouch(stage);	
			
			if(touch !=null){
				try{
					touch = event.getTouch(stage);	
					touchX = touch.globalX;
					touchY = touch.globalY;
				}catch(err:Error){
					
				}
			}
		}
		
		private function OnGameTick(event:Event):void{
			switch(estadoJuego){
				case "idle":
					hero.vida = 300;
					hero.setMunicion(50);
					//aparecer en pantalla
					if(hero.x < stage.stageWidth * 0.5 * 0.5){
						hero.x += ((stage.stageWidth * 0.5 * 0.5 + 10) - hero.x) * 0.05;
						hero.y = stage.stageHeight * 0.5;
						
						velocidadJugador +=(MIN_SPEED - velocidadJugador) * 0.05;
						bg.speed = velocidadJugador*2 * elapsed;
						
						
						
//						addEventListener(Event.ENTER_FRAME, agregarEnemigo);
					}else{
						estadoJuego = "flying";
					}
				break;
					
				case "flying":
										
					if(golpeObstaculo<= 0){
						hero.y -=(hero.y - touchY) * 0.1;
						
						//rotacion al mover el mouse
						if(-(hero.y - touchY) < 150 && -(hero.y - touchY) > -150){
							hero.rotation = deg2rad(-(hero.y - touchY) * 0.2);
						}
						
						
						if(hero.y > gameArea.bottom - hero.height+100 * 0.5){
							hero.y = gameArea.bottom - hero.height+100 * 0.5;
							hero.rotation = deg2rad(0);
						}//rango de vuelo
						if(hero.y < gameArea.top - hero.height+100 * 0.5){
							hero.y = gameArea.top - hero.height+100 * 0.5;
							hero.rotation = deg2rad(0);
						}
						
					}else{
						golpeObstaculo--;
						efectoEnPantalla();
					}
					
					velocidadJugador -= (velocidadJugador - MIN_SPEED) * 0.01;
					bg.speed = velocidadJugador * elapsed;
					
					distanciaRecorrida += (velocidadJugador * elapsed) * 0.1;
				//	trace(distanciaRecorrida);
					
					puntaje.text = "Puntaje: "+distanciaRecorrida;
					
					municion.text = "Municion: "+hero.getMunicion();
					
					iniciarObstaculo();
					animarObstaculos();
					
					crearPowerUps();
					animarPowerUps();
					
					calcularVida();
					animarBullets();

					
				break;
				
				case "over":
					
					trace("morido");
					removeEventListener(Event.ENTER_FRAME, checkElapsed);
					velocidadJugador = 0;
					bg.speed = velocidadJugador;
					
					dispatchEvent(new EventoNavegacion(EventoNavegacion.CHANGE_SCREEN,{id:"menu"},true));
					
				break;
				
			}
			
		}
		
		private function animarBullets():void
		{
			var bulletTracked:Image;
			
			for(var i:uint = 0; i< bullets.length;i++){
				bulletTracked = bullets[i];
				
				bulletTracked.x += hero.getArma().velocidad * elapsed;
				try{
					if(bulletTracked.bounds.intersects(enemigos[0].bounds)){
						hero.getArma().municion += 5;
						bullets.splice(i,1);
						removeChild(bulletTracked);
						removeChild(enemigos[0]);
						enemigos.splice(0,1);
					}
				}catch(Exception){
					
				}
				
				if(bulletTracked.x > stage.stageWidth+50){
					bullets.splice(i,1);
					removeChild(bulletTracked);
				}
				
			}
		}
		
		private function generarBalas(event:KeyboardEvent):void{
			if(event.keyCode == 32 && hero.getArma().municion > 0){
				hero.disparar();
				var bullet:Image;
				bullet = new Image(Assets.obtenerTextura("laser"));
				bullet.x = hero.x+10;
				bullet.y = hero.y;
				
				addChild(bullet);
				
				bullets.push(bullet);
				
			}
		}		
		
		private function calcularVida():void
		{
			if(hero.vida<=0){
				//estadoJuego = "over";
			}
		}
		
		private function animarPowerUps():void
		{
			var powerUpASeguir:AbstractPowerUp;
			
			for(var i:uint = 0; i< powerUps.length;i++){
				powerUpASeguir = powerUps[i];
				
				powerUpASeguir.x -= velocidadJugador * elapsed;
				
				if(powerUpASeguir.bounds.intersects(hero.bounds)){
					hero.getArma().municion += 5;
					powerUps.splice(i,1);
					removeChild(powerUpASeguir);
				}
				
				if(powerUpASeguir.x < -50){
					powerUps.splice(i,1);
					removeChild(powerUpASeguir);
				}
				
			}
			
		}
		
		private function crearPowerUps():void
		{
			if(Math.random() > 0.100){
				var powerUp:AbstractPowerUp;
				powerUp = fabricaPowerUps.crearPowerUp(1);//posibles valores 1 y 2
				powerUp.x = stage.width +50;
				powerUp.y = int(Math.random() *(gameArea.bottom - gameArea.top))+gameArea.top;
				addChild(powerUp);
				
				powerUps.push(powerUp);
			}
		}
		
		private function efectoEnPantalla():void
		{
			if(golpeObstaculo > 0){
				x = Math.random() * golpeObstaculo;
				y = Math.random() * golpeObstaculo;
			}else if (x != 0){
				
				this.x = 0;
				this.y = 0;
			}
			
		}
		
		private function animarObstaculos():void
		{
			var enemigoASeguir:Enemigo;
			for(var i:uint = 0;i<enemigos.length;i++){
				enemigoASeguir = enemigos[i];
				
				if(enemigoASeguir.golpeado == false && enemigoASeguir.bounds.intersects(hero.bounds)){
					enemigoASeguir.golpeado = true;
					enemigoASeguir.rotation = deg2rad(70);
					golpeObstaculo = 30;
					velocidadJugador *=0.5;
					
					hero.vida -= enemigoASeguir.damage;
					
					trace(hero.vida);
					vida.text = "Vida: "+hero.vida;
						
				}
				if(enemigoASeguir.distancia>0){
					enemigoASeguir.distancia -= velocidadJugador * elapsed;
				}else{
					enemigoASeguir.x -= (velocidadJugador + enemigoASeguir.velocidad)* elapsed;
				}
				
				if(enemigoASeguir.x < -enemigoASeguir.width || estadoJuego == "over" ){
					enemigos.splice(i,1);
					removeChild(enemigoASeguir);
				}

			}
			
		}
		
		private function iniciarObstaculo():void
		{
			if(obstacleGapCount < 1200){
				obstacleGapCount += velocidadJugador * elapsed;
			}
			else if (obstacleGapCount != 0){
				obstacleGapCount = 0;
				agregarEnemigo(Math.ceil(Math.random()* 4),Math.random() * 1000 +1000);
			}
		}
		
		private function agregarEnemigo(ptipo:Number, pdistancia:Number):void
		{
			var enemigo:Enemigo = new Enemigo(ptipo,pdistancia);	
			enemigo.x = stage.stageWidth;
			addChild(enemigo);
			
			if(Math.random() > 0.5){
				enemigo.y = gameArea.top;
				
				
			}else{
				
			}
			enemigos.push(enemigo);
		}
		
//		private function obstaculos():void
//		{
//			var enemyToTrack:Enemy;
//			
//			for(var i:uint; i<enemigos.length;i++){
//				enemyToTrack = enemigos[i];
//				
//				if(enemyToTrack){
//					
//				}
//				
//			}
//		}
		
		private function checkElapsed():void
		{
			timePrevious = timeCurrent;
			timeCurrent = getTimer();
			elapsed = (timeCurrent - timePrevious) *0.001;
			
		}
		
	}
}
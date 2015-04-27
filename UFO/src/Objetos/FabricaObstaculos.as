package Objetos{
	
	public class FabricaObstaculos{

		
		public function FabricaObstaculos(){
				super();
				
		}
		
		
		public function crearObstaculo(ptipo:String):AbstractObstaculo{
			var obstaculo:AbstractObstaculo;
			
			if(ptipo=="Asteroide"){
				obstaculo= new Asteroide();
			}
			else if(ptipo=="Cometa"){
				obstaculo= new Cometa();
			}
			return obstaculo;

		}
	}
}
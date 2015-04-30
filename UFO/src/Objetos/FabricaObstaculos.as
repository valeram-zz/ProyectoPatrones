package Objetos{
	
	public class FabricaObstaculos{

		
		public function FabricaObstaculos(){
				super();
				
		}
		
		
		public function crearObstaculo(ptipo:int):AbstractObstaculo{
			var obstaculo:AbstractObstaculo;
			
			if(ptipo==1){
				obstaculo= new Asteroide();
			}
			else if(ptipo==2){
				obstaculo= new Cometa();
			}
			return obstaculo;

		}
	}
}
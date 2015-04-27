package Objetos
{
	public class FabricaPowerUps
	{
		
		
		public function FabricaPowerUps(){
		}
			
		public function crearPowerUp(ptipo:int):AbstractPowerUp{
		
			var powerUp:AbstractPowerUp;
			
			if(ptipo==1){
				powerUp= new Escudo();
			}
			else if(ptipo==2){
				powerUp= new Explosion();
			}
			return powerUp;
				
		}
		
	}
}
package{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;

	public class Assets{
		[Embed(source="../Media/objetos/ufo.png")]
		public static const ufo:Class;
		public static var texturasJuego:Dictionary = new Dictionary(); 
		
		public static function obtenerTextura(nombre:String):Texture{
			
			if(texturasJuego[nombre]==undefined){
				var bitmap:Bitmap = new Assets[nombre]();
				texturasJuego[nombre] = Texture.fromBitmap(bitmap);
			}
			
			return texturasJuego[nombre];
		}
	}
}
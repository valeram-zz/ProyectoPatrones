package{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets{
		
		[Embed(source="../Media/ovnis/Buenos/ovni9.png")]
		public static const ovniBueno:Class;
		
		[Embed(source="../Media/ovnis/Malos/ovni1.png")]
		public static const ovniMalo1:Class;
		
		[Embed(source="../Media/ovnis/Malos/ovni3.png")]
		public static const ovniMalo2:Class;
		
		[Embed(source="../Media/ovnis/Malos/ovni4.png")]
		public static const ovniMalo3:Class;

		[Embed(source="../Media/font/space.ttf", fontFamily="MyFontName", embedAsCFF = "false")]
		public static var Myfont:Class;
		
		
//		[Embed(source="../Media/music/Dreamwalk.mp3")]
//		public static const dreamwalk:Class;
		[Embed(source="../Media/objetos/shield.png")]
		public static const escudo:Class;
		
		
		
		[Embed(source="../Media/objetos/ufo.png")]
		public static const ufo:Class;
		
		[Embed(source="../Media/imagenes/space.jpg")]
		public static const bg:Class;
		
		[Embed(source="../Media/imagenes/bg1.png")]
		public static const layer1:Class;
		
		[Embed(source="../Media/imagenes/logo.png")]
		public static const logo:Class;
		
		[Embed(source="../Media/botones/start.png")]
		public static const iniciar:Class;
		
		[Embed(source="../Media/botones/info.png")]
		public static const informacion:Class;
		
		public static var texturasJuego:Dictionary = new Dictionary(); 
		
		private static var gameTextureAtlas:TextureAtlas;
		
		[Embed(source="../Media/spritesheet/juagoufo.png")]
		public static const AtlasTextureGame:Class;
		
		[Embed(source="../Media/spritesheet/juagoufo.xml",mimeType="application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
		public static function getAtlas():TextureAtlas
		{
			if(gameTextureAtlas == null){
				var texture:Texture = obtenerTextura("AtlasTextureGame");
				var xml:XML =  XML(new AtlasXmlGame());
				gameTextureAtlas = new TextureAtlas(texture,xml);
			}
			return gameTextureAtlas;
		}
		
		public static function obtenerTextura(nombre:String):Texture{
			
			if(texturasJuego[nombre]==undefined){
				var bitmap:Bitmap = new Assets[nombre]();
				texturasJuego[nombre] = Texture.fromBitmap(bitmap);
			}
			
			return texturasJuego[nombre];
		}
	}
}
package Pantallas{
	import starling.events.Event;

	public class EventoNavegacion extends Event{
		
		public static const CHANGE_SCREEN:String = "changeScreen"
		
		public var  params:Object;	
			
		public function EventoNavegacion(type:String,_params:Object = null, bubles:Boolean=false){
			super(type,bubles)
			params = _params;
			
		}
		
		
	}
}
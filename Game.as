package {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.xml.*;
	import flash.geom.*;
	import flash.net.*;
	import flash.display.BitmapData;
	import flash.filters.*;
	
	
	public class Game {
		private var _world:World;
		private var _view:Rectangle;		
		
		public function Game() {

		}
		
		public function MoveAvatar(a:Avatar, mv:MovementVector)
		{
			if (a.IsAtEdgeOf(_view))
			{
				
			}
								   
			
		}
	}
	
}
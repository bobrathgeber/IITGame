package {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.xml.*;
	import flash.geom.*;
	import flash.net.*;
	import flash.display.BitmapData;
	import flash.filters.*;
	
	public class Npc extends MovieClip {
		public function Npc(obj:wObject) {
			obj.gotoAndStop("person");
			addChild(obj);
		}
	}

}
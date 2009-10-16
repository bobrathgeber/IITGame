package {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.xml.*;
	import flash.geom.*;
	import flash.net.*;
	import flash.display.BitmapData;
	import flash.filters.*;
	
	
	public class ObtainableItem extends MovieClip {
		public function ObtainableItem(obj:wObject, image:String) {
			obj.gotoAndStop(image);
			addChild(obj);
		}
	}
	
}
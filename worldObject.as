package {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.xml.*;
	import flash.geom.*;
	import flash.net.*;
	import flash.display.BitmapData;
	import flash.filters.*;
	
	
	public class worldObject extends MovieClip {
		public var itemType:String = "";
		public function worldObject(newX:int,newY:int,newType:String,newImage:String) {
			var newObject:wObject = new wObject();
			itemType = newType;
			newObject.gotoAndStop(newImage);
			x = newX;
			y = newY;
			addChild(newObject);
		}
	}
	
}
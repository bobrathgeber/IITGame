package {
	import flash.display.BitmapData;
	import flash.geom.*;
	import flash.display.MovieClip;
	public class Avatar {
		// fields
		private var _mc:MovieClip;
		private var _inventory:Array;
		private var _pos:Position;
		private var _hitbox:Rectangle;
		private var _bmpData:BitmapData;
				
		// ctor
		public function Avatar(mc:MovieClip) {
			_mc = mc;			
			_pos = new Position(mc);
			// trace mc.Parent
			_hitbox = mc.getBounds(mc.parent);
			
			_bmpData = new BitmapData(_hitbox.width, _hitbox.height, true, 0);
			_bmpData.draw(mc);
		}
		// property
		public function get BmpData():BitmapData
		{
			return _bmpData;
		}
		// methods
		public function Pickup(item:ObtainableItem):void
		{
			//throw new Exception();
			//_inventory.Add(item);
		}
				
		public function SetSex(avatarSex:int):void
		{
			if (avatarSex==1) {
				ShowBoy();
			} else {
				ShowGirl();
			}
		}
		public function get x():int
		{
			return _mc.x;
		}
		public function get y():int
		{
			return _mc.y;
		}
		public function ShowBoy():void
		{
			_mc.girl.visible=false;
		}
		public function ShowGirl():void
		{
			_mc.boy.visible=false;
		}
		
		public function Drop(item:wObject):void
		{
			//throw new NotImplementedException();
			//_inventory.Splice(item);
			//item
		}
		
		
		public function Move(mv:MovementVector):void
		{
			trace("speed of av:" + mv.Speed);
			
			// rotate
			_mc.rotation = mv.Direction;
			
			// walk if moving
			if (mv.Speed > 0)
			{
				trace(mv.XComponent + ", " + mv.YComponent);
				_mc.x += mv.XComponent;
				_mc.y += mv.YComponent;
				_mc.gotoAndStop(_mc.currentFrame+1);
			}		
		}		
	}
}

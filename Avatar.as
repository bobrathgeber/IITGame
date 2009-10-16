package {

	public class Avatar {
		// fields
		private _mc:MovieClip;
		private _inventory:Array;
		private _pos:Position;
		private _hitbox:Rectangle;
		private _bmpData:BitmapData;
				
		// ctor
		public function Avatar(mc:MovieClip) {
			_mc = mc;			
			_pos = new Position(mc);
			// trace mc.Parent
			_hitbox = new Rectangle(mc.parent);
			
			_bmpData = new BitmapData(_hitbox.width, _hitbox.height, true, 0);
			_bmpData.draw(avatar_mc);
		}
		// property
		public function get BmpData:BitmapData
		{
			return _bmpData;
		}
		// methods
		public function Pickup(item:wObject):void
		{
			//throw new Exception();
			//_inventory.Add(item);
		}
				
		public function SetSex(avatarSex:int):void
		{
			if (avatarSex==1) {
				avatar.ShowBoy();
			} else {
				avatar.ShowGirl();
			}
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
		
		public function GetTarget(mv:MovementVector):Position
		{
			
		}
		
		public function IsAtEdge(r:Rectange):Boolean
		{
			if (_pos.y == r.top // etc)
			{
				return true;
			}
			else
			{
				return false;
			}
			
		}
		
		public function Move(mv:MovementVector):void
		{
			// rotate
			_mc.rotation = mv.Direction;
			
			// walk if moving
			if (_mc.Speed > 0)
			{
				_mc.gotoAndStop(_mc.currentFrame+1);
			}		
		}		
	}
}

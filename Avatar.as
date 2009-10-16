package {

	public class Avatar {
		private _mc:MovieClip;
		private _inventory:Array;
		private _pos:Position;
		
		public function Avatar(mc:MovieClip) {
			_mc = mc;
			//_invatory  initalize
			_pos = new Position(mc);
		}
		
		public function Pickup(item:wObject):void
		{
			//throw new Exception();
			//_inventory.Add(item);
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
			
		if (avatar_mc.y<=75&&upArrow) {
			moveObject(bg_mc, 0, 1);
			avatar_mc.rotation=90;
			avatar_mc.gotoAndStop(avatar_mc.currentFrame+1);
		}
		if (avatar_mc.y>=400&&downArrow) {
			moveObject(bg_mc, 0, -1);
			avatar_mc.rotation=270;
			avatar_mc.gotoAndStop(avatar_mc.currentFrame+1);
		}
		if (avatar_mc.x<=75&&leftArrow) {
			moveObject(bg_mc, 1, 0);
			avatar_mc.rotation=0;
			avatar_mc.gotoAndStop(avatar_mc.currentFrame+1);
		}
		if (avatar_mc.x>=575&&rightArrow) {
			moveObject(bg_mc, -1, 0);
			avatar_mc.rotation=180;
			avatar_mc.gotoAndStop(avatar_mc.currentFrame+1);
		}
	} else if (leftArrow && upArrow) {
		moveObject(avatar_mc, -0.5, -0.5);
		avatar_mc.rotation=45;
		avatar_mc.gotoAndStop(avatar_mc.currentFrame+1);
	} else if (rightArrow && upArrow) {
		moveObject(avatar_mc, 0.5, -0.5);
		avatar_mc.rotation=135;
		avatar_mc.gotoAndStop(avatar_mc.currentFrame+1);
	} else if (leftArrow && downArrow) {
		moveObject(avatar_mc, -0.5, 0.5);
		avatar_mc.rotation=315;
		avatar_mc.gotoAndStop(avatar_mc.currentFrame+1);
	} else if (downArrow && rightArrow) {
		moveObject(avatar_mc, 0.5, 0.5);
		avatar_mc.rotation=225;
		avatar_mc.gotoAndStop(avatar_mc.currentFrame+1);
	} else {
		if (leftArrow) {
			moveObject(avatar_mc, -1, 0);
			avatar_mc.rotation=0;
			avatar_mc.gotoAndStop(avatar_mc.currentFrame+1);
		}
		if (rightArrow) {
			moveObject(avatar_mc, 1, 0);
			avatar_mc.rotation=180;
			avatar_mc.gotoAndStop(avatar_mc.currentFrame+1);
		}
		if (upArrow) {
			moveObject(avatar_mc, 0, -1);
			avatar_mc.rotation=90;
			avatar_mc.gotoAndStop(avatar_mc.currentFrame+1);
		}
		if (downArrow) {
			moveObject(avatar_mc, 0, 1);
			avatar_mc.rotation=270;
			avatar_mc.gotoAndStop(avatar_mc.currentFrame+1);
		}
	}
		}		
	}
	
}
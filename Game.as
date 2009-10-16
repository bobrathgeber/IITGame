package {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.xml.*;
	import flash.geom.*;
	import flash.net.*;
	import flash.display.BitmapData;
	import flash.filters.*;
	
	
	public class Game {
		private var _world:MovieClip;
		private var _npcs:Array;
		
		private var _wall:MovieClip;
		private var _view:Rectangle;
	
		private var _playerSpawn:Position;
		private var _container:MovieClip;

		var _idScore:Number = 0;
		var _gdScore:Number = 0;
		var _lmsScore:Number = 0;
		
		private function Spawn(pos:Position, mc:MovieClip)
		{
			mc.x=370;
			mc.y=220;
			_container.addChild(mc);
		}
		
		public function Game(container:MovieClip) {
			_container = container;
			_world = new bg();
			_world.x = -315.1;
			_world.y = -1085.8;
			
			_container.addChild(_world);
			var tmpMC:wObject = new wObject();
			tmpMC.x = 370;
			tmpMC.y = 220;
			_playerSpawn = new Position(tmpMC)
		
			_view = CreateView();
			CreateWalls();

			
			var firstPerson:worldObject = new worldObject(250,250,'person','person');
			firstPerson.filters = [new GlowFilter(0xFF0000,1,15,15)];

			_npcs = new Array([firstPerson]);
			
			_container.addChild(firstPerson);
		}

		
		private function CreateView():Rectangle
		{
			return new Rectangle(75, 75, 500, 325);
		}
		private function CreateWalls():void
		{
			var wall = new walls1();
			wall.x = -175.9;
			wall.y = -976.95;
			_container.addChild(wall);
			_wall = wall;
		}
		
		public function MoveWorld(mv:MovementVector)
		{
			_world.x += mv.XComponent;
			_world.y += mv.YComponent;
		}
		public function MakeAvatarPickup(a:Avatar, item:ObtainableItem)
		{			
			for each (var obj in _world)
			{
				if (obj === item)
				{
					a.Pickup(item);
					_world.remove(item);
				}
			}
		}
		private function IsOnViewEdge(a:Avatar):Boolean
		{
			return a.y <=_view.top || a.y >=_view.bottom || a.x <=_view.left || a.y >= _view.right
		}
		public function CollideTestFails(a:Avatar, mv:MovementVector)
		{
			//Wall Variables
			var wallHitBox = _wall.getBounds(_wall.parent);
			var wallsBmpData = new BitmapData(wallHitBox.width,wallHitBox.height,true,0);
			wallsBmpData.draw(_wall);

			var wallPoint:Point = new Point(_wall.x, _wall.y);
			var tolerance:int = 255;
			var avPoint:Point = new Point(a.x, a.y);
			return wallsBmpData.hitTest(wallPoint, tolerance, a.BmpData, avPoint, tolerance);
		}
		
		public function MoveAvatar(a:Avatar, mv:MovementVector)
		{
			trace("speed:" + mv.Speed);
			trace("dir:" + mv.Direction);
			// if moving the avatar along the vector will create a collision
			// set the movement vector speed to 0;
			if (CollideTestFails(a, mv))
			{
				trace("collision");
				mv.Speed = 0;
			}
			
			if (IsOnViewEdge(a))
			{
				MoveWorld(mv.Reverse());
			}
			else
			{
				a.Move(mv);
			}
		}
	}
	
}
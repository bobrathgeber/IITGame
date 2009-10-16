package {

	public class MovementVector {
		// fields
		var _speed:int;
		var _direction:int;
		
		// ctors
		public function MovementVector(dir:int,speed:int) {
			_speed = speed;
			_direction = dir
		}
		
		// properties
		public function get Speed():String
		{
			return _speed;
		}
		public function set Speed(value:int):void {
  			_speed = value;
		}

		public function get Direction():String
		{
			return _direction;
		}
		public function set Direction(value:int):void {
  			_direction = value;
		}
		
		public function get XComponent():Number
		{		
			return Math.cos(GetRadians(_direction)) * speed;
		}
		public function get YComponent():Number
		{
			return Math.sin(GetRadians(_direction)) * speed;
		}
		
		public function Reverse(mv:MovementVector):MovementVector
		{
			return new MovementVector(GetOppositeDirection(_direction), speed);
		}
		
		private function GetOppositeDirection(dir:Number)
		{
			var firstPass = dir - 180;
			
			if (dir < 0)
			{
				return dir + 360;
			}
			
			return dir;
		}
		private function GetRadians(degrees:Number):Number
		{
			return _direction / Math.PI;
		}
	}
	
}
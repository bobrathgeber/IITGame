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
		public function get Speed():int
		{
			return _speed;
		}
		public function set Speed(value:int):void {
  			_speed = value;
		}

		public function get Direction():int
		{
			return _direction;
		}
		public function set Direction(value:int):void {
  			_direction = value;
		}
		
		public function get XComponent():Number
		{		
			// 180 == 1
			// 0 == -1
			// 90 == 0
			// 270 == 0
			// return  
			// return Math.cos(GetRadians(_direction)) * _speed;
		}
		public function get YComponent():Number
		{
			// 180 == 0
			// 0 == 0
			// 90 == 1
			// 270 == -1
			// return Math.sin(GetRadians(_direction)) * _speed;
		}
		
		public function Reverse():MovementVector
		{
			return new MovementVector(GetOppositeDirection(_direction), _speed);
		}
		
		private function GetOppositeDirection(dir:Number)
		{
			var firstPass = dir;
			
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
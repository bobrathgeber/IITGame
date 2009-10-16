package {

	public class Position {
		public var X:int;
		public var Y:int;
		
		public function Position(mc:MovieClip) {
			X = mc.x;
			Y = mc.y;
		}
	}	
}
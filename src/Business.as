package
{
	public class Business
	{
		private var _hours:Vector.<DailyHours>;
		private var _color:uint;
		
		public var name:String;
		
		public function Business($hours:Vector.<DailyHours>, $color:uint, $name:String)
		{
			name = $name;
			_hours = $hours.concat();
			_color = $color;
		}
		
		public function get hours():Vector.<DailyHours>
		{
			return _hours.concat();
		}
		
		public function get color():uint
		{
			return _color;
		}
	}
}
package
{
	public class Person
	{
		private var _hours:DailyHours;
		private var _color:uint;
		private var _name:String;
		private var _location:String;
		private var _timezoneOffset:int;
		
		public function Person($hours:DailyHours, $color:uint, $name:String, $location:String, $timezoneOffset:int)
		{
			_hours = $hours;
			_color = $color;
			_name = $name;
			_location = $location;
			_timezoneOffset = $timezoneOffset;
		}

		public function get timezoneOffset():int
		{
			return _timezoneOffset;
		}

		public function get location():String
		{
			return _location;
		}

		public function get name():String
		{
			return _name;
		}

		public function get color():uint
		{
			return _color;
		}

		public function get hours():DailyHours
		{
			return _hours;
		}

	}
}
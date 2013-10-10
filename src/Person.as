package
{
	public class Person
	{
		private var _morningHours:DailyHours;
		private var _eveningHours:DailyHours;
		private var _coreHours:DailyHours;
		private var _color:uint;
		private var _name:String;
		private var _location:String;
		private var _timezoneOffset:int;
		
		public function Person($weekdayOpen:Time, $weekdayClose:Time, $color:uint, $name:String, $location:String, $timezoneOffset:int = 0, $weekendOpen:Time = null, $weekendClose:Time = null)
		{
			
			if($weekendOpen == null || $weekendClose == null ||
				($weekendOpen.hoursIntoWeek == $weekdayOpen.hoursIntoWeek && $weekendClose.hoursIntoWeek == $weekdayClose.hoursIntoWeek))
			{
				_coreHours = new DailyHours($weekdayOpen, $weekdayClose);
			}
			else {
				var timesArray:Array = [$weekdayOpen, $weekdayClose, $weekendOpen, $weekendClose];
				timesArray.sortOn("hoursIntoWeek", Array.NUMERIC);
				
				_morningHours = new DailyHours(timesArray[0], timesArray[1]);
				_coreHours = new DailyHours(timesArray[1], timesArray[2]);
				_eveningHours = new DailyHours(timesArray[2], timesArray[3]);
			}
			
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

		public function get morningHours():DailyHours
		{
			return _morningHours;
		}

		public function get eveningHours():DailyHours
		{
			return _eveningHours;
		}

		public function get coreHours():DailyHours
		{
			return _coreHours;
		}


	}
}
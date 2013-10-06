package
{
	public class Weekday
	{
		public static const MONDAY:String = "M";
		public static const TUESDAY:String = "T";
		public static const WEDNESDAY:String = "W";
		public static const THURSDAY:String = "Th";
		public static const FRIDAY:String = "F";
		public static const SATURDAY:String = "S";
		public static const SUNDAY:String = "Su";
		
		private var _day:String;
		
		public function Weekday($day:String)
		{
			_day = $day;
		}
		
		public function get day():String
		{
			return _day;
		}
		
		public function get dayOffset():Number
		{
			switch(_day)
			{
				case SUNDAY:
					return 0;
				case MONDAY:
					return 1;
				case TUESDAY:
					return 2;
				case WEDNESDAY:
					return 3;
				case THURSDAY:
					return 4;
				case FRIDAY:
					return 5;
				case SATURDAY:
					return 6;
				default:
					return -1;
			}
		}
	}
}
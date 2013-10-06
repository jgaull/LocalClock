package
{
	public class Time
	{
		private var _timeString:String;
		private var _convertedTime:Number;
		
		public function Time($timeString:String)
		{
			_timeString = $timeString;
			
			var hours:int = int($timeString.split(":")[0]);
			var minutes:Number = Number($timeString.split(":")[1]) / 60;
			_convertedTime = hours + minutes;
		}
		
		public function get hoursIntoWeek():Number
		{
			return _convertedTime;
		}
	}
}
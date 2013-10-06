package
{
	import flash.geom.Point;

	public class DailyHours
	{
		private var _open:Time;
		private var _close:Time;
		private var _day:Weekday;
		
		public function DailyHours($open:Time, $close:Time, $day:Weekday)
		{
			_open = $open;
			_close = $close;
			_day = $day;
		}
		
		public function getOpeningPoint(radius:Number):Point
		{
			return pointForTime(_open, radius);
		}
		
		public function getClosingPoint(radius:Number):Point
		{
			return pointForTime(_close, radius);
		}
		
		private function pointForTime(time:Time, radius:Number):Point
		{
			//x = cx + r * cos(a)
			//y = cy + r * sin(a)
			var dayOffsetRadians:Number = Math.PI / 2;
			var someCrazyNumber:Number = 2 * Math.PI * ((time.hoursIntoWeek + _day.dayOffset * 24) / (24 * 7)) - dayOffsetRadians;
			var x:Number = radius * Math.cos(someCrazyNumber);
			var y:Number = radius * Math.sin(someCrazyNumber);
			return new Point(x, y);
		}
	}
}
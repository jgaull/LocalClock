package
{
	import flash.geom.Point;

	public class DailyHours
	{
		private var _open:Time;
		private var _close:Time;
		
		public function DailyHours($open:Time, $close:Time)
		{
			_open = $open;
			_close = $close;
		}
		
		public function getPointsToDraw(radius:Number, timezoneOffset:int):Vector.<Point>
		{
			var points:Vector.<Point> = new Vector.<Point>();
			var hours:Number = _open.hoursIntoWeek + timezoneOffset;
			
			do {
				points.push(pointForHours(hours, radius));
				hours += 6;
			} while(hours < _close.hoursIntoWeek + timezoneOffset)
				
			points.push(pointForHours(_close.hoursIntoWeek + timezoneOffset, radius));
			
			return points;
		}
		
		public function getOpeningPoint(radius:Number):Point
		{
			return pointForHours(_open.hoursIntoWeek, radius);
		}
		
		public function getClosingPoint(radius:Number):Point
		{
			return pointForHours(_close.hoursIntoWeek, radius);
		}
		
		private function pointForHours(hours:Number, radius:Number):Point
		{
			//x = cx + r * cos(a)
			//y = cy + r * sin(a)
			var dayOffsetRadians:Number = Math.PI / 2;
			//var someCrazyNumber:Number = 2 * Math.PI * ((time.hoursIntoWeek + _day.dayOffset * 24) / (24 * 7)) - dayOffsetRadians;
			var someCrazyNumber:Number = 2 * Math.PI * (hours / 24) - dayOffsetRadians;
			var x:Number = radius * Math.cos(someCrazyNumber);
			var y:Number = radius * Math.sin(someCrazyNumber);
			return new Point(x, y);
		}
	}
}
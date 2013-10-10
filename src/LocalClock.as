package
{
	import clockParts.ClockRing;
	
	import com.adobe.images.PNGEncoder;
	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.sampler.NewObjectSample;
	import flash.utils.ByteArray;
	
	public class LocalClock extends Sprite
	{
		private var _clockFace:Sprite;
		private var _people:Vector.<Person>;
		
		public function LocalClock()
		{
			var scale:Number = 6;
			var innerRadius:int = 75 * scale;
			var thickness:int = 15 * scale;
			var spacing:int = 3 * scale;
			var fudgeRadius:int = 250 * scale;
			
			setupData();
			
			_clockFace = new Sprite();
			
			for (var i:int = 0; i < _people.length; i++)
			{
				var person:Person = _people[i];
				var radius:Number = innerRadius + ((thickness + spacing) * i);
				var ring:ClockRing = new ClockRing(person, radius, thickness);
				_clockFace.addChildAt(ring, 0);
			}
			
			var overallRadius:Number = innerRadius + ((thickness + spacing) * i);
			var border:Sprite = new Sprite();
			border.graphics.lineStyle(1);
			border.graphics.drawCircle(0, 0, overallRadius);
			_clockFace.addChild(border);
			
			_clockFace.x = overallRadius;
			_clockFace.y = overallRadius;
			addChild(_clockFace);
			
			var pngSource:BitmapData = new BitmapData (overallRadius * 2, overallRadius * 2);
			pngSource.draw(this);
			var ba:ByteArray = PNGEncoder.encode(pngSource);
			var file:File = File.desktopDirectory.resolvePath("clock.png");
			var fileStream:FileStream = new FileStream();
			fileStream.open(file, FileMode.WRITE);
			fileStream.writeBytes(ba);
			fileStream.close();
		}
		
		private function setupData():void
		{
			_people = new Vector.<Person>();
			
			var mom:Person = new Person(new Time("15:00"), new Time("20:00"), 0xFF8000, "Shari", "Bethlehem, PA", 3, new Time("8:00"), new Time("20:00"));
			var dad:Person = new Person(new Time("09:00"), new Time("22:00"), 0xCCB129, "Dave", "Belle Mead, NJ", 3, new Time("09:00"), new Time("22:00"));
			var melissaMom:Person = new Person(new Time("18:30"), new Time("20:00"), 0x8A993D, "Caroline", "Los Altos, CA", 0, new Time("11:00"), new Time("20:00"));
			var melissaDad:Person = new Person(new Time("18:00"), new Time("20:00"), 0x14663D, "John", "Portland, OR", 0, new Time("07:00"), new Time("20:00"));
			var michelle:Person = new Person(new Time("17:00"), new Time("20:00"), 0x003333, "Michelle", "New Orleans, LA", 2, new Time("11:00"), new Time("20:00"));
			
			_people.push(mom);
			_people.push(dad);
			_people.push(melissaMom);
			_people.push(melissaDad);
			_people.push(michelle);
			
			/*var test:Vector.<DailyHours> = new Vector.<DailyHours>();
			test.push(new DailyHours(new Time("00:00"), new Time("12:00"), new Weekday(Weekday.MONDAY)));
			test.push(new DailyHours(new Time("00:00"), new Time("12:00"), new Weekday(Weekday.TUESDAY)));
			test.push(new DailyHours(new Time("00:00"), new Time("12:00"), new Weekday(Weekday.WEDNESDAY)));
			test.push(new DailyHours(new Time("00:00"), new Time("12:00"), new Weekday(Weekday.THURSDAY)));
			test.push(new DailyHours(new Time("00:00"), new Time("12:00"), new Weekday(Weekday.FRIDAY)));
			test.push(new DailyHours(new Time("00:00"), new Time("12:00"), new Weekday(Weekday.SATURDAY)));
			test.push(new DailyHours(new Time("00:00"), new Time("12:00"), new Weekday(Weekday.SUNDAY)));
			_businesses.unshift(new Business(test, 0xFF0000, "Test"));*/
		}
	}
}
package
{
	import clockParts.ClockRing;
	
	import com.adobe.images.PNGEncoder;
	
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.Sprite;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.sampler.NewObjectSample;
	import flash.utils.ByteArray;
	
	import org.alivepdf.display.Display;
	import org.alivepdf.events.ProcessingEvent;
	import org.alivepdf.images.ResizeMode;
	import org.alivepdf.layout.Layout;
	import org.alivepdf.layout.Orientation;
	import org.alivepdf.layout.Size;
	import org.alivepdf.layout.Unit;
	import org.alivepdf.pages.Page;
	import org.alivepdf.pdf.PDF;
	import org.alivepdf.saving.Method;
	
	public class LocalClock extends Sprite
	{
		private static const DPI:int = 300;
		private static const OVERALL_RADIUS:Number = 5.75;
		private static const OUTER_RADIUS:Number = 4.5;
		private static const INNER_RADIUS:Number = 1.5;
		private static const RING_GAP_PERCENTAGE:Number = 0.15;
		
		private static const INNER_MARKER_RADIUS:Number = 0.125;
		private static const BOTTOM_MARKER_SIZE:Number = 0.1;
		
		private var _clockFace:Sprite;
		private var _people:Vector.<Person>;
		
		public function LocalClock()
		{
			setupData();
			
			var overallThickness:Number = ((OUTER_RADIUS - INNER_RADIUS) / _people.length) * DPI;
			var spacing:Number = RING_GAP_PERCENTAGE * overallThickness;
			var thickness:Number = overallThickness - spacing;
			
			_clockFace = new Sprite();
			
			for (var i:int = 0; i < _people.length; i++)
			{
				var person:Person = _people[i];
				var radius:Number = OUTER_RADIUS * DPI - overallThickness * i;
				var ring:ClockRing = new ClockRing(person, radius, thickness);
				_clockFace.addChild(ring);
			}
			
			var clockFaceRadius:Number = OVERALL_RADIUS * DPI;
			var markup:Sprite = new Sprite();
			markup.graphics.lineStyle(1);
			markup.graphics.drawCircle(0, 0, clockFaceRadius);
			markup.graphics.drawCircle(0, 0, DPI * INNER_MARKER_RADIUS);
			markup.graphics.moveTo(0, clockFaceRadius);
			markup.graphics.lineTo(0, clockFaceRadius - BOTTOM_MARKER_SIZE * DPI);
			_clockFace.addChild(markup);
			
			_clockFace.x = clockFaceRadius;
			_clockFace.y = clockFaceRadius;
			addChild(_clockFace);
			
			var clockfaceSource:BitmapData = new BitmapData (clockFaceRadius * 2, clockFaceRadius * 2, false, 0xffffff);
			clockfaceSource.draw(this);
			var ba:ByteArray = PNGEncoder.encode(clockfaceSource);
			var file:File = File.desktopDirectory.resolvePath("clock.png");
			var fileStream:FileStream = new FileStream();
			fileStream.open(file, FileMode.WRITE);
			fileStream.writeBytes(ba);
			fileStream.close();
			file.openWithDefaultApplication();
			
			/*var fuck:Number = 2.835;
			var inchesSize:Number = OVERALL_RADIUS * 2;
			var pixelsSize:Number = inchesSize * DPI;
			var mmSize:Number = inchesSize * 25.4;
			var size:Size = new Size([pixelsSize * fuck, pixelsSize * fuck], "The Label", [inchesSize, inchesSize], [mmSize, mmSize]);
			
			var myPDF:PDF = new PDF(Orientation.PORTRAIT, Unit.MM, size);
			myPDF.setDisplayMode(Display.FULL_PAGE, Layout.SINGLE_PAGE);
		
			myPDF.addPage();
			myPDF.addImage(_clockFace, 0, 0, clockFaceRadius * 2, clockFaceRadius * 2);
			//myPDF.addImageStream(ba, 0, 0, pixelsSize, pixelsSize, 1);
			
			var f:FileStream = new FileStream();
			var file:File = File.desktopDirectory.resolvePath("clock.pdf");
			f.open( file, FileMode.WRITE);
			var bytes:ByteArray = myPDF.save(Method.LOCAL);
			f.writeBytes(bytes);
			f.close();
			file.openWithDefaultApplication();*/
		}
		
		private function setupData():void
		{
			_people = new Vector.<Person>();
			
			var mom:Person = new Person(new Time("15:00"), new Time("20:00"), 0xFF8000, "Shari", "Bethlehem, PA", -3, new Time("8:00"), new Time("20:00"));
			var dad:Person = new Person(new Time("09:00"), new Time("22:00"), 0xCCB129, "Dave", "Belle Mead, NJ", -3, new Time("09:00"), new Time("22:00"));
			var michelle:Person = new Person(new Time("17:00"), new Time("20:00"), 0x015b5b, "Michelle", "New Orleans, LA", -2, new Time("11:00"), new Time("20:00"));
			var melissaMom:Person = new Person(new Time("18:30"), new Time("20:00"), 0xa0aa6f, "Caroline", "Los Altos, CA", 0, new Time("11:00"), new Time("20:00"));
			var melissaDad:Person = new Person(new Time("18:00"), new Time("20:00"), 0x14663D, "John", "Portland, OR", 0, new Time("07:00"), new Time("20:00"));
			
			_people.push(melissaDad);
			_people.push(melissaMom);
			_people.push(michelle);
			_people.push(dad);
			_people.push(mom);
			
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
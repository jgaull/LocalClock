package clockParts
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class ClockRing extends Sprite
	{
		private var _outerMask:Sprite;
		private var _innerMask:Sprite;
		private var _ring:Sprite;
		
		public function ClockRing($person:Person, $innerRadius:Number, $thickness:Number)
		{
			super();
			
			var fudgeFactor:Number = 1.5;
			var points:Vector.<Point> = $person.hours.getPointsToDraw(($innerRadius + $thickness) * fudgeFactor, $person.timezoneOffset);
			
			_ring = new Sprite();
			_ring.graphics.beginFill($person.color);
			
			//Draw wedge for open time
			_ring.graphics.moveTo(0, 0);
			
			for(var i:int = 0; i < points.length; i++)
			{
				var point:Point = points[i];
				_ring.graphics.lineTo(point.x, point.y);
			}
			
			_ring.graphics.lineTo(0, 0);
			_ring.graphics.endFill();
			
			//Draw the mask
			_outerMask = new Sprite();
			_outerMask.graphics.beginFill(0x00ff00, 0.5);
			_outerMask.graphics.drawCircle(0, 0, $innerRadius);
			_outerMask.graphics.drawCircle(0, 0, $innerRadius + $thickness);
			_outerMask.graphics.endFill();
			
			_innerMask = new Sprite();
			_innerMask.graphics.beginFill(0xffffff);
			_innerMask.graphics.drawCircle(0, 0, $innerRadius);
			_innerMask.graphics.endFill();
			_ring.addChild(_innerMask);
			
			_ring.mask = _outerMask;
			_ring.addChild(_outerMask);
			addChild(_ring);
		}
	}
}
package clockParts
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class ClockRing extends Sprite
	{
		private var _outerMask:Sprite;
		private var _innerMask:Sprite;
		private var _ring:Sprite;
		
		public function ClockRing($dailyHours:DailyHours, $color:uint, $innerRadius:Number, $thickness:Number)
		{
			super();
			
			var fudgeFactor:Number = 1.5;
			var openingPoint:Point = $dailyHours.getOpeningPoint(($innerRadius + $thickness) * fudgeFactor);
			var closingPoint:Point = $dailyHours.getClosingPoint(($innerRadius + $thickness) * fudgeFactor);
			
			_ring = new Sprite();
			_ring.graphics.beginFill($color);
			
			//Draw the knockout for closed time
			_ring.graphics.moveTo(0, 0);
			_ring.graphics.lineTo(openingPoint.x, openingPoint.y);
			_ring.graphics.lineTo(closingPoint.x, closingPoint.y);
			_ring.graphics.lineTo(0, 0);
			_ring.graphics.endFill();
			
			//Draw the mask
			_outerMask = new Sprite();
			_outerMask.graphics.beginFill(0x00ff00, 0.5);
			_outerMask.graphics.drawCircle(0, 0, $innerRadius);
			_outerMask.graphics.drawCircle(0, 0, $innerRadius + $thickness);
			_outerMask.graphics.endFill();
			
			_innerMask = new Sprite();
			_innerMask.graphics.beginFill(0x00ff00);
			_innerMask.graphics.drawCircle(0, 0, $innerRadius);
			_innerMask.graphics.endFill();
			_ring.addChild(_innerMask);
			
			_ring.mask = _outerMask;
			_ring.addChild(_outerMask);
			addChild(_ring);
		}
	}
}
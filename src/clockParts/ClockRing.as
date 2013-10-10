package clockParts
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class ClockRing extends Sprite
	{
		private static const FUDGE_FACTOR:Number = 1.1;
		private var _outerMask:Sprite;
		private var _innerMask:Sprite;
		private var _ring:Sprite;
		
		public function ClockRing($person:Person, $innerRadius:Number, $thickness:Number)
		{
			super();
			
			_ring = new Sprite();
			
			//Draw wedge for open time
			this.drawSolidHours($person.coreHours, $person, $innerRadius, $thickness);
			
			if($person.morningHours)
			{
				this.drawDashedHours($person.morningHours, $person, $innerRadius, $thickness);
			}
			
			if($person.eveningHours)
			{
				this.drawDashedHours($person.eveningHours, $person, $innerRadius, $thickness);
			}
			
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
		
		private function drawDashedHours(hours:DailyHours, person:Person, innerRadius:Number, thickness:Number):void
		{
			var topDiagonal:Vector.<Point> = hours.getPointsToDraw(( innerRadius + thickness) * FUDGE_FACTOR, person.timezoneOffset);
			var bottomDiagonal:Vector.<Point> = hours.getPointsToDraw(innerRadius, person.timezoneOffset);
			
			var startPoint:Point = topDiagonal[0];
			_ring.graphics.moveTo(startPoint.x, startPoint.y);
			_ring.graphics.lineStyle();
			_ring.graphics.beginFill(person.color);
			
			var polygoneSize:int = 3;
			
			for(var i:int = hours == person.morningHours ? 0 : 1; i < topDiagonal.length - 1; i += polygoneSize)
			{
				var topLeft:Point = topDiagonal[i];
				_ring.graphics.moveTo(topLeft.x, topLeft.y);
				
				var polygon:Vector.<Point> = new Vector.<Point>();
				for(var j:int = 0; j < polygoneSize; j++)
				{
					polygon.push(topDiagonal[Math.min(j + i, topDiagonal.length - 1)]);
				}
				
				for(j = polygoneSize - 1; j >= 0; j--)
				{
					polygon.push(bottomDiagonal[Math.min(j + i, topDiagonal.length - 1)]);
				}
				
				polygon.push(topLeft);
				
				for(j = 0; j < polygon.length; j++)
				{
					var vertex:Point = polygon[j];
					_ring.graphics.lineTo(vertex.x, vertex.y);
				}
			}
			
			_ring.graphics.lineStyle();
		}
		
		private function drawSolidHours(hours:DailyHours, person:Person, innerRadius:Number, thickness:Number, alpha:Number = 1.0):void
		{
			_ring.graphics.beginFill(person.color, alpha);
			var points:Vector.<Point> = hours.getPointsToDraw((innerRadius + thickness) * FUDGE_FACTOR, person.timezoneOffset);
			_ring.graphics.moveTo(0, 0);
			
			for(var i:int = 0; i < points.length; i++)
			{
				var point:Point = points[i];
				_ring.graphics.lineTo(point.x, point.y);
			}
			
			_ring.graphics.lineTo(0, 0);
			_ring.graphics.endFill();
		}
	}
}
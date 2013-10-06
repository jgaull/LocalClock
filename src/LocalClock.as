package
{
	import clockParts.ClockRing;
	
	import flash.display.Sprite;
	
	public class LocalClock extends Sprite
	{
		private var _clockFace:Sprite;
		private var _businesses:Vector.<Business>;
		
		public function LocalClock()
		{
			var innerRadius:int = 75;
			var thickness:int = 10;
			var fudgeRadius:int = 250;
			
			setupData();
			
			_clockFace = new Sprite();
			
			for (var i:int = 0; i < _businesses.length; i++)
			{
				var business:Business = _businesses[i];
				
				for each(var hours:DailyHours in business.hours)
				{
					var ring:ClockRing = new ClockRing(hours, business.color, innerRadius + (thickness * i), thickness);
					_clockFace.addChildAt(ring, 0);
				}
			}
			
			_clockFace.x = innerRadius + (thickness * _businesses.length) + 1;
			_clockFace.y = innerRadius + (thickness * _businesses.length) + 1;
			addChild(_clockFace);
		}
		
		private function setupData():void
		{
			_businesses = new Vector.<Business>();
			
			var arizmendi:Vector.<DailyHours> = new Vector.<DailyHours>();
			arizmendi.push(new DailyHours(new Time("00:00"), new Time("00:00"), new Weekday(Weekday.MONDAY)));
			arizmendi.push(new DailyHours(new Time("07:00"), new Time("19:00"), new Weekday(Weekday.TUESDAY)));
			arizmendi.push(new DailyHours(new Time("07:00"), new Time("19:00"), new Weekday(Weekday.WEDNESDAY)));
			arizmendi.push(new DailyHours(new Time("07:00"), new Time("19:00"), new Weekday(Weekday.THURSDAY)));
			arizmendi.push(new DailyHours(new Time("07:00"), new Time("19:00"), new Weekday(Weekday.FRIDAY)));
			arizmendi.push(new DailyHours(new Time("07:30"), new Time("18:00"), new Weekday(Weekday.SATURDAY)));
			arizmendi.push(new DailyHours(new Time("07:30"), new Time("18:00"), new Weekday(Weekday.SUNDAY)));
			_businesses.unshift(new Business(arizmendi, 0x66CC55, "Arizmendi"));
			
			var dogpatchBoulders:Vector.<DailyHours> = new Vector.<DailyHours>();
			dogpatchBoulders.push(new DailyHours(new Time("12:00"), new Time("22:00"), new Weekday(Weekday.MONDAY)));
			dogpatchBoulders.push(new DailyHours(new Time("12:00"), new Time("22:00"), new Weekday(Weekday.TUESDAY)));
			dogpatchBoulders.push(new DailyHours(new Time("12:00"), new Time("22:00"), new Weekday(Weekday.WEDNESDAY)));
			dogpatchBoulders.push(new DailyHours(new Time("12:00"), new Time("22:00"), new Weekday(Weekday.THURSDAY)));
			dogpatchBoulders.push(new DailyHours(new Time("12:00"), new Time("22:00"), new Weekday(Weekday.FRIDAY)));
			dogpatchBoulders.push(new DailyHours(new Time("09:00"), new Time("18:00"), new Weekday(Weekday.SATURDAY)));
			dogpatchBoulders.push(new DailyHours(new Time("09:00"), new Time("18:00"), new Weekday(Weekday.SUNDAY)));
			_businesses.unshift(new Business(dogpatchBoulders, 0xFFCE00, "Dogpatch Boulders"));
			
			var bart:Vector.<DailyHours> = new Vector.<DailyHours>();
			bart.push(new DailyHours(new Time("04:15"), new Time("24:17"), new Weekday(Weekday.MONDAY)));
			bart.push(new DailyHours(new Time("04:15"), new Time("24:17"), new Weekday(Weekday.TUESDAY)));
			bart.push(new DailyHours(new Time("04:15"), new Time("24:17"), new Weekday(Weekday.WEDNESDAY)));
			bart.push(new DailyHours(new Time("04:15"), new Time("24:17"), new Weekday(Weekday.THURSDAY)));
			bart.push(new DailyHours(new Time("04:15"), new Time("24:17"), new Weekday(Weekday.FRIDAY)));
			bart.push(new DailyHours(new Time("05:58"), new Time("24:17"), new Weekday(Weekday.SATURDAY)));
			bart.push(new DailyHours(new Time("07:58"), new Time("24:17"), new Weekday(Weekday.SUNDAY)));
			_businesses.unshift(new Business(bart, 0xFF6600, "BART (To Oakland)"));
			
			var valenciaFarmersMarket:Vector.<DailyHours> = new Vector.<DailyHours>();
			valenciaFarmersMarket.push(new DailyHours(new Time("08:00"), new Time("19:30"), new Weekday(Weekday.MONDAY)));
			valenciaFarmersMarket.push(new DailyHours(new Time("08:00"), new Time("19:30"), new Weekday(Weekday.TUESDAY)));
			valenciaFarmersMarket.push(new DailyHours(new Time("08:00"), new Time("19:30"), new Weekday(Weekday.WEDNESDAY)));
			valenciaFarmersMarket.push(new DailyHours(new Time("08:00"), new Time("19:30"), new Weekday(Weekday.THURSDAY)));
			valenciaFarmersMarket.push(new DailyHours(new Time("08:00"), new Time("19:30"), new Weekday(Weekday.FRIDAY)));
			valenciaFarmersMarket.push(new DailyHours(new Time("09:00"), new Time("18:30"), new Weekday(Weekday.SATURDAY)));
			valenciaFarmersMarket.push(new DailyHours(new Time("08:00"), new Time("18:30"), new Weekday(Weekday.SUNDAY)));
			_businesses.unshift(new Business(valenciaFarmersMarket, 0xD799AF, "Valencia Farmer's Market"));
			
			var elFarolito:Vector.<DailyHours> = new Vector.<DailyHours>();
			elFarolito.push(new DailyHours(new Time("10:00"), new Time("26:30"), new Weekday(Weekday.MONDAY)));
			elFarolito.push(new DailyHours(new Time("10:00"), new Time("26:30"), new Weekday(Weekday.TUESDAY)));
			elFarolito.push(new DailyHours(new Time("10:00"), new Time("26:30"), new Weekday(Weekday.WEDNESDAY)));
			elFarolito.push(new DailyHours(new Time("10:00"), new Time("26:30"), new Weekday(Weekday.THURSDAY)));
			elFarolito.push(new DailyHours(new Time("10:00"), new Time("27:30"), new Weekday(Weekday.FRIDAY)));
			elFarolito.push(new DailyHours(new Time("10:00"), new Time("27:30"), new Weekday(Weekday.SATURDAY)));
			elFarolito.push(new DailyHours(new Time("10:00"), new Time("26:30"), new Weekday(Weekday.SUNDAY)));
			_businesses.unshift(new Business(elFarolito, 0x868F98, "El Farolito"));
			
			var biltmoreFrenchLaundry:Vector.<DailyHours> = new Vector.<DailyHours>();
			biltmoreFrenchLaundry.push(new DailyHours(new Time("08:00"), new Time("19:00"), new Weekday(Weekday.MONDAY)));
			biltmoreFrenchLaundry.push(new DailyHours(new Time("08:00"), new Time("19:00"), new Weekday(Weekday.TUESDAY)));
			biltmoreFrenchLaundry.push(new DailyHours(new Time("08:00"), new Time("19:00"), new Weekday(Weekday.WEDNESDAY)));
			biltmoreFrenchLaundry.push(new DailyHours(new Time("08:00"), new Time("19:00"), new Weekday(Weekday.THURSDAY)));
			biltmoreFrenchLaundry.push(new DailyHours(new Time("08:00"), new Time("19:00"), new Weekday(Weekday.FRIDAY)));
			biltmoreFrenchLaundry.push(new DailyHours(new Time("08:00"), new Time("19:00"), new Weekday(Weekday.SATURDAY)));
			biltmoreFrenchLaundry.push(new DailyHours(new Time("00:00"), new Time("00:00"), new Weekday(Weekday.SUNDAY)));
			_businesses.unshift(new Business(biltmoreFrenchLaundry, 0x751056, "Biltmore French Laundry"));
			
			var drTeeth:Vector.<DailyHours> = new Vector.<DailyHours>();
			drTeeth.push(new DailyHours(new Time("17:00"), new Time("26:00"), new Weekday(Weekday.MONDAY)));
			drTeeth.push(new DailyHours(new Time("17:00"), new Time("26:00"), new Weekday(Weekday.TUESDAY)));
			drTeeth.push(new DailyHours(new Time("17:00"), new Time("26:00"), new Weekday(Weekday.WEDNESDAY)));
			drTeeth.push(new DailyHours(new Time("17:00"), new Time("26:00"), new Weekday(Weekday.THURSDAY)));
			drTeeth.push(new DailyHours(new Time("17:00"), new Time("26:00"), new Weekday(Weekday.FRIDAY)));
			drTeeth.push(new DailyHours(new Time("10:00"), new Time("26:00"), new Weekday(Weekday.SATURDAY)));
			drTeeth.push(new DailyHours(new Time("10:00"), new Time("26:00"), new Weekday(Weekday.SUNDAY)));
			_businesses.unshift(new Business(drTeeth, 0x000000, "Dr. Teeth"));
			
			var coleHardware:Vector.<DailyHours> = new Vector.<DailyHours>();
			coleHardware.push(new DailyHours(new Time("08:00"), new Time("20:00"), new Weekday(Weekday.MONDAY)));
			coleHardware.push(new DailyHours(new Time("08:00"), new Time("20:00"), new Weekday(Weekday.TUESDAY)));
			coleHardware.push(new DailyHours(new Time("08:00"), new Time("20:00"), new Weekday(Weekday.WEDNESDAY)));
			coleHardware.push(new DailyHours(new Time("08:00"), new Time("20:00"), new Weekday(Weekday.THURSDAY)));
			coleHardware.push(new DailyHours(new Time("08:00"), new Time("20:00"), new Weekday(Weekday.FRIDAY)));
			coleHardware.push(new DailyHours(new Time("08:00"), new Time("20:00"), new Weekday(Weekday.SATURDAY)));
			coleHardware.push(new DailyHours(new Time("08:00"), new Time("20:00"), new Weekday(Weekday.SUNDAY)));
			_businesses.unshift(new Business(coleHardware, 0x76D0BD, "Cole Hardware"));
			
			var rainbowGrocery:Vector.<DailyHours> = new Vector.<DailyHours>();
			rainbowGrocery.push(new DailyHours(new Time("09:00"), new Time("21:00"), new Weekday(Weekday.MONDAY)));
			rainbowGrocery.push(new DailyHours(new Time("09:00"), new Time("21:00"), new Weekday(Weekday.TUESDAY)));
			rainbowGrocery.push(new DailyHours(new Time("09:00"), new Time("21:00"), new Weekday(Weekday.WEDNESDAY)));
			rainbowGrocery.push(new DailyHours(new Time("09:00"), new Time("21:00"), new Weekday(Weekday.THURSDAY)));
			rainbowGrocery.push(new DailyHours(new Time("09:00"), new Time("21:00"), new Weekday(Weekday.FRIDAY)));
			rainbowGrocery.push(new DailyHours(new Time("09:00"), new Time("21:00"), new Weekday(Weekday.SATURDAY)));
			rainbowGrocery.push(new DailyHours(new Time("09:00"), new Time("21:00"), new Weekday(Weekday.SUNDAY)));
			_businesses.unshift(new Business(rainbowGrocery, 0x00A0E2, "Rainbow Grocery"));
			
			var valenciaCyclery:Vector.<DailyHours> = new Vector.<DailyHours>();
			valenciaCyclery.push(new DailyHours(new Time("10:00"), new Time("18:00"), new Weekday(Weekday.MONDAY)));
			valenciaCyclery.push(new DailyHours(new Time("10:00"), new Time("18:00"), new Weekday(Weekday.TUESDAY)));
			valenciaCyclery.push(new DailyHours(new Time("10:00"), new Time("18:00"), new Weekday(Weekday.WEDNESDAY)));
			valenciaCyclery.push(new DailyHours(new Time("10:00"), new Time("19:00"), new Weekday(Weekday.THURSDAY)));
			valenciaCyclery.push(new DailyHours(new Time("10:00"), new Time("18:00"), new Weekday(Weekday.FRIDAY)));
			valenciaCyclery.push(new DailyHours(new Time("10:00"), new Time("18:00"), new Weekday(Weekday.SATURDAY)));
			valenciaCyclery.push(new DailyHours(new Time("11:00"), new Time("17:00"), new Weekday(Weekday.SUNDAY)));
			_businesses.unshift(new Business(valenciaCyclery, 0x0019A8, "Valencia Cyclery"));
			
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
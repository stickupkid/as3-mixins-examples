package org.osflash.mixins.examples.boid.mixins.position.util
{
	import flash.geom.Point;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class ExtendedPoint extends Point
	{
		
		private var _angle : Number;
		
		public function ExtendedPoint(x : Number = 0, y : Number = 0)
		{
			super(x, y);
		}
		
		private function getAngleInRadians() : Number
		{
			return (_angle = Math.atan2(y, x));
		}
		
		override public function get length() : Number
		{
			return Math.sqrt(x * x + y * y);
		}
		
		public function set length(value : Number) : void
		{
			if (x == 0 && y == 0) {
				const angle : Number = _angle || 0;
				x =	Math.cos(angle) * length;
				y =	Math.sin(angle) * length;
			} else {
				const scale : Number = value / length;
				// Force calculation of angle now, so it will be preserved even when
				// x and y are 0
				if (scale == 0) angle;
				x *= scale;
				y *= scale;
			}
		}
		
		public function get angle() : Number
		{
			return getAngleInRadians() * 180 / Math.PI; 
		}

	}
}

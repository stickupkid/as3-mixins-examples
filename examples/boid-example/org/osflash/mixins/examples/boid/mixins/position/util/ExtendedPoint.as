package org.osflash.mixins.examples.boid.mixins.position.util
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class ExtendedPoint
	{
		
		private var _angle : Number;
		
		private var _x : Number;
		
		private var _y : Number;
		
		public function ExtendedPoint(x : Number = 0, y : Number = 0)
		{
			_x = x;
			_y = y;
			
			getAngleInRadians();
		}
		
		public function subtract(p : ExtendedPoint) : ExtendedPoint
		{
			return new ExtendedPoint(x - p.x, y - p.y);
		}
		
		public function multiply(value : Number) : ExtendedPoint
		{
			return new ExtendedPoint(x * value, y * value);
		}
		
		public function distance(p : ExtendedPoint) : Number
		{
			const xx : Number = p.x - x;
			const yy : Number = p.y - y;
			return Math.sqrt(xx * xx + yy * yy);
		}
		
		public function normalize(value : Number) : ExtendedPoint
		{
			const l : Number = length;
			const scale : Number = l != 0 ? value / l : 0;
			return new ExtendedPoint(x * scale, y * scale);
		}
		
		public function clone() : ExtendedPoint
		{
			return new ExtendedPoint(x, y);
		}
				
		private function getAngleInRadians() : Number
		{
			_angle = Math.atan2(y, x);
			return _angle;
		}
		
		public function get x() : Number
		{
			return _x;
		}
		
		public function set x(value : Number) : void
		{
			_x = value;
		}
		
		public function get y() : Number
		{
			return _y;
		}
		
		public function set y(value : Number) : void
		{
			_y = value;
		}
		
		public function get length() : Number
		{
			return Math.sqrt(x * x + y * y);
		}
		
		public function set length(value : Number) : void
		{
			const l : Number = length;
			if (x == 0 && y == 0) 
			{
				const a : Number = angle || 0;
				x =	Math.cos(a) * l;
				y =	Math.sin(a) * l;
			} 
			else 
			{
				const scale : Number = value / l;
				
				if(scale == 0) getAngleInRadians();
				
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

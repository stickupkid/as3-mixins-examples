package org.osflash.mixins.examples.boid.mixins.position
{
	import org.osflash.mixins.examples.boid.mixins.position.util.ExtendedPoint;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class Position implements IPosition
	{

		private const _point : ExtendedPoint = new ExtendedPoint();

		public function get x() : Number
		{
			return _point.x;
		}

		public function set x(value : Number) : void
		{
			_point.x = value;
		}

		public function get y() : Number
		{
			return _point.y;
		}

		public function set y(value : Number) : void
		{
			_point.y = value;
		}

		public function get point() : ExtendedPoint
		{
			return _point;
		}
	}
}

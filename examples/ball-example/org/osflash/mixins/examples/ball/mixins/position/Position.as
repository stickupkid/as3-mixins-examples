package org.osflash.mixins.examples.ball.mixins.position
{
	import flash.geom.Point;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class Position implements IPosition
	{

		private const _point : Point = new Point();

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
	}
}

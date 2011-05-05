package org.osflash.mixins.examples.ball.mixins.radius
{

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class Radius implements IRadius
	{

		private var _radius : Number;

		public function get radius() : Number
		{
			return _radius;
		}

		public function set radius(value : Number) : void
		{
			_radius = value;
		}
	}
}

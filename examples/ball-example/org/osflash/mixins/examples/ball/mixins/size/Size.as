package org.osflash.mixins.examples.ball.mixins.size
{
	import flash.geom.Rectangle;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class Size implements ISize
	{

		private const _rectangle : Rectangle = new Rectangle();

		public function get width() : Number
		{
			return _rectangle.width;
		}

		public function set width(value : Number) : void
		{
			_rectangle.width = value;
		}

		public function get height() : Number
		{
			return _rectangle.height;
		}

		public function set height(value : Number) : void
		{
			_rectangle.height = value;
		}
	}
}

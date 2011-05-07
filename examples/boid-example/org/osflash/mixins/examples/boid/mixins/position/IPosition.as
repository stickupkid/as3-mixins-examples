package org.osflash.mixins.examples.boid.mixins.position
{
	import org.osflash.mixins.examples.boid.mixins.position.util.ExtendedPoint;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IPosition
	{

		function get x() : Number;

		function set x(value : Number) : void;

		function get y() : Number;

		function set y(value : Number) : void;
		
		function get point() : ExtendedPoint;
	}
}

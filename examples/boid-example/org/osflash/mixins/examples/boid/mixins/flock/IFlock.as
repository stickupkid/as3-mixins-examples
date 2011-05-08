package org.osflash.mixins.examples.boid.mixins.flock
{
	import org.osflash.mixins.examples.boid.mixins.boid.IBoid;
	import org.osflash.mixins.examples.boid.mixins.position.util.ExtendedPoint;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IFlock
	{
			
			
		function flock(boids : Vector.<IBoid>) : void;

		function separate(boids : Vector.<IBoid>) : ExtendedPoint;

		function align(boids : Vector.<IBoid>) : ExtendedPoint;

		function cohesion(boids : Vector.<IBoid>) : ExtendedPoint;

		function steer(boid : ExtendedPoint, slowdown : Boolean) : ExtendedPoint;

		function seek(boid : ExtendedPoint) : void;

		function arrive(boid : ExtendedPoint) : void;

		function get velocity() : ExtendedPoint;
		
		function get accelertion() : ExtendedPoint;
		
		function get maxSpeed() : Number;
	}
}

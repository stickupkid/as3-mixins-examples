package org.osflash.mixins.examples.boid.mixins.runnable
{
	import org.osflash.mixins.examples.boid.mixins.boid.IBoid;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IRunnable
	{
		
		function run(boids : Vector.<IBoid>) : void;
	}
}

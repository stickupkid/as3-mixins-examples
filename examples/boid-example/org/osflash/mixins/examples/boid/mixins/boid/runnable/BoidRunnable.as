package org.osflash.mixins.examples.boid.mixins.boid.runnable
{
	import org.osflash.mixins.examples.boid.mixins.boid.IBoid;
	import org.osflash.mixins.examples.boid.mixins.runnable.IRunnable;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class BoidRunnable implements IRunnable
	{
		
		private var _self : IBoid;
		
		public function BoidRunnable(self : IBoid)
		{
			_self = self;
		}
		
		public function run(boids : Vector.<IBoid>) : void
		{
			_self.flock(boids);
		
			_self.velocity.x += _self.accelertion.x;
			_self.velocity.y += _self.accelertion.y;
			
			_self.velocity.length = Math.min(_self.maxSpeed, _self.velocity.length);
			
			_self.x += _self.velocity.x;
			_self.y += _self.velocity.y;
			
			_self.draw();
			
			_self.accelertion.length = 0;
		}
	}
}

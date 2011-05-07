package org.osflash.mixins.examples.boid.mixins.boid.runnable
{
	import org.osflash.mixins.examples.boid.mixins.position.util.ExtendedPoint;
	import org.osflash.mixins.examples.boid.mixins.boid.IBoid;
	import org.osflash.mixins.examples.boid.mixins.boid.IBoidSelf;
	import org.osflash.mixins.examples.boid.mixins.runnable.IRunnable;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class BoidRunnable implements IRunnable, IBoidSelf
	{
		
		private var _self : IBoid;
		
		private var _lastPoint : ExtendedPoint;
		
		public function run(boids : Vector.<IBoid>) : void
		{
			_lastPoint = self.point;
			
			self.flock(boids);			
		}

		public function get self() : IBoid { return _self; }

		public function set self(value : IBoid) : void { _self = value;	}
	}
}

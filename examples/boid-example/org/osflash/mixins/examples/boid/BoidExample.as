package org.osflash.mixins.examples.boid
{
	import org.osflash.mixins.IMixin;
	import org.osflash.mixins.Mixin;
	import org.osflash.mixins.examples.boid.mixins.boid.IBoid;
	import org.osflash.mixins.examples.boid.mixins.boid.base.Boid;
	import org.osflash.mixins.examples.boid.mixins.boid.runnable.BoidRunnable;
	import org.osflash.mixins.examples.boid.mixins.position.IPosition;
	import org.osflash.mixins.examples.boid.mixins.position.Position;
	import org.osflash.mixins.examples.boid.mixins.runnable.IRunnable;
	import org.osflash.signals.natives.NativeSignal;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class BoidExample extends Sprite
	{
		
		public const boids : Vector.<IBoid> = new Vector.<IBoid>();
		
		public function BoidExample()
		{
			const boid : IMixin = new Mixin();
			boid.add(IPosition, Position);
			boid.add(IRunnable, BoidRunnable);
			
			boid.define(IBoid, Boid);
			
			boid.generate().completedSignal.add(handleBoidCreatedSignal);
			
			new NativeSignal(this, Event.ENTER_FRAME, Event).add(handleEnterFrame);
		}
		
		private function handleBoidCreatedSignal(mixin : IMixin) : void
		{
			for(var i : int = 0; i<30; i++)
			{
				const boid : IBoid = mixin.create(IBoid);
				boid.self = boid;
				boids.push(boid);
			}
		}
		
		private function handleEnterFrame(event : Event) : void
		{
			const total : int = boids.length;
			for(var i : int = 0; i<total; i++)
			{
				boids[i].run(boids);
			}
		}

	}
}

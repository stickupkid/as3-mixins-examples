package org.osflash.mixins.examples.boid
{
	import org.osflash.mixins.IMixin;
	import org.osflash.mixins.Mixin;
	import org.osflash.mixins.examples.boid.mixins.boid.IBoid;
	import org.osflash.mixins.examples.boid.mixins.boid.base.Boid;
	import org.osflash.mixins.examples.boid.mixins.boid.displayobject.BoidDisplayObject;
	import org.osflash.mixins.examples.boid.mixins.boid.drawable.BoidDrawable;
	import org.osflash.mixins.examples.boid.mixins.boid.flock.BoidFlock;
	import org.osflash.mixins.examples.boid.mixins.boid.graphic.BoidGraphics;
	import org.osflash.mixins.examples.boid.mixins.boid.runnable.BoidRunnable;
	import org.osflash.mixins.examples.boid.mixins.displayobject.IDisplayObject;
	import org.osflash.mixins.examples.boid.mixins.drawable.IDrawable;
	import org.osflash.mixins.examples.boid.mixins.flock.IFlock;
	import org.osflash.mixins.examples.boid.mixins.graphic.IGraphics;
	import org.osflash.mixins.examples.boid.mixins.position.IPosition;
	import org.osflash.mixins.examples.boid.mixins.position.Position;
	import org.osflash.mixins.examples.boid.mixins.runnable.IRunnable;
	import org.osflash.signals.natives.NativeSignal;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	[SWF(backgroundColor="#1d1d1d", frameRate="60", width="400", height="400")]
	public class BoidExample extends Sprite
	{
		
		public const boids : Vector.<IBoid> = new Vector.<IBoid>();
		
		public function BoidExample()
		{
			const boid : IMixin = new Mixin();
			boid.add(IPosition, Position);
			boid.add(IRunnable, BoidRunnable);
			boid.add(IFlock, BoidFlock);
			boid.add(IDrawable, BoidDrawable);
			boid.add(IGraphics, BoidGraphics);
			boid.add(IDisplayObject, BoidDisplayObject);
			
			boid.define(IBoid, Boid);
			
			boid.generate().completedSignal.add(handleBoidCreatedSignal);
			
			new NativeSignal(this, Event.ENTER_FRAME, Event).add(handleEnterFrame);
		}
		
		private function handleBoidCreatedSignal(mixin : IMixin) : void
		{
			for(var i : int = 0; i<30; i++)
			{
				const bx : int = Math.random() * 400;
				const by : int = Math.random() * 400;
				
				const boid : IBoid = mixin.create(IBoid, {x:bx, y:by});
				
				boids.push(boid);
				
				addChild(boid.displayObject);
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

package org.osflash.mixins.examples.boid.mixins.boid
{
	import org.osflash.mixins.examples.boid.mixins.displayobject.IDisplayObject;
	import org.osflash.mixins.examples.boid.mixins.drawable.IDrawable;
	import org.osflash.mixins.examples.boid.mixins.flock.IFlock;
	import org.osflash.mixins.examples.boid.mixins.graphic.IGraphics;
	import org.osflash.mixins.examples.boid.mixins.position.IPosition;
	import org.osflash.mixins.examples.boid.mixins.runnable.IRunnable;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IBoid extends 	IRunnable, 
									IFlock, 
									IPosition, 
									IDrawable, 
									IGraphics, 
									IDisplayObject
	{
	}
}

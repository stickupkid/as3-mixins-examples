package org.osflash.mixins.examples.boid.mixins.boid.base
{
	import org.osflash.mixins.examples.boid.mixins.boid.IBoid;
	import flash.display.Sprite;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class Boid extends Sprite
	{
		
		[Inject]
		public var boid : IBoid;
		
		public function _init_() : void
		{
			
		}
	}
}

package org.osflash.mixins.examples.boid.mixins.boid.graphic
{
	import flash.display.Graphics;
	import org.osflash.mixins.examples.boid.mixins.boid.IBoid;
	import org.osflash.mixins.examples.boid.mixins.boid.base.Boid;
	import org.osflash.mixins.examples.boid.mixins.graphic.IGraphics;


	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class BoidGraphics implements IGraphics
	{

		private var _self : IBoid;
		
		private var _boid : Boid;
		
		private var _graphics : Graphics;

		public function BoidGraphics(self : IBoid)
		{
			_self = self;
			
			_boid = Boid(_self);
			_graphics = _boid.graphics;
		}

		public function get graphic() : Graphics
		{
			return _graphics;
		}
	}
}

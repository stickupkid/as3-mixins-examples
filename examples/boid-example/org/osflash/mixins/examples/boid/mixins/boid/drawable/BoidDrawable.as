package org.osflash.mixins.examples.boid.mixins.boid.drawable
{
	import org.osflash.mixins.examples.boid.mixins.boid.IBoid;
	import org.osflash.mixins.examples.boid.mixins.drawable.IDrawable;
	import flash.display.Graphics;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class BoidDrawable implements IDrawable
	{
		
		private var _self : IBoid;
				
		public function BoidDrawable(self : IBoid)
		{
			_self = self;
		}
		
		public function draw() : void
		{
			const g : Graphics = _self.graphic;
			g.clear();
			g.beginFill(0xcccccc, 0.75);
			g.drawEllipse(_self.x - 10, _self.y - 8, 20, 16);
			g.endFill();
		}
	}
}

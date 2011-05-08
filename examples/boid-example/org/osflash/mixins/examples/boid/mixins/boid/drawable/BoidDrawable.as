package org.osflash.mixins.examples.boid.mixins.boid.drawable
{
	import org.osflash.mixins.examples.boid.mixins.boid.IBoid;
	import org.osflash.mixins.examples.boid.mixins.drawable.IDrawable;

	import flash.display.Graphics;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class BoidDrawable implements IDrawable
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
			g.beginFill(0xff00ff);
			g.drawCircle(_self.x, _self.y, 10);
			g.endFill();
		}
	}
}

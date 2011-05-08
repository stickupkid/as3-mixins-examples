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
			const x : int = _self.x;
			const y : int = _self.y;
			
			const g : Graphics = _self.graphic;
			g.clear();
			
			g.lineStyle(1, 0xffffff, 0.2);
			g.beginFill(0xffffff, 0.1);
			g.drawCircle(x, y, 12);
			g.endFill();
			
			g.lineStyle(0, 0xffffff);
			g.beginFill(0xffffff, 1);
			g.drawCircle(x, y, 4);
			g.endFill();
		}
	}
}

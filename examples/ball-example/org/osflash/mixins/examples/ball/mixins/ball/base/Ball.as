package org.osflash.mixins.examples.ball.mixins.ball.base
{
	import org.osflash.mixins.examples.ball.mixins.ball.IBall;

	import flash.display.Graphics;
	import flash.display.Sprite;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class Ball extends Sprite
	{
		[Inject]
		public var ball : IBall;
		
		public function draw() : void
		{
			const colour : int = ball.getRandomColour();
			
			const g : Graphics = graphics;
			g.beginFill(colour, 0.45);
			g.drawCircle(ball.x, ball.y, ball.radius);
			g.endFill();
		}
	}
}

package org.osflash.mixins.examples.ball.mixins.ball.base
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import org.osflash.mixins.examples.ball.mixins.ball.IBall;

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
			g.beginFill(colour);
			g.drawCircle(ball.x, ball.y, ball.radius);
			g.endFill();
		}
	}
}

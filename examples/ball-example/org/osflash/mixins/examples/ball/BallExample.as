package org.osflash.mixins.examples.ball
{
	import org.osflash.mixins.IMixin;
	import org.osflash.mixins.Mixin;
	import org.osflash.mixins.examples.ball.mixins.ball.IBall;
	import org.osflash.mixins.examples.ball.mixins.ball.base.Ball;
	import org.osflash.mixins.examples.ball.mixins.colour.Colour;
	import org.osflash.mixins.examples.ball.mixins.colour.IColour;
	import org.osflash.mixins.examples.ball.mixins.position.IPosition;
	import org.osflash.mixins.examples.ball.mixins.position.Position;
	import org.osflash.mixins.examples.ball.mixins.radius.IRadius;
	import org.osflash.mixins.examples.ball.mixins.radius.Radius;

	import flash.display.Sprite;
	import flash.utils.setInterval;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class BallExample extends Sprite
	{

		public function BallExample()
		{
			const mixin : IMixin = new Mixin();
			mixin.add(IColour, Colour);
			mixin.add(IPosition, Position);
			mixin.add(IRadius, Radius);
			
			mixin.define(IBall, Ball);
			
			mixin.generate().completedSignal.add(handleCreatedSignal);
		}
		
		private function handleCreatedSignal(mixin : IMixin) : void
		{
			setInterval(createBall, 100, mixin);
		}
		
		private function createBall(mixin : IMixin) : void
		{
			const randX : Number = Math.random() * 400;
			const randY : Number = Math.random() * 400;
			const randR : Number = (Math.random() * 80) + 20;
			
			const ball : Ball = mixin.create(IBall, {x: randX, y:randY, radius:randR}) as Ball;
			
			ball.draw();
			
			addChild(ball);
		}
	}
}

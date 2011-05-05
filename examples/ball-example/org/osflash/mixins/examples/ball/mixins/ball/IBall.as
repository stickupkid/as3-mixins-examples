package org.osflash.mixins.examples.ball.mixins.ball
{
	import org.osflash.mixins.examples.ball.mixins.colour.IColour;
	import org.osflash.mixins.examples.ball.mixins.radius.IRadius;
	import org.osflash.mixins.examples.ball.mixins.position.IPosition;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IBall extends IPosition, IRadius, IColour
	{
	}
}

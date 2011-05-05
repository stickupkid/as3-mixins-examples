package org.osflash.mixins.examples.ball.mixins.colour
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class Colour implements IColour
	{

		public function getRandomColour() : int
		{
			return int(Math.random() * 0xffffff);
		}
	}
}

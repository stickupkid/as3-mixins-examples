package org.osflash.mixins.examples.boid.mixins.boid
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IBoidSelf
	{
		
		
		function get self() : IBoid;
		
		function set self(value : IBoid) : void;
	}
}

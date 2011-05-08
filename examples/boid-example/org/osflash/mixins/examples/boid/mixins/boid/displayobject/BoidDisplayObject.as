package org.osflash.mixins.examples.boid.mixins.boid.displayobject
{
	import org.osflash.mixins.examples.boid.mixins.boid.IBoid;
	import org.osflash.mixins.examples.boid.mixins.boid.base.Boid;
	import org.osflash.mixins.examples.boid.mixins.displayobject.IDisplayObject;

	import flash.display.DisplayObject;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class BoidDisplayObject implements IDisplayObject
	{

		private var _self : IBoid;

		private var _boid : Boid;

		public function BoidDisplayObject(self : IBoid)
		{
			_self = self;

			_boid = Boid(_self);
		}

		public function get displayObject() : DisplayObject
		{
			return _boid;
		}
	}
}

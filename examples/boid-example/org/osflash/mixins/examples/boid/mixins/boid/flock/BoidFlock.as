package org.osflash.mixins.examples.boid.mixins.boid.flock
{
	import org.osflash.mixins.examples.boid.mixins.boid.IBoid;
	import org.osflash.mixins.examples.boid.mixins.flock.IFlock;
	import org.osflash.mixins.examples.boid.mixins.position.util.ExtendedPoint;

	import flash.geom.Point;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class BoidFlock implements IFlock
	{
		
		private var _self : IBoid;
			
		private const _velocity : ExtendedPoint = new ExtendedPoint();
		
		private const _accelertion : ExtendedPoint = new ExtendedPoint();
	
		protected const strength : Number = Math.random() * 0.5;
		
		protected const _maxSpeed : Number = 10 + strength;
		
		protected const maxForce : Number = 0.05 + strength;

		public function BoidFlock(self : IBoid)
		{
			_self = self;
		}
		
		public function flock(boids : Vector.<IBoid>) : void
		{
			const sep : ExtendedPoint = separate(boids);
			const ali : ExtendedPoint = align(boids);
			const coh : ExtendedPoint = cohesion(boids);
			
			_accelertion.x = sep.x + ali.x + coh.x;
			_accelertion.y = sep.y + ali.y + coh.y;
		}

		public function separate(boids : Vector.<IBoid>) : ExtendedPoint
		{
			const desiredSeperation : int = 60;
			const steer : ExtendedPoint = new ExtendedPoint();
			
			var count : int = 0;
			
			const loc : ExtendedPoint = _self.point;
			
			const total : int = boids.length;
			for(var i : int = 0; i<total; i++)
			{
				const other : IBoid = boids[i];
				const d : Number = Point.distance(loc, other.point);
				if(d > 0 && d < desiredSeperation)
				{
					const diff : Point = loc.subtract(other.point);
					diff.normalize(1 / d);
					
					steer.x += diff.x;
					steer.y += diff.y;
					
					count++;
				}
			}
			
			if(count > 0)
			{
				steer.x /= count;
				steer.y /= count;
			}
			
			if(steer.length > 0)
			{
				steer.length = _maxSpeed;
				steer.x -= velocity.x;
				steer.y -= velocity.y;
				steer.length = Math.min(steer.length, maxForce);
			}
			
			return steer;
		}

		public function align(boids : Vector.<IBoid>) : ExtendedPoint
		{
			const neighborDist : int = 25;
			const steer : ExtendedPoint = new ExtendedPoint();
			
			var count : int = 0;
			var nearest : int = 999;
			var closestPoint : ExtendedPoint;
			
			const loc : ExtendedPoint = _self.point;
			
			const total : int = boids.length;
			for(var i : int = 0; i<total; i++)
			{
				const other : IBoid = boids[i];
				const d : Number = Point.distance(loc, other.point);
				if(d > 0 && d < nearest)
				{
					closestPoint = other.point;
					nearest = d;
				}
				if(d > 0 && d < neighborDist)
				{
					steer.x += other.velocity.x;
					steer.y += other.velocity.y;
					count++;
				}
			}
			
			if(count > 0)
			{
				steer.x /= count;
				steer.y /= count;
			}
			
			if(steer.length > 0)
			{
				steer.length = _maxSpeed;
				steer.x -= velocity.x;
				steer.y -= velocity.y;
				steer.length = Math.min(steer.length, maxForce);
			}
			
			return steer;
		}

		public function cohesion(boids : Vector.<IBoid>) : ExtendedPoint
		{
			const neighborDist : int = 100;
			const sum : ExtendedPoint = new ExtendedPoint();
			
			var count : int = 0;
			
			const loc : ExtendedPoint = _self.point;
		
			const total : int = boids.length;
			for(var i : int = 0; i<total; i++)
			{
				const other : IBoid = boids[i];
				const d : Number = Point.distance(loc, other.point);
				if(d > 0 && d < neighborDist)
				{
					sum.x += other.point.x;
					sum.y += other.point.y;
					count++;
				}
			}
			
			if(count > 0)
			{
				sum.x /= count;
				sum.y /= count;
				
				return steer(sum, false);
			}
			
			return sum;
		}

		public function steer(target : ExtendedPoint, slowdown : Boolean) : ExtendedPoint
		{
			const loc : ExtendedPoint = _self.point;
			const desired : ExtendedPoint = new ExtendedPoint(target.x - loc.x, target.y - loc.y);
			const d : Number = desired.length;
			
			const steer : ExtendedPoint = new ExtendedPoint();
			if(d > 0) 
			{
				if(slowdown && d < 100)
					desired.length = _maxSpeed * (d / 100);
				else
					desired.length = _maxSpeed;
				steer.x = desired.x - velocity.x;
				steer.y = desired.y - velocity.y;
				steer.length = Math.min(maxForce, steer.length); 
			}
			
			return steer;
		}

		public function seek(boid : ExtendedPoint) : void
		{
			const point : ExtendedPoint = steer(boid, false);
			_accelertion.x += point.x;
			_accelertion.y += point.y;
		}

		public function arrive(boid : ExtendedPoint) : void
		{
			const point : ExtendedPoint = steer(boid, true);
			_accelertion.x += point.x;
			_accelertion.y += point.y;
		}

		public function get velocity() : ExtendedPoint { return _velocity; }

		public function get accelertion() : ExtendedPoint { return _accelertion; }

		public function get maxSpeed() : Number { return _maxSpeed; }
	}
}

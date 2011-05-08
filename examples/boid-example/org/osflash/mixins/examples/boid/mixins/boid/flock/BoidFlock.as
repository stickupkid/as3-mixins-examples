package org.osflash.mixins.examples.boid.mixins.boid.flock
{
	import org.osflash.mixins.examples.boid.mixins.boid.IBoid;
	import org.osflash.mixins.examples.boid.mixins.flock.IFlock;
	import org.osflash.mixins.examples.boid.mixins.position.util.ExtendedPoint;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */ 
	public class BoidFlock implements IFlock
	{
		
		private var _self : IBoid;
			
		private const _velocity : ExtendedPoint = new ExtendedPoint();
		
		private const _accelertion : ExtendedPoint = new ExtendedPoint();
	
		private const _strength : Number = Math.random() * 0.5;
		
		private const _maxSpeed : Number = 10 + _strength;
		
		private const _maxForce : Number = 0.5 + _strength;

		public function BoidFlock(self : IBoid)
		{
			_self = self;
			
			_velocity.x = Math.random() * 2 - 1;
			_velocity.y = Math.random() * 2 - 1;
		}
		
		public function flock(boids : Vector.<IBoid>) : void
		{
			const sep : ExtendedPoint = separate(boids).multiply(3);
			const ali : ExtendedPoint = align(boids);
			const coh : ExtendedPoint = cohesion(boids);
			
			_accelertion.x = sep.x + ali.x + coh.x;
			_accelertion.y = sep.y + ali.y + coh.y;
		}

		public function separate(boids : Vector.<IBoid>) : ExtendedPoint
		{
			const desiredSeperation : int = 60;
			const s : ExtendedPoint = new ExtendedPoint();
			
			var count : int = 0;
			
			const loc : ExtendedPoint = _self.point;
			
			const total : int = boids.length;
			for(var i : int = 0; i<total; i++)
			{
				const other : IBoid = boids[i];
				const d : Number = other.point.distance(loc);
				if(d > 0 && d < desiredSeperation)
				{
					const diff : ExtendedPoint = loc.subtract(other.point);
					const normalized : ExtendedPoint = diff.normalize(1 / d);
					
					s.x += normalized.x;
					s.y += normalized.y;
					
					count++;
				}
			}
			
			if(count > 0)
			{
				s.x /= count;
				s.y /= count;
			}
			
			if(s.length > 0)
			{
				s.length = _maxSpeed;
				s.x -= velocity.x;
				s.y -= velocity.y;
				s.length = Math.min(s.length, _maxForce);
			}
			
			return s;
		}

		public function align(boids : Vector.<IBoid>) : ExtendedPoint
		{
			const neighborDist : int = 25;
			const s : ExtendedPoint = new ExtendedPoint();
			
			var count : int = 0;
			var nearest : int = 999;
			var closestPoint : ExtendedPoint;
			
			const loc : ExtendedPoint = _self.point;
			
			const total : int = boids.length;
			for(var i : int = 0; i<total; i++)
			{
				const other : IBoid = boids[i];
				const d : Number = other.point.distance(loc);
				if(d > 0 && d < nearest)
				{
					closestPoint = other.point;
					nearest = d;
				}
				if(d > 0 && d < neighborDist)
				{
					s.x += other.velocity.x;
					s.y += other.velocity.y;
					count++;
				}
			}
			
			if(count > 0)
			{
				s.x /= count;
				s.y /= count;
			}
			
			if(s.length > 0)
			{
				s.length = _maxSpeed;
				s.x -= velocity.x;
				s.y -= velocity.y;
				s.length = Math.min(s.length, _maxForce);
			}
			
			return s;
		}

		public function cohesion(boids : Vector.<IBoid>) : ExtendedPoint
		{
			const neighborDist : int = 100;
			const s : ExtendedPoint = new ExtendedPoint();
			
			var count : int = 0;
			
			const loc : ExtendedPoint = _self.point;
		
			const total : int = boids.length;
			for(var i : int = 0; i<total; i++)
			{
				const other : IBoid = boids[i];
				const d : Number = other.point.distance(loc);
				if(d > 0 && d < neighborDist)
				{
					s.x += other.point.x;
					s.y += other.point.y;
					count++;
				}
			}
			
			if(count > 0)
			{
				s.x /= count;
				s.y /= count;
				
				return steer(s, false);
			}
			
			return s;
		}

		public function steer(target : ExtendedPoint, slowdown : Boolean) : ExtendedPoint
		{
			const loc : ExtendedPoint = _self.point;
			const desired : ExtendedPoint = target.subtract(loc);
			const d : Number = desired.length;
			
			var steer : ExtendedPoint = new ExtendedPoint();
			if(d > 0) 
			{
				if(slowdown && d < 100)
					desired.length = _maxSpeed * (d / 100);
				else
					desired.length = _maxSpeed;
				steer = desired.subtract(velocity);
				steer.length = Math.min(_maxForce, steer.length); 
			}
			
			return steer;
		}

		public function get velocity() : ExtendedPoint { return _velocity; }

		public function get accelertion() : ExtendedPoint { return _accelertion; }

		public function get maxSpeed() : Number { return _maxSpeed; }
	}
}

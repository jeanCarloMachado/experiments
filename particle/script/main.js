var DEBUG = true;
var PARTICLE_SIZE =  5;
var canvas;
var context;
canvas = document.getElementById('screen');
var canvasHeight = canvas.height;
var canvasWidth = canvas.width;
context = canvas.getContext('2d');

function notNaN(obj, name) {
	var key = '__' + name;
	obj.__defineGetter__(name, function() {
		return this[key];
	});
	obj.__defineSetter__(name, function(v) {
		if(typeof v !== 'number' || isNAN(v)) {
			throw new TypeError(name + ' isNAN');
		}
		this[key] = v;
	});
}

function Vec2(x, y) {
	this.x = x;
	this.y = y; }

if (DEBUG) {
	notNaN(Vec2.prototype, 'x');
	notNaN(Vec2.prototype, 'y');
}

Vec2.prototype = {
	muls: function(n) { return new Vec2(this.x*n, this.y*n); },
	imuls: function(n) { this.x*=n, this.y*=n; return this; },

	mul: function(v) { return new Vec2(this.x*v.x, this.y*v.y); },
	imul: function(v) { this.x*=v.x, this.y*=v.y; return this; },

	divs: function(n) { return new Vec2(this.x/n, this.y/n); },
	div: function(v) { return new Vec2(this.x/v.x, this.y/v.y); },

	adds: function(n) { return new Vec2(this.x+n, this.y+n); },
	iadds: function(s) { this.x+=s, this.y+s; return this; },

	add: function(v) { return new Vec2(this.x+v.x, this.y+v.y); },
	iadd: function(v) { this.x+=v.x, this.y+=v.y; return this; },

	subs: function(n) { return new Vec2(this.x-n, this.y-n); },
	isubs: function(s) { this.x-=s, this.y-=s; return this; },

	sub: function(v) { return new Vec2(this.x-v.x, this.y-v.y); },
	isub: function(v) { this.x-=v.x, this.y-=v.y; return this; },

	set: function(x, y) {this.x = x; this.y = y;}
}

function Particle(position, velocity) {
	this.position = position;
	this.velocity = velocity;
}

Particle.prototype = {
	update: function(td) {
        if (this.position.x > canvasWidth
            || this.position.y > canvasHeight 
           ) {
               this.position.set(Math.random()*canvasWidth, Math.random()*canvasHeight);
               return;
           }


		this.position.iadd(this.velocity.muls(td));

	}
}

function fuzzy(range, base){
	return (base||0) + (Math.random()-0.5)*range*2;
}

function choice(array) {
	return array[Math.floor(Math.random()*array.length)];
}

function gravity(particle, td) { particle.velocity.y += 10*td;
}

function renderCanvasImage(context, particles) {
	var radius = PARTICLE_SIZE / 2;
	//console.log("Particles to render: "+particles.length);
	for (var i=0; i < particles.length; i ++) {
		var particle = particles[i];
	    //console.log("Pos"+i+":"+particle.position.x+'-'+ particle.position.x)
	    //console.log("Vel"+i+":"+particle.velocity.x+'-'+ particle.velocity.x)
		context.beginPath();
		context.arc(particle.position.x, particle.position.y, radius, 0, Math.PI * 2, false);
		context.closePath();
		context.fill();
        context.fillStyle="#FF0000";
	}
}

function ParticleSystem(){
    this.particles = [];
    this.forces = [];
}

ParticleSystem.prototype = {
    update: function(td) {
        var particlesLen = this.particles.length;
        for (var i =0; i < particlesLen; i++) {
            var particle = this.particles[i];
            var forcesLen = this.forces.length;
            for (var j = 0; j < forcesLen; j++) {
                var force = this.forces[j];
                force(particle, td);
            }

            particle.update(td);
        }
    }
}

function emit(system) {
	var position = new Vec2(
	    canvasWidth*Math.random(),
	    canvasWidth*Math.random()
	);
	for (var i = 0; i < 1; i++) {
		var particle =  new Particle(position, new Vec2(fuzzy(50), fuzzy(50)));
		system.particles.push(particle);
		//console.log(particle);
	}
}

var counter = 0;
function step(timestamp){
	if (Math.random() < 1.00 && counter < 50000) {
	    //console.log('emitting');
		emit(system);
		counter++;
	}
	system.update(1/10);
	canvas.width = canvasWidth;
	canvas.heigh = canvasHeight;
	renderCanvasImage(context, system.particles)
	window.requestAnimationFrame(step);
}

var system = new ParticleSystem;
//system.forces.push(gravity);
step();

class Level extends dn.Process {
	public var game(get,never) : Game; inline function get_game() return Game.ME;
	public var fx(get,never) : Fx; inline function get_fx() return Game.ME.fx;

	public var wid(get,never) : Int; inline function get_wid() return 16;
	public var hei(get,never) : Int; inline function get_hei() return 16;

	var stars : Array<Star> = [];

	var invalidated = true;

	var starcount = 10;

	var min_speed = 30;
	var speed_range = 110;

	public function new() {
		super(Game.ME);
		createRootInLayers(Game.ME.scroller, Const.DP_BG);

		for(counter in 0...starcount) {
			stars[counter] = new Star(-400+Std.random(480),-100+Std.random(300));
		}

	}

	public inline function isValid(cx,cy) return cx>=0 && cx<wid && cy>=0 && cy<hei;
	public inline function coordId(cx,cy) return cx + cy*wid;


	public function render() {
		// Debug level render
		root.removeChildren();

		for(counter in 0...starcount) {
			if(stars[counter].x < -900) {
				// reset 
				stars[counter].x = 900;
				stars[counter].y = -100 + Std.random(400);
				stars[counter].speed = min_speed + Std.random(speed_range);
			}
		}

		for(counter in 0...starcount) {
			stars[counter].x += -0.1*tmod*stars[counter].speed;
			RenderFireball(stars[counter].x, stars[counter].y);
		}

	}

	public function RenderFireball(x:Float, y:Float){
			// Larger Star
			//fx.fxsmallcircle(x, y, 0x0000ff, 1);

			// Small Blue Star with Blur
			fx.fxpixel(x, y, 0x0000ff, 1);

			// FireBall 
			// fx.lightSpot(
			// 	x,
			// 	y,
			// 	Color.interpolateInt(0xff0000,0xffcc00,rnd(0,1)),
			// 	0.2
			// );

		}

	override function postUpdate() {
		super.postUpdate();

		if( invalidated ) {
			//invalidated = false;
			render();
		}
	}
}

class Star {
	public var x:Float;
	public var y:Float;
	public var speed:Float;

	public function new(x,y) {
		this.x = x;
		this.y = y;

		this.speed = 30 + Std.random(70);
	}
}

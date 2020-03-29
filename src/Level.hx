class Level extends dn.Process {
	public var game(get,never) : Game; inline function get_game() return Game.ME;
	public var fx(get,never) : Fx; inline function get_fx() return Game.ME.fx;

	public var wid(get,never) : Int; inline function get_wid() return 4;
	public var hei(get,never) : Int; inline function get_hei() return 4;

	var starx = 443.0;
	var stary = 43.0;
	
	var speed = 3.0;

	var invalidated = true;

	var stars : Array<Float> = [];

	var starspeed : Array<Float> = [];

	public function new() {
		super(Game.ME);
		createRootInLayers(Game.ME.scroller, Const.DP_BG);

		for(counter in 0...44) {

			var yy = Math.random() * 433;
			stars[counter] = yy;
			//stars[1] = 234;
			//trace("y" + yy);
		}
		
		for(counterspeed in 0...44) {

			var zz = Math.random() * 133;
			starspeed[counterspeed] = 33/zz;
			//stars[1] = 234;
			//trace("speed [" + counterspeed + "] "+ zz);
		
		}


	}

	public inline function isValid(cx,cy) return cx>=0 && cx<wid && cy>=0 && cy<hei;
	public inline function coordId(cx,cy) return cx + cy*wid;


	public function render() {
		// Debug level render
		root.removeChildren();
		// for(cx in 0...wid)
		// for(cy in 0...hei) {
		// 	var g = new h2d.Graphics(root);

		// 	var xx = Math.random() * 3;
		// 	var yy = Math.random() * 3;


		// 	g.beginFill(Color.randomColor(rnd(0,1), 0.5, 0.4), 1);
		// 	g.drawRect(xx*cx*Const.GRID*(0.5 *tmod), yy*cy*Const.GRID, Const.GRID, Const.GRID);
		// }

		if(starx < -900) {
			starx = 900;
		}
			

		for(starcluster in 0...stars.length) {
			var g = new h2d.Graphics(root);
			g.beginFill(0x0000ff);
	
			var speedrand = Math.random() * 0.33;

			starx += -0.1*tmod*starspeed[starcluster];
			stary = stars[starcluster];

			g.drawRect(starx, stary, 3, 3);
			//trace("[" + starx + "][ "+ stary + "]");
		}

	}

	override function postUpdate() {
		super.postUpdate();

		if( invalidated ) {
			//invalidated = false;
			render();
		}
	}
}
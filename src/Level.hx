class Level extends dn.Process {
	public var game(get,never) : Game; inline function get_game() return Game.ME;
	public var fx(get,never) : Fx; inline function get_fx() return Game.ME.fx;

	public var wid(get,never) : Int; inline function get_wid() return 16;
	public var hei(get,never) : Int; inline function get_hei() return 16;

	var hcount = 0;
 
	var xspeed = 555.0;
	//var yheight : Array<Float> = [];
	var yheight = 0;

	var invalidated = true;

	public function new() {
		super(Game.ME);
		createRootInLayers(Game.ME.scroller, Const.DP_BG);
	}

	public inline function isValid(cx,cy) return cx>=0 && cx<wid && cy>=0 && cy<hei;
	public inline function coordId(cx,cy) return cx + cy*wid;


	public function render() {
		// Debug level render
		root.removeChildren();
		// for(cx in 0...wid)
		// for(cy in 0...hei) {
		// 	var g = new h2d.Graphics(root);
		// 	g.beginFill(Color.randomColor(rnd(0,1), 0.5, 0.4), 1);
		// 	g.drawRect(cx*Const.GRID, cy*Const.GRID, Const.GRID, Const.GRID);
		// }

		if(xspeed < -900) {
			xspeed = 900;
		}

		xspeed += -0.1*tmod*74;

		// cool
		var yheight = Math.random() * 0.3 * 100;

		fx.fxsmallcircle(xspeed, yheight , 0x0000ff, 1);

		fx.lightSpot(
			xspeed,
			yheight,
			Color.interpolateInt(0xff0000,0xffcc00,rnd(0,1)),
			0.2
		);


	}

	override function postUpdate() {
		super.postUpdate();

		if( invalidated ) {
			//invalidated = false;
			render();
		}
	}
}
class Level extends dn.Process {
	public var game(get,never) : Game; inline function get_game() return Game.ME;
	public var fx(get,never) : Fx; inline function get_fx() return Game.ME.fx;

	public var wid(get,never) : Int; inline function get_wid() return 4;
	public var hei(get,never) : Int; inline function get_hei() return 4;

	var starx = 443.0;
	var speed2 = 643.0;
	var speed3 = -143.0;

	var invalidated = true;

	var stars : Array<Float> = [];

	var starspeed : Array<Float> = [];

	public function new() {
		super(Game.ME);
		createRootInLayers(Game.ME.scroller, Const.DP_BG);

		for(counter in 0...44) {

			var yy = Math.random() * 433;
			stars[counter] = yy;
		}
		
		for(counterspeed in 0...44) {
			var sv = Math.random() * 0.3;
			starspeed[counterspeed] = 3 ;
		}
	}

	public inline function isValid(cx,cy) return cx>=0 && cx<wid && cy>=0 && cy<hei;
	public inline function coordId(cx,cy) return cx + cy*wid;

	// 3 simple background 'stars'

	public function render() {

		root.removeChildren();

		if(starx < -900) {
			starx = 900;
		}

		if(speed2 < -900) {
			speed2 = 900;
		}

		if(speed3 < -900) {
			speed3 = 900;
		}
			
		starx += -0.1*tmod*22;
		fx.lightSpot(starx, 88, 0xffffff, 0.04);

		speed2 += -0.1*tmod*44;
		fx.lightSpot(speed2, 33, 0x0000ff, 0.02);

		speed3 += -0.1*tmod*14;
		fx.fxsmallcircle(speed3, -83, 0xff00ff, 0.05);
	}

	override function postUpdate() {
		super.postUpdate();

		if( invalidated ) {
			//invalidated = false;
			render();
		}
	}
}


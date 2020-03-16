package en;

class Enemy extends Entity {

	public function new(x,y) {
		super(x,y);

        // Some default rendering for our character
        var g = new h2d.Graphics(spr);
		g.beginFill(0x00ff00);
        g.drawRect(0,0,16,16);
        
        // g.rotate +- 0.1;
    }
    
    override function dispose() { // call on garbage collection
		super.dispose();
		//ca.dispose(); // release on destruction
	}

	override function update() { // the Entity main loop
		super.update();

        //this.spr.rotation +- 0.1;
        
        rotate();
    }
    
    public function rotate() {
        //g.rotate +- 0.1;
     }
}
package en;

class Hero extends Entity {

	var ca : dn.heaps.Controller.ControllerAccess;
	var mx = 0;

	var apressed = false;

	public function new(x,y) {
		super(x,y);

		// Some default rendering for our character
		var g = new h2d.Graphics(spr);
		g.beginFill(0xff0000);
        g.drawRect(0,0,16,16);
        
        ca = Main.ME.controller.createAccess("hero"); // creates an instance of controller
    }
    
    override function dispose() { // call on garbage collection
		super.dispose();
		ca.dispose(); // release on destruction
	}

	override function update() { // the Entity main loop
		super.update();

		if( ca.leftDown() || ca.isKeyboardDown(hxd.Key.LEFT) )
			dx -= 0.1*tmod;

		if( ca.rightDown() || ca.isKeyboardDown(hxd.Key.RIGHT) )
            dx += 0.1*tmod;
        
        if( ca.upDown() || ca.isKeyboardDown(hxd.Key.UP) )
			dy -= 0.1*tmod;

		if( ca.downDown() || ca.isKeyboardDown(hxd.Key.DOWN) )
			dy += 0.1*tmod;

	
		if(ca.aDown()){

			if(!apressed){
				var tf = new h2d.Text(hxd.res.DefaultFont.get(), Main.ME.root);
				tf.text = "A is pressed !" + mx;
			
				mx += mx + 1;

					apressed = true;
			}
		}
	}
}
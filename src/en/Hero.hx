package en;

class Hero extends Entity {

	var ca : dn.heaps.Controller.ControllerAccess;
	var mx = 0;

	var apressed = false;

	var timerCounter:Float = 0;
	var maxTimerCounter:Float = 5;


	public function new(x,y) {
		super(x,y);

		// Some default rendering for our character
		// var g = new h2d.Graphics(spr);
		// g.beginFill(0xff0000);
        // g.drawRect(0,0,16,16);
		
		spr.anim.registerStateAnim("heroship",1, 0.025);

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

		// Engine

		fx.backrocket(spr.x-140, spr.y-85, 0x00ff00, rnd(0.15,0.18));
		fx.backrocket(spr.x-132, spr.y-80, 0x00ff00, rnd(0.15,0.18));
		fx.backrocket(spr.x-138, spr.y-76, 0x00ff00, rnd(0.15,0.18));

		// Flasing light
		timerCounter += 0.1*tmod;  // Fix this 

		if (timerCounter > maxTimerCounter){
			//onTimerComplete();
			fx.lightSpot(spr.x-40, spr.y-80, 0x0000ff, 0.9);
			timerCounter = 0;
		}

		// Shooting
		if(ca.aDown() || ca.isKeyboardDown(hxd.Key.SPACE)){
			
			var tf = new h2d.Text(hxd.res.DefaultFont.get(), Main.ME.root);
				tf.text = "A is pressed !" + mx;
			
			// Shot Blast
			//fx.shotblast(spr.x+55, spr.y-38, 0x00ff00, 1);

			// Effects Tests
			//fx.lightSpot(spr.x+168, spr.y-56, 0xffffff, 1);

			//fx.shotblast(spr.x+138, spr.y-26, 0x00ff00, rnd(0.15,0.18));
			//fx.lightSpot(spr.x, spr.y, 0x00ff00, rnd(0.15,0.18));
			//fx.lazerblast(spr.x+133, spr.y-35, 0x00ff00, rnd(0.15,0.18));

			// Create new Bullet
			var b = new en.Bullet(this, 0.4);
			
		}
	}
}
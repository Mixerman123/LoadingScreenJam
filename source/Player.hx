package ;

import flixel.FlxSprite;
import flixel.FlxG;

class Player extends FlxSprite {
	var world:WorldLevel;
	var state:PlayState;

	public function new (X:Int,Y:Int,_state:PlayState){
		super(X,Y);

		world = _state.activeLevel;

		state=_state;


		loadGraphic("assets/images/Player.png",true,16,16);
		animation.add("run",[0]);

		drag.set();
	}

	override public function update (){
		super.update();

		animation.play("run");

		velocity.x = 95;
		velocity.y += 10;

		if (world.checkForDeaths (this)) {
			//Hit something deadly
			trace("Restarting");
			state.mode = PlayState.PlayMode.shooting;
			state.resetWorld();
			//this.x = (40);
			//this.y = (40);
		}

		if (world.collideWithLevel(this)){
			if (FlxG.keys.justPressed.SPACE){

				velocity.y = -250;
			}
		}
	}
}
package funkin.backend.system;

import flixel.FlxGame;

/**
 * Custom FlxGame implementation
 * Prevents lag spikes on state switching
 * Sorry if this looks like codename one :sob:
 *
 * @author RobZ
 */
class FunkinGame extends FlxGame {
    var skipNextTickUpdate:Bool = false;

	   public override function switchState() {
		      super.switchState();
		      draw();
	       _total = ticks = getTicks();
		      skipNextTickUpdate = true;
	   }

	   public override function onEnterFrame(t) {
		      if (skipNextTickUpdate != (skipNextTickUpdate = false))
			         _total = ticks = getTicks();
		      super.onEnterFrame(t);
	   }
}
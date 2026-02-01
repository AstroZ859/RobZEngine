package funkin.backend.system;

/**
 * Test state used to verify engine systems
 * This is NOT a final gameplay state
 *
 * @author RobZ
 */
@:experimental
@:access(funkin.backend.system.EngineCore)
class TestState extends FlxState {
    override public function create():Void {
        super.create();

        var text = new FlxText(0, 0, 0, "RobZ Engine\nTestState");
        text.setFormat(null, 24, FlxColor.WHITE, CENTER);
        text.screenCenter();

        add(text);
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ESCAPE) {
            FlxG.switchState(new TestState());
        }
    }
}
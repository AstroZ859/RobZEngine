package funkin.backend.system;

import openfl.display.Sprite;
import funkin.menus.*;

/**
 * Core of the game
 * Initializes the game with some custom configurations
 * WARNING: If you want add some engine logic use EngineCore instead
 *
 * @author RobZ
 */
@:todo('Check this')
class Main extends Sprite {
    public static var instance:Main;
    public static var game:FunkinGame;

    var config:MainConfig = {
        width: 1280, // Width of the game in pixels (might be less / more in actual pixels).
        height: 720, // Height of the game in pixels (might be less / more in actual pixels).
        initialState: TestState, // Initial state of the game (you should import it first if not in menus or in this package).
        zoom: -1.0, // Just don't change this ok? This is used for calculate and fit the window dimensions.
        skipSplash: true, // Whether to skip the flixel splash screen that appears in release mode
        startFullScreen: false // Whether to start the game in fullscreen on desktop targets (not recommended).
    };

    public function new() {
        super();
        EngineCore.init(#if debug true #else false #end);
        if (stage != null) init();
        else addEventListener(Event.ADDED_TO_STAGE, init);
    }

    private function init(?E:Event):Void {
        if (hasEventListener(Event.ADDED_TO_STAGE)) {
            removeEventListener(Event.ADDED_TO_STAGE, init);
            setupGame();
        }
    }

    private function setupGame() {
        instance = this;

        MainState.init(config.initialState);

        addChild(game = new FunkinGame(config.width, config.height, MainState, 60, 60, config.skipSplash, config.startFullScreen));

        var stageWidth:Int = Lib.current.stage.stageWidth;
        var stageHeight:Int = Lib.current.stage.stageHeight;

        if (config.zoom == -1.0) {
            var ratioX:Float = stageWidth / config.width;
            var ratioY:Float = stageHeight / config.height;

            config.zoom = Math.min(ratioX, ratioY);
            config.width = Math.ceil(stageWidth / config.zoom);
            config.height = Math.ceil(stageHeight / config.zoom);
        }
    }
}

typedef MainConfig = {
    var width:Int;
    var height:Int;
    var initialState:Class<FlxState>;
    var zoom:Float;
    var skipSplash:Bool;
    var startFullScreen:Bool;
}
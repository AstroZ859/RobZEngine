package funkin.backend.utils;

import flixel.FlxG;
import flixel.input.keyboard.FlxKey;

/**
 * Input helpers for scripts.
 *
 * Provides string-based keyboard and mouse input access,
 * making input handling simpler and more readable in mods.
 *
 * @author RobZ
 * @since 0.1.0
 */
class FunkinInput {
    /** Checks if a key was just pressed. */
    public static inline function justPressed(key:String):Bool {
        return FlxG.keys.anyJustPressed([key]);
    }

    /** Checks if a key is currently pressed. */
    public static inline function pressed(key:String):Bool {
        return FlxG.keys.anyPressed([key]);
    }

    /** Checks if a key was just released. */
    public static inline function justReleased(key:String):Bool {
        return FlxG.keys.anyJustReleased([key]);
    }

    /** Checks if any key in the list was just pressed. */
    public static function anyJustPressed(keys:Array<String>) {
        return FlxG.keys.anyJustPressed(keys);
    }

    /** Checks if any key in the list is pressed. */
    public static function anyPressed(keys:Array<String>):Bool {
        return FlxG.keys.anyPressed(keys);
    }

    /** Checks if any key in the list was just released. */
    public static function anyJustReleased(keys:Array<String>) {
        return FlxG.keys.anyJustReleased(keys);
    }

    /** Checks if the mouse button is pressed. */
    public static inline function mousePressed():Bool {
        return FlxG.mouse.pressed;
    }

    /** Checks if the mouse button was just pressed. */
    public static inline function mouseJustPressed():Bool {
        return FlxG.mouse.justPressed;
    }

    /** Checks if the mouse button was just released. */
    public static inline function mouseJustReleased():Bool {
        return FlxG.mouse.justReleased;
    }
}
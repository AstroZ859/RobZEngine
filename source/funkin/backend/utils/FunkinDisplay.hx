package funkin.backend.utils;

import flixel.FlxG;
import flixel.FlxSprite;

/**
 * Display and positioning helpers for scripts.
 *
 * Provides common screen-related utilities such as
 * centering, scaling, and screen size access.
 *
 * Designed to reduce repetitive layout code in mods.
 *
 * @author RobZ
 * @since 0.1.0
 */
class FunkinDisplay {
    /** Centers an object on both axes. */
    public static inline function center(obj:FlxSprite):Void {
        obj.screenCenter();
    }

    /** Centers an object horizontally. */
    public static inline function centerX(obj:FlxSprite):Void {
        obj.screenCenter(X);
    }

    /** Centers an object vertically. */
    public static inline function centerY(obj:FlxSprite):Void {
        obj.screenCenter(Y);
    }

    /** Returns the screen width. */
    public static inline function screenWidth():Int {
        return FlxG.width;
    }

    /** Returns the screen height. */
    public static inline function screenHeight():Int {
        return FlxG.height;
    }

    /** Scales an object to fit the screen while preserving aspect ratio. */
    public static function scaleToFit(obj:FlxSprite):Void {
        var scale = Math.min(
            FlxG.width / obj.width,
            FlxG.height / obj.height
        );

        obj.scale.set(scale, scale);
        obj.updateHitbox();
    }

    /** Scales an object to match the screen width. */
    public static function scaleToWidth(obj:FlxSprite):Void {
        var scale = FlxG.width / obj.width;
        obj.scale.set(scale, scale);
        obj.updateHitbox();
    }

    /** Scales an object to match the screen height. */
    public static function scaleToHeight(obj:FlxSprite):Void {
        var scale = FlxG.height / obj.height;
        obj.scale.set(scale, scale);
        obj.updateHitbox();
    }
}
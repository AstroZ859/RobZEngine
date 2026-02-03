package funkin.backend.utils;

/**
 * Simple timer utility for scripts and engine systems.
 *
 * Provides an easy-to-use API over FlxTimer,
 * allowing delayed and repeated callbacks
 * without exposing Flixel internals.
 *
 * Designed to be scripting-friendly.
 *
 * @author RobZ
 * @since 0.1.0
 */
class FunkinTimer {
    /** Internal timer registry */
    static var _timers:Map<Int, FlxTimer> = new Map();

    /** Internal incremental ID */
    static var _nextId:Int = 0;

    /**
     * Executes a callback after a delay.
     *
     * @param seconds Delay in seconds.
     * @param callback Function to execute.
     * @return Timer ID.
     */
    public static function after(seconds:Float, callback:Void->Void):Int {
        var id = _nextId++;
        var timer = new FlxTimer();

        timer.start(seconds, function(_) {
            callback();
            cancel(id);
        });

        _timers.set(id, timer);
        return id;
    }

    /**
     * Executes a callback repeatedly.
     *
     * @param seconds Interval in seconds.
     * @param callback Function to execute.
     * @return Timer ID.
     */
    public static function every(seconds:Float, callback:Void->Void):Int {
        var id = _nextId++;
        var timer = new FlxTimer();

        timer.start(seconds, function(_) {
            callback();
        }, 0);

        _timers.set(id, timer);
        return id;
    }

    /**
     * Cancels a timer by ID.
     *
     * @param id Timer ID.
     */
    public static function cancel(id:Int):Void {
        var timer = _timers.get(id);
        if (timer == null) return;

        timer.cancel();
        _timers.remove(id);
    }

    /**
     * Cancels all active timers.
     */
    public static function clearAll():Void {
        for (timer in _timers)
            timer.cancel();

        _timers.clear();
    }
}
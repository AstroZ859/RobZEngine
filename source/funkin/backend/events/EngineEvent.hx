package funkin.backend.events;

/**
 * Base class for all engine events.
 *
 * EngineEvent represents a signal or action occurring
 * within the engine that can be observed by listeners.
 *
 * This class does not define cancellation by default.
 * Events that can be prevented should extend
 * {@link CancellableEvent} instead.
 *
 * @author RobZ
 * @since 0.1.0
 */
class EngineEvent {
    /**
     * Whether this event has been handled.
     *
     * This can be used by listeners to indicate that the
     * event was processed and may not require further handling.
     */
    public var handled(default, set):Bool = false;

    /** Creates a new engine event. */
    public function new() {}

    /** Marks this event as handled. */
    public inline function markHandled():Void {
        handled = true;
    }

    /** Setter to control handled state. */
    function set_handled(value:Bool):Bool {
        return handled = value;
    }
}
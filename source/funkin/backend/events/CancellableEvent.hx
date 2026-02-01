package funkin.backend.events;

/**
 * Base class for events that can be cancelled.
 *
 * A cancellable event represents an action that may be
 * prevented by listeners before it fully executes.
 *
 * This class contains no logic by design and is meant
 * to be extended by specific engine or gameplay events.
 *
 * @author RobZ
 * @since 0.1.0
 */
class CancellableEvent {
    /**
     * Whether the event has been cancelled.
     *
     * If set to true by any listener, the action associated
     * with this event should not continue.
     */
    public var cancelled(default, set):Bool = false;

    /** Creates a new cancellable event. */
    public function new() {}

    /** Cancels the event. */
    public inline function preventDefault():Void {
        cancelled = true;
    }

    public inline function cancel():Void {
        preventDefault();
    }

    /** Setter to ensure cancellation is explicit and controlled. */
    function set_cancelled(value:Bool):Bool {
        return cancelled = value;
    }
}
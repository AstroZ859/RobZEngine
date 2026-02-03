package funkin.backend.events;

/**
 * Simple event dispatcher for engine-level events.
 *
 * Responsible for registering listeners and dispatching
 * EngineEvent instances to them.
 *
 * This implementation is intentionally minimal and does
 * not include priorities or filtering.
 *
 * @author RobZ
 * @since 0.1.0
 */
class EventDispatcher {
    static var listeners:Map<Class<EngineEvent>, Array<EventListener<EngineEvent>>> = new Map();

    /**
     * Registers a listener for a specific event type.
     *
     * @param eventClass The class of the event to listen for.
     * @param listener The callback to invoke when the event is dispatched.
     */
    public static function addListener<T:EngineEvent>(eventClass:Class<T>, listener:EventListener<T>):Void {
        var list = listeners.get(cast eventClass);
        if (list == null) {
            list = [];
            listeners.set(cast eventClass, list);
        }

        list.push(cast listener);
    }

    /**
     * Removes a listener for a specific event type.
     *
     * @param eventClass The class of the event to remove.
     * @param listener The callback to remove.
     */
    public function removeListener<T:EngineEvent>(eventClass:Class<T>, listener:EventListener<T>):Bool {
        if (!listeners.exists(eventClass))
            return false;

        var list = listeners.get(eventClass);
        var removed = false;

        for (i in 0...list.length) {
            if (list[i] == listener) {
                list.splice(i, 1);
                removed = true;
                break;
            }
         }

        if (list.length == 0)
            listeners.remove(eventClass);

        return removed;
    }

    /**
     * Dispatches an event to all registered listeners.
     *
     * @param event The event instance to dispatch.
     */
    public static function dispatch(event:EngineEvent):Void {
        var eventClass = Type.getClass(event);
        if (eventClass == null) return;

        var list = listeners.get(eventClass);
        if (list == null) return;

        for (listener in list.copy()) {
            listener(event);

            // Stop propagation if handled
            if (event.handled)
                break;

            // Stop propagation if cancelled
            if (Std.isOfType(event, CancellableEvent)) {
                var c:CancellableEvent = cast event;
                if (c.cancelled)
                    break;
            }
        }
    }

    /**
     * Clears all registered listeners.
     *
     * Useful for engine resets or hot reloads.
     */
    public static function clear():Void {
        listeners.clear();
    }
}

typedef EventListener<T:EngineEvent> = T->Void;
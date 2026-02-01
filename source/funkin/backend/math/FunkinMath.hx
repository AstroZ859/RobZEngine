package funkin.backend.math;

/**
 * Math utilities specific to RobZ Engine / FNF-style gameplay.
 *
 * This class complements FlxMath instead of replacing it.
 *
 * @author RobZ
 * @since 0.1.0
 */
class FunkinMath {
    /** Linearly interpolates between two values using FNF-style smoothing. */
    public static inline function lerp(from:Float, to:Float, ratio:Float):Float {
        return from + (to - from) * ratio;
    }

    /** Snaps a value to the nearest step. */
    public static inline function snap(value:Float, step:Float):Float {
        return Math.round(value / step) * step;
    }

    /** Approaches a target value without overshooting. */
    public static inline function approach(current:Float, target:Float, speed:Float):Float {
        return current + (target - current) * speed;
    }

    /**
     * Performs a positive modulo operation.
     *
     * Unlike the `%` operator, this function always returns
     * a value in the range `(0, modulus)`, even for negative inputs.
     *
     * @param value The value to apply the modulo operation to.
     * @param modulus The modulus (range). Must be greater than zero.
     * @return A positive modulo result within the given range.
     */
    public static inline function mod(value:Float, modulus:Float):Float {
        return ((value % modulus) + modulus) % modulus;
    }
}
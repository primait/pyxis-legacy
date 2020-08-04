/**
 * Returns a new object with all values flattened.
 * @example
 * flatten({
 *   a: "Hi",
 *   b: {
 *     c: "nested"
 *   }
 * })
 * ->
 * {
 *   a: "Hi",
 *   "b.c": "nested"
 * }
 *
 * @param {Object} obj object to flatten
 * @returns {Array<[string, string]>} flattened object
 */
export function flatten(obj) {
    const result = {};
    for (const k in obj) {
        if (!obj.hasOwnProperty(k)) {
            continue;
        }

        if (typeof obj[k] === "object" && obj[k] !== null) {
            const nested = flatten(obj[k]);
            for (const x in nested) {
                if (!nested.hasOwnProperty(x)) {
                    continue;
                }

                result[`${k}.${x}`] = String(nested[x])
            }
        } else {
            result[k] = String(obj[k]);
        }
    }
    return result;
}

window.flatten = flatten;

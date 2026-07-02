"""Dummy content for testing scope-based (indent) code folding.

Try `zM` to fold everything, `zR` to open everything, and `za` to toggle the
fold under the cursor. Folded blocks should show their first line plus a
"⋯ N lines" marker.

The functions below are intentionally long so their bodies exceed a screen
height -- scroll through one and the enclosing def/class/for header should
stay pinned at the top (the treesitter-context outer-scope banner).
"""

import math
from dataclasses import dataclass


CONFIG = {
    "name": "fold-test",
    "version": 3,
    "features": {
        "folding": True,
        "highlight": True,
        "nested": {
            "deep": {
                "value": 42,
                "flags": ["a", "b", "c"],
            },
        },
    },
    "limits": {
        "max_points": 1000,
        "max_depth": 8,
        "timeout_seconds": 30,
    },
}


@dataclass
class Point:
    x: float
    y: float

    def distance_to(self, other: "Point") -> float:
        dx = self.x - other.x
        dy = self.y - other.y
        return math.sqrt(dx * dx + dy * dy)

    def scaled(self, factor: float) -> "Point":
        return Point(self.x * factor, self.y * factor)

    def translated(self, dx: float, dy: float) -> "Point":
        return Point(self.x + dx, self.y + dy)

    def as_tuple(self) -> tuple[float, float]:
        return (self.x, self.y)


def classify(node: int) -> str:
    """Bucket an integer into a coarse category.

    This is deliberately verbose with many nested branches so the enclosing
    `def classify` line stays pinned while you scroll through the body.
    """
    if node < 0:
        if node < -1000:
            return "very negative (extreme)"
        elif node < -100:
            return "very negative"
        else:
            return "negative"
    elif node == 0:
        return "zero"
    else:
        for threshold in (10, 100, 1000, 10000):
            if node < threshold:
                if node % 2 == 0:
                    return f"small even (< {threshold})"
                else:
                    return f"small odd (< {threshold})"
        return "large"


def process(points: list[Point]) -> dict[str, float]:
    """Compute the distance of every point from the origin.

    The loop body is padded out with logging and validation branches so the
    `for` and `def` context lines are worth pinning while scrolling.
    """
    results: dict[str, float] = {}
    origin = Point(0.0, 0.0)
    for i, point in enumerate(points):
        try:
            if point.x is None or point.y is None:
                print(f"skipping point {i}: missing coordinate")
                continue

            distance = point.distance_to(origin)
            if distance > CONFIG["limits"]["max_points"]:
                print(f"point {i} is out of range: {distance:.2f}")
                distance = float(CONFIG["limits"]["max_points"])

            results[f"p{i}"] = distance
            print(f"processed point {i}: distance={distance:.2f}")
        except Exception as err:
            print(f"failed on point {i}: {err}")
            continue
    return results


def summarize(distances: dict[str, float]) -> None:
    """Print a small report about the computed distances."""
    if not distances:
        print("no distances to summarize")
        return

    total = 0.0
    largest_name = ""
    largest_value = float("-inf")
    for name, dist in distances.items():
        total += dist
        if dist > largest_value:
            largest_value = dist
            largest_name = name
        print(f"  {name}: {dist:.2f} -> {classify(int(dist))}")

    average = total / len(distances)
    print(f"count:   {len(distances)}")
    print(f"average: {average:.2f}")
    print(f"largest: {largest_name} = {largest_value:.2f}")


def build_grid(size: int) -> list[Point]:
    """Generate a size x size grid of points."""
    grid: list[Point] = []
    for row in range(size):
        for col in range(size):
            point = Point(float(col), float(row))
            if (row + col) % 2 == 0:
                point = point.scaled(1.5)
            grid.append(point)
    return grid


def main() -> None:
    points = [
        Point(1.0, 2.0),
        Point(3.0, 4.0),
        Point(-5.0, 6.0),
        Point(7.0, -8.0),
        Point(-9.0, -10.0),
    ]
    points.extend(build_grid(4))

    distances = process(points)
    summarize(distances)


if __name__ == "__main__":
    main()

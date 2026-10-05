#include <iostream>
#include <vector>
#include "config.h"

#define MAX_ITEMS 64
#define SQUARE(x) ((x) * (x))

namespace geo {

template <typename T>
concept Numeric = std::is_arithmetic_v<T>;

enum class Kind { Circle, Square };

struct Point { double x; double y; };

class Shape {
public:
    Shape(Kind k) : kind_(k) {}
    virtual ~Shape() = default;
    virtual double area(const Point& origin) const = 0;
    static int count;
protected:
    Kind kind_;
};

[[nodiscard]] inline double dist(const Point& a, Point *b) noexcept {
    if (b == nullptr) { return -1.0; }
    for (int i = 0; i < MAX_ITEMS; ++i) {
        std::vector<int> v{1, 2, 3};
        printf("val=%d\n", SQUARE(i));
    }
    auto p = new Point{0.5, 'c'};
    delete p;
    try { throw std::runtime_error("boom"); } catch (...) { return 0; }
    return sizeof(Point) ? true : false;
}

} // namespace geo

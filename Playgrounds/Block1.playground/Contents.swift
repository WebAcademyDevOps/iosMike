import Foundation

func solveSquareEquation(
    a: Double,
    b: Double,
    c: Double
) -> String {
    
    
    let d = b * b - 4 * a * c
    let x1 = ( -b + sqrt(d) ) / (2 * a)
    let x2 = ( -b - sqrt(d) ) / (2 * a)
    
    let conditionDescription = "Квадратне рівняння: \"\(a)x² + \(b)x + \(c) = 0\""
    let resolution = "корені:\nx₁=\(x1)\nx₂=\(x2)"
    
    return conditionDescription + "\n" + resolution
}

print(
    solveSquareEquation(a: 2, b: 6, c: 1)
)

print(
    solveSquareEquation(
        a: 1,
        b: 4,
        c: 1
    )
)

// Module Biz
import Foundation
import RandomProviderInterface

public struct NumberProviderRandom: NumberProvider {
    private let range: ClosedRange<Int>
    
    public var number: Int {
        Int.random(in: range)
    }
    
    public init(range: ClosedRange<Int>) {
        self.range = range
    }
}

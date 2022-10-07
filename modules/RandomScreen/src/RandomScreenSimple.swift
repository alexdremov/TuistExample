import Foundation
import SwiftUI
import RandomScreenInterface
import RandomProviderInterface


public struct RandomScreenSimple: RandomScreen {
    let randomProvider: NumberProvider
    
    @State var number: Int = 0
    
    public init(randomProvider: NumberProvider) {
        self.randomProvider = randomProvider
    }
    
    public var body: some View {
        VStack {
            Text("\(number)")
            Button("generate") {
                number = randomProvider.number
            }
        }.onAppear {
            number = randomProvider.number
        }
        .animation(.default, value: number)
    }
}

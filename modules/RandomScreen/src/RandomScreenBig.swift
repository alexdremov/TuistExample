import Foundation
import SwiftUI
import RandomScreenInterface
import RandomProviderInterface


public struct RandomScreenBig: RandomScreen {
    let randomProvider: NumberProvider
    
    @State var number: Int = 0
    
    public init(randomProvider: NumberProvider) {
        self.randomProvider = randomProvider
    }
    
    public var body: some View {
        VStack {
            Text("\(number)")
                .font(.system(size: 80))
            Button("generate") {
                number = randomProvider.number
            }
        }.onAppear {
            number = randomProvider.number
        }
        .animation(.default, value: number)
    }
}

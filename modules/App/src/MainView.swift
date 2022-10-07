import Foundation
import SwiftUI

import RandomProvider
import RandomProviderInterface
import RandomScreen
import RandomScreenInterface

import Common

struct MainView: View {
    enum RandomMode: String, CaseIterable, Identifiable {
        case random, zero
        var id: Self { self }
    }
    
    enum ScreenMode: String, CaseIterable, Identifiable {
        case big, simple
        var id: Self { self }
    }
    
    @State private var screen: ScreenMode = .simple
    @State private var random: RandomMode = .random
    
    private var randomRange: ClosedRange<Int> {
        random == .random ? 0...100 : 0...0
    }
    
    var body: some View {
        VStack {
            VStack {
                Picker("Screen", selection: $screen) {
                    ForEach(ScreenMode.allCases) { flavor in
                        Text(flavor.rawValue.capitalized)
                    }
                }
                Picker("Random", selection: $random) {
                    ForEach(RandomMode.allCases) { topping in
                        Text(topping.rawValue.capitalized)
                    }
                }
            }
            .pickerStyle(.segmented)
            Spacer()
            relevantScreen
            Spacer()
        }
        .padding()
    }
    
    @ViewBuilder
    private var relevantScreen: some View {
        switch screen {
            case .simple:
                simpleScreen
            case .big:
                bigScreen
        }
    }
    
    private var relevantRandomProvider: NumberProvider {
        switch random {
            case .random:
                return NumberProviderRandom(range: randomRange)
            case .zero:
                return NumberProviderZero()
        }
    }
    
    @ViewBuilder
    private var simpleScreen: some View {
        HStack {
            RandomScreenSimple(randomProvider: relevantRandomProvider)
        }
    }
    
    @ViewBuilder
    private var bigScreen: some View {
        HStack {
            Text("\(randomRange.lowerBound)").gray
            RandomScreenBig(randomProvider: relevantRandomProvider)
                .frame(minWidth: 200)
            Text("\(randomRange.upperBound)").gray
        }
    }
}

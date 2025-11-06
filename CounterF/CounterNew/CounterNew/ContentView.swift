//  Created by vozzh on 06.11.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.system(size: 64))
                .bold()
            HStack {
                Button("-") {count -= 1 }
                    .buttonStyle(ConunterButtonStyle())
                Button("Сброс") {count = 0 }
                    .buttonStyle(ConunterButtonStyle())
                Button("+") {count += 1 }
                    .buttonStyle(ConunterButtonStyle())
            }
        }
    }
}
struct ConunterButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .padding()
            .background(Color.blue.opacity(configuration.isPressed ? 0.5 : 1.0))
            .foregroundStyle(.white)
            .cornerRadius(10.0)
    }
}
#Preview {
    ContentView()
}

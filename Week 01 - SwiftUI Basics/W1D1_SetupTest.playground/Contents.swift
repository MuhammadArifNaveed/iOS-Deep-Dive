import SwiftUI
import PlaygroundSupport // Essential for showing SwiftUI views in a Playground

struct MyFirstSwiftUIView: View {
    var body: some View {
        VStack {
            Text("Hello, Arif Deep Dive!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.purple)
            Text("My coding journey officially begins!")
                .font(.subheadline)
                .padding(.top, 5)
        }
        .padding()
        .background(Color.yellow.opacity(0.2))
        .cornerRadius(10)
    }
}

// Displays your view in the Live View panel of the Playground
PlaygroundPage.current.setLiveView(MyFirstSwiftUIView())

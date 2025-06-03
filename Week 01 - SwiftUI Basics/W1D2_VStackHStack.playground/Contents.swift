import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) { // Experiment: .leading, .trailing, .center (default)
            Text("VStack Parent")
                .font(.title)

            Text("Short Item")
                .background(Color.yellow.opacity(0.3)) // To clearly see alignment

            Text("A longer item that needs more space")
                .background(Color.orange.opacity(0.3))

            HStack(alignment: .bottom, spacing: 5) { // Experiment: .top, .center (default), .bottom, .firstTextBaseline
                Text("HStack Item A")
                    .font(.caption) // Smaller text
                    .background(Color.purple.opacity(0.3))

                Rectangle()
                    .fill(Color.green)
                    .frame(width: 40, height: 20) // Shorter height

                Text("HStack Item B")
                    .font(.headline) // Larger text for baseline test
                    .background(Color.pink.opacity(0.3))

                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 40, height: 60) // Taller height
            }
            .border(Color.red)
            .padding(5)
            .background(Color.white) // Inner background for clarity
        }
        .border(Color.blue)
        .padding()
        .frame(width: 300, height: 400)
        .background(Color.gray.opacity(0.1))
    }
}
// Displays your view in the Live View panel of the Playground
PlaygroundPage.current.setLiveView(ContentView())

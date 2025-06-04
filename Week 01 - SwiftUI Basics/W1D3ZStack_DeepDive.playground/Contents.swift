import SwiftUI
import PlaygroundSupport

struct InteractiveCardView: View {
    @State private var showOverlay = false // State variable for interactivity

    var body: some View {
        ZStack { // ZStack allows layering
            VStack { // Your main card content
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit() // Or .scaledToFill() then .clipped()
                    .frame(width: 250, height: 120) // Image size
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10) // Only rounds image corners

                Text("Vacation Destination")
                    .font(.headline)
                    .padding(.bottom, 5)

                Button("Show Details") {
                    showOverlay.toggle() // Toggle the state
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
            }
            .frame(width: 250, height: 200) // Frame for the whole card content
            .background(Color.white) // Card background
            .cornerRadius(15) // Rounds card corners
            .shadow(radius: 5)
            // .padding() // If you want padding around the card itself

            if showOverlay { // The overlay content, conditional
                VStack {
                    Text("This is detailed information about the destination!")
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()

                    Button("Close") {
                        showOverlay.toggle()
                    }
                    .buttonStyle(.bordered)
                    .tint(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Make it fill the ZStack
                .background(Color.black.opacity(0.8)) // Semi-transparent black background
                .cornerRadius(15) // Match card corners
                .transition(.opacity) // Smooth fade in/out
            }
        }
        .animation(.easeInOut(duration: 0.3), value: showOverlay) // Apply animation to state changes
        .padding() // Padding for the whole ZStack if needed
    }
}

PlaygroundPage.current.setLiveView(InteractiveCardView())

import SwiftUI
import PlaygroundSupport

struct CustomButtonView: View {
    @State private var buttonText: String = "Tap Me"
    @State private var isButtonSelected: Bool = false // Changed to isButtonSelected for semantic clarity
    @State private var buttonColor: Color = .red

    var body: some View {
        VStack(spacing: 15.0) { // Increased spacing slightly
            TextField("Enter button title", text: $buttonText)
                .textFieldStyle(RoundedBorderTextFieldStyle()) // Added style
                .padding(.horizontal) // Padding for text field

            ColorPicker("Select button color", selection: $buttonColor)
                .padding(.horizontal) // Padding for color picker

            // Placing the state text closer to the button for better context
            Text("Button is selected: \(isButtonSelected ? "Yes" : "No")")
                .font(.subheadline)
                .foregroundColor(.gray)

            // Changed to isSelected
            StyledButton(text: $buttonText, isSelected: $isButtonSelected, backgroundColor: $buttonColor)
                .padding(.top, 10) // Add some space above the button
        }
        .padding(20)
        .frame(width: 320, height: 320) // Slightly increased frame size
        .background(Color.white)
        .cornerRadius(12) // Slightly rounded corners
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4) // Subtle shadow
    }
}

struct StyledButton: View {
    @Binding var text: String
    @Binding var isSelected: Bool // Changed to isSelected
    @Binding var backgroundColor: Color

    var body: some View {
        Button {
            isSelected.toggle() // Simpler way to toggle boolean
        } label: {
            Text(text)
                .foregroundColor(.white)
                .padding(.vertical, 12) // Slightly more vertical padding
                .padding(.horizontal, 25) // Slightly more horizontal padding
                .background(backgroundColor)
                .cornerRadius(10) // Slightly more rounded corners
                .font(isSelected ? .headline : .subheadline) // Uses isSelected
                .animation(.easeOut(duration: 0.15), value: isSelected) // Added subtle animation
        }
    }
}

// MARK: - Live View Setup for Playground
PlaygroundPage.current.setLiveView(CustomButtonView())

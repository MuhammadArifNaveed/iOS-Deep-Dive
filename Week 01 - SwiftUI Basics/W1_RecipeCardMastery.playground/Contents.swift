import SwiftUI
import PlaygroundSupport

struct RecipeCardView: View {
    // State variables will go here, for interactivity
    @State private var showDetails = false
    var body: some View {
        
        
        // Main card content will go here
        VStack{
            ZStack(alignment: .bottomLeading){
                Image(systemName:  "photo.fill")
                    .resizable()
                    .scaledToFill() // Fills the ZStack's bounds
                    .frame(height: 180)
                    .clipped()
                
                VStack(alignment: .leading) {
                    Text("Delicious Pizza Recipe")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 2) // Makes text more readable over image
                    
                    Text("Quick & Easy Italian Delight")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding([.leading, .bottom], 15)
                
            }
            // ... after the ZStack, inside the main VStack
            HStack(spacing: 15) { // HStack for horizontal arrangement of stats
                VStack { // Prep Time
                    Text("Prep Time")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("30 min")
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity) // Allow each stat VStack to take available space
                
                VStack { // Servings
                    Text("Servings")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("4 people")
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity) // Allow each stat VStack to take available space
                
                VStack { // Difficulty
                    Text("Difficulty")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("Easy")
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity) // Allow each stat VStack to take available space
            }
            .padding([.horizontal, .top]) // Padding around the stats Hstack
            
            Toggle(isOn: $showDetails) {
                Text("Show Ingredients & Steps")
                    .font(.subheadline)
            }
            .padding(.horizontal) // Padding for the toggle
            
            // Conditional VStack for details
            if showDetails {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Ingredients:")
                        .font(.headline)
                        .padding(.bottom, 2)
                    Text("""
                               - 2 cups all-purpose flour
                               - 1 cup warm water
                               - 1 tsp salt
                               - 1/2 tsp active dry yeast
                               - Tomato sauce, mozzarella, toppings
                               """)
                    .font(.subheadline)
                    
                    Text("Steps:")
                        .font(.headline)
                        .padding(.top, 5)
                        .padding(.bottom, 2)
                    Text("""
                               1. Mix flour, water, salt, yeast. Knead for 5 mins.
                               2. Let dough rise for 1 hour.
                               3. Roll out dough, add sauce, cheese, toppings.
                               4. Bake at 200°C for 15-20 mins until golden.
                               """)
                    .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading) // Ensure text aligns left and fills width
                .padding([.horizontal, .bottom]) // Padding for the details section
                .transition(.scale) // Smooth slide in/out transition
            }
            HStack{
                Button("Save Recipe") {
                        print("Recipe saved!")
                    }
                    .buttonStyle(.bordered)
                    .tint(.green)
                Spacer() // Pushes content apart
                ZStack { // ZStack for layering the badge
                        Button("Comments (3)") { // Main button
                            print("Show comments!")
                        }
                        .buttonStyle(.bordered)
                        .tint(.blue)

                        Circle() // The "new comments" badge
                            .fill(Color.red)
                            .frame(width: 10, height: 10)
                            .offset(x: 30, y: -10) // Position the badge relative to the button
                    }

            }
            .padding()
            
            
            
            
        }
        .frame(width: 300) // Adjust height dynamically
        .animation(.snappy(duration: 0.3), value: showDetails) // Animate the transition and height change
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 8, x: 0, y: 5)
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.2), lineWidth: 1))
        .clipped()
    }
}

PlaygroundPage.current.setLiveView(RecipeCardView())

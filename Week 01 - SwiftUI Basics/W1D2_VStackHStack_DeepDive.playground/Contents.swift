import SwiftUI
import PlaygroundSupport

struct UserCardView: View {
    var body: some View {
        VStack(){
            HStack{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    . frame(width: 50, height: 50)
                    .foregroundColor(.blue)
                VStack(alignment: .leading){
                    Text("John Doe")
                               .font(.headline)
                           Text("@johndoe")
                               .font(.subheadline)
                               .foregroundColor(.gray)
                }
                Spacer()

            }
            Text("Building amazing SwiftUI apps!")
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Spacer() // Pushes button to the right
                Button("Follow") {
                    print("Follow button tapped!")
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue) // Or .accentColor
            }
        }
        .frame(width: 250)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

// Replace previous setLiveView if you're testing this directly
PlaygroundPage.current.setLiveView(UserCardView())

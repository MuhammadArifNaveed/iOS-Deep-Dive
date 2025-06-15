import SwiftUI
import Combine // Needed for @Published, which is part of the Combine framework
import PlaygroundSupport // Required to display SwiftUI views in a Playground's Live View

// ---
// MARK: - ObservableObject: The Data Model
// ---
// UserSettings is a custom class that holds our application's state (score and username).
// It conforms to ObservableObject, which tells SwiftUI that it can be observed for changes.
class UserSettings: ObservableObject {
    // @Published property wrapper automatically publishes changes to any view observing UserSettings.
    // When 'score' or 'username' changes, SwiftUI views that depend on them will re-render.
    @Published var score: Int = 0
    @Published var username: String = "Guest"
}

// ---
// MARK: - @ObservedObject Example
// ---
// This view demonstrates @ObservedObject.
// @ObservedObject is used when a view needs to observe changes to an *instance* of an ObservableObject
// that is passed into the view or created by the view itself.
// In this specific example, 'settings' is created directly within the view.
// For the *source of truth* of an ObservableObject, @StateObject is generally preferred (as seen below).
struct ObservableObjectExample: View {
    // @ObservedObject tells SwiftUI to redraw this view whenever a @Published property
    // inside the 'settings' object changes.
    // If this view were to be recreated (e.g., by its parent), this 'settings' instance
    // would also be recreated, potentially losing its state.
    @ObservedObject var settings = UserSettings()

    var body: some View {
        VStack {
            Text("Score: \(settings.score)")
                .font(.largeTitle)
            Text("Username: \(settings.username)")
                .font(.title2)
            Button("Increase Score") {
                // Modifying 'settings.score' here triggers the view to update
                settings.score += 1
            }
            Button("Change Username") {
                // Modifying 'settings.username' also triggers the view to update
                settings.username = "Arif \(settings.score)"
            }
        }
    }
}

// ---
// MARK: - @EnvironmentObject Child View
// ---
// This view demonstrates @EnvironmentObject.
// @EnvironmentObject is used to inject an ObservableObject into the SwiftUI environment,
// making it accessible to any descendant view in the view hierarchy without
// explicitly passing it through initializers. This avoids "prop drilling".
struct ChildView: View {
    // @EnvironmentObject automatically looks for an instance of UserSettings
    // that has been provided by an ancestor view using the .environmentObject() modifier.
    // If no such object is found in the environment, the app will crash at runtime.
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        VStack {
            Text("child view score \(settings.score)")
            Button("increase score from child") {
                // Changes made here will update the *same* UserSettings instance
                // that the parent view is observing, and both views will re-render.
                settings.score += 5
            }
        }
    }
}

// ---
// MARK: - @EnvironmentObject Parent View
// ---
// This view acts as the parent and sets up the @EnvironmentObject for its children.
struct EnvironmentObjectExample: View {
    // @StateObject is used here to create and own the UserSettings instance.
    // Unlike @ObservedObject, @StateObject ensures that the UserSettings instance
    // persists for the lifetime of this view (EnvironmentObjectExample), even if the view
    // itself is recreated due to updates. It acts as the "source of truth" for the ObservableObject.
    @StateObject var settings = UserSettings()

    var body: some View {
        VStack {
            Text("parent score: \(settings.score)")
                .font(.largeTitle)
            Button("change score from parent") {
                settings.score += 1
            }
            Divider() // A visual separator
            ChildView() // This child view will automatically receive the settings object
        }
        // The .environmentObject() modifier injects the 'settings' object into the environment
        // for this view and all of its descendants (like ChildView).
        .environmentObject(settings)
    }
}

// ---
// MARK: - Live View Setup for Playground
// ---
// This line tells the Xcode Playground to display the EnvironmentObjectExample view
// in its Live View panel.
// You can uncomment and change this line to display other examples if you wish:
// PlaygroundPage.current.setLiveView(ObservableObjectExample())
PlaygroundPage.current.setLiveView(EnvironmentObjectExample())

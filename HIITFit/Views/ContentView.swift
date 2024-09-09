import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      WelcomeView()
      ExerciseView()
    }
    .tabViewStyle(PageTabViewStyle())
    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
  }
}

#Preview {
  ContentView()
}

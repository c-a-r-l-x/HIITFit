import SwiftUI

struct ContentView: View {
  @SceneStorage("selectedTab") private var selectedTab = 9
  
  var body: some View {
    ZStack {
      GradientBackgroundView()
      TabView(selection: $selectedTab) {
        WelcomeView(selectedTab: $selectedTab)
          .tag(9)
        ForEach(Exercise.exercises.indices, id: \.self) { index in
          ExerciseView(selectedTab: $selectedTab, index: index)
            .tag(index)
        }
      }
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
  }
}

#Preview {
  ContentView()
    .environmentObject(HistoryStore())
}

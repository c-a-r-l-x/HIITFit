import SwiftUI

struct ExerciseView: View {
  let exerciseNames = ["Squat", "Step Up", "Burpee", "Sun Salute"]
  let index: Int
  
  var body: some View {
    VStack {
      HeaderView(exerciseName: exerciseNames[index])
      Text("Video player")
      Text("Timer")
      Text("Start/Done button")
      Text("Rating")
      Text("History button")
    }
  }
}

#Preview {
  ExerciseView(index: 0)
}

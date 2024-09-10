import SwiftUI

struct ExerciseView: View {
  let index: Int
  var exercise: Exercise {
    Exercise.exercises[index]
  }
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        HeaderView(exerciseName: exercise.exerciseName)
          .padding(.bottom)
        VideoPlayerView(videoName: exercise.videoName)
          .frame(height: geometry.size.height * 0.45)
        Text("Timer")
        Text("Start/Done button")
        Text("Rating")
        Text("History button")
      }
    }
  }
}

#Preview {
  ExerciseView(index: 0)
}

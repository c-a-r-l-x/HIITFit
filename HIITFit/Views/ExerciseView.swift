import SwiftUI

struct ExerciseView: View {
  @Binding var selectedTab: Int
  let index: Int
  var exercise: Exercise {
    Exercise.exercises[index]
  }
  var lastExercise: Bool {
    index + 1 == Exercise.exercises.count
  }
  var startButton: some View {
    Button("Start") {}
  }
  var doneButton: some View {
    Button("Done") {
      selectedTab = lastExercise ? 9 : selectedTab + 1
    }
  }
  let interval: TimeInterval = 30
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        HeaderView(title: exercise.exerciseName)
          .padding(.bottom)
        VideoPlayerView(videoName: exercise.videoName)
          .frame(height: geometry.size.height * 0.45)
        Text(Date().addingTimeInterval(interval), style: .timer)
          .font(.system(size: geometry.size.height * 0.07))
        HStack(spacing: 150) {
          startButton
          doneButton
        }
        .font(.title3)
        .padding()
        RatingView()
          .padding()
        Spacer()
        Button("History") {}
          .padding(.bottom)
      }
    }
  }
}

#Preview {
  ExerciseView(selectedTab: .constant(0), index: 0)
}

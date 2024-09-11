import SwiftUI

struct ExerciseView: View {
  let index: Int
  var exercise: Exercise {
    Exercise.exercises[index]
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
          Button("Start") {}
          Button("Done") {}
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
  ExerciseView(index: 0)
}

import SwiftUI

struct ExerciseView: View {
  @Binding var selectedTab: Int
  @EnvironmentObject var history: HistoryStore
  @State private var rating = 0
  @State private var timerDone = false
  @State private var showTimer = false
  @State private var showHistory = false
  @State private var showSuccess = false
  let index: Int
  var exercise: Exercise {
    Exercise.exercises[index]
  }
  var lastExercise: Bool {
    index + 1 == Exercise.exercises.count
  }
  var startButton: some View {
    Button("Start") {
      showTimer.toggle()
    }
  }
  var doneButton: some View {
    Button("Done") {
      history.addDoneExercise(exercise.exerciseName)
      timerDone = false
      showTimer.toggle()
      if lastExercise {
        showSuccess.toggle()
      } else {
        selectedTab += 1
      }
    }
  }
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        HeaderView(selectedTab: $selectedTab, title: exercise.exerciseName)
          .padding(.bottom)
        VideoPlayerView(videoName: exercise.videoName)
          .frame(height: geometry.size.height * 0.45)
        HStack(spacing: 150) {
          startButton
          doneButton
            .disabled(!timerDone)
            .sheet(isPresented: $showSuccess) {
              SuccessView(selectedTab: $selectedTab)
                .presentationDetents([.medium, .large])
            }
        }
        .font(.title3)
        .padding()
        if showTimer {
          TimerView(timerDone: $timerDone, size: geometry.size.height * 0.07)
        }
        Spacer()
        RatingView(rating: $rating)
          .padding()
        Button("History") {
          showHistory.toggle()
        }
        .padding(.bottom)
        .sheet(isPresented: $showHistory) {
          HistoryView(showHistory: $showHistory)
        }
      }
    }
  }
}

#Preview {
  ExerciseView(selectedTab: .constant(0), index: 0)
    .environmentObject(HistoryStore())
}

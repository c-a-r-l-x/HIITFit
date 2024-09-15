import Foundation

struct ExerciseDay: Identifiable {
  let id = UUID()
  let date: Date
  var exercises: [String] = []
}

class HistoryStore: ObservableObject {
  @Published var exerciseDays: [ExerciseDay] = []
  
  init() {
    #if DEBUG
    createDevData()
    #endif
  }
  
  /// The date of the first element of exerciseDays is the user’s most recent exercise day.
  /// 1) If today is the same as this date, append the current exerciseName to the exercises array of this ExerciseDay.
  /// 2) If today is a new day, create a new ExerciseDay object and insert it at the beginning of the exerciseDays array.
  func addDoneExercise(_ exerciseName: String) {
    let today = Date()
    if today.isSameDay(as: exerciseDays[0].date) { // 1
      exerciseDays[0].exercises.append(exerciseName)
      print("Adding \(exerciseName)")
    } else { // 2
      exerciseDays.insert(
        ExerciseDay(date: today, exercises: [exerciseName]),
        at: 0
      )
    }
  }
}

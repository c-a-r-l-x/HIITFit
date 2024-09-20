import Foundation

struct ExerciseDay: Identifiable {
  let id = UUID()
  let date: Date
  var exercises: [String] = []
}

class HistoryStore: ObservableObject {
  @Published var exerciseDays: [ExerciseDay] = []
  @Published var loadingError = false
  var dataURL: URL {
    URL.documentsDirectory.appendingPathComponent("history.plist")
  }
  
  enum FileError: Error {
    case loadFailure
    case saveFailure
  }
  
  init() {
    #if DEBUG
//    createDevData()
    #endif
    do {
      try load()
    } catch {
      loadingError = true
    }
    print("Initializing HistoryStore")
  }
  
  // 1) Convert history data to a serialized property list format.
  // 2) Write to disk using dataURL.
  // 3) Conversion and writing may throw errors; catch them by throwing an error.
  func save() throws {
    let plistData = exerciseDays.map { exerciseDay in
      [exerciseDay.id.uuidString, exerciseDay.date, exerciseDay.exercises]
    }
    do {
      let data = try PropertyListSerialization.data( // 1
        fromPropertyList: plistData, format: .binary, options: .zero
      )
      try data.write(to: dataURL, options: .atomic) // 2
    } catch {
      throw FileError.saveFailure // 3
    }
  }
  
  func load() throws {
    throw FileError.loadFailure
  }
  
  // The date of the first element of exerciseDays is the user’s most recent exercise day.
  // 1) If today is the same as this date, append the current exerciseName to the exercises array of this ExerciseDay.
  // 2) If today is a new day, create a new ExerciseDay object and insert it at the beginning of the exerciseDays array.
  func addDoneExercise(_ exerciseName: String) {
    let today = Date()
    if let firstDate = exerciseDays.first?.date, today.isSameDay(as: firstDate) { // 1
      exerciseDays[0].exercises.append(exerciseName)
      print("Adding \(exerciseName)")
    } else { // 2
      exerciseDays.insert(
        ExerciseDay(date: today, exercises: [exerciseName]),
        at: 0
      )
    }
    do {
      try save()
    } catch {
      fatalError(error.localizedDescription)
    }
    print("History: ", exerciseDays)
  }
}

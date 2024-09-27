import SwiftUI

struct HistoryView: View {
  @EnvironmentObject var history: HistoryStore
  @Binding var showHistory: Bool
  
  var headerView: some View {
    HStack {
      Spacer()
      Text("History")
        .font(.title)
      Spacer()
      Button(action: {
        showHistory.toggle()
      }, label: {
        Image(systemName: "xmark.circle")
          .font(.title)
      })
    }
  }
  
  func dayView(day: ExerciseDay) -> some View {
    Section(header: Text(day.date.formatted(as: "MMM d")).font(.headline)) {
      exerciseView(day: day)
    }
  }
  
  func exerciseView(day: ExerciseDay) -> some View {
    ForEach(day.exercises, id: \.self) { exercise in
      Text(exercise)
    }
  }
  
  var body: some View {
    VStack {
      headerView
        .padding()
      Form {
        ForEach(history.exerciseDays) { day in
          dayView(day: day)
        }
      }
    }
  }
}

#Preview {
  HistoryView(showHistory: .constant(true))
    .environmentObject(HistoryStore(preview: true))
}

import SwiftUI

struct HistoryView: View {
  // sample data:
  let today = Date()
  let yesterday = Date().addingTimeInterval(-86400)
  let exercises1 = ["Squat", "Step Up", "Burpee", "Sun Salute"]
  let exercises2 = ["Sun Salute", "Burpee", "Step Up", "Squat"]
  
  var body: some View {
    ZStack(alignment: .topTrailing) {
      Button(action: {}, label: {
        Image(systemName: "xmark.circle")
          .font(.title)
          .padding()
      })
      VStack {
        Text("History")
          .font(.title)
          .padding()
        Form {
          Section(header: Text(today.formatted(as: "MMM d")).font(.headline)) {
            ForEach(exercises1, id: \.self) { exercise in
              Text(exercise)
            }
          }
          Section(header: Text(yesterday.formatted(as: "MMM d")).font(.headline)) {
            ForEach(exercises2, id: \.self) { exercise in
              Text(exercise)
            }
          }
        }
      }
    }
  }
}

#Preview {
  HistoryView()
}

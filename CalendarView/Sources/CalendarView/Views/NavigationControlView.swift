import SwiftUI

struct NavigationControlView: View {
    
    @Binding var date: Date
    
    var body: some View {
        HStack(spacing: 2) {
            Button { date = Calendar.current.date(byAdding: .day, value: -1, to: date)! }
                label: { Image(systemName: "chevron.backward") }
                .buttonStyle(GrowingButton())
            
            Button { date = Date() }
                label: {
                    Text("Today".localized)
                        .font(.system(size: 14))
                }
                .buttonStyle(GrowingButton())
            
            Button { date = Calendar.current.date(byAdding: .day, value: 1, to: date)! }
                label: { Image(systemName: "chevron.forward") }
                .buttonStyle(GrowingButton())
        }
    }
}

struct NavigationControlView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationControlView(date: Binding<Date>(get: {
            return Date()
        }, set: { (date) in
            
        }))
    }
}

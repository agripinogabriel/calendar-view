import SwiftUI

struct DayView: View {
    
    @State var date = Date()
    
    var body: some View {
        ZStack {
            Text("\(date.day)")
                .font(
                    .system(
                        size: 60,
                        weight: .black,
                        design: .rounded
                    )
                )
                .foregroundColor(Color(.lightGray))
            
            dayInfoView(date.weekDayName)
                .padding(EdgeInsets(top: -50, leading: 0, bottom: 0, trailing: 0))
            
            dayInfoView(date.monthName)
                .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
        }
        .frame(alignment: .top)
    }
    
    private func dayInfoView(_ text: String) -> some View {
        Text(text)
            .font(
                .system(
                    size: 30,
                    weight: .semibold,
                    design: .rounded
                )
            )
            .foregroundColor(.blue)
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView()
    }
}

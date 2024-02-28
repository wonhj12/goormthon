import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var vm: MapViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
    }
}

extension LocationsListView {
    private func listRowView(location: Location) -> some View {
        HStack {
            // 이미지
            //            if let imageName = location.imageName {
            //                Image(imageName)
            //            }
            
            VStack(alignment: .leading) {
                // 장소 이름
                Text(location.name)
                    .font(.headline)
                
                // 장소 주소
                Text(location.address)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

//#Preview {
//    LocationsListView()
//}

### 사전과제
[SwiftUI Tutorial-developer.apple.com](https://developer.apple.com/tutorials/swiftui)

<hr>

### 🗂️ 목차<br>
[Creating and Combining Views](#-creating-and-combining-views)<br>
  &emsp;&emsp;[Section 1 - Create a New Project and Explore the Canvas](#section-1---create-a-new-project-and-explore-the-canvas)<br>
  &emsp;&emsp;[Section 2 - Customize the Text View](#section-2---customize-the-text-view)<br>
  &emsp;&emsp;[Section 3 - Combine Views Using Stacks](#section-3---combine-views-using-stacks)<br>
  &emsp;&emsp;[Section 4 - Create a Custom Image View](#section-4---create-a-custom-image-view)<br>
  &emsp;&emsp;[Section 5 - Using SwiftUI Views From Other Frameworks](#section-5---using-swiftui-views-from-other-frameworks)<br>
  &emsp;&emsp;[Section 6 - Compose the Detail View](#section-6---compose-the-detail-view)<br><br>
  
[Building Lists and Navigation](#-building-lists-and-navigation)<br>
  &emsp;&emsp;[Section 1 - Create a Landmark Model](#section-1---create-a-landmark-model)<br>
  &emsp;&emsp;[Section 2 - Create the Row View](#section-2---create-the-row-view)<br>
  &emsp;&emsp;[Section 3 - Customize the Row Preview](#section-3---customize-the-row-preview)<br>
  &emsp;&emsp;[Section 4 - Create the List of Landmarks](#section-4---create-the-list-of-landmarks)<br>
  &emsp;&emsp;[Section 5 - Make the List Dynamic](#section-5---make-the-list-dynamic)<br>
  &emsp;&emsp;[Section 6 - Set Up Navigation Between List and Detail](#section-6---set-up-navigation-between-list-and-detail)<br>
  &emsp;&emsp;[Section 7 - Pass Data into Child Views](#section-7---pass-data-into-child-views)<br>
  &emsp;&emsp;[Section 8 - Generate Previews Dynamically](#section-8---generate-previews-dynamically)<br>

[Handling User Input](#-handling-user-input)<br>
   &emsp;&emsp;[Section 1 - Mark the User’s Favorite Landmarks](#section-1---mark-the-users-favorite-landmarks)<br>
   &emsp;&emsp;[Section 2 - Filter the List View](#section-2---filter-the-list-view)<br>
   &emsp;&emsp;[Section 3 - Add a Control to Toggle the State](#section-3---add-a-control-to-toggle-the-state)<br>
   &emsp;&emsp;[Section 4 - Use an Observable Object for Storage](#section-4---use-an-observable-object-for-storage)<br>
   &emsp;&emsp;[Section 5 - Adopt the Model Object in Your Views](#section-5---adopt-the-model-object-in-your-views)<br>
   &emsp;&emsp;[Section 6 - Create a Favorite Button for Each Landmark](#section-6---create-a-favorite-button-for-each-landmark)<br>
<hr>
<br>

# Chapter 1 - SwiftUI Essentials

🖊️ 프로젝트 명 : Landmarks


<br>

## 👩🏻‍💻 Creating and Combining Views

### Section 1 - Create a New Project and Explore the Canvas
- An app that uses the SwiftUI app life cycle has a structure that conforms to the App protocol. The structure’s body property returns one or more scenes, which in turn provide content for display. The `@main` attribute identifies the app’s entry point.<br>-<br>
SwiftUI 앱 수명 주기를 사용하는 앱은 앱 프로토콜을 준수하는 구조를 가집니다. 구조의 body 속성은 하나 이상의 장면을 반환하고 표시할 콘텐츠를 제공합니다. `@main` 속성은 앱의 진입점을 식별합니다.

<br>

- By default, SwiftUI view files declare two structures. The first structure conforms to the View protocol and describes the view’s content and layout. The second structure declares a preview for that view.<br>-<br>
기본적으로 SwiftUI 보기 파일은 두 개의 구조를 선언합니다. 첫 번째 구조는 View 프로토콜을 준수하고 뷰의 콘텐츠와 레이아웃을 설명합니다. 두 번째 구조는 해당 보기에 대한 미리보기를 선언합니다.

<br>

### Section 2 - Customize the Text View
- In the preview, Command-click the greeting to bring up the structured editing popover,  and choose “Show SwiftUI Inspector”.<br>-<br>
미리보기에서 인사말(Text)을 Command-클릭하여 구조화된 편집 팝오버를 표시하고 "Show SwiftUI Inspector"를 선택합니다.
  - "SwiftUI Inspector" 창에서 요소 커스텀 가능

<br>

### Section 3 - Combine Views Using Stacks
- VStack과 HStack으로 Text를 묶음
- Spacer()로 두개의 Text 사이에 여백을 최대로 둠
<br>

> ContentView.swift
```Swift
VStack(alignment: .leading) {
                
    Text("Turtle Rock")
        .font(.title)
    HStack {
        Text("Joshua Tree National Park")
            .font(.subheadline)
        Spacer()
        Text("California")
            .font(.subheadline)
    }
}
.padding()
```
<br>

### Section 4 - Create a Custom Image View
- 이미지를 Asset에 추가하고, `Image("이미지명")`으로 View에 추가
<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/a8758d6c-a9ae-4f42-a2ca-18eb7f6ec9bc" width="20%">
<br><br>

> CircleImage.swift
```Swift
struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle()) // 동그랗게 자르기
            .overlay {  // 테두리
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7) // 그림자
    }
}
```

<br>

### Section 5 - Using SwiftUI Views From Other Frameworks
- import MapKit
- You use the `@State` attribute to establish a source of truth for data in your app that you can modify from more than one view. SwiftUI manages the underlying storage and automatically updates views that depend on the value.<br>-<br>
`@State` 특성을 사용하여 둘 이상의 보기에서 수정할 수 있는 앱의 데이터에 대한 신뢰할 수 있는 소스를 설정합니다. SwiftUI는 기본 스토리지를 관리하고 값에 따라 뷰를 자동으로 업데이트합니다.
<br>

- By prefixing a state variable with `$`, you pass a binding, which is like a reference to the underlying value. When the user interacts with the map, the map updates the region value to match the part of the map that’s currently visible in the user interface.<br>-<br>
상태 변수에 `$`를 접두사로 지정하면 기본 값에 대한 참조와 같은 바인딩을 전달합니다. 사용자가 지도와 상호작용하면 지도는 현재 사용자 인터페이스에 표시되는 지도 부분과 일치하도록 지역 값을 업데이트합니다.

<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/792e0b14-ddb7-4b10-a6e5-0bee65797112" width="20%">
<br><br>

> MapView.swift
```Swift
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )

    var body: some View {
        
        Map(coordinateRegion: $region)
    }
}
```

<br>

### Section 6 - Compose the Detail View
- ContentView에 MapView와 CircleImage 추가
<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/37173bcd-ce47-4ec1-b568-23962b9f8000" width="20%">
<br><br>

> ContentView.swift
```Swift
struct ContentView: View {
    var body: some View {
        VStack{
            
            MapView()
                .ignoresSafeArea(edges: .top) // 위쪽 안전영역 무시
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider() // 구분선

                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
                
                
            }
            .padding()
            
            
            Spacer()
        }
    }
}
```

<br>

## 👩🏻‍💻 Building Lists and Navigation

### Section 1 - Create a Landmark Model
- `landmarkData.json` 파일 추가 (Drag&Drop)
<img width="500" alt="스크린샷 2023-07-19 오전 10 26 23" src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/c1ffa2ec-6d0d-4ae6-931f-f65564f7620b">
<br><br>

- Adding Codable conformance makes it easier to move data between the structure and a data file. You’ll rely on the Decodable component of the Codable protocol later in this section to read data from file.
<br>-<br>
Codable 적합성을 추가하면 구조와 데이터 파일 간에 데이터를 더 쉽게 이동할 수 있습니다. 파일에서 데이터를 읽으려면 이 섹션의 뒷부분에서 Codable 프로토콜의 Decodable 구성 요소에 의존합니다.

> Landmark.swift
```Swift
import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Codable, Hashable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    
    private var coordinates: Coordinates

    // locationCoordinate - MapKit 프레임워크와 상호 작용
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    // 좌표 속성 추가
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
}
```

<br>

- The load method relies on the return type’s conformance to the Decodable protocol, which is one component of the Codable protocol.<br>-<br>
로드 방법은 Codable 프로토콜의 한 구성 요소인 Decodable 프로토콜에 대한 반환 유형의 적합성에 의존합니다.

> ModelData.swift
```Swift
import Foundation

var landmarks: [Landmark] = load("landmarkData.json")

// 주어진 이름으로 JSON 데이터를 가져오는 메서드
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
```

<br>

- 파일 정리 및 그룹화
<img width="268" alt="스크린샷 2023-07-19 오전 11 05 24" src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/d5b251fa-e219-4440-9f00-c8b6cc1985e3">

<br><br>

### Section 2 - Create the Row View
- When you add the landmark property, the preview stops working, because the LandmarkRow type needs a landmark instance during initialization.
  <br>-<br>
  랜드마크 속성을 추가하면 LandmarkRow 유형에 초기화 중에 랜드마크 인스턴스가 필요하기 때문에 미리보기가 작동을 멈춥니다.
<br>

- In the previews static property of `LandmarkRow_Previews`, add the landmark parameter to the `LandmarkRow` initializer, specifying the first element of the landmarks array.
  <br>-<br>
  `LandmarkRow_Previews`의 미리보기 정적 속성에서 `LandmarkRow` 이니셜라이저에 랜드마크 매개 변수를 추가하여 랜드마크 배열의 첫 번째 요소를 지정합니다.

<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/21ee8394-524a-4fd2-85ce-42c5244e10e1" width="20%">
<br><br>

> LandmarkRow.swift
```Swift
import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)

            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: landmarks[0])
    }
}
```

<br>

### Section 3 - Customize the Row Preview
- Group is a container for grouping view content. Xcode renders the group’s child views as separate previews in the canvas.
  <br>-<br>
  Group은 보기 콘텐츠를 그룹화하기 위한 컨테이너입니다. Xcode는 그룹의 하위 뷰를 캔버스에서 별도의 미리보기로 렌더링합니다.

<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/e1f2d97a-db8c-4e32-96bd-fab0c48e8f5b" width="30%">
<br><br>

> LandmarkRow.swift
```Swift
struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
                .previewLayout(.fixed(width: 300, height: 70))
            LandmarkRow(landmark: landmarks[1])
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
```

- A view’s children inherit the view’s contextual settings, such as preview configurations.
  <br>-<br>
  view의 자식은 미리 보기 구성과 같은 보기의 컨텍스트 설정을 상속합니다.
> LandmarkRow.swift
```Swift
struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
```

<br>

### Section 4 - Create the List of Landmarks
- 리스트로 LandmarkRow 2개 띄워보기

<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/bca32582-32e7-42f7-bb76-b513fd2f003c" width="20%">
<br><br>

> LandmarkList.swift
```Swift
import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
    }
}
```

<br>

### Section 5 - Make the List Dynamic

<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/828866ba-b7ce-409f-81b6-d411b5474f1a" width="20%">
<br>

- Lists work with `identifiable data`. You can make your data identifiable in one of two ways: by passing along with your data a key path to a property that uniquely identifies each element, or by making your data type conform to the `Identifiable` protocol.
  <br>-<br>
  List는 `식별 가능한 데이터`로 작동합니다. 두 가지 방법 중 하나로 데이터를 식별 가능하게 만들 수 있습니다. 데이터와 함께 각 요소를 고유하게 식별하는 속성에 대한 키 경로를 전달하거나 데이터 유형이 `Identifiable` 프로토콜을 준수하도록 합니다.

> LandmarkList.swift
```Swift
import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List(landmarks, id: \.id) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}
```

<br>

- The Landmark data already has the id property required by Identifiable protocol; you only need to add a property to decode it when reading the data.
  <br>-<br>
  Landmark 데이터에는 Identifiable 프로토콜에 필요한 id 속성이 이미 있습니다. 데이터를 읽을 때 디코딩할 속성만 추가하면 됩니다.

> Landmark.swift
```Swift
struct Landmark: Codable, Hashable, Identifiable {
  ...
}
```

<br>

- remove id parameter
> LandmarkList.swift
```Swift
struct LandmarkList: View {
    var body: some View {
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}
```

### Section 6 - Set Up Navigation Between List and Detail


<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/8bd6ca17-ef2c-4401-a6e2-82c1e5d819ae" width="20%">

<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/b4d7dce4-507d-4570-bff4-2d48805a434f" width="20%">
<br>

- ContentView의 코드를 LandmarkDetail.swift로 옮기고, ContentView는 LandmarkList() 띄우기

> LandmarkDetail.swift
```Swift
struct LandmarkDetail: View {
    var body: some View {
        VStack{
            
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()

                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
                
                
            }
            .padding()
            
            
            Spacer()
        }
    }
}
```

<br>

> ContentView.swift
```Swift
struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}
```

<br>

- LandmarkList.swift에 NavigationView 추가

> LandmarkList.swift
```Swift
struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks, id: \.id) { landmark in
                NavigationLink {
                    LandmarkDetail()
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
        }
        .navigationTitle("Landmarks")
    }
}
```

<br>

### Section 7 - Pass Data into Child Views

<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/5f0d9ddd-4867-4218-9a9b-bd568fba92fd" width="20%">
<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/c99b0899-c4a1-42ad-ad44-9f0ed2f28724" width="20%">
<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/e1d24f84-041a-4bef-a955-ec38caab6798" width="20%">
<br><br>

- CircleImage와 MapView에서 선택된 장소의 정보로 데이터가 변경될 수 있도록 코드 수정
> CircleImage.swift
```Swift
struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            ...
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
```

<br>

> MapView.swift
```Swift
struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()

    var body: some View {
        
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    // 좌표 값을 기반으로 지역을 업데이트하는 메서드
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
```

<br>

- LandmarkDetail에 landmark 변수를 통해 현재 선택된 장소의 이미지와 지도뷰를 보여주고, Text를 현재 장소의 정보로 업데이트

> LandmarkDetail.swift
```Swift
struct LandmarkDetail: View {
    
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                
                Text(landmark.name)
                    .font(.title)
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
```
<br>

> LandmarkList.swift
```Swift
struct LandmarkList: View {
    var body: some View {
            ...
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                ...
}
```

<br>

### Section 8 - Generate Previews Dynamically

- 다양한 기기 크기에서 list view의 미리보기를 렌더링

- Within the list preview, embed the LandmarkList in a ForEach instance, using an array of device names as the data.
  <br>-<br>
  list preview 내에서 기기 이름 배열을 데이터로 사용하여 ForEach 인스턴스에 LandmarkList를 포함합니다.
<br>

- ForEach operates on collections the same way as the list, which means you can use it anywhere you can use a child view, such as in stacks, lists, groups, and more. When the elements of your data are simple value types — like the strings you’re using here — you can use \.self as key path to the identifier.
  <br>-<br>
  ForEach는 목록과 동일한 방식으로 컬렉션에서 작동하므로 스택, 목록, 그룹 등과 같이 자식 보기를 사용할 수 있는 모든 곳에서 사용할 수 있습니다. 데이터의 요소가 여기에서 사용하는 문자열과 같은 단순한 값 유형인 경우 \.self를 식별자의 키 경로로 사용할 수 있습니다.

> LandmarkList.swift
```Swift
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
```

<br>

## 👩🏻‍💻 Handling User Input

### Section 1 - Mark the User’s Favorite Landmarks
- Landmark.swift에 isFavorite 변수를 추가하고, LandmarkRow.swift에 isFavorite이 true인 경우 노란색 별이 보여지게 함
<br>
<img width="300" alt="스크린샷 2023-07-21 오후 1 47 02" src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/d0eb997f-e86a-45bb-9f17-15238ca00afa">
<br>

> Landmark.swift
```Swift
struct Landmark: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool

    ...
}
```
<br>

> LandmarkRow.swift
```Swift
struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)

            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}
```
<br>

### Section 2 - Filter the List View
- LandmarkList.swift에 `@State` 변수로 showFavoritesOnly를 추가
- filteredLandmarks : showFavoritesOnly 속성과 각 Landmark.isFavorite 값을 확인하여 랜드마크 목록의 필터링된 버전 계산
<br> 
<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/b64d70af-05b8-419a-abd6-f1697c4441fd" width="20%">
<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/a62357ab-a174-4965-8716-8f180a826aea" width="20%">

- LEFT : showFavoratesOnly = false
- RIGHT : showFavorateOnly = true
<br>

> LandmarkList.swift
```Swift
struct LandmarkList: View {
    
    @State private var showFavoritesOnly = true
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    
    var body: some View {
        NavigationView {
            List(filteredLandmarks, id: \.id) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
```
<br>

### Section 3 - Add a Control to Toggle the State
- 토클 버튼으로 `전체보기`와 `좋아요한 목록만 보기` 전환

<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/3562351d-58f3-4347-aa7d-e1e06c9639fa" width="20%">
<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/24969504-7f60-4d72-8afd-1f03b3e909b3" width="20%">
<br><br>

> LandmarkList.swift
```Swift
struct LandmarkList: View {

    // false로 초기화
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    
    var body: some View {
        NavigationView {
            // 리스트 안에 토글 버튼 추가
            // Landmark 리스트는 ForEach로 보여지게 하기
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .navigationTitle("Landmarks")
    }
}
```
<br>

### Section 4 - Use an Observable Object for Storage

- Declare a new model type that conforms to the ObservableObject protocol from the Combine framework.
  <br>-<br>
  Combine 프레임워크에서 ObservableObject 프로토콜을 준수하는 새 모델 유형을 선언합니다.

```Swift
import Combine

final class ModelData: ObservableObject {
}
```
<br>

- SwiftUI subscribes to your observable object, and updates any views that need refreshing when the data changes.
  <br>-<br>
  SwiftUI는 관찰 가능한 객체를 구독하고 데이터가 변경될 때 새로 고쳐야 하는 모든 보기를 업데이트합니다.
<br>

- An observable object needs to publish any changes to its data, so that its subscribers can pick up the change.
  <br>-<br>
  Observable 객체는 구독자가 변경 사항을 선택할 수 있도록 데이터 변경 사항을 게시해야 합니다.
```Swift
// @Published 속성 추가
@Published var landmarks: [Landmark] = load("landmarkData.json")
```
<br>

> ModelData.swift
```Swift
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}
```
<br>

### Section 5 - Adopt the Model Object in Your Views
- The modelData property gets its value automatically, as long as the environmentObject(_:) modifier has been applied to a parent.
  <br>-<br>
  modelData 속성은 environmentObject( _:) 수정자가 부모에 적용되는 한 자동으로 값을 가져옵니다.
<br>

> LandmarkList.swift
```Swift
struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
  ...
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
```
<br>

> LandmarkDetail.swift
```Swift
struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}
```
<br>

> LandmarkRow.swift
```Swift
struct LandmarkRow_Previews: PreviewProvider {
    
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
```
<br>

> ContentView.swift
```Swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
```
<br>

### Section 6 - Create a Favorite Button for Each Landmark
- FavoriteButton.swift를 새로 생성
<br>

> FavoriteButton.swift
```Swift
struct FavoriteButton: View {
    @Binding var isSet: Bool

    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
```
<br>

- Helpers 그룹을 만들어서 파일 정리
<img width="270" alt="스크린샷 2023-07-24 오후 8 48 11" src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/1ebfcbc3-5c1a-4e72-9dc9-8729ee7cd443">
<br><br>

- LandmarkDetail.swift에 Favorite 버튼 추가
<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/5c12b993-1052-44bc-a864-9400945f0229" width="20%">
<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/ca58a83b-7c2d-477e-b765-7ec41ba9fa12" width="20%">
<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/60dc50fb-7dfc-404d-8977-5aa79eb7eba6" width="20%">
<img src="https://github.com/julia8024/pre-onboarding-iOS-challenge-Aug/assets/79641953/041211b4-4f6c-4d9e-aeb3-1572d5d0eed2" width="20%">

<br><br>

> LandmarkDetail.swift
```Swift
struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    var body: some View {
        ScrollView {
          ...
          VStack(alignment: .leading) {
                
              HStack {
                 Text(landmark.name)
                     .font(.title)
                 FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
             }
            ...
        }
  ...
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
```
<br>

> LandmarkApp.swift
```Swift
import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
```

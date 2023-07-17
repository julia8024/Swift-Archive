# 사전과제
[SwiftUI Tutorial-developer.apple.com](https://developer.apple.com/tutorials/swiftui)

<br>

## Chapter 1 - SwiftUI Essentials

🖊️ 프로젝트 명 : Landmarks


<br>

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

<img src = "https://user-images.githubusercontent.com/92036498/215314013-3751fca7-3a25-4c21-9aa6-ca82a8809173.gif" width = "217" height = "458"/>

### 트러블슈팅
- 최소 버전 iOS 11
  - SF symbol의 사용 불가.. iOS 12부터 사용이 가능했다니..
  - Kingfisher 라이브러리 12부터 지원, UIImageView를 extension 해서 이미지를 비동기 처리하여 가져오는 로직을 구현하였습니다.
  - Systemgray 색상.. 또한 UIColor를 extension 하여 직접 구현
  - Xcode 14에서는 설치 가능한 iOS 최소 버전이 12.4...
- RxDatasources 에 CollectionView의 Custom Header를 만들때 FlowLayout에 Header 높이 넓이를 설정해주지 않아서 시간을 투자하였습니다..

### 한 줄 회고
- 전체적으로 iOS11 이라는 낮은 버전에 대응하는 데 필요한 지식을 습득한 프로젝트였습니다.
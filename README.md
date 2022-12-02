# OCR_NameCard
명함 자동저장 어플리케이션

## 1. 개요
2022년 한 회사에서 근로학생 진행했다. 이 회사는 정직원들의 출장이 잦았는데 이때 명함 교환이 빈번하게 일어나는것을 보았다. 이 점에서 명함을 서로 주고받았을 때 앱에서 촬영하면 OCR로 글자를 인식하여 자동으로 전화번호부에 저장되게 하는 앱이 있으면 좋을것 같다는 생각을 하였고 개인적으로 프로젝트를 진행하게 되었다.
앱의 동작방식은 단순하다. 명함을 촬영하면 명함에 있는 이름과 회사주소 전화번호가 인식되고 디바이스에 저장되는 방식이다.<br>
본 프로젝트는 크로스플랫폼 Flutter 앱으로 제작하며, Flutter에서 android와 ios의 네이티브 코드를 사용하는 플랫폼 채널 "MethodChannel" 사용에 초점을 둔다.

### 1-1. 프로젝트 기간
2022-10-24 ~ ing

### 1-2. 개발 환경
  - 운영체제
    - Windows 10
    - macOS Ventura
  - IDE
    - Visual Studio Code
  - Test Device
    - Galaxy S20
    - iPhone 6S
## 2. 기능
1. App 기능
  - 명함 이미지 촬영
  - 명함 텍스트 인식
  - 디바이스 저장
## 3. 흐름도
![NamecardSaver_Flow](https://user-images.githubusercontent.com/67559542/197653378-65ba5350-c7d1-47f4-a41f-1fe0b0bbb5e7.png)

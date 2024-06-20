# 2024-NC2-M20-ScreenTime
<pre>
2024 Apple Deveopler Academy @ POSTECH, Morning Session AengZi & TEO
📅 2024.06.10(Mon) - 2024.06.21(Fri)
📲 ios 17.4/SwiftUI/
</pre>


## 🎥 Youtube Link
(추후 만들어진 유튜브 링크 추가)

## ⏳ About Screen Time
![ScreenTime](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-M20-ScreenTime/blob/main/ScreenTime.png)

> 디지털 기기의 사용 시간을 추적하고 관리할 수 있는 기능
> 

**Screen Time**은 웹 사용 데이터를 공유 및 추적, 관리하는 것과 관련된 기술입니다.

$\color{#5c56d2} \bf 기기$ $\color{#5c56d2} \bf 사용시간$ $\color{#5c56d2} \bf 추적$ DeviceActivity

기기 사용시간, 앱 서비스, 웹 사이트에 머문 시간을 추적하고 기록, 분석할 수 있습니다.

$\color{#5c56d2} \bf 스크린타임$ $\color{#5c56d2} \bf 제어$ Managed Settings

기기 사용 시간을 추적해서 특정 어플이나 웹 사이트에 머무르는 시간을 제어할 수 있습니다.

$\color{#5c56d2} \bf 스크린타임$ $\color{#5c56d2} \bf 사용량$ $\color{#5c56d2} \bf 공유$ FamilyControls

보호자가 자녀의 스크린 타임을 공유받을 수 있고 그것을 보호차원에서 제한할 수 있습니다.

## 🎯 What we focus on?
### **🔍 우리가 Screen Time에서 집중한 ‘스크린타임 제어’**(Managed Settings)

**1. 다운타임**

특정 시간을 정해서 그 시간대에는 기본적인 앱인 설정, 건강, 전화 등의 앱과 별개로 선택해 둔 앱 이외의 사용을 제한

**2. 앱 시간 제한**

특정 앱을 일정시간 동안만 사용할 수 있도록 제한

**3. 컨텐츠 및 개인정보 보호 제한**

앱 설치와 삭제, 특정 사이트와 콘텐츠를 아예 접속할 수 없도록 설정하는 기능

## 💼 Use Case
- 집중모드(Focus)에서는 유저와 유저의 상황에 맞게 앱 커뮤니케이션 제한을 할 수 있는 기능이 있지만 시간 설정이 어렵다!
- 스크린타임(Screen Time)에서는 앱 제한 및 시간 설정이 가능하지만 유저와 유저의 상황에 맞게 설정할 수 없다!

→ Screen Time의 앱 접근/사용을 관리하는 ManagedSettings 프레임워크: 다운타임 기능을 활용하여 사용자에게 알맞는 다운타임 집중모드를 개발해보자!

### → 앱 사용 시간을 제한함으로 업무에 대한 집중을 도와주는 $\color{#5c56d2} \bf 뽀모도로$ $\color{#5c56d2} \bf 타이머$ 를 만들어보자!
> 뽀모도로 기법(Pomodoro Technique)이란? </br> 집중력 향상이 목적인 시간 관리 방법론으로, **25분 동안 무언가에 집중하고 5분 동안 쉬는 것을 4번 반복하고, 그 뒤에 30분간 쉬도록 시간을 배분**하는 방식으로 이루어진다. 이 때, "25분 집중 + 5분 휴식"의 사이클을 가리켜 “뽀모도로”라고 하고, 이 사이클을 1회 완료하는 것을 "1 뽀모도로" 라고 한다.



## 🖼️ Prototype
![prototype](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-M20-ScreenTime/blob/main/prototype.gif)

## 🛠️ About Code
### 1. ManagedSetting 권한 요청


```swift
import SwiftUI
import FamilyControls

@main
struct ScreenTimeApp: App {
    let center = AuthorizationCenter.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    Task {
                        do {
                            try await center.requestAuthorization(for: .individual)
                        } catch {
                            print("Fail: \(error)")
                        }
                    }
                }
        }
    }
}
```

엔트리 포인트인 App 구조체에 FamilyControls에 대한 권한을 요청 코드를 작성해야 합니다.

iOS15에서는 가족 구성원 중 부모 권한의 승인이 있어야 실행가능 했지만, iOS16 버전부터 가족 구성원의 승인 없이 자신의 iPhone에 스스로 권한을 요청활 수 있도록 업데이트 되었습니다 (.individual 선택)

### 2. ManagedSetting을 관리하는 객체


```swift
import Foundation
import FamilyControls
import ManagedSettings

class ManagedSettingModel: ObservableObject {
    static var shared = ManagedSettingModel()
    
    let store = ManagedSettingsStore()
    
    @Published var selectionToDiscourage: FamilyActivitySelection
    
    init() {
        selectionToDiscourage = FamilyActivitySelection()
    }
    
		...
}
```

권한을 제어하는 객체를 단 하나만 두기 위해 SingleTon패턴으로 ManagedSetting모델을 만들었습니다.

싱글톤 패턴은 하나의 어플리케이션 내에서 하나의 인스턴스(객체)만 사용해야하는 상황에 구현합니다.

어플리케이션 전체 영역에서 동일한 객체에 접근할 수 있는 장점 덕분에 유저 정보, 앱 설정과 같이, 인스턴스들이 꼬이는 상황을 방지하고, 메모리의 낭비를 막을 수 있습니다.

현재 상황에서는 특히 어플리케이션의 제한과 해제를 제어하는 객체는 단 하나만 존재해야 꼬이지 않고, 의도치 않은 어플 제한/해제를 방지할 수 있어서 SingleTon패턴을 적용하였습니다.

다른 파일에서는

`ManagedSettingModel.shared.[ 메서드 혹은 프로퍼티 ]` 코드로 접근할 수 있습니다

### 3. 앱 제한 및 해제 기능


```swift
import Foundation
import FamilyControls
import ManagedSettings

class ManagedSettingModel: ObservableObject {
    ...
    
    func setShieldRestrictions() {
        let applications = ManagedSettingModel.shared.selectionToDiscourage
        
        storeshield.applications = applications.applicationTokens.isEmpty ? nil : applications.applicationTokens
        store.shield.applicationCategories = applications.categoryTokens.isEmpty ? nil : ShieldSettings.ActivityCategoryPolicy.specific(applications.categoryTokens)
    }
    
    func freeShieldRestrictions() {
        store.shield.applications = nil
        store.shield.applicationCategories =  nil
    }
    
    func isSelectionEmpty() -> Bool {
        selectionToDiscourage.applicationTokens.isEmpty &&
        selectionToDiscourage.categoryTokens.isEmpty &&
        selectionToDiscourage.webDomainTokens.isEmpty
    }
    
}
```

어플리케이션을 제한, 해제하기 위해서 `ManagedSettingsStore()` 의 `sheild` 의 `applications` 에 선택한 어플의 토큰값을 추가하거나 비워주어야 합니다.

위 코드의 경우

`setShieldRestrictions()` 메서드 선언하고 어플리케이션 토큰을 담을 수 있게 하였고

`freeShieldRestrictions()` 메서드를 선언하고 어플리케이션 토큰을 비울 수 있게 하였습니다.

이제 해당 메서드들을 필요한 시점에 실행 시켜주면 앱을 제한하거나 해제할 수 있습니다!

### 4. 제한 할 앱을 선택하는 방법

```swift
import SwiftUI
import FamilyControls

struct RoutinePrepareView: View {
		@EnvironmentObject var managedSettingModel: ManagedSettingModel
    @State var isPresented = false
    
    var body: some View {
        VStack { ... }
        }
        .familyActivityPicker(isPresented: $isPresented,
											        selection: $managedSettingModel.selectionToDiscourage)

    }
}
```

View를 그릴 때, 최상위 뷰에 아래 수정자를 작성하고

첫 번째 인자로는 true로 바뀔 수 있는 상태값

두 번째 인자로는 선택한 앱의 토큰을 담을 수 있는 상태값

을 대입하면 미리 구현된, 제한 할 앱을 선택하는 Modal뷰가 나타납니다.

```swift
.familyActivityPicker(isPresented: Binding<Bool>,
selection: Binding<FamilyActivitySelection>)
```

그리고 그 Modal 뷰에서 앱을 선택하면 앱의 토큰들이 담기게 되고

트리거가 되는 버튼에서`setShieldRestrictions()` 실행하면, 선택한 어플들은 사용이 제한 됩니다.

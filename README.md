# ManageSponsor_iOS
후원회 업무 알림 애플리케이션 

## 프로젝트 개요
* 학교에 지속적인 관심을 갖고 지원을 하는 후원자들의 데이터를 체계적으로 관리할 수 있도록 합니다. 

### 메뉴 구성
일정 관리, 약정 관리, 시스템 기록 관리 세 가지 탭으로 구분 

### 기대 효과
- 언제 어디서든 원활한 업무 관리 가능
- 선택한 시간에 지속적으로 알림 받기 가능
- 장기 후원자 유치 이어짐

### 개발 과정
기획 및 와이어프레임 구축  
애플리케이션 GUI 설계 및 구축  
데이터베이스 설계 및 구축  
서버 구축   
베타 테스트 실시  
버그 수정 및 보완  
애플리케이션 런칭 -  플레이스토어 앱스토어 등록

### 개발 목적
모든 업무 웹으로 처리해야하는 번거로움 해소
  
![텍스트목록](./ss/purpose.gif)

### 사용 아키텍처
* MVVM

### 개발환경
* 언어 : Swift4
* 개발환경 : Xcode

### SwiftSoup
>https://github.com/scinfu/SwiftSoup

        // get html

        let doc : Document = try SwiftSoup.parse(html)
 
            //multiple element
            
            let script : [Element] = try doc.select("script").array()
            for i in script {
    
                // set data 
            }
            
        } catch Exception.Error(type: let type, Message: let message) {
            print(type)
            print(message)
        } catch {
            print("")
        }
        
        

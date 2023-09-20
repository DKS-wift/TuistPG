import ProjectDescription

/*
 
 간단하게 요약하면 하위 static 모듈들의 코드가 적재가 안되는 상황이 일어날 수도 있어서
 dynamic framework들은
 -all_load 옵션을
 달아주었습니다
 
 */
//링커 관련 =  OTHER_LDFLAGS
/*
 
  SettingDictionary  key,value 레퍼런스
 
 https://developer.apple.com/documentation/xcode/build-settings-reference
 
 */
public extension SettingsDictionary {
    static let ldFlages: SettingsDictionary = [
        "OTHER_LDFLAGS": .string("$(inherited)")
    ]

    /*
      타겟의 설정은 기본은 프로젝트 설정을 상속하지만
      링커관련 설정은  링커에게 라이브러리에 작성된 모든 멤버를 적재하도록 전달
     
     */
    static let allLoadLDFlages: SettingsDictionary = [
        "OTHER_LDFLAGS": .string("$(inherited) -all_load")
    ]
}

import ProjectDescription

/*
 각 모듈별로의
 경로들을 미리 정의해놓는 그런겁니다
 */
public extension SourceFilesList {
    static let demoSources: SourceFilesList = "Demo/Sources/**"
    static let interface: SourceFilesList = "Interface/**"
    static let sources: SourceFilesList = "Sources/**"
    static let testing: SourceFilesList = "Testing/**"
    static let unitTests: SourceFilesList = "Tests/**"
    static let uiTests: SourceFilesList = "UITests/**"
}

import ProjectDescription


/* Projects 의 Build Settings의 code Sign 
 */

public extension SettingsDictionary {
    static let codeSign = SettingsDictionary()
        .codeSignIdentityAppleDevelopment() // Signing & Capabilities -> Signing Certificate
        .automaticCodeSigning(devTeam: "") // Signing & Capabilities -> Team
    
}

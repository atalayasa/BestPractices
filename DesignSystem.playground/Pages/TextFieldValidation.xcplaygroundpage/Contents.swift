//: [Previous](@previous)

import Foundation
import UIKit.UITextField

class ValidationError: Error {
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}

protocol ValidatorConvertible {
    func validated(_ value: String) throws -> String
}

enum ValidatorType {
    case password
    case username
}

enum VaildatorFactory {
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .password: return PasswordValidator()
        case .username: return UserNameValidator()
        }
    }
}

struct UserNameValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        guard value.count >= 1 else {
            throw ValidationError("Kullanıcı adı alanı boş olmamalıdır." )
        }
        guard value.count < 9 else {
            throw ValidationError("Kullanıcı adı en fazla 8 karakter olmalıdır." )
        }
        
        do {
            if try NSRegularExpression(pattern: "^[a-z]{1,18}$",  options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Kullanıcı adı yanlış, boşluk, sayı ya da özel karakter içermemeli")
                
            }
        } catch {
            throw ValidationError("Kullanıcı adı yanlış, boşluk, sayı ya da özel karakter içermemeli")
        }
        return value
    }
}

struct PasswordValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError("Şifre alanı girilmelidir.")}
        guard value.count <= 8 else { throw ValidationError("Şifre alanı en fazla 8 karakter olmalıdır.") }
        do {
            if try NSRegularExpression(pattern: "^[0-9]{1,10}$",  options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Şifre alanı sadece numerik değer içermelidir.")
            }
        } catch {
            throw ValidationError("Şifre alanı sadece numerik değer içermelidir.")
        }
        return value
    }
}

extension String {
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = VaildatorFactory.validatorFor(type: validationType)
        return try validator.validated(self)
    }
}

do {
     let username = try usernameField.validatedText(validationType: .username)
     let password = try passwordField.validatedText(validationType: .password)
} catch {
    print("error")
}

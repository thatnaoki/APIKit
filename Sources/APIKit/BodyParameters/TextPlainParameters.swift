import Foundation

/// `TextPlainParameters` serializes plain text for HTTP body and states its content type is plain text.
public struct TextPlainParameters: BodyParameters {
   /// The plain text to be serialized.
   private let text: String

   /// Returns `TextPlainParameters` that is initialized with plain text.
   public init(text: String) {
       self.text = text
   }

   // MARK: - BodyParameters
   /// `Content-Type` to send. The value for this property will be set to `Accept` HTTP header field.
   public var contentType: String {
       "text/plain"
   }

   /// Builds `RequestBodyEntity.data` that represents plain text.
   public func buildEntity() throws -> RequestBodyEntity {
       .data(Data(self.text.utf8))
   }
}

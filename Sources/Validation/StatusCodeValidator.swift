import Foundation

public final class StatusCodeValidator<T: Sequence>: Validating where T.Iterator.Element == Int {
  private let statusCodes: T

  // MARK: - Initialization

  public init(statusCodes: T) {
    self.statusCodes = statusCodes
  }

  // MARK: - Validation

  public func validate(_ result: Response) throws {
    guard statusCodes.contains(result.response.statusCode) else {
      throw NetworkError.unacceptableStatusCode(result.response.statusCode)
    }
  }
}

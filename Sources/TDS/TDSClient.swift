import Logging
import NIO

public protocol TDSClient {
  var logger: Logger { get }
  var eventLoop: EventLoop { get }
  func send(_ request: TDSRequest, logger: Logger) -> EventLoopFuture<Void>
}

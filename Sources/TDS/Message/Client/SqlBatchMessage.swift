import Foundation
import Logging
import NIO

extension TDSMessages {
  /// `SQLBatch`
  /// https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-tds/f2026cd3-9a46-4a3f-9a08-f63140bcbbe3
  public struct RawSqlBatchMessage: TDSMessagePayload {
    public static let packetType: TDSPacket.HeaderType = .sqlBatch

    var sqlText: String

    public func serialize(into buffer: inout ByteBuffer) throws {
      TDSMessage.serializeAllHeaders(&buffer)
      buffer.writeUTF16String(sqlText)
      return
    }
  }
}

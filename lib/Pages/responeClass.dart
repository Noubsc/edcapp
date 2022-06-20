class QueryMsisdn {
  final bool error;
  final String msisdn;
  final String wallet_ids;
  final String username;
  final String message;

  const QueryMsisdn(
      {required this.error,
      required this.msisdn,
      required this.username,
      required this.wallet_ids,
      required this.message});

  factory QueryMsisdn.fromJson(Map<String, dynamic> json) {
    return QueryMsisdn(
      error: json['error'],
      msisdn: json['msisdn'],
      wallet_ids: json['wallet_ids'],
      username: json['username'],
      message: json['message'],
    );
  }
}

class ReqGenQr {
  final bool error;
  final String qrcodeStr;
  final String message;

  const ReqGenQr(
      {required this.error, required this.qrcodeStr, required this.message});

  factory ReqGenQr.fromJson(Map<String, dynamic> json) {
    return ReqGenQr(
      error: json['error'],
      qrcodeStr: json['qrcodeStr'],
      message: json['message'],
    );
  }
}

import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_websocket_example/model/user-data-profile.entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'logging.service.dart';

enum Status { loading, error, success }

class DataServiceV1 extends GetxService {
  WebSocketChannel _channel;

  final _logger = LoggingService().logger;
  final Rx<UserDataProfile> _userDataProfile = UserDataProfile().obs;

  final ObserverList<Function> _listeners = new ObserverList<Function>();
  final LinkedHashSet _listenerSet = new LinkedHashSet();

  Rx<UserDataProfile> fetchUserDataProfile() {
    Function _fetchUserDataProfileCallback = (Map<String, dynamic> _messageEventMap, String _uuid) {
      if (_messageEventMap['event'] == '/identity/$_uuid') {
        _userDataProfile(UserDataProfile.fromJson(_messageEventMap['data']));
        _logger.d('---------------userProfile.1: ${_userDataProfile.value.uuid}');
      }
    };

    String uuid = "xyz";
    String rawJson = '{ "event": "/identity/$uuid", "data": { "uuid": "$uuid", "name": "John Doe", "email": "john.doe@acme.com" } }';

    _addListener(uuid, (messageEventMap) => _fetchUserDataProfileCallback(messageEventMap, uuid));
    _send(rawJson);

    return _userDataProfile;
  }

  _connect() async {
    final _wsUrl = 'wss://echo.websocket.org';
    if (_channel == null) {
      _logger.d('Connecting ...');
      _channel = WebSocketChannel.connect(Uri.parse(_wsUrl));
      _channel.stream.where((event) => event != null).map((event) => jsonDecode(event) as Map<String, dynamic>).where((eventMap) => eventMap['data'] != '404').listen(_onMessage);
    }
  }

  _send(String message) {
    if (_channel != null) {
      if (_channel.sink != null) {
        _channel.sink.add(message);
      }
    }
  }

  // ---------------------------------------------------------
  /// Adds a callback to be invoked in case of incoming
  /// notification
  /// ---------------------------------------------------------
  _addListener(String id, Function callback) {
    if (!_listenerSet.contains(id)) _listeners.add(callback);
    _listenerSet.add(id);
  }

  /// ----------------------------------------------------------
  /// Callback which is invoked each time that we are receiving
  /// a message from the server
  /// ----------------------------------------------------------
  _onMessage(message) {
    _listeners.forEach((Function callback) {
      callback(message);
    });
  }

  @override
  void onInit() {
    super.onInit();
    _connect();
  }
}

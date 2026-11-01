// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionSnapshot {

/// Player identity.
 PlayerId get playerId;/// Session identity.
 SessionId get sessionId;/// Current generation identity.
 GenerationId get generationId;/// Current source identity.
 SourceId? get sourceId;/// Current session state.
 SessionState get state;/// Current playback position.
 Duration get position;/// Total media duration.
 Duration? get duration;/// Whether media is currently buffering.
 bool get buffering;/// Whether playback has encountered an error.
 bool get hasError;/// Error description, when available.
 String? get errorMessage;/// Time at which this snapshot was created.
 DateTime get timestamp;
/// Create a copy of SessionSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionSnapshotCopyWith<SessionSnapshot> get copyWith => _$SessionSnapshotCopyWithImpl<SessionSnapshot>(this as SessionSnapshot, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SessionSnapshot;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionSnapshot&&(identical(other.playerId, _this.playerId) || other.playerId == _this.playerId)&&(identical(other.sessionId, _this.sessionId) || other.sessionId == _this.sessionId)&&(identical(other.generationId, _this.generationId) || other.generationId == _this.generationId)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId)&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.position, _this.position) || other.position == _this.position)&&(identical(other.duration, _this.duration) || other.duration == _this.duration)&&(identical(other.buffering, _this.buffering) || other.buffering == _this.buffering)&&(identical(other.hasError, _this.hasError) || other.hasError == _this.hasError)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp));
}


@override
int get hashCode {
  final _this = this as SessionSnapshot;
  return Object.hash(runtimeType,_this.playerId,_this.sessionId,_this.generationId,_this.sourceId,_this.state,_this.position,_this.duration,_this.buffering,_this.hasError,_this.errorMessage,_this.timestamp);
}

@override
String toString() {
  final _this = this as SessionSnapshot;
  return 'SessionSnapshot(playerId: ${_this.playerId}, sessionId: ${_this.sessionId}, generationId: ${_this.generationId}, sourceId: ${_this.sourceId}, state: ${_this.state}, position: ${_this.position}, duration: ${_this.duration}, buffering: ${_this.buffering}, hasError: ${_this.hasError}, errorMessage: ${_this.errorMessage}, timestamp: ${_this.timestamp})';
}


}

/// @nodoc
abstract mixin class $SessionSnapshotCopyWith<$Res>  {
  factory $SessionSnapshotCopyWith(SessionSnapshot value, $Res Function(SessionSnapshot) _then) = _$SessionSnapshotCopyWithImpl;
@useResult
$Res call({
 PlayerId playerId, SessionId sessionId, GenerationId generationId, SourceId? sourceId, SessionState state, Duration position, Duration? duration, bool buffering, bool hasError, String? errorMessage, DateTime timestamp
});




}
/// @nodoc
class _$SessionSnapshotCopyWithImpl<$Res>
    implements $SessionSnapshotCopyWith<$Res> {
  _$SessionSnapshotCopyWithImpl(this._self, this._then);

  final SessionSnapshot _self;
  final $Res Function(SessionSnapshot) _then;

/// Create a copy of SessionSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerId = null,Object? sessionId = null,Object? generationId = null,Object? sourceId = freezed,Object? state = null,Object? position = null,Object? duration = freezed,Object? buffering = null,Object? hasError = null,Object? errorMessage = freezed,Object? timestamp = null,}) {
  return _then(SessionSnapshot(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as PlayerId,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as SessionId,generationId: null == generationId ? _self.generationId : generationId // ignore: cast_nullable_to_non_nullable
as GenerationId,sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as SourceId?,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as SessionState,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,buffering: null == buffering ? _self.buffering : buffering // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionSnapshot].
extension SessionSnapshotPatterns on SessionSnapshot {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionSnapshot() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _SessionSnapshot():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _SessionSnapshot() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlayerId playerId,  SessionId sessionId,  GenerationId generationId,  SourceId? sourceId,  SessionState state,  Duration position,  Duration? duration,  bool buffering,  bool hasError,  String? errorMessage,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionSnapshot() when $default != null:
return $default(_that.playerId,_that.sessionId,_that.generationId,_that.sourceId,_that.state,_that.position,_that.duration,_that.buffering,_that.hasError,_that.errorMessage,_that.timestamp);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlayerId playerId,  SessionId sessionId,  GenerationId generationId,  SourceId? sourceId,  SessionState state,  Duration position,  Duration? duration,  bool buffering,  bool hasError,  String? errorMessage,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _SessionSnapshot():
return $default(_that.playerId,_that.sessionId,_that.generationId,_that.sourceId,_that.state,_that.position,_that.duration,_that.buffering,_that.hasError,_that.errorMessage,_that.timestamp);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlayerId playerId,  SessionId sessionId,  GenerationId generationId,  SourceId? sourceId,  SessionState state,  Duration position,  Duration? duration,  bool buffering,  bool hasError,  String? errorMessage,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _SessionSnapshot() when $default != null:
return $default(_that.playerId,_that.sessionId,_that.generationId,_that.sourceId,_that.state,_that.position,_that.duration,_that.buffering,_that.hasError,_that.errorMessage,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc


class _SessionSnapshot implements SessionSnapshot {
  const _SessionSnapshot({required this.playerId, required this.sessionId, required this.generationId, this.sourceId, this.state = const SessionState.idle(), this.position = Duration.zero, this.duration, this.buffering = false, this.hasError = false, this.errorMessage, required this.timestamp});
  

/// Player identity.
@override final  PlayerId playerId;
/// Session identity.
@override final  SessionId sessionId;
/// Current generation identity.
@override final  GenerationId generationId;
/// Current source identity.
@override final  SourceId? sourceId;
/// Current session state.
@override@JsonKey() final  SessionState state;
/// Current playback position.
@override@JsonKey() final  Duration position;
/// Total media duration.
@override final  Duration? duration;
/// Whether media is currently buffering.
@override@JsonKey() final  bool buffering;
/// Whether playback has encountered an error.
@override@JsonKey() final  bool hasError;
/// Error description, when available.
@override final  String? errorMessage;
/// Time at which this snapshot was created.
@override final  DateTime timestamp;

/// Create a copy of SessionSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionSnapshotCopyWith<_SessionSnapshot> get copyWith => __$SessionSnapshotCopyWithImpl<_SessionSnapshot>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionSnapshot&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.generationId, generationId) || other.generationId == generationId)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.state, state) || other.state == state)&&(identical(other.position, position) || other.position == position)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.buffering, buffering) || other.buffering == buffering)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode {
    return Object.hash(runtimeType,playerId,sessionId,generationId,sourceId,state,position,duration,buffering,hasError,errorMessage,timestamp);
}

@override
String toString() {
    return 'SessionSnapshot(playerId: $playerId, sessionId: $sessionId, generationId: $generationId, sourceId: $sourceId, state: $state, position: $position, duration: $duration, buffering: $buffering, hasError: $hasError, errorMessage: $errorMessage, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$SessionSnapshotCopyWith<$Res> implements $SessionSnapshotCopyWith<$Res> {
  factory _$SessionSnapshotCopyWith(_SessionSnapshot value, $Res Function(_SessionSnapshot) _then) = __$SessionSnapshotCopyWithImpl;
@override @useResult
$Res call({
 PlayerId playerId, SessionId sessionId, GenerationId generationId, SourceId? sourceId, SessionState state, Duration position, Duration? duration, bool buffering, bool hasError, String? errorMessage, DateTime timestamp
});




}
/// @nodoc
class __$SessionSnapshotCopyWithImpl<$Res>
    implements _$SessionSnapshotCopyWith<$Res> {
  __$SessionSnapshotCopyWithImpl(this._self, this._then);

  final _SessionSnapshot _self;
  final $Res Function(_SessionSnapshot) _then;

/// Create a copy of SessionSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerId = null,Object? sessionId = null,Object? generationId = null,Object? sourceId = freezed,Object? state = null,Object? position = null,Object? duration = freezed,Object? buffering = null,Object? hasError = null,Object? errorMessage = freezed,Object? timestamp = null,}) {
  return _then(_SessionSnapshot(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as PlayerId,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as SessionId,generationId: null == generationId ? _self.generationId : generationId // ignore: cast_nullable_to_non_nullable
as GenerationId,sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as SourceId?,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as SessionState,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,buffering: null == buffering ? _self.buffering : buffering // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

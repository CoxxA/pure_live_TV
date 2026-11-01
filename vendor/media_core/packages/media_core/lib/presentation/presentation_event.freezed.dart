// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presentation_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PresentationEvent {

/// Request lifecycle generation.
///
/// Used to ignore stale callbacks.
 int get generation;/// Original request id.
///
/// Useful when multiple async
/// operations exist.
 String? get requestId;/// Event source.
///
/// Examples:
///
/// - android
/// - ios
/// - windows
/// - user
/// - lifecycle
 String? get source;
/// Create a copy of PresentationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresentationEventCopyWith<PresentationEvent> get copyWith => _$PresentationEventCopyWithImpl<PresentationEvent>(this as PresentationEvent, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PresentationEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresentationEvent&&(identical(other.generation, _this.generation) || other.generation == _this.generation)&&(identical(other.requestId, _this.requestId) || other.requestId == _this.requestId)&&(identical(other.source, _this.source) || other.source == _this.source));
}


@override
int get hashCode {
  final _this = this as PresentationEvent;
  return Object.hash(runtimeType,_this.generation,_this.requestId,_this.source);
}

@override
String toString() {
  final _this = this as PresentationEvent;
  return 'PresentationEvent(generation: ${_this.generation}, requestId: ${_this.requestId}, source: ${_this.source})';
}


}

/// @nodoc
abstract mixin class $PresentationEventCopyWith<$Res>  {
  factory $PresentationEventCopyWith(PresentationEvent value, $Res Function(PresentationEvent) _then) = _$PresentationEventCopyWithImpl;
@useResult
$Res call({
 int generation, String? requestId, String? source
});




}
/// @nodoc
class _$PresentationEventCopyWithImpl<$Res>
    implements $PresentationEventCopyWith<$Res> {
  _$PresentationEventCopyWithImpl(this._self, this._then);

  final PresentationEvent _self;
  final $Res Function(PresentationEvent) _then;

/// Create a copy of PresentationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? generation = null,Object? requestId = freezed,Object? source = freezed,}) {
  return _then(_self.copyWith(
generation: null == generation ? _self.generation : generation // ignore: cast_nullable_to_non_nullable
as int,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PresentationEvent].
extension PresentationEventPatterns on PresentationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PresentationStarted value)?  started,TResult Function( PresentationCompleted value)?  completed,TResult Function( PresentationFailed value)?  failed,TResult Function( PresentationChanged value)?  changed,TResult Function( PresentationDisposed value)?  disposed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PresentationStarted() when started != null:
return started(_that);case PresentationCompleted() when completed != null:
return completed(_that);case PresentationFailed() when failed != null:
return failed(_that);case PresentationChanged() when changed != null:
return changed(_that);case PresentationDisposed() when disposed != null:
return disposed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PresentationStarted value)  started,required TResult Function( PresentationCompleted value)  completed,required TResult Function( PresentationFailed value)  failed,required TResult Function( PresentationChanged value)  changed,required TResult Function( PresentationDisposed value)  disposed,}){
final _that = this;
switch (_that) {
case PresentationStarted():
return started(_that);case PresentationCompleted():
return completed(_that);case PresentationFailed():
return failed(_that);case PresentationChanged():
return changed(_that);case PresentationDisposed():
return disposed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PresentationStarted value)?  started,TResult? Function( PresentationCompleted value)?  completed,TResult? Function( PresentationFailed value)?  failed,TResult? Function( PresentationChanged value)?  changed,TResult? Function( PresentationDisposed value)?  disposed,}){
final _that = this;
switch (_that) {
case PresentationStarted() when started != null:
return started(_that);case PresentationCompleted() when completed != null:
return completed(_that);case PresentationFailed() when failed != null:
return failed(_that);case PresentationChanged() when changed != null:
return changed(_that);case PresentationDisposed() when disposed != null:
return disposed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( PresentationMode mode,  int generation,  String? requestId,  String? source)?  started,TResult Function( PresentationMode mode,  int generation,  String? requestId,  String? source)?  completed,TResult Function( PresentationMode? mode,  String error,  int generation,  String? requestId,  String? source)?  failed,TResult Function( PresentationMode mode,  int generation,  String? requestId,  String? source)?  changed,TResult Function( int generation,  String? requestId,  String? source)?  disposed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PresentationStarted() when started != null:
return started(_that.mode,_that.generation,_that.requestId,_that.source);case PresentationCompleted() when completed != null:
return completed(_that.mode,_that.generation,_that.requestId,_that.source);case PresentationFailed() when failed != null:
return failed(_that.mode,_that.error,_that.generation,_that.requestId,_that.source);case PresentationChanged() when changed != null:
return changed(_that.mode,_that.generation,_that.requestId,_that.source);case PresentationDisposed() when disposed != null:
return disposed(_that.generation,_that.requestId,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( PresentationMode mode,  int generation,  String? requestId,  String? source)  started,required TResult Function( PresentationMode mode,  int generation,  String? requestId,  String? source)  completed,required TResult Function( PresentationMode? mode,  String error,  int generation,  String? requestId,  String? source)  failed,required TResult Function( PresentationMode mode,  int generation,  String? requestId,  String? source)  changed,required TResult Function( int generation,  String? requestId,  String? source)  disposed,}) {final _that = this;
switch (_that) {
case PresentationStarted():
return started(_that.mode,_that.generation,_that.requestId,_that.source);case PresentationCompleted():
return completed(_that.mode,_that.generation,_that.requestId,_that.source);case PresentationFailed():
return failed(_that.mode,_that.error,_that.generation,_that.requestId,_that.source);case PresentationChanged():
return changed(_that.mode,_that.generation,_that.requestId,_that.source);case PresentationDisposed():
return disposed(_that.generation,_that.requestId,_that.source);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( PresentationMode mode,  int generation,  String? requestId,  String? source)?  started,TResult? Function( PresentationMode mode,  int generation,  String? requestId,  String? source)?  completed,TResult? Function( PresentationMode? mode,  String error,  int generation,  String? requestId,  String? source)?  failed,TResult? Function( PresentationMode mode,  int generation,  String? requestId,  String? source)?  changed,TResult? Function( int generation,  String? requestId,  String? source)?  disposed,}) {final _that = this;
switch (_that) {
case PresentationStarted() when started != null:
return started(_that.mode,_that.generation,_that.requestId,_that.source);case PresentationCompleted() when completed != null:
return completed(_that.mode,_that.generation,_that.requestId,_that.source);case PresentationFailed() when failed != null:
return failed(_that.mode,_that.error,_that.generation,_that.requestId,_that.source);case PresentationChanged() when changed != null:
return changed(_that.mode,_that.generation,_that.requestId,_that.source);case PresentationDisposed() when disposed != null:
return disposed(_that.generation,_that.requestId,_that.source);case _:
  return null;

}
}

}

/// @nodoc


class PresentationStarted extends PresentationEvent {
  const PresentationStarted({required this.mode, this.generation = 0, this.requestId, this.source}): super._();
  

/// Target presentation mode.
 final  PresentationMode mode;
/// Request lifecycle generation.
///
/// Used to ignore stale callbacks.
@override@JsonKey() final  int generation;
/// Original request id.
///
/// Useful when multiple async
/// operations exist.
@override final  String? requestId;
/// Event source.
///
/// Examples:
///
/// - android
/// - ios
/// - windows
/// - user
/// - lifecycle
@override final  String? source;

/// Create a copy of PresentationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresentationStartedCopyWith<PresentationStarted> get copyWith => _$PresentationStartedCopyWithImpl<PresentationStarted>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PresentationStarted&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.generation, generation) || other.generation == generation)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode,generation,requestId,source);
}

@override
String toString() {
    return 'PresentationEvent.started(mode: $mode, generation: $generation, requestId: $requestId, source: $source)';
}


}

/// @nodoc
abstract mixin class $PresentationStartedCopyWith<$Res> implements $PresentationEventCopyWith<$Res> {
  factory $PresentationStartedCopyWith(PresentationStarted value, $Res Function(PresentationStarted) _then) = _$PresentationStartedCopyWithImpl;
@override @useResult
$Res call({
 PresentationMode mode, int generation, String? requestId, String? source
});




}
/// @nodoc
class _$PresentationStartedCopyWithImpl<$Res>
    implements $PresentationStartedCopyWith<$Res> {
  _$PresentationStartedCopyWithImpl(this._self, this._then);

  final PresentationStarted _self;
  final $Res Function(PresentationStarted) _then;

/// Create a copy of PresentationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? generation = null,Object? requestId = freezed,Object? source = freezed,}) {
  return _then(PresentationStarted(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as PresentationMode,generation: null == generation ? _self.generation : generation // ignore: cast_nullable_to_non_nullable
as int,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class PresentationCompleted extends PresentationEvent {
  const PresentationCompleted({required this.mode, this.generation = 0, this.requestId, this.source}): super._();
  

/// Actual active presentation mode.
 final  PresentationMode mode;
/// Request generation.
@override@JsonKey() final  int generation;
/// Request identifier.
@override final  String? requestId;
/// Event source.
@override final  String? source;

/// Create a copy of PresentationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresentationCompletedCopyWith<PresentationCompleted> get copyWith => _$PresentationCompletedCopyWithImpl<PresentationCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PresentationCompleted&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.generation, generation) || other.generation == generation)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode,generation,requestId,source);
}

@override
String toString() {
    return 'PresentationEvent.completed(mode: $mode, generation: $generation, requestId: $requestId, source: $source)';
}


}

/// @nodoc
abstract mixin class $PresentationCompletedCopyWith<$Res> implements $PresentationEventCopyWith<$Res> {
  factory $PresentationCompletedCopyWith(PresentationCompleted value, $Res Function(PresentationCompleted) _then) = _$PresentationCompletedCopyWithImpl;
@override @useResult
$Res call({
 PresentationMode mode, int generation, String? requestId, String? source
});




}
/// @nodoc
class _$PresentationCompletedCopyWithImpl<$Res>
    implements $PresentationCompletedCopyWith<$Res> {
  _$PresentationCompletedCopyWithImpl(this._self, this._then);

  final PresentationCompleted _self;
  final $Res Function(PresentationCompleted) _then;

/// Create a copy of PresentationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? generation = null,Object? requestId = freezed,Object? source = freezed,}) {
  return _then(PresentationCompleted(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as PresentationMode,generation: null == generation ? _self.generation : generation // ignore: cast_nullable_to_non_nullable
as int,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class PresentationFailed extends PresentationEvent {
  const PresentationFailed({this.mode, required this.error, this.generation = 0, this.requestId, this.source}): super._();
  

/// Target mode if known.
 final  PresentationMode? mode;
/// Error message.
 final  String error;
/// Request generation.
@override@JsonKey() final  int generation;
/// Request identifier.
@override final  String? requestId;
/// Event source.
@override final  String? source;

/// Create a copy of PresentationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresentationFailedCopyWith<PresentationFailed> get copyWith => _$PresentationFailedCopyWithImpl<PresentationFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PresentationFailed&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.error, error) || other.error == error)&&(identical(other.generation, generation) || other.generation == generation)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode,error,generation,requestId,source);
}

@override
String toString() {
    return 'PresentationEvent.failed(mode: $mode, error: $error, generation: $generation, requestId: $requestId, source: $source)';
}


}

/// @nodoc
abstract mixin class $PresentationFailedCopyWith<$Res> implements $PresentationEventCopyWith<$Res> {
  factory $PresentationFailedCopyWith(PresentationFailed value, $Res Function(PresentationFailed) _then) = _$PresentationFailedCopyWithImpl;
@override @useResult
$Res call({
 PresentationMode? mode, String error, int generation, String? requestId, String? source
});




}
/// @nodoc
class _$PresentationFailedCopyWithImpl<$Res>
    implements $PresentationFailedCopyWith<$Res> {
  _$PresentationFailedCopyWithImpl(this._self, this._then);

  final PresentationFailed _self;
  final $Res Function(PresentationFailed) _then;

/// Create a copy of PresentationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = freezed,Object? error = null,Object? generation = null,Object? requestId = freezed,Object? source = freezed,}) {
  return _then(PresentationFailed(
mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as PresentationMode?,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,generation: null == generation ? _self.generation : generation // ignore: cast_nullable_to_non_nullable
as int,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class PresentationChanged extends PresentationEvent {
  const PresentationChanged({required this.mode, this.generation = 0, this.requestId, this.source}): super._();
  

/// Actual mode reported by platform.
 final  PresentationMode mode;
/// Event generation.
@override@JsonKey() final  int generation;
/// Request identifier.
@override final  String? requestId;
/// Event source.
@override final  String? source;

/// Create a copy of PresentationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresentationChangedCopyWith<PresentationChanged> get copyWith => _$PresentationChangedCopyWithImpl<PresentationChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PresentationChanged&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.generation, generation) || other.generation == generation)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode,generation,requestId,source);
}

@override
String toString() {
    return 'PresentationEvent.changed(mode: $mode, generation: $generation, requestId: $requestId, source: $source)';
}


}

/// @nodoc
abstract mixin class $PresentationChangedCopyWith<$Res> implements $PresentationEventCopyWith<$Res> {
  factory $PresentationChangedCopyWith(PresentationChanged value, $Res Function(PresentationChanged) _then) = _$PresentationChangedCopyWithImpl;
@override @useResult
$Res call({
 PresentationMode mode, int generation, String? requestId, String? source
});




}
/// @nodoc
class _$PresentationChangedCopyWithImpl<$Res>
    implements $PresentationChangedCopyWith<$Res> {
  _$PresentationChangedCopyWithImpl(this._self, this._then);

  final PresentationChanged _self;
  final $Res Function(PresentationChanged) _then;

/// Create a copy of PresentationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? generation = null,Object? requestId = freezed,Object? source = freezed,}) {
  return _then(PresentationChanged(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as PresentationMode,generation: null == generation ? _self.generation : generation // ignore: cast_nullable_to_non_nullable
as int,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class PresentationDisposed extends PresentationEvent {
  const PresentationDisposed({this.generation = 0, this.requestId, this.source}): super._();
  

/// Lifecycle generation.
@override@JsonKey() final  int generation;
/// Request identifier.
@override final  String? requestId;
/// Event source.
@override final  String? source;

/// Create a copy of PresentationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresentationDisposedCopyWith<PresentationDisposed> get copyWith => _$PresentationDisposedCopyWithImpl<PresentationDisposed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PresentationDisposed&&(identical(other.generation, generation) || other.generation == generation)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode {
    return Object.hash(runtimeType,generation,requestId,source);
}

@override
String toString() {
    return 'PresentationEvent.disposed(generation: $generation, requestId: $requestId, source: $source)';
}


}

/// @nodoc
abstract mixin class $PresentationDisposedCopyWith<$Res> implements $PresentationEventCopyWith<$Res> {
  factory $PresentationDisposedCopyWith(PresentationDisposed value, $Res Function(PresentationDisposed) _then) = _$PresentationDisposedCopyWithImpl;
@override @useResult
$Res call({
 int generation, String? requestId, String? source
});




}
/// @nodoc
class _$PresentationDisposedCopyWithImpl<$Res>
    implements $PresentationDisposedCopyWith<$Res> {
  _$PresentationDisposedCopyWithImpl(this._self, this._then);

  final PresentationDisposed _self;
  final $Res Function(PresentationDisposed) _then;

/// Create a copy of PresentationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? generation = null,Object? requestId = freezed,Object? source = freezed,}) {
  return _then(PresentationDisposed(
generation: null == generation ? _self.generation : generation // ignore: cast_nullable_to_non_nullable
as int,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presentation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PresentationState {

/// Current active presentation mode.
///
/// This represents the mode that has successfully
/// completed.
///
/// During a transition, this value remains unchanged
/// until the transition is completed.
 PresentationMode get mode;/// Target presentation mode.
///
/// This is non-null while a transition is being
/// processed.
///
/// Example:
///
/// ```text
/// mode:
///   normal
///
/// targetMode:
///   fullscreen
///
/// transitioning:
///   true
/// ```
 PresentationMode? get targetMode;/// Presentation capabilities reported by the
/// current environment.
///
/// Capabilities describe what the environment supports.
/// They do not describe the current presentation mode.
 PresentationCapabilities get capabilities;/// Orientation of the media currently being presented.
///
/// Both fullscreen variants present differently per orientation — a
/// portrait video filling a portrait phone, a landscape video taking over
/// the screen, a portrait video letterboxed on a desktop monitor — so the
/// orientation belongs to the presentation state rather than to one
/// platform's driver. Drivers and hosts read it to pick a layout strategy;
/// nothing here decides that strategy for them.
 VideoOrientation get orientation;/// Whether a presentation transition is currently
/// running.
 bool get transitioning;/// Whether the presentation subsystem is enabled.
///
/// This represents application-level availability of
/// presentation functionality.
 bool get enabled;/// Whether presentation is currently available.
///
/// This can become false when the presentation subsystem
/// cannot currently perform presentation operations.
///
/// Examples:
///
/// - player has been disposed
/// - required platform resource is unavailable
/// - presentation lifecycle has ended
 bool get available;/// Lifecycle generation.
///
/// Used to distinguish newer presentation operations
/// from stale asynchronous callbacks.
///
/// The controller owns generation changes.
///
/// The reducer uses generation to prevent an older
/// asynchronous event from overwriting newer state.
 int get generation;/// Last presentation error.
///
/// A null value means that the current state does not
/// contain a presentation error.
 String? get error;
/// Create a copy of PresentationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresentationStateCopyWith<PresentationState> get copyWith => _$PresentationStateCopyWithImpl<PresentationState>(this as PresentationState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PresentationState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresentationState&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.targetMode, _this.targetMode) || other.targetMode == _this.targetMode)&&(identical(other.capabilities, _this.capabilities) || other.capabilities == _this.capabilities)&&(identical(other.orientation, _this.orientation) || other.orientation == _this.orientation)&&(identical(other.transitioning, _this.transitioning) || other.transitioning == _this.transitioning)&&(identical(other.enabled, _this.enabled) || other.enabled == _this.enabled)&&(identical(other.available, _this.available) || other.available == _this.available)&&(identical(other.generation, _this.generation) || other.generation == _this.generation)&&(identical(other.error, _this.error) || other.error == _this.error));
}


@override
int get hashCode {
  final _this = this as PresentationState;
  return Object.hash(runtimeType,_this.mode,_this.targetMode,_this.capabilities,_this.orientation,_this.transitioning,_this.enabled,_this.available,_this.generation,_this.error);
}

@override
String toString() {
  final _this = this as PresentationState;
  return 'PresentationState(mode: ${_this.mode}, targetMode: ${_this.targetMode}, capabilities: ${_this.capabilities}, orientation: ${_this.orientation}, transitioning: ${_this.transitioning}, enabled: ${_this.enabled}, available: ${_this.available}, generation: ${_this.generation}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $PresentationStateCopyWith<$Res>  {
  factory $PresentationStateCopyWith(PresentationState value, $Res Function(PresentationState) _then) = _$PresentationStateCopyWithImpl;
@useResult
$Res call({
 PresentationMode mode, PresentationMode? targetMode, PresentationCapabilities capabilities, VideoOrientation orientation, bool transitioning, bool enabled, bool available, int generation, String? error
});


$PresentationCapabilitiesCopyWith<$Res> get capabilities;

}
/// @nodoc
class _$PresentationStateCopyWithImpl<$Res>
    implements $PresentationStateCopyWith<$Res> {
  _$PresentationStateCopyWithImpl(this._self, this._then);

  final PresentationState _self;
  final $Res Function(PresentationState) _then;

/// Create a copy of PresentationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? targetMode = freezed,Object? capabilities = null,Object? orientation = null,Object? transitioning = null,Object? enabled = null,Object? available = null,Object? generation = null,Object? error = freezed,}) {
  return _then(PresentationState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as PresentationMode,targetMode: freezed == targetMode ? _self.targetMode : targetMode // ignore: cast_nullable_to_non_nullable
as PresentationMode?,capabilities: null == capabilities ? _self.capabilities : capabilities // ignore: cast_nullable_to_non_nullable
as PresentationCapabilities,orientation: null == orientation ? _self.orientation : orientation // ignore: cast_nullable_to_non_nullable
as VideoOrientation,transitioning: null == transitioning ? _self.transitioning : transitioning // ignore: cast_nullable_to_non_nullable
as bool,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,generation: null == generation ? _self.generation : generation // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PresentationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PresentationCapabilitiesCopyWith<$Res> get capabilities {
  
  return $PresentationCapabilitiesCopyWith<$Res>(_self.capabilities, (value) {
    return _then(_self.copyWith(capabilities: value));
  });
}
}


/// Adds pattern-matching-related methods to [PresentationState].
extension PresentationStatePatterns on PresentationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresentationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresentationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresentationState value)  $default,){
final _that = this;
switch (_that) {
case _PresentationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresentationState value)?  $default,){
final _that = this;
switch (_that) {
case _PresentationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PresentationMode mode,  PresentationMode? targetMode,  PresentationCapabilities capabilities,  VideoOrientation orientation,  bool transitioning,  bool enabled,  bool available,  int generation,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresentationState() when $default != null:
return $default(_that.mode,_that.targetMode,_that.capabilities,_that.orientation,_that.transitioning,_that.enabled,_that.available,_that.generation,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PresentationMode mode,  PresentationMode? targetMode,  PresentationCapabilities capabilities,  VideoOrientation orientation,  bool transitioning,  bool enabled,  bool available,  int generation,  String? error)  $default,) {final _that = this;
switch (_that) {
case _PresentationState():
return $default(_that.mode,_that.targetMode,_that.capabilities,_that.orientation,_that.transitioning,_that.enabled,_that.available,_that.generation,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PresentationMode mode,  PresentationMode? targetMode,  PresentationCapabilities capabilities,  VideoOrientation orientation,  bool transitioning,  bool enabled,  bool available,  int generation,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _PresentationState() when $default != null:
return $default(_that.mode,_that.targetMode,_that.capabilities,_that.orientation,_that.transitioning,_that.enabled,_that.available,_that.generation,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PresentationState extends PresentationState {
  const _PresentationState({this.mode = PresentationMode.normal, this.targetMode, this.capabilities = const PresentationCapabilities(), this.orientation = VideoOrientation.unknown, this.transitioning = false, this.enabled = true, this.available = true, this.generation = 0, this.error}): super._();
  

/// Current active presentation mode.
///
/// This represents the mode that has successfully
/// completed.
///
/// During a transition, this value remains unchanged
/// until the transition is completed.
@override@JsonKey() final  PresentationMode mode;
/// Target presentation mode.
///
/// This is non-null while a transition is being
/// processed.
///
/// Example:
///
/// ```text
/// mode:
///   normal
///
/// targetMode:
///   fullscreen
///
/// transitioning:
///   true
/// ```
@override final  PresentationMode? targetMode;
/// Presentation capabilities reported by the
/// current environment.
///
/// Capabilities describe what the environment supports.
/// They do not describe the current presentation mode.
@override@JsonKey() final  PresentationCapabilities capabilities;
/// Orientation of the media currently being presented.
///
/// Both fullscreen variants present differently per orientation — a
/// portrait video filling a portrait phone, a landscape video taking over
/// the screen, a portrait video letterboxed on a desktop monitor — so the
/// orientation belongs to the presentation state rather than to one
/// platform's driver. Drivers and hosts read it to pick a layout strategy;
/// nothing here decides that strategy for them.
@override@JsonKey() final  VideoOrientation orientation;
/// Whether a presentation transition is currently
/// running.
@override@JsonKey() final  bool transitioning;
/// Whether the presentation subsystem is enabled.
///
/// This represents application-level availability of
/// presentation functionality.
@override@JsonKey() final  bool enabled;
/// Whether presentation is currently available.
///
/// This can become false when the presentation subsystem
/// cannot currently perform presentation operations.
///
/// Examples:
///
/// - player has been disposed
/// - required platform resource is unavailable
/// - presentation lifecycle has ended
@override@JsonKey() final  bool available;
/// Lifecycle generation.
///
/// Used to distinguish newer presentation operations
/// from stale asynchronous callbacks.
///
/// The controller owns generation changes.
///
/// The reducer uses generation to prevent an older
/// asynchronous event from overwriting newer state.
@override@JsonKey() final  int generation;
/// Last presentation error.
///
/// A null value means that the current state does not
/// contain a presentation error.
@override final  String? error;

/// Create a copy of PresentationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresentationStateCopyWith<_PresentationState> get copyWith => __$PresentationStateCopyWithImpl<_PresentationState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresentationState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.targetMode, targetMode) || other.targetMode == targetMode)&&(identical(other.capabilities, capabilities) || other.capabilities == capabilities)&&(identical(other.orientation, orientation) || other.orientation == orientation)&&(identical(other.transitioning, transitioning) || other.transitioning == transitioning)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.available, available) || other.available == available)&&(identical(other.generation, generation) || other.generation == generation)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode,targetMode,capabilities,orientation,transitioning,enabled,available,generation,error);
}

@override
String toString() {
    return 'PresentationState(mode: $mode, targetMode: $targetMode, capabilities: $capabilities, orientation: $orientation, transitioning: $transitioning, enabled: $enabled, available: $available, generation: $generation, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PresentationStateCopyWith<$Res> implements $PresentationStateCopyWith<$Res> {
  factory _$PresentationStateCopyWith(_PresentationState value, $Res Function(_PresentationState) _then) = __$PresentationStateCopyWithImpl;
@override @useResult
$Res call({
 PresentationMode mode, PresentationMode? targetMode, PresentationCapabilities capabilities, VideoOrientation orientation, bool transitioning, bool enabled, bool available, int generation, String? error
});


@override $PresentationCapabilitiesCopyWith<$Res> get capabilities;

}
/// @nodoc
class __$PresentationStateCopyWithImpl<$Res>
    implements _$PresentationStateCopyWith<$Res> {
  __$PresentationStateCopyWithImpl(this._self, this._then);

  final _PresentationState _self;
  final $Res Function(_PresentationState) _then;

/// Create a copy of PresentationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? targetMode = freezed,Object? capabilities = null,Object? orientation = null,Object? transitioning = null,Object? enabled = null,Object? available = null,Object? generation = null,Object? error = freezed,}) {
  return _then(_PresentationState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as PresentationMode,targetMode: freezed == targetMode ? _self.targetMode : targetMode // ignore: cast_nullable_to_non_nullable
as PresentationMode?,capabilities: null == capabilities ? _self.capabilities : capabilities // ignore: cast_nullable_to_non_nullable
as PresentationCapabilities,orientation: null == orientation ? _self.orientation : orientation // ignore: cast_nullable_to_non_nullable
as VideoOrientation,transitioning: null == transitioning ? _self.transitioning : transitioning // ignore: cast_nullable_to_non_nullable
as bool,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,generation: null == generation ? _self.generation : generation // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PresentationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PresentationCapabilitiesCopyWith<$Res> get capabilities {
  
  return $PresentationCapabilitiesCopyWith<$Res>(_self.capabilities, (value) {
    return _then(_self.copyWith(capabilities: value));
  });
}
}

// dart format on

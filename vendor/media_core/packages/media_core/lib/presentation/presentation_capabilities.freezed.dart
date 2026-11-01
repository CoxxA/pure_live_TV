// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presentation_capabilities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PresentationCapabilities {

/// Fullscreen support.
 bool get fullscreen;/// Window-level fullscreen support.
///
/// Separate from [fullscreen] because they are separate abilities: filling
/// the application window needs nothing from the platform, while covering
/// the screen does. A phone reports window fullscreen but not system
/// fullscreen; a desktop window reports both.
 bool get windowFullscreen;/// Picture-in-picture support.
 bool get pip;/// Floating window support.
 bool get floating;
/// Create a copy of PresentationCapabilities
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresentationCapabilitiesCopyWith<PresentationCapabilities> get copyWith => _$PresentationCapabilitiesCopyWithImpl<PresentationCapabilities>(this as PresentationCapabilities, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PresentationCapabilities;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresentationCapabilities&&(identical(other.fullscreen, _this.fullscreen) || other.fullscreen == _this.fullscreen)&&(identical(other.windowFullscreen, _this.windowFullscreen) || other.windowFullscreen == _this.windowFullscreen)&&(identical(other.pip, _this.pip) || other.pip == _this.pip)&&(identical(other.floating, _this.floating) || other.floating == _this.floating));
}


@override
int get hashCode {
  final _this = this as PresentationCapabilities;
  return Object.hash(runtimeType,_this.fullscreen,_this.windowFullscreen,_this.pip,_this.floating);
}

@override
String toString() {
  final _this = this as PresentationCapabilities;
  return 'PresentationCapabilities(fullscreen: ${_this.fullscreen}, windowFullscreen: ${_this.windowFullscreen}, pip: ${_this.pip}, floating: ${_this.floating})';
}


}

/// @nodoc
abstract mixin class $PresentationCapabilitiesCopyWith<$Res>  {
  factory $PresentationCapabilitiesCopyWith(PresentationCapabilities value, $Res Function(PresentationCapabilities) _then) = _$PresentationCapabilitiesCopyWithImpl;
@useResult
$Res call({
 bool fullscreen, bool windowFullscreen, bool pip, bool floating
});




}
/// @nodoc
class _$PresentationCapabilitiesCopyWithImpl<$Res>
    implements $PresentationCapabilitiesCopyWith<$Res> {
  _$PresentationCapabilitiesCopyWithImpl(this._self, this._then);

  final PresentationCapabilities _self;
  final $Res Function(PresentationCapabilities) _then;

/// Create a copy of PresentationCapabilities
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullscreen = null,Object? windowFullscreen = null,Object? pip = null,Object? floating = null,}) {
  return _then(PresentationCapabilities(
fullscreen: null == fullscreen ? _self.fullscreen : fullscreen // ignore: cast_nullable_to_non_nullable
as bool,windowFullscreen: null == windowFullscreen ? _self.windowFullscreen : windowFullscreen // ignore: cast_nullable_to_non_nullable
as bool,pip: null == pip ? _self.pip : pip // ignore: cast_nullable_to_non_nullable
as bool,floating: null == floating ? _self.floating : floating // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PresentationCapabilities].
extension PresentationCapabilitiesPatterns on PresentationCapabilities {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresentationCapabilities value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresentationCapabilities() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresentationCapabilities value)  $default,){
final _that = this;
switch (_that) {
case _PresentationCapabilities():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresentationCapabilities value)?  $default,){
final _that = this;
switch (_that) {
case _PresentationCapabilities() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool fullscreen,  bool windowFullscreen,  bool pip,  bool floating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresentationCapabilities() when $default != null:
return $default(_that.fullscreen,_that.windowFullscreen,_that.pip,_that.floating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool fullscreen,  bool windowFullscreen,  bool pip,  bool floating)  $default,) {final _that = this;
switch (_that) {
case _PresentationCapabilities():
return $default(_that.fullscreen,_that.windowFullscreen,_that.pip,_that.floating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool fullscreen,  bool windowFullscreen,  bool pip,  bool floating)?  $default,) {final _that = this;
switch (_that) {
case _PresentationCapabilities() when $default != null:
return $default(_that.fullscreen,_that.windowFullscreen,_that.pip,_that.floating);case _:
  return null;

}
}

}

/// @nodoc


class _PresentationCapabilities extends PresentationCapabilities {
  const _PresentationCapabilities({this.fullscreen = true, this.windowFullscreen = true, this.pip = false, this.floating = false}): super._();
  

/// Fullscreen support.
@override@JsonKey() final  bool fullscreen;
/// Window-level fullscreen support.
///
/// Separate from [fullscreen] because they are separate abilities: filling
/// the application window needs nothing from the platform, while covering
/// the screen does. A phone reports window fullscreen but not system
/// fullscreen; a desktop window reports both.
@override@JsonKey() final  bool windowFullscreen;
/// Picture-in-picture support.
@override@JsonKey() final  bool pip;
/// Floating window support.
@override@JsonKey() final  bool floating;

/// Create a copy of PresentationCapabilities
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresentationCapabilitiesCopyWith<_PresentationCapabilities> get copyWith => __$PresentationCapabilitiesCopyWithImpl<_PresentationCapabilities>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresentationCapabilities&&(identical(other.fullscreen, fullscreen) || other.fullscreen == fullscreen)&&(identical(other.windowFullscreen, windowFullscreen) || other.windowFullscreen == windowFullscreen)&&(identical(other.pip, pip) || other.pip == pip)&&(identical(other.floating, floating) || other.floating == floating));
}


@override
int get hashCode {
    return Object.hash(runtimeType,fullscreen,windowFullscreen,pip,floating);
}

@override
String toString() {
    return 'PresentationCapabilities(fullscreen: $fullscreen, windowFullscreen: $windowFullscreen, pip: $pip, floating: $floating)';
}


}

/// @nodoc
abstract mixin class _$PresentationCapabilitiesCopyWith<$Res> implements $PresentationCapabilitiesCopyWith<$Res> {
  factory _$PresentationCapabilitiesCopyWith(_PresentationCapabilities value, $Res Function(_PresentationCapabilities) _then) = __$PresentationCapabilitiesCopyWithImpl;
@override @useResult
$Res call({
 bool fullscreen, bool windowFullscreen, bool pip, bool floating
});




}
/// @nodoc
class __$PresentationCapabilitiesCopyWithImpl<$Res>
    implements _$PresentationCapabilitiesCopyWith<$Res> {
  __$PresentationCapabilitiesCopyWithImpl(this._self, this._then);

  final _PresentationCapabilities _self;
  final $Res Function(_PresentationCapabilities) _then;

/// Create a copy of PresentationCapabilities
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullscreen = null,Object? windowFullscreen = null,Object? pip = null,Object? floating = null,}) {
  return _then(_PresentationCapabilities(
fullscreen: null == fullscreen ? _self.fullscreen : fullscreen // ignore: cast_nullable_to_non_nullable
as bool,windowFullscreen: null == windowFullscreen ? _self.windowFullscreen : windowFullscreen // ignore: cast_nullable_to_non_nullable
as bool,pip: null == pip ? _self.pip : pip // ignore: cast_nullable_to_non_nullable
as bool,floating: null == floating ? _self.floating : floating // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

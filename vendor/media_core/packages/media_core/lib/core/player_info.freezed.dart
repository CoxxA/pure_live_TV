// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayerInfo {

/// Optional title of the current media.
 String? get title;/// Optional description of the current media.
 String? get description;/// Optional author, creator, or channel name.
 String? get author;/// Optional album name.
 String? get album;/// Optional artist name.
 String? get artist;/// Optional artwork URL.
 String? get artworkUrl;/// Optional thumbnail URL.
 String? get thumbnailUrl;/// Optional media duration in milliseconds.
 int? get durationMs;/// Optional width of the video.
 int? get width;/// Optional height of the video.
 int? get height;/// Optional video frame rate.
 double? get frameRate;/// Optional video bitrate in bits per second.
 int? get videoBitrate;/// Optional audio bitrate in bits per second.
 int? get audioBitrate;/// Optional container or stream format.
 String? get format;/// Optional video codec.
 String? get videoCodec;/// Optional audio codec.
 String? get audioCodec;/// Optional subtitle codec.
 String? get subtitleCodec;/// Optional language of the primary audio stream.
 String? get audioLanguage;/// Optional language of the primary subtitle stream.
 String? get subtitleLanguage;/// Optional container metadata.
 Map<String, String> get metadata;
/// Create a copy of PlayerInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerInfoCopyWith<PlayerInfo> get copyWith => _$PlayerInfoCopyWithImpl<PlayerInfo>(this as PlayerInfo, _$identity);

  /// Serializes this PlayerInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlayerInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerInfo&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.album, _this.album) || other.album == _this.album)&&(identical(other.artist, _this.artist) || other.artist == _this.artist)&&(identical(other.artworkUrl, _this.artworkUrl) || other.artworkUrl == _this.artworkUrl)&&(identical(other.thumbnailUrl, _this.thumbnailUrl) || other.thumbnailUrl == _this.thumbnailUrl)&&(identical(other.durationMs, _this.durationMs) || other.durationMs == _this.durationMs)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.frameRate, _this.frameRate) || other.frameRate == _this.frameRate)&&(identical(other.videoBitrate, _this.videoBitrate) || other.videoBitrate == _this.videoBitrate)&&(identical(other.audioBitrate, _this.audioBitrate) || other.audioBitrate == _this.audioBitrate)&&(identical(other.format, _this.format) || other.format == _this.format)&&(identical(other.videoCodec, _this.videoCodec) || other.videoCodec == _this.videoCodec)&&(identical(other.audioCodec, _this.audioCodec) || other.audioCodec == _this.audioCodec)&&(identical(other.subtitleCodec, _this.subtitleCodec) || other.subtitleCodec == _this.subtitleCodec)&&(identical(other.audioLanguage, _this.audioLanguage) || other.audioLanguage == _this.audioLanguage)&&(identical(other.subtitleLanguage, _this.subtitleLanguage) || other.subtitleLanguage == _this.subtitleLanguage)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlayerInfo;
  return Object.hashAll([runtimeType,_this.title,_this.description,_this.author,_this.album,_this.artist,_this.artworkUrl,_this.thumbnailUrl,_this.durationMs,_this.width,_this.height,_this.frameRate,_this.videoBitrate,_this.audioBitrate,_this.format,_this.videoCodec,_this.audioCodec,_this.subtitleCodec,_this.audioLanguage,_this.subtitleLanguage,const DeepCollectionEquality().hash(_this.metadata)]);
}

@override
String toString() {
  final _this = this as PlayerInfo;
  return 'PlayerInfo(title: ${_this.title}, description: ${_this.description}, author: ${_this.author}, album: ${_this.album}, artist: ${_this.artist}, artworkUrl: ${_this.artworkUrl}, thumbnailUrl: ${_this.thumbnailUrl}, durationMs: ${_this.durationMs}, width: ${_this.width}, height: ${_this.height}, frameRate: ${_this.frameRate}, videoBitrate: ${_this.videoBitrate}, audioBitrate: ${_this.audioBitrate}, format: ${_this.format}, videoCodec: ${_this.videoCodec}, audioCodec: ${_this.audioCodec}, subtitleCodec: ${_this.subtitleCodec}, audioLanguage: ${_this.audioLanguage}, subtitleLanguage: ${_this.subtitleLanguage}, metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $PlayerInfoCopyWith<$Res>  {
  factory $PlayerInfoCopyWith(PlayerInfo value, $Res Function(PlayerInfo) _then) = _$PlayerInfoCopyWithImpl;
@useResult
$Res call({
 String? title, String? description, String? author, String? album, String? artist, String? artworkUrl, String? thumbnailUrl, int? durationMs, int? width, int? height, double? frameRate, int? videoBitrate, int? audioBitrate, String? format, String? videoCodec, String? audioCodec, String? subtitleCodec, String? audioLanguage, String? subtitleLanguage, Map<String, String> metadata
});




}
/// @nodoc
class _$PlayerInfoCopyWithImpl<$Res>
    implements $PlayerInfoCopyWith<$Res> {
  _$PlayerInfoCopyWithImpl(this._self, this._then);

  final PlayerInfo _self;
  final $Res Function(PlayerInfo) _then;

/// Create a copy of PlayerInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? description = freezed,Object? author = freezed,Object? album = freezed,Object? artist = freezed,Object? artworkUrl = freezed,Object? thumbnailUrl = freezed,Object? durationMs = freezed,Object? width = freezed,Object? height = freezed,Object? frameRate = freezed,Object? videoBitrate = freezed,Object? audioBitrate = freezed,Object? format = freezed,Object? videoCodec = freezed,Object? audioCodec = freezed,Object? subtitleCodec = freezed,Object? audioLanguage = freezed,Object? subtitleLanguage = freezed,Object? metadata = null,}) {
  return _then(PlayerInfo(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,artworkUrl: freezed == artworkUrl ? _self.artworkUrl : artworkUrl // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,durationMs: freezed == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,frameRate: freezed == frameRate ? _self.frameRate : frameRate // ignore: cast_nullable_to_non_nullable
as double?,videoBitrate: freezed == videoBitrate ? _self.videoBitrate : videoBitrate // ignore: cast_nullable_to_non_nullable
as int?,audioBitrate: freezed == audioBitrate ? _self.audioBitrate : audioBitrate // ignore: cast_nullable_to_non_nullable
as int?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,videoCodec: freezed == videoCodec ? _self.videoCodec : videoCodec // ignore: cast_nullable_to_non_nullable
as String?,audioCodec: freezed == audioCodec ? _self.audioCodec : audioCodec // ignore: cast_nullable_to_non_nullable
as String?,subtitleCodec: freezed == subtitleCodec ? _self.subtitleCodec : subtitleCodec // ignore: cast_nullable_to_non_nullable
as String?,audioLanguage: freezed == audioLanguage ? _self.audioLanguage : audioLanguage // ignore: cast_nullable_to_non_nullable
as String?,subtitleLanguage: freezed == subtitleLanguage ? _self.subtitleLanguage : subtitleLanguage // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerInfo].
extension PlayerInfoPatterns on PlayerInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerInfo value)  $default,){
final _that = this;
switch (_that) {
case _PlayerInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  String? description,  String? author,  String? album,  String? artist,  String? artworkUrl,  String? thumbnailUrl,  int? durationMs,  int? width,  int? height,  double? frameRate,  int? videoBitrate,  int? audioBitrate,  String? format,  String? videoCodec,  String? audioCodec,  String? subtitleCodec,  String? audioLanguage,  String? subtitleLanguage,  Map<String, String> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerInfo() when $default != null:
return $default(_that.title,_that.description,_that.author,_that.album,_that.artist,_that.artworkUrl,_that.thumbnailUrl,_that.durationMs,_that.width,_that.height,_that.frameRate,_that.videoBitrate,_that.audioBitrate,_that.format,_that.videoCodec,_that.audioCodec,_that.subtitleCodec,_that.audioLanguage,_that.subtitleLanguage,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  String? description,  String? author,  String? album,  String? artist,  String? artworkUrl,  String? thumbnailUrl,  int? durationMs,  int? width,  int? height,  double? frameRate,  int? videoBitrate,  int? audioBitrate,  String? format,  String? videoCodec,  String? audioCodec,  String? subtitleCodec,  String? audioLanguage,  String? subtitleLanguage,  Map<String, String> metadata)  $default,) {final _that = this;
switch (_that) {
case _PlayerInfo():
return $default(_that.title,_that.description,_that.author,_that.album,_that.artist,_that.artworkUrl,_that.thumbnailUrl,_that.durationMs,_that.width,_that.height,_that.frameRate,_that.videoBitrate,_that.audioBitrate,_that.format,_that.videoCodec,_that.audioCodec,_that.subtitleCodec,_that.audioLanguage,_that.subtitleLanguage,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  String? description,  String? author,  String? album,  String? artist,  String? artworkUrl,  String? thumbnailUrl,  int? durationMs,  int? width,  int? height,  double? frameRate,  int? videoBitrate,  int? audioBitrate,  String? format,  String? videoCodec,  String? audioCodec,  String? subtitleCodec,  String? audioLanguage,  String? subtitleLanguage,  Map<String, String> metadata)?  $default,) {final _that = this;
switch (_that) {
case _PlayerInfo() when $default != null:
return $default(_that.title,_that.description,_that.author,_that.album,_that.artist,_that.artworkUrl,_that.thumbnailUrl,_that.durationMs,_that.width,_that.height,_that.frameRate,_that.videoBitrate,_that.audioBitrate,_that.format,_that.videoCodec,_that.audioCodec,_that.subtitleCodec,_that.audioLanguage,_that.subtitleLanguage,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayerInfo extends PlayerInfo {
  const _PlayerInfo({this.title, this.description, this.author, this.album, this.artist, this.artworkUrl, this.thumbnailUrl, this.durationMs, this.width, this.height, this.frameRate, this.videoBitrate, this.audioBitrate, this.format, this.videoCodec, this.audioCodec, this.subtitleCodec, this.audioLanguage, this.subtitleLanguage,  Map<String, String> metadata = const <String, String>{}}): _metadata = metadata,super._();
  factory _PlayerInfo.fromJson(Map<String, dynamic> json) => _$PlayerInfoFromJson(json);

/// Optional title of the current media.
@override final  String? title;
/// Optional description of the current media.
@override final  String? description;
/// Optional author, creator, or channel name.
@override final  String? author;
/// Optional album name.
@override final  String? album;
/// Optional artist name.
@override final  String? artist;
/// Optional artwork URL.
@override final  String? artworkUrl;
/// Optional thumbnail URL.
@override final  String? thumbnailUrl;
/// Optional media duration in milliseconds.
@override final  int? durationMs;
/// Optional width of the video.
@override final  int? width;
/// Optional height of the video.
@override final  int? height;
/// Optional video frame rate.
@override final  double? frameRate;
/// Optional video bitrate in bits per second.
@override final  int? videoBitrate;
/// Optional audio bitrate in bits per second.
@override final  int? audioBitrate;
/// Optional container or stream format.
@override final  String? format;
/// Optional video codec.
@override final  String? videoCodec;
/// Optional audio codec.
@override final  String? audioCodec;
/// Optional subtitle codec.
@override final  String? subtitleCodec;
/// Optional language of the primary audio stream.
@override final  String? audioLanguage;
/// Optional language of the primary subtitle stream.
@override final  String? subtitleLanguage;
/// Optional container metadata.
 final  Map<String, String> _metadata;
/// Optional container metadata.
@override@JsonKey() Map<String, String> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of PlayerInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerInfoCopyWith<_PlayerInfo> get copyWith => __$PlayerInfoCopyWithImpl<_PlayerInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerInfoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerInfo&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.author, author) || other.author == author)&&(identical(other.album, album) || other.album == album)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.artworkUrl, artworkUrl) || other.artworkUrl == artworkUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.durationMs, durationMs) || other.durationMs == durationMs)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.frameRate, frameRate) || other.frameRate == frameRate)&&(identical(other.videoBitrate, videoBitrate) || other.videoBitrate == videoBitrate)&&(identical(other.audioBitrate, audioBitrate) || other.audioBitrate == audioBitrate)&&(identical(other.format, format) || other.format == format)&&(identical(other.videoCodec, videoCodec) || other.videoCodec == videoCodec)&&(identical(other.audioCodec, audioCodec) || other.audioCodec == audioCodec)&&(identical(other.subtitleCodec, subtitleCodec) || other.subtitleCodec == subtitleCodec)&&(identical(other.audioLanguage, audioLanguage) || other.audioLanguage == audioLanguage)&&(identical(other.subtitleLanguage, subtitleLanguage) || other.subtitleLanguage == subtitleLanguage)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,title,description,author,album,artist,artworkUrl,thumbnailUrl,durationMs,width,height,frameRate,videoBitrate,audioBitrate,format,videoCodec,audioCodec,subtitleCodec,audioLanguage,subtitleLanguage,const DeepCollectionEquality().hash(_metadata)]);
}

@override
String toString() {
    return 'PlayerInfo(title: $title, description: $description, author: $author, album: $album, artist: $artist, artworkUrl: $artworkUrl, thumbnailUrl: $thumbnailUrl, durationMs: $durationMs, width: $width, height: $height, frameRate: $frameRate, videoBitrate: $videoBitrate, audioBitrate: $audioBitrate, format: $format, videoCodec: $videoCodec, audioCodec: $audioCodec, subtitleCodec: $subtitleCodec, audioLanguage: $audioLanguage, subtitleLanguage: $subtitleLanguage, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$PlayerInfoCopyWith<$Res> implements $PlayerInfoCopyWith<$Res> {
  factory _$PlayerInfoCopyWith(_PlayerInfo value, $Res Function(_PlayerInfo) _then) = __$PlayerInfoCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? description, String? author, String? album, String? artist, String? artworkUrl, String? thumbnailUrl, int? durationMs, int? width, int? height, double? frameRate, int? videoBitrate, int? audioBitrate, String? format, String? videoCodec, String? audioCodec, String? subtitleCodec, String? audioLanguage, String? subtitleLanguage, Map<String, String> metadata
});




}
/// @nodoc
class __$PlayerInfoCopyWithImpl<$Res>
    implements _$PlayerInfoCopyWith<$Res> {
  __$PlayerInfoCopyWithImpl(this._self, this._then);

  final _PlayerInfo _self;
  final $Res Function(_PlayerInfo) _then;

/// Create a copy of PlayerInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? description = freezed,Object? author = freezed,Object? album = freezed,Object? artist = freezed,Object? artworkUrl = freezed,Object? thumbnailUrl = freezed,Object? durationMs = freezed,Object? width = freezed,Object? height = freezed,Object? frameRate = freezed,Object? videoBitrate = freezed,Object? audioBitrate = freezed,Object? format = freezed,Object? videoCodec = freezed,Object? audioCodec = freezed,Object? subtitleCodec = freezed,Object? audioLanguage = freezed,Object? subtitleLanguage = freezed,Object? metadata = null,}) {
  return _then(_PlayerInfo(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,artworkUrl: freezed == artworkUrl ? _self.artworkUrl : artworkUrl // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,durationMs: freezed == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,frameRate: freezed == frameRate ? _self.frameRate : frameRate // ignore: cast_nullable_to_non_nullable
as double?,videoBitrate: freezed == videoBitrate ? _self.videoBitrate : videoBitrate // ignore: cast_nullable_to_non_nullable
as int?,audioBitrate: freezed == audioBitrate ? _self.audioBitrate : audioBitrate // ignore: cast_nullable_to_non_nullable
as int?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,videoCodec: freezed == videoCodec ? _self.videoCodec : videoCodec // ignore: cast_nullable_to_non_nullable
as String?,audioCodec: freezed == audioCodec ? _self.audioCodec : audioCodec // ignore: cast_nullable_to_non_nullable
as String?,subtitleCodec: freezed == subtitleCodec ? _self.subtitleCodec : subtitleCodec // ignore: cast_nullable_to_non_nullable
as String?,audioLanguage: freezed == audioLanguage ? _self.audioLanguage : audioLanguage // ignore: cast_nullable_to_non_nullable
as String?,subtitleLanguage: freezed == subtitleLanguage ? _self.subtitleLanguage : subtitleLanguage // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

// dart format on

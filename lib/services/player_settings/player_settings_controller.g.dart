// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_settings_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlayerSettingsController)
final playerSettingsControllerProvider = PlayerSettingsControllerProvider._();

final class PlayerSettingsControllerProvider
    extends $NotifierProvider<PlayerSettingsController, PlayerSettingsModel> {
  PlayerSettingsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerSettingsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerSettingsControllerHash();

  @$internal
  @override
  PlayerSettingsController create() => PlayerSettingsController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlayerSettingsModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlayerSettingsModel>(value),
    );
  }
}

String _$playerSettingsControllerHash() =>
    r'9406e3720cf93c4db7553cd982da9487e54dac1b';

abstract class _$PlayerSettingsController
    extends $Notifier<PlayerSettingsModel> {
  PlayerSettingsModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PlayerSettingsModel, PlayerSettingsModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PlayerSettingsModel, PlayerSettingsModel>,
              PlayerSettingsModel,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$viewProfileControllerHash() =>
    r'e84651291719eafb7057ea4727768bdf6aaf9a4e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ViewProfileController
    extends BuildlessAutoDisposeAsyncNotifier<ProfileModel> {
  late final String userId;

  Future<ProfileModel> build(
    String userId,
  );
}

/// See also [ViewProfileController].
@ProviderFor(ViewProfileController)
const viewProfileControllerProvider = ViewProfileControllerFamily();

/// See also [ViewProfileController].
class ViewProfileControllerFamily extends Family<AsyncValue<ProfileModel>> {
  /// See also [ViewProfileController].
  const ViewProfileControllerFamily();

  /// See also [ViewProfileController].
  ViewProfileControllerProvider call(
    String userId,
  ) {
    return ViewProfileControllerProvider(
      userId,
    );
  }

  @override
  ViewProfileControllerProvider getProviderOverride(
    covariant ViewProfileControllerProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'viewProfileControllerProvider';
}

/// See also [ViewProfileController].
class ViewProfileControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ViewProfileController,
        ProfileModel> {
  /// See also [ViewProfileController].
  ViewProfileControllerProvider(
    this.userId,
  ) : super.internal(
          () => ViewProfileController()..userId = userId,
          from: viewProfileControllerProvider,
          name: r'viewProfileControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$viewProfileControllerHash,
          dependencies: ViewProfileControllerFamily._dependencies,
          allTransitiveDependencies:
              ViewProfileControllerFamily._allTransitiveDependencies,
        );

  final String userId;

  @override
  bool operator ==(Object other) {
    return other is ViewProfileControllerProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<ProfileModel> runNotifierBuild(
    covariant ViewProfileController notifier,
  ) {
    return notifier.build(
      userId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

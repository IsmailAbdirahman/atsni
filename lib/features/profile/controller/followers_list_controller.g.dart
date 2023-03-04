// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followers_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$followersListControllerHash() =>
    r'0d225c29816697c988832a085799af19b505e32c';

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

abstract class _$FollowersListController
    extends BuildlessAutoDisposeAsyncNotifier<List<ProfileModel>> {
  late final String userId;

  Future<List<ProfileModel>> build(
    String userId,
  );
}

/// See also [FollowersListController].
@ProviderFor(FollowersListController)
const followersListControllerProvider = FollowersListControllerFamily();

/// See also [FollowersListController].
class FollowersListControllerFamily
    extends Family<AsyncValue<List<ProfileModel>>> {
  /// See also [FollowersListController].
  const FollowersListControllerFamily();

  /// See also [FollowersListController].
  FollowersListControllerProvider call(
    String userId,
  ) {
    return FollowersListControllerProvider(
      userId,
    );
  }

  @override
  FollowersListControllerProvider getProviderOverride(
    covariant FollowersListControllerProvider provider,
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
  String? get name => r'followersListControllerProvider';
}

/// See also [FollowersListController].
class FollowersListControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FollowersListController,
        List<ProfileModel>> {
  /// See also [FollowersListController].
  FollowersListControllerProvider(
    this.userId,
  ) : super.internal(
          () => FollowersListController()..userId = userId,
          from: followersListControllerProvider,
          name: r'followersListControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$followersListControllerHash,
          dependencies: FollowersListControllerFamily._dependencies,
          allTransitiveDependencies:
              FollowersListControllerFamily._allTransitiveDependencies,
        );

  final String userId;

  @override
  bool operator ==(Object other) {
    return other is FollowersListControllerProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<List<ProfileModel>> runNotifierBuild(
    covariant FollowersListController notifier,
  ) {
    return notifier.build(
      userId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

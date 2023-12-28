// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_details_view_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchActorDetailsHash() => r'122cd005512eba0e9a0d8d5d9db7e766c35d1bae';

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

/// See also [fetchActorDetails].
@ProviderFor(fetchActorDetails)
const fetchActorDetailsProvider = FetchActorDetailsFamily();

/// See also [fetchActorDetails].
class FetchActorDetailsFamily extends Family<AsyncValue<Actor>> {
  /// See also [fetchActorDetails].
  const FetchActorDetailsFamily();

  /// See also [fetchActorDetails].
  FetchActorDetailsProvider call(
    String id,
  ) {
    return FetchActorDetailsProvider(
      id,
    );
  }

  @override
  FetchActorDetailsProvider getProviderOverride(
    covariant FetchActorDetailsProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'fetchActorDetailsProvider';
}

/// See also [fetchActorDetails].
class FetchActorDetailsProvider extends AutoDisposeFutureProvider<Actor> {
  /// See also [fetchActorDetails].
  FetchActorDetailsProvider(
    String id,
  ) : this._internal(
          (ref) => fetchActorDetails(
            ref as FetchActorDetailsRef,
            id,
          ),
          from: fetchActorDetailsProvider,
          name: r'fetchActorDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchActorDetailsHash,
          dependencies: FetchActorDetailsFamily._dependencies,
          allTransitiveDependencies:
              FetchActorDetailsFamily._allTransitiveDependencies,
          id: id,
        );

  FetchActorDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Actor> Function(FetchActorDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchActorDetailsProvider._internal(
        (ref) => create(ref as FetchActorDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Actor> createElement() {
    return _FetchActorDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchActorDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchActorDetailsRef on AutoDisposeFutureProviderRef<Actor> {
  /// The parameter `id` of this provider.
  String get id;
}

class _FetchActorDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Actor> with FetchActorDetailsRef {
  _FetchActorDetailsProviderElement(super.provider);

  @override
  String get id => (origin as FetchActorDetailsProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

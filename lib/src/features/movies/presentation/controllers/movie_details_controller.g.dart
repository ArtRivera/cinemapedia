// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchMovieDetailsHash() => r'2856c0cbc89a1fe037a45dbcae073187b05460c7';

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

/// See also [fetchMovieDetails].
@ProviderFor(fetchMovieDetails)
const fetchMovieDetailsProvider = FetchMovieDetailsFamily();

/// See also [fetchMovieDetails].
class FetchMovieDetailsFamily extends Family<AsyncValue<Movie>> {
  /// See also [fetchMovieDetails].
  const FetchMovieDetailsFamily();

  /// See also [fetchMovieDetails].
  FetchMovieDetailsProvider call(
    String movieId,
  ) {
    return FetchMovieDetailsProvider(
      movieId,
    );
  }

  @override
  FetchMovieDetailsProvider getProviderOverride(
    covariant FetchMovieDetailsProvider provider,
  ) {
    return call(
      provider.movieId,
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
  String? get name => r'fetchMovieDetailsProvider';
}

/// See also [fetchMovieDetails].
class FetchMovieDetailsProvider extends FutureProvider<Movie> {
  /// See also [fetchMovieDetails].
  FetchMovieDetailsProvider(
    String movieId,
  ) : this._internal(
          (ref) => fetchMovieDetails(
            ref as FetchMovieDetailsRef,
            movieId,
          ),
          from: fetchMovieDetailsProvider,
          name: r'fetchMovieDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchMovieDetailsHash,
          dependencies: FetchMovieDetailsFamily._dependencies,
          allTransitiveDependencies:
              FetchMovieDetailsFamily._allTransitiveDependencies,
          movieId: movieId,
        );

  FetchMovieDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final String movieId;

  @override
  Override overrideWith(
    FutureOr<Movie> Function(FetchMovieDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchMovieDetailsProvider._internal(
        (ref) => create(ref as FetchMovieDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  FutureProviderElement<Movie> createElement() {
    return _FetchMovieDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchMovieDetailsProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchMovieDetailsRef on FutureProviderRef<Movie> {
  /// The parameter `movieId` of this provider.
  String get movieId;
}

class _FetchMovieDetailsProviderElement extends FutureProviderElement<Movie>
    with FetchMovieDetailsRef {
  _FetchMovieDetailsProviderElement(super.provider);

  @override
  String get movieId => (origin as FetchMovieDetailsProvider).movieId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

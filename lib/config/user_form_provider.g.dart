// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userFormHash() => r'394b066fec51ec44005a44456a64896838bc631d';

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

/// See also [userForm].
@ProviderFor(userForm)
const userFormProvider = UserFormFamily();

/// See also [userForm].
class UserFormFamily extends Family<AsyncValue<FormGroup>> {
  /// See also [userForm].
  const UserFormFamily();

  /// See also [userForm].
  UserFormProvider call(
    String? userId,
  ) {
    return UserFormProvider(
      userId,
    );
  }

  @override
  UserFormProvider getProviderOverride(
    covariant UserFormProvider provider,
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
  String? get name => r'userFormProvider';
}

/// See also [userForm].
class UserFormProvider extends AutoDisposeFutureProvider<FormGroup> {
  /// See also [userForm].
  UserFormProvider(
    String? userId,
  ) : this._internal(
          (ref) => userForm(
            ref as UserFormRef,
            userId,
          ),
          from: userFormProvider,
          name: r'userFormProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userFormHash,
          dependencies: UserFormFamily._dependencies,
          allTransitiveDependencies: UserFormFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserFormProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String? userId;

  @override
  Override overrideWith(
    FutureOr<FormGroup> Function(UserFormRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserFormProvider._internal(
        (ref) => create(ref as UserFormRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FormGroup> createElement() {
    return _UserFormProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserFormProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserFormRef on AutoDisposeFutureProviderRef<FormGroup> {
  /// The parameter `userId` of this provider.
  String? get userId;
}

class _UserFormProviderElement
    extends AutoDisposeFutureProviderElement<FormGroup> with UserFormRef {
  _UserFormProviderElement(super.provider);

  @override
  String? get userId => (origin as UserFormProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jd_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$jdHistoryHash() => r'04377f47ad87a3c8faa85ed910ba236884376ebc';

/// See also [JdHistory].
@ProviderFor(JdHistory)
final jdHistoryProvider =
    AutoDisposeAsyncNotifierProvider<
      JdHistory,
      List<JobParameterResponse>
    >.internal(
      JdHistory.new,
      name: r'jdHistoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$jdHistoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$JdHistory = AutoDisposeAsyncNotifier<List<JobParameterResponse>>;
String _$jdGeneratorHash() => r'1cca788a3b12283341b89938b5fe1faa459e1c71';

/// See also [JdGenerator].
@ProviderFor(JdGenerator)
final jdGeneratorProvider =
    AutoDisposeAsyncNotifierProvider<
      JdGenerator,
      JobDescriptionResponse?
    >.internal(
      JdGenerator.new,
      name: r'jdGeneratorProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$jdGeneratorHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$JdGenerator = AutoDisposeAsyncNotifier<JobDescriptionResponse?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

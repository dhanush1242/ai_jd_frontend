import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/auth/presentation/auth_provider.dart';

import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/register_screen.dart';
import '../features/jd_generator/presentation/home_screen.dart';
import '../features/jd_generator/presentation/jd_form_screen.dart';
import '../features/jd_generator/presentation/jd_result_screen.dart';
import '../features/jd_generator/presentation/recruiter_jobs_screen.dart';
import '../features/jd_generator/presentation/applicants_screen.dart';
import '../features/jd_generator/presentation/recruiter_settings_screen.dart';
import '../features/jd_generator/data/models/jd_models.dart';
import '../features/candidate/presentation/profile_form_screen.dart';
import '../features/candidate/presentation/profile_view_screen.dart';
import '../features/candidate/presentation/my_jobs_screen.dart';
import '../features/candidate/presentation/saved_jobs_screen.dart';
import '../features/candidate/presentation/settings_screen.dart';
import '../features/candidate/presentation/explore_jobs_screen.dart';
import 'dashboard_layout.dart';
import '../features/candidate/presentation/candidate_provider.dart';

part 'router.g.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: CircularProgressIndicator()));
}

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authProvider);
  final isProfileComplete = ref.watch(profileCompletedProvider);

  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final isLoading = authState.isLoading;
      final user = authState.valueOrNull;
      final path = state.uri.path;

      if (isLoading) return null; // Wait on splash

      if (user == null) {
        if (path == '/login' || path == '/register') return null;
        return '/login';
      }

      // If user is candidate, enforce profile completion
      if (user.role == 'candidate') {
        final profileLoaded = isProfileComplete.hasValue;
        if (profileLoaded && !isProfileComplete.value!) {
          if (path != '/candidate/profile') return '/candidate/profile';
        }
      }

      if (path == '/splash' || path == '/login' || path == '/register') {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => DashboardLayout(child: child),
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/jd/create',
            builder: (context, state) => const JdFormScreen(),
          ),
          GoRoute(
            path: '/recruiter/jobs',
            builder: (context, state) {
              final tab = state.uri.queryParameters['tab'];
              return RecruiterJobsScreen(initialTab: tab);
            },
          ),
          GoRoute(
            path: '/recruiter/applications',
            builder: (context, state) {
              final tab = state.uri.queryParameters['tab'];
              return ApplicantsScreen(jobId: 0, initialTab: tab);
            },
          ),
          GoRoute(
            path: '/recruiter/jobs/:id/applicants',
            builder: (context, state) {
              final jobId = int.parse(state.pathParameters['id']!);
              final tab = state.uri.queryParameters['tab'];
              return ApplicantsScreen(jobId: jobId, initialTab: tab);
            },
          ),
          GoRoute(
            path: '/recruiter/settings',
            builder: (context, state) => const RecruiterSettingsScreen(),
          ),
          GoRoute(
            path: '/jd/result',
            builder: (context, state) {
              final jd = state.extra as JobDescriptionResponse?;
              return JdResultScreen(initialJd: jd);
            },
          ),
          GoRoute(
            path: '/candidate/profile',
            builder: (context, state) => const ProfileFormScreen(),
          ),
          GoRoute(
            path: '/candidate/view_profile',
            builder: (context, state) => const ProfileViewScreen(),
          ),
          GoRoute(
            path: '/candidate/explore',
            builder: (context, state) => const ExploreJobsScreen(),
          ),
          GoRoute(
            path: '/candidate/jobs',
            builder: (context, state) => const MyJobsScreen(),
          ),
          GoRoute(
            path: '/candidate/saved',
            builder: (context, state) => const SavedJobsScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
  );
}

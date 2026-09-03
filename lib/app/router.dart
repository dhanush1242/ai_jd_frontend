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
import '../features/candidate/presentation/profile_form_screen.dart';
import '../features/candidate/presentation/profile_view_screen.dart';
import '../features/candidate/presentation/my_jobs_screen.dart';
import '../features/candidate/presentation/saved_jobs_screen.dart';
import '../features/candidate/presentation/settings_screen.dart';
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
      final isAuthenticated = authState.valueOrNull != null;

      final isSplash = state.matchedLocation == '/splash';
      final isLogin = state.matchedLocation == '/login';
      final isRegister = state.matchedLocation == '/register';

      if (!isAuthenticated && !isLoading) {
        if (!isLogin && !isRegister) return '/login';
      } else if (isAuthenticated) {
        final user = authState.valueOrNull;
        if (isSplash || isLogin || isRegister) {
          if (user?.role == 'candidate' && !isProfileComplete) {
            return '/candidate/profile';
          }
          return '/home';
        }
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
        builder: (context, state, child) {
          return DashboardLayout(child: child);
        },
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
            builder: (context, state) => const RecruiterJobsScreen(),
          ),
          GoRoute(
            path: '/recruiter/jobs/:id/applicants',
            builder: (context, state) {
              final jobId = int.parse(state.pathParameters['id']!);
              return ApplicantsScreen(jobId: jobId);
            },
          ),
          GoRoute(
            path: '/recruiter/settings',
            builder: (context, state) => const RecruiterSettingsScreen(),
          ),
          GoRoute(
            path: '/jd/result',
            builder: (context, state) => const JdResultScreen(),
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

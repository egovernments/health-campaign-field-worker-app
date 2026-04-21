import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:digit_face_verification/digit_face_verification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [FaceEmbeddingSchema],
    directory: dir.path,
  );

  final faceModelService = FaceModelService();
  final embeddingRepo = FaceEmbeddingRepository(isar);

  runApp(MyApp(
    faceModelService: faceModelService,
    embeddingRepository: embeddingRepo,
  ));
}

class MyApp extends StatelessWidget {
  final FaceModelService faceModelService;
  final FaceEmbeddingRepository embeddingRepository;

  const MyApp({
    super.key,
    required this.faceModelService,
    required this.embeddingRepository,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FaceVerificationBloc(
        faceModelService: faceModelService,
        embeddingRepository: embeddingRepository,
      )..add(const FaceVerificationEvent.initialize()),
      child: MaterialApp(
        title: 'Face Verification Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Colors.teal,
          useMaterial3: true,
        ),
        home: HomePage(faceModelService: faceModelService),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final FaceModelService faceModelService;

  // Hard-coded test individual ID for standalone testing.
  static const _testIndividualId = 'test-user-001';

  const HomePage({super.key, required this.faceModelService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Face Verification Test')),
      body: BlocListener<FaceVerificationBloc, FaceVerificationState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red,
                ),
              );
            },
            orElse: () {},
          );
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.face, size: 96, color: Colors.teal),
                const SizedBox(height: 16),
                const Text(
                  'MobileFaceNet Test',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Test ID: $_testIndividualId',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 8),
                BlocBuilder<FaceVerificationBloc, FaceVerificationState>(
                  builder: (context, state) {
                    return Text(
                      state.maybeWhen(
                        idle: () => 'Ready',
                        processing: (msg) => msg,
                        error: (msg) => 'Error: $msg',
                        orElse: () => '',
                      ),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                      textAlign: TextAlign.center,
                    );
                  },
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    icon: const Icon(Icons.person_add),
                    label: const Text('Register Face'),
                    onPressed: () => _openFaceView(
                      context,
                      FaceVerificationMode.register,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.verified_user),
                    label: const Text('Verify Face'),
                    onPressed: () => _openFaceView(
                      context,
                      FaceVerificationMode.verify,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                TextButton.icon(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  label: const Text(
                    'Clear Registration',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    context.read<FaceVerificationBloc>().add(
                          const FaceVerificationEvent.deleteRegistration(
                            individualId: _testIndividualId,
                          ),
                        );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registration cleared')),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openFaceView(BuildContext context, FaceVerificationMode mode) {
    final bloc = context.read<FaceVerificationBloc>();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: bloc,
          child: FaceVerificationView(
            mode: mode,
            individualId: _testIndividualId,
            faceModelService: faceModelService,
            onResult: (success, confidence) {
              debugPrint(
                '${mode.name}: success=$success, '
                'confidence=${(confidence * 100).toStringAsFixed(1)}%',
              );
            },
          ),
        ),
      ),
    );
  }
}

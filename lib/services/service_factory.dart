import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_mood/services/providers/answer_provider.dart';
import 'package:provider/provider.dart';

class ServiceFactory extends StatelessWidget {
  final Widget child; 
  
  const ServiceFactory({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AnswerProvider()
        ),
      ],
      child: child,
    );
  }
}
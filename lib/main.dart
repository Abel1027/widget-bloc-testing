import 'package:bloc_testing/my_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  MyCubit myCubit = MyCubit();
  runApp(MyAppParent(myCubit: myCubit));
}

class MyAppParent extends StatelessWidget {
  const MyAppParent({
    Key? key,
    required this.myCubit,
  }) : super(key: key);

  final MyCubit myCubit;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('test'),
        ),
        body: BlocProvider<MyCubit>(
          create: (_) => myCubit,
          child: const MyApp(),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyCubit myCubit = context.read<MyCubit>();
    return Column(
      children: [
        BlocConsumer<MyCubit, int>(
          bloc: myCubit,
          listener: (BuildContext context, int count) {
            print('COUNTER: $count');
          },
          builder: (BuildContext context, int count) {
            return Text('$count');
          },
        ),
        TextButton(
          onPressed: () {
            myCubit.increment();
          },
          child: const Text('Increment'),
        ),
        TextButton(
          onPressed: () {
            myCubit.decrement();
          },
          child: const Text('Decrement'),
        )
      ],
    );
  }
}

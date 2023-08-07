import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class MyThemeChangerScreen extends ConsumerWidget {
  static const String name = 'my_theme_changer_screen';
  const MyThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(isDarkmodeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onPressed: () {
              ref.read(isDarkmodeProvider.notifier).update((state) => !state);
            },
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final colorList = ref.watch(colorListProvider);

    return ListView.builder(
        itemCount: colorList.length,
        itemBuilder: (context, index) {
          final Color color = colorList[index];
          return RadioListTile(
              title: Text('Color $index'),
              subtitle: Text('#${color.value}', style: TextStyle(color: color)),
              activeColor: color,
              value: index,
              groupValue: 3,
              onChanged: (value) {});
        });
  }
}

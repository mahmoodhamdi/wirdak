import 'package:flutter/material.dart';
import 'package:wirdak/core/common/widgets/custom_app_bar.dart';
import 'package:wirdak/features/settings/presentation/widgets/settings_list.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'الاعدادات',
        centerTitle: true,
        icon: Icons.settings_outlined,
        
      ),
      body: SafeArea(child: SettingsList()),
    );
  }
}
